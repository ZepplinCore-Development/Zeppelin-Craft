-- Found 33 unique mining loot tables

-- =====================================================
-- GAMEOBJECT LIST (for review)
-- =====================================================
-- Copper Vein (Loot ID: 1502)
-- Tin Vein (Loot ID: 1503)
-- Ooze Covered Silver Vein (Loot ID: 1504)
-- Iron Deposit (Loot ID: 1505)
-- Gold Vein (Loot ID: 1506)
-- Copper Vein (Loot ID: 1735)
-- Tin Vein (Loot ID: 1736)
-- Mithril Deposit (Loot ID: 1742)
-- Copper Vein (Loot ID: 2626)
-- Tin Vein (Loot ID: 2627)
-- Ooze Covered Truesilver Deposit (Loot ID: 5045)
-- Ooze Covered Thorium Vein (Loot ID: 9597)
-- Dark Iron Deposit (Loot ID: 11213)
-- Ooze Covered Rich Thorium Vein (Loot ID: 12883)
-- Small Thorium Vein (Loot ID: 13960)
-- Mithril Deposit (Loot ID: 13961)
-- Hakkari Thorium Vein (Loot ID: 17241)
-- Truesilver Deposit (Loot ID: 17938)
-- Gold Vein (Loot ID: 17939)
-- Copper Vein (Loot ID: 18092)
-- Tin Vein (Loot ID: 18093)
-- Fel Iron Deposit (Loot ID: 18359)
-- Adamantite Deposit (Loot ID: 18361)
-- Khorium Vein (Loot ID: 18363)
-- Nethercite Deposit (Loot ID: 22070)
-- Cobalt Deposit (Loot ID: 24153)
-- Rich Cobalt Deposit (Loot ID: 24154)
-- Saronite Deposit (Loot ID: 24155)
-- Rich Saronite Deposit (Loot ID: 24156)
-- Titanium Vein (Loot ID: 24157)
-- Rich Adamantite Deposit (Loot ID: 26861)
-- Ancient Gem Vein (Loot ID: 26862)
-- Pure Saronite Deposit (Loot ID: 27244)
-- =====================================================

-- =====================================================
-- MINING PICK BONUS YIELD SYSTEM
-- =====================================================
-- Reference loot tables that duplicate mining node loot
-- Provides bonus 'second roll' when mining with picks
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 92000 AND 92999;
DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 92000 AND 92999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 92000 AND 92999;

-- Copper Vein (Loot ID: 1502)
-- Copper Vein - Journeyman Pick Bonus (Ref 92000)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 818, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');

-- Copper Vein - Artisan Pick Bonus (Ref 92001)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 818, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');

-- Copper Vein - Master Pick Bonus (Ref 92002)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 774, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 818, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');

-- Copper Vein - Grand Master Pick Bonus (Ref 92003)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 818, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');


-- Tin Vein (Loot ID: 1503)
-- Tin Vein - Journeyman Pick Bonus (Ref 92004)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');

-- Tin Vein - Artisan Pick Bonus (Ref 92005)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');

-- Tin Vein - Master Pick Bonus (Ref 92006)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');

-- Tin Vein - Grand Master Pick Bonus (Ref 92007)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');


-- Ooze Covered Silver Vein (Loot ID: 1504)
-- Ooze Covered Silver Vein - Journeyman Pick Bonus (Ref 92008)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 2775, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');

-- Ooze Covered Silver Vein - Artisan Pick Bonus (Ref 92009)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 2775, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');

-- Ooze Covered Silver Vein - Master Pick Bonus (Ref 92010)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 2775, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');

-- Ooze Covered Silver Vein - Grand Master Pick Bonus (Ref 92011)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 2775, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');


-- Iron Deposit (Loot ID: 1505)
-- Iron Deposit - Journeyman Pick Bonus (Ref 92012)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 2772, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 2838, 50.0, 0, 0, 1, 5, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Iron Deposit - Artisan Pick Bonus (Ref 92013)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 2772, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 2838, 50.0, 0, 0, 1, 5, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Iron Deposit - Master Pick Bonus (Ref 92014)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 2772, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 2838, 50.0, 0, 0, 1, 5, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Iron Deposit - Grand Master Pick Bonus (Ref 92015)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 2772, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 2838, 50.0, 0, 0, 1, 5, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Gold Vein (Loot ID: 1506)
-- Gold Vein - Journeyman Pick Bonus (Ref 92016)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Gold Vein - Artisan Pick Bonus (Ref 92017)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Gold Vein - Master Pick Bonus (Ref 92018)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Gold Vein - Grand Master Pick Bonus (Ref 92019)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Copper Vein (Loot ID: 1735)
-- Copper Vein - Journeyman Pick Bonus (Ref 92020)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 818, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2798, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');

-- Copper Vein - Artisan Pick Bonus (Ref 92021)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 818, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2798, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');

-- Copper Vein - Master Pick Bonus (Ref 92022)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 774, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 818, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2798, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');

-- Copper Vein - Grand Master Pick Bonus (Ref 92023)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 818, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2798, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');


-- Tin Vein (Loot ID: 1736)
-- Tin Vein - Journeyman Pick Bonus (Ref 92024)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2798, 100.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');

-- Tin Vein - Artisan Pick Bonus (Ref 92025)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2798, 100.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');

-- Tin Vein - Master Pick Bonus (Ref 92026)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2798, 100.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');

-- Tin Vein - Grand Master Pick Bonus (Ref 92027)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2798, 100.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');


-- Mithril Deposit (Loot ID: 1742)
-- Mithril Deposit - Journeyman Pick Bonus (Ref 92028)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Mithril Deposit - Artisan Pick Bonus (Ref 92029)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Mithril Deposit - Master Pick Bonus (Ref 92030)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Mithril Deposit - Grand Master Pick Bonus (Ref 92031)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Copper Vein (Loot ID: 2626)
-- Copper Vein - Journeyman Pick Bonus (Ref 92032)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 818, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 5075, 5.0, 0, 0, 1, 3, 'Bonus from Journeyman Pick');

-- Copper Vein - Artisan Pick Bonus (Ref 92033)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 818, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 5075, 5.0, 0, 0, 1, 3, 'Bonus from Artisan Pick');

-- Copper Vein - Master Pick Bonus (Ref 92034)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 774, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 818, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 5075, 5.0, 0, 0, 1, 3, 'Bonus from Master Pick');

-- Copper Vein - Grand Master Pick Bonus (Ref 92035)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 818, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 5075, 5.0, 0, 0, 1, 3, 'Bonus from Grand Master Pick');


-- Tin Vein (Loot ID: 2627)
-- Tin Vein - Journeyman Pick Bonus (Ref 92036)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 5075, 5.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');

-- Tin Vein - Artisan Pick Bonus (Ref 92037)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 5075, 5.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');

-- Tin Vein - Master Pick Bonus (Ref 92038)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 5075, 5.0, 0, 0, 1, 4, 'Bonus from Master Pick');

-- Tin Vein - Grand Master Pick Bonus (Ref 92039)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 5075, 5.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');


-- Ooze Covered Truesilver Deposit (Loot ID: 5045)
-- Ooze Covered Truesilver Deposit - Journeyman Pick Bonus (Ref 92040)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7911, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');

-- Ooze Covered Truesilver Deposit - Artisan Pick Bonus (Ref 92041)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7911, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');

-- Ooze Covered Truesilver Deposit - Master Pick Bonus (Ref 92042)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7911, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');

-- Ooze Covered Truesilver Deposit - Grand Master Pick Bonus (Ref 92043)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7911, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');


-- Ooze Covered Thorium Vein (Loot ID: 9597)
-- Ooze Covered Thorium Vein - Journeyman Pick Bonus (Ref 92044)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92044, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92044, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Journeyman Pick');

-- Ooze Covered Thorium Vein - Artisan Pick Bonus (Ref 92045)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92045, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92045, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Artisan Pick');

-- Ooze Covered Thorium Vein - Master Pick Bonus (Ref 92046)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92046, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92046, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Master Pick');

-- Ooze Covered Thorium Vein - Grand Master Pick Bonus (Ref 92047)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92047, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92047, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Grand Master Pick');


-- Dark Iron Deposit (Loot ID: 11213)
-- Dark Iron Deposit - Journeyman Pick Bonus (Ref 92048)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11370, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11754, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Dark Iron Deposit - Artisan Pick Bonus (Ref 92049)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11370, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11754, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Dark Iron Deposit - Master Pick Bonus (Ref 92050)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11370, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11754, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Dark Iron Deposit - Grand Master Pick Bonus (Ref 92051)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11370, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11382, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11754, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Ooze Covered Rich Thorium Vein (Loot ID: 12883)
-- Ooze Covered Rich Thorium Vein - Journeyman Pick Bonus (Ref 92052)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92052, 10620, 100.0, 0, 0, 3, 5, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92052, 12365, 50.0, 0, 0, 4, 7, 'Bonus from Journeyman Pick');

-- Ooze Covered Rich Thorium Vein - Artisan Pick Bonus (Ref 92053)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92053, 10620, 100.0, 0, 0, 3, 5, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92053, 12365, 50.0, 0, 0, 4, 7, 'Bonus from Artisan Pick');

-- Ooze Covered Rich Thorium Vein - Master Pick Bonus (Ref 92054)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92054, 10620, 100.0, 0, 0, 3, 5, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92054, 12365, 50.0, 0, 0, 4, 7, 'Bonus from Master Pick');

-- Ooze Covered Rich Thorium Vein - Grand Master Pick Bonus (Ref 92055)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92055, 10620, 100.0, 0, 0, 3, 5, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92055, 12365, 50.0, 0, 0, 4, 7, 'Bonus from Grand Master Pick');


-- Small Thorium Vein (Loot ID: 13960)
-- Small Thorium Vein - Journeyman Pick Bonus (Ref 92056)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Journeyman Pick');

-- Small Thorium Vein - Artisan Pick Bonus (Ref 92057)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Artisan Pick');

-- Small Thorium Vein - Master Pick Bonus (Ref 92058)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Master Pick');

-- Small Thorium Vein - Grand Master Pick Bonus (Ref 92059)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 10620, 100.0, 0, 0, 1, 3, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 12365, 50.0, 0, 0, 1, 5, 'Bonus from Grand Master Pick');


-- Mithril Deposit (Loot ID: 13961)
-- Mithril Deposit - Journeyman Pick Bonus (Ref 92060)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 11513, 25.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');

-- Mithril Deposit - Artisan Pick Bonus (Ref 92061)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 11513, 25.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');

-- Mithril Deposit - Master Pick Bonus (Ref 92062)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 11513, 25.0, 0, 0, 1, 4, 'Bonus from Master Pick');

-- Mithril Deposit - Grand Master Pick Bonus (Ref 92063)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 3858, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7912, 50.0, 0, 0, 1, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 9262, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 11513, 25.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');


-- Hakkari Thorium Vein (Loot ID: 17241)
-- Hakkari Thorium Vein - Journeyman Pick Bonus (Ref 92064)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 10620, 100.0, 0, 0, 1, 5, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 12365, 50.0, 0, 0, 1, 7, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 19774, 40.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Hakkari Thorium Vein - Artisan Pick Bonus (Ref 92065)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 10620, 100.0, 0, 0, 1, 5, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 12365, 50.0, 0, 0, 1, 7, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 19774, 40.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Hakkari Thorium Vein - Master Pick Bonus (Ref 92066)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 10620, 100.0, 0, 0, 1, 5, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 12365, 50.0, 0, 0, 1, 7, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 19774, 40.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Hakkari Thorium Vein - Grand Master Pick Bonus (Ref 92067)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 10620, 100.0, 0, 0, 1, 5, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 12365, 50.0, 0, 0, 1, 7, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 19774, 40.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Truesilver Deposit (Loot ID: 17938)
-- Truesilver Deposit - Journeyman Pick Bonus (Ref 92068)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7911, 100.0, 0, 0, 2, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Truesilver Deposit - Artisan Pick Bonus (Ref 92069)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7911, 100.0, 0, 0, 2, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Truesilver Deposit - Master Pick Bonus (Ref 92070)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7911, 100.0, 0, 0, 2, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Truesilver Deposit - Grand Master Pick Bonus (Ref 92071)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7910, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7911, 100.0, 0, 0, 2, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 11513, 50.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Gold Vein (Loot ID: 17939)
-- Gold Vein - Journeyman Pick Bonus (Ref 92072)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Gold Vein - Artisan Pick Bonus (Ref 92073)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Gold Vein - Master Pick Bonus (Ref 92074)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Gold Vein - Grand Master Pick Bonus (Ref 92075)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 2776, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 3864, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 7909, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Copper Vein (Loot ID: 18092)
-- Copper Vein - Journeyman Pick Bonus (Ref 92076)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 774, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 818, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Copper Vein - Artisan Pick Bonus (Ref 92077)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 774, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 818, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Copper Vein - Master Pick Bonus (Ref 92078)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 774, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 818, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Copper Vein - Grand Master Pick Bonus (Ref 92079)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 774, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 818, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 2770, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 2835, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Tin Vein (Loot ID: 18093)
-- Tin Vein - Journeyman Pick Bonus (Ref 92080)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Tin Vein - Artisan Pick Bonus (Ref 92081)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Tin Vein - Master Pick Bonus (Ref 92082)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Tin Vein - Grand Master Pick Bonus (Ref 92083)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1206, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1210, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1529, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1705, 5.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 2771, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 2836, 50.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 22634, 100.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Fel Iron Deposit (Loot ID: 18359)
-- Fel Iron Deposit - Journeyman Pick Bonus (Ref 92084)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 23424, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Fel Iron Deposit - Artisan Pick Bonus (Ref 92085)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 23424, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Fel Iron Deposit - Master Pick Bonus (Ref 92086)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 23424, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Fel Iron Deposit - Grand Master Pick Bonus (Ref 92087)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 22573, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 22574, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 23424, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 23427, 5.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Adamantite Deposit (Loot ID: 18361)
-- Adamantite Deposit - Journeyman Pick Bonus (Ref 92088)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 22573, 10.0, 0, 0, 1, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 23425, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 23427, 10.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Adamantite Deposit - Artisan Pick Bonus (Ref 92089)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 22573, 10.0, 0, 0, 1, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 23425, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 23427, 10.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Adamantite Deposit - Master Pick Bonus (Ref 92090)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 22573, 10.0, 0, 0, 1, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 23425, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 23427, 10.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Adamantite Deposit - Grand Master Pick Bonus (Ref 92091)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 22573, 10.0, 0, 0, 1, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 23425, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 23427, 10.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Khorium Vein (Loot ID: 18363)
-- Khorium Vein - Journeyman Pick Bonus (Ref 92092)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 22573, 35.0, 0, 0, 2, 5, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 22574, 10.0, 0, 0, 2, 5, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 23426, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 23427, 10.0, 0, 0, 1, 3, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Khorium Vein - Artisan Pick Bonus (Ref 92093)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 22573, 35.0, 0, 0, 2, 5, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 22574, 10.0, 0, 0, 2, 5, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 23426, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 23427, 10.0, 0, 0, 1, 3, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Khorium Vein - Master Pick Bonus (Ref 92094)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 22573, 35.0, 0, 0, 2, 5, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 22574, 10.0, 0, 0, 2, 5, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 23426, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 23427, 10.0, 0, 0, 1, 3, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Khorium Vein - Grand Master Pick Bonus (Ref 92095)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 22573, 35.0, 0, 0, 2, 5, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 22574, 10.0, 0, 0, 2, 5, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 23426, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 23427, 10.0, 0, 0, 1, 3, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Nethercite Deposit (Loot ID: 22070)
-- Nethercite Deposit - Journeyman Pick Bonus (Ref 92096)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 22573, 10.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 22574, 10.0, 0, 0, 1, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 32464, 100.0, 0, 0, 1, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 32506, 1.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Nethercite Deposit - Artisan Pick Bonus (Ref 92097)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 22573, 10.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 22574, 10.0, 0, 0, 1, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 32464, 100.0, 0, 0, 1, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 32506, 1.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Nethercite Deposit - Master Pick Bonus (Ref 92098)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 22573, 10.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 22574, 10.0, 0, 0, 1, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 32464, 100.0, 0, 0, 1, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 32506, 1.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Nethercite Deposit - Grand Master Pick Bonus (Ref 92099)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 22573, 10.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 22574, 10.0, 0, 0, 1, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 32464, 100.0, 0, 0, 1, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 32506, 1.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Cobalt Deposit (Loot ID: 24153)
-- Cobalt Deposit - Journeyman Pick Bonus (Ref 92100)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 36909, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Cobalt Deposit - Artisan Pick Bonus (Ref 92101)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 36909, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Cobalt Deposit - Master Pick Bonus (Ref 92102)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 36909, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Cobalt Deposit - Grand Master Pick Bonus (Ref 92103)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 36909, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Rich Cobalt Deposit (Loot ID: 24154)
-- Rich Cobalt Deposit - Journeyman Pick Bonus (Ref 92104)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 36909, 100.0, 0, 0, 4, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Rich Cobalt Deposit - Artisan Pick Bonus (Ref 92105)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 36909, 100.0, 0, 0, 4, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Rich Cobalt Deposit - Master Pick Bonus (Ref 92106)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 36909, 100.0, 0, 0, 4, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Rich Cobalt Deposit - Grand Master Pick Bonus (Ref 92107)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 36909, 100.0, 0, 0, 4, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 37701, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 37705, 30.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Saronite Deposit (Loot ID: 24155)
-- Saronite Deposit - Journeyman Pick Bonus (Ref 92108)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 36912, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 37701, 40.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 37703, 40.0, 0, 0, 1, 2, 'Bonus from Journeyman Pick');

-- Saronite Deposit - Artisan Pick Bonus (Ref 92109)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 36912, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 37701, 40.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 37703, 40.0, 0, 0, 1, 2, 'Bonus from Artisan Pick');

-- Saronite Deposit - Master Pick Bonus (Ref 92110)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 36912, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 37701, 40.0, 0, 0, 1, 2, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 37703, 40.0, 0, 0, 1, 2, 'Bonus from Master Pick');

-- Saronite Deposit - Grand Master Pick Bonus (Ref 92111)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 36912, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 37701, 40.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 37703, 40.0, 0, 0, 1, 2, 'Bonus from Grand Master Pick');


-- Rich Saronite Deposit (Loot ID: 24156)
-- Rich Saronite Deposit - Journeyman Pick Bonus (Ref 92112)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 36912, 100.0, 0, 0, 5, 7, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 37701, 40.0, 0, 0, 1, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 37703, 40.0, 0, 0, 1, 8, 'Bonus from Journeyman Pick');

-- Rich Saronite Deposit - Artisan Pick Bonus (Ref 92113)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 36912, 100.0, 0, 0, 5, 7, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 37701, 40.0, 0, 0, 1, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 37703, 40.0, 0, 0, 1, 8, 'Bonus from Artisan Pick');

-- Rich Saronite Deposit - Master Pick Bonus (Ref 92114)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 36912, 100.0, 0, 0, 5, 7, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 37701, 40.0, 0, 0, 1, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 37703, 40.0, 0, 0, 1, 8, 'Bonus from Master Pick');

-- Rich Saronite Deposit - Grand Master Pick Bonus (Ref 92115)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 36912, 100.0, 0, 0, 5, 7, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 37701, 40.0, 0, 0, 1, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 37703, 40.0, 0, 0, 1, 8, 'Bonus from Grand Master Pick');


-- Titanium Vein (Loot ID: 24157)
-- Titanium Vein - Journeyman Pick Bonus (Ref 92116)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 36910, 100.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37700, 50.0, 0, 0, 3, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37701, 50.0, 0, 0, 3, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37702, 50.0, 0, 0, 3, 6, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37705, 50.0, 0, 0, 3, 6, 'Bonus from Journeyman Pick');

-- Titanium Vein - Artisan Pick Bonus (Ref 92117)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 36910, 100.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37700, 50.0, 0, 0, 3, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37701, 50.0, 0, 0, 3, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37702, 50.0, 0, 0, 3, 6, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37705, 50.0, 0, 0, 3, 6, 'Bonus from Artisan Pick');

-- Titanium Vein - Master Pick Bonus (Ref 92118)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 36910, 100.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37700, 50.0, 0, 0, 3, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37701, 50.0, 0, 0, 3, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37702, 50.0, 0, 0, 3, 6, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37705, 50.0, 0, 0, 3, 6, 'Bonus from Master Pick');

-- Titanium Vein - Grand Master Pick Bonus (Ref 92119)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 36910, 100.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37700, 50.0, 0, 0, 3, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37701, 50.0, 0, 0, 3, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37702, 50.0, 0, 0, 3, 6, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37705, 50.0, 0, 0, 3, 6, 'Bonus from Grand Master Pick');


-- Rich Adamantite Deposit (Loot ID: 26861)
-- Rich Adamantite Deposit - Journeyman Pick Bonus (Ref 92120)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 22573, 10.0, 0, 0, 4, 8, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 23425, 100.0, 0, 0, 5, 7, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 23427, 10.0, 0, 0, 2, 3, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Journeyman Pick');

-- Rich Adamantite Deposit - Artisan Pick Bonus (Ref 92121)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 22573, 10.0, 0, 0, 4, 8, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 23425, 100.0, 0, 0, 5, 7, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 23427, 10.0, 0, 0, 2, 3, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Artisan Pick');

-- Rich Adamantite Deposit - Master Pick Bonus (Ref 92122)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 22573, 10.0, 0, 0, 4, 8, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 23425, 100.0, 0, 0, 5, 7, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 23427, 10.0, 0, 0, 2, 3, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Master Pick');

-- Rich Adamantite Deposit - Grand Master Pick Bonus (Ref 92123)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 22573, 10.0, 0, 0, 4, 8, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 23425, 100.0, 0, 0, 5, 7, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 23427, 10.0, 0, 0, 2, 3, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 35229, 25.0, 0, 0, 1, 1, 'Bonus from Grand Master Pick');


-- Ancient Gem Vein (Loot ID: 26862)
-- Ancient Gem Vein - Journeyman Pick Bonus (Ref 92124)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92124, 34907, 70.0, 0, 0, 1, 3, 'Bonus from Journeyman Pick');

-- Ancient Gem Vein - Artisan Pick Bonus (Ref 92125)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92125, 34907, 70.0, 0, 0, 1, 3, 'Bonus from Artisan Pick');

-- Ancient Gem Vein - Master Pick Bonus (Ref 92126)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92126, 34907, 70.0, 0, 0, 1, 3, 'Bonus from Master Pick');

-- Ancient Gem Vein - Grand Master Pick Bonus (Ref 92127)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92127, 34907, 70.0, 0, 0, 1, 3, 'Bonus from Grand Master Pick');


-- Pure Saronite Deposit (Loot ID: 27244)
-- Pure Saronite Deposit - Journeyman Pick Bonus (Ref 92128)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92128, 35624, 60.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92128, 35627, 60.0, 0, 0, 2, 4, 'Bonus from Journeyman Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92128, 36912, 100.0, 0, 0, 22, 38, 'Bonus from Journeyman Pick');

-- Pure Saronite Deposit - Artisan Pick Bonus (Ref 92129)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92129, 35624, 60.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92129, 35627, 60.0, 0, 0, 2, 4, 'Bonus from Artisan Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92129, 36912, 100.0, 0, 0, 22, 38, 'Bonus from Artisan Pick');

-- Pure Saronite Deposit - Master Pick Bonus (Ref 92130)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92130, 35624, 60.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92130, 35627, 60.0, 0, 0, 2, 4, 'Bonus from Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92130, 36912, 100.0, 0, 0, 22, 38, 'Bonus from Master Pick');

-- Pure Saronite Deposit - Grand Master Pick Bonus (Ref 92131)
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92131, 35624, 60.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92131, 35627, 60.0, 0, 0, 2, 4, 'Bonus from Grand Master Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, GroupId, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92131, 36912, 100.0, 0, 0, 22, 38, 'Bonus from Grand Master Pick');


-- =====================================================
-- LINK REFERENCES TO GAMEOBJECTS
-- =====================================================

-- Journeyman bonus for GO 1731
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9500, 92000, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 1731
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9501, 92001, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 1731
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9502, 92002, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 1731
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1731, 9503, 92003, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 103713
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103713, 9504, 92000, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 103713
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103713, 9505, 92001, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 103713
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103713, 9506, 92002, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 103713
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103713, 9507, 92003, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 1732
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9508, 92004, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 1732
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9509, 92005, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 1732
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9510, 92006, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 1732
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1732, 9511, 92007, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 103711
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103711, 9512, 92004, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 103711
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103711, 9513, 92005, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 103711
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103711, 9514, 92006, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 103711
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (103711, 9515, 92007, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 1733
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9516, 92008, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 1733
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9517, 92009, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 1733
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9518, 92010, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 1733
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1733, 9519, 92011, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 73940
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73940, 9520, 92008, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 73940
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73940, 9521, 92009, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 73940
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73940, 9522, 92010, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 73940
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73940, 9523, 92011, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 105569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (105569, 9524, 92008, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 105569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (105569, 9525, 92009, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 105569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (105569, 9526, 92010, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 105569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (105569, 9527, 92011, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 1735
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9528, 92012, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 1735
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9529, 92013, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 1735
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9530, 92014, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 1735
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9531, 92015, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 73939
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73939, 9532, 92012, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 73939
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73939, 9533, 92013, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 73939
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73939, 9534, 92014, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 73939
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73939, 9535, 92015, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 1734
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9536, 92016, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 1734
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9537, 92017, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 1734
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9538, 92018, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 1734
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1734, 9539, 92019, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 73941
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73941, 9540, 92016, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 73941
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73941, 9541, 92017, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 73941
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73941, 9542, 92018, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 73941
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (73941, 9543, 92019, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 150080
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150080, 9544, 92016, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 150080
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150080, 9545, 92017, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 150080
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150080, 9546, 92018, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 150080
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150080, 9547, 92019, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 2055
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2055, 9548, 92020, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 2055
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2055, 9549, 92021, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 2055
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2055, 9550, 92022, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 2055
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2055, 9551, 92023, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 2054
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2054, 9552, 92024, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 2054
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2054, 9553, 92025, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 2054
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2054, 9554, 92026, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 2054
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2054, 9555, 92027, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 2040
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2040, 9556, 92028, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 2040
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2040, 9557, 92029, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 2040
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2040, 9558, 92030, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 2040
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2040, 9559, 92031, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 123310
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123310, 9560, 92028, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 123310
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123310, 9561, 92029, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 123310
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123310, 9562, 92030, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 123310
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123310, 9563, 92031, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 150079
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150079, 9564, 92028, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 150079
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150079, 9565, 92029, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 150079
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150079, 9566, 92030, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 150079
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150079, 9567, 92031, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 3763
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3763, 9568, 92032, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 3763
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3763, 9569, 92033, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 3763
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3763, 9570, 92034, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 3763
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3763, 9571, 92035, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 3764
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3764, 9572, 92036, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 3764
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3764, 9573, 92037, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 3764
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3764, 9574, 92038, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 3764
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (3764, 9575, 92039, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 2047
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2047, 9576, 92040, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 2047
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2047, 9577, 92041, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 2047
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2047, 9578, 92042, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 2047
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2047, 9579, 92043, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 123309
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123309, 9580, 92040, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 123309
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123309, 9581, 92041, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 123309
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123309, 9582, 92042, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 123309
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123309, 9583, 92043, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 150081
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150081, 9584, 92040, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 150081
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150081, 9585, 92041, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 150081
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150081, 9586, 92042, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 150081
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150081, 9587, 92043, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 324
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (324, 9588, 92044, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 324
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (324, 9589, 92045, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 324
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (324, 9590, 92046, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 324
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (324, 9591, 92047, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 123848
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123848, 9592, 92044, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 123848
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123848, 9593, 92045, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 123848
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123848, 9594, 92046, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 123848
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (123848, 9595, 92047, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 150082
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150082, 9596, 92044, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 150082
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150082, 9597, 92045, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 150082
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150082, 9598, 92046, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 150082
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (150082, 9599, 92047, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 165658
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (165658, 9600, 92048, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 165658
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (165658, 9601, 92049, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 165658
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (165658, 9602, 92050, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 165658
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (165658, 9603, 92051, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 175404
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (175404, 9604, 92052, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 175404
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (175404, 9605, 92053, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 175404
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (175404, 9606, 92054, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 175404
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (175404, 9607, 92055, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 177388
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (177388, 9608, 92052, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 177388
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (177388, 9609, 92053, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 177388
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (177388, 9610, 92054, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 177388
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (177388, 9611, 92055, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 176643
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176643, 9612, 92056, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 176643
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176643, 9613, 92057, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 176643
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176643, 9614, 92058, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 176643
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176643, 9615, 92059, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 176645
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176645, 9616, 92060, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 176645
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176645, 9617, 92061, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 176645
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176645, 9618, 92062, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 176645
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (176645, 9619, 92063, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 180215
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180215, 9620, 92064, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 180215
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180215, 9621, 92065, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 180215
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180215, 9622, 92066, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 180215
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (180215, 9623, 92067, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181108
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181108, 9624, 92068, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181108
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181108, 9625, 92069, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181108
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181108, 9626, 92070, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181108
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181108, 9627, 92071, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181109
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181109, 9628, 92072, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181109
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181109, 9629, 92073, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181109
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181109, 9630, 92074, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181109
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181109, 9631, 92075, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181248
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181248, 9632, 92076, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181248
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181248, 9633, 92077, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181248
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181248, 9634, 92078, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181248
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181248, 9635, 92079, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181249
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181249, 9636, 92080, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181249
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181249, 9637, 92081, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181249
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181249, 9638, 92082, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181249
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181249, 9639, 92083, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181555
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181555, 9640, 92084, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181555
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181555, 9641, 92085, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181555
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181555, 9642, 92086, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181555
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181555, 9643, 92087, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181556
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181556, 9644, 92088, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181556
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181556, 9645, 92089, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181556
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181556, 9646, 92090, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181556
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181556, 9647, 92091, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181557, 9648, 92092, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181557, 9649, 92093, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181557, 9650, 92094, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181557, 9651, 92095, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 185877
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185877, 9652, 92096, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 185877
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185877, 9653, 92097, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 185877
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185877, 9654, 92098, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 185877
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185877, 9655, 92099, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 189978
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189978, 9656, 92100, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 189978
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189978, 9657, 92101, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 189978
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189978, 9658, 92102, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 189978
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189978, 9659, 92103, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 189979
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189979, 9660, 92104, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 189979
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189979, 9661, 92105, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 189979
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189979, 9662, 92106, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 189979
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189979, 9663, 92107, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 189980
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189980, 9664, 92108, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 189980
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189980, 9665, 92109, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 189980
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189980, 9666, 92110, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 189980
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189980, 9667, 92111, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 189981
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189981, 9668, 92112, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 189981
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189981, 9669, 92113, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 189981
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189981, 9670, 92114, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 189981
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (189981, 9671, 92115, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 191133
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191133, 9672, 92116, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 191133
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191133, 9673, 92117, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 191133
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191133, 9674, 92118, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 191133
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (191133, 9675, 92119, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 181569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181569, 9676, 92120, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181569, 9677, 92121, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181569, 9678, 92122, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181569
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181569, 9679, 92123, 40, 0, 1, 1, 'Grand Master Pick Bonus');
-- Journeyman bonus for GO 181570
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181570, 9680, 92120, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 181570
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181570, 9681, 92121, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 181570
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181570, 9682, 92122, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 181570
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (181570, 9683, 92123, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 185557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185557, 9684, 92124, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 185557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185557, 9685, 92125, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 185557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185557, 9686, 92126, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 185557
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (185557, 9687, 92127, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- Journeyman bonus for GO 195036
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (195036, 9688, 92128, 10, 0, 1, 1, 'Journeyman Pick Bonus');
-- Artisan bonus for GO 195036
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (195036, 9689, 92129, 20, 0, 1, 1, 'Artisan Pick Bonus');
-- Master bonus for GO 195036
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (195036, 9690, 92130, 30, 0, 1, 1, 'Master Pick Bonus');
-- Grand Master bonus for GO 195036
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (195036, 9691, 92131, 40, 0, 1, 1, 'Grand Master Pick Bonus');

-- =====================================================
-- CONDITIONS (Check for active pick auras)
-- =====================================================

-- Copper Vein - Journeyman Pick condition (Ref 92000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92000, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Copper Vein - Artisan Pick condition (Ref 92001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92001, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Copper Vein - Master Pick condition (Ref 92002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92002, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Copper Vein - Grand Master Pick condition (Ref 92003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92003, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Tin Vein - Journeyman Pick condition (Ref 92004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92004, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Tin Vein - Artisan Pick condition (Ref 92005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92005, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Tin Vein - Master Pick condition (Ref 92006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92006, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Tin Vein - Grand Master Pick condition (Ref 92007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92007, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Ooze Covered Silver Vein - Journeyman Pick condition (Ref 92008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92008, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Ooze Covered Silver Vein - Artisan Pick condition (Ref 92009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92009, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Ooze Covered Silver Vein - Master Pick condition (Ref 92010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92010, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Ooze Covered Silver Vein - Grand Master Pick condition (Ref 92011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92011, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Iron Deposit - Journeyman Pick condition (Ref 92012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92012, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Iron Deposit - Artisan Pick condition (Ref 92013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92013, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Iron Deposit - Master Pick condition (Ref 92014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92014, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Iron Deposit - Grand Master Pick condition (Ref 92015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92015, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Gold Vein - Journeyman Pick condition (Ref 92016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92016, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Gold Vein - Artisan Pick condition (Ref 92017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92017, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Gold Vein - Master Pick condition (Ref 92018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92018, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Gold Vein - Grand Master Pick condition (Ref 92019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92019, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Copper Vein - Journeyman Pick condition (Ref 92020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92020, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Copper Vein - Artisan Pick condition (Ref 92021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92021, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Copper Vein - Master Pick condition (Ref 92022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92022, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Copper Vein - Grand Master Pick condition (Ref 92023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92023, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Tin Vein - Journeyman Pick condition (Ref 92024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92024, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Tin Vein - Artisan Pick condition (Ref 92025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92025, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Tin Vein - Master Pick condition (Ref 92026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92026, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Tin Vein - Grand Master Pick condition (Ref 92027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92027, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Mithril Deposit - Journeyman Pick condition (Ref 92028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92028, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Mithril Deposit - Artisan Pick condition (Ref 92029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92029, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Mithril Deposit - Master Pick condition (Ref 92030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92030, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Mithril Deposit - Grand Master Pick condition (Ref 92031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92031, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Copper Vein - Journeyman Pick condition (Ref 92032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92032, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Copper Vein - Artisan Pick condition (Ref 92033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92033, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Copper Vein - Master Pick condition (Ref 92034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92034, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Copper Vein - Grand Master Pick condition (Ref 92035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92035, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Tin Vein - Journeyman Pick condition (Ref 92036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92036, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Tin Vein - Artisan Pick condition (Ref 92037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92037, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Tin Vein - Master Pick condition (Ref 92038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92038, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Tin Vein - Grand Master Pick condition (Ref 92039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92039, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Ooze Covered Truesilver Deposit - Journeyman Pick condition (Ref 92040)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92040, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Ooze Covered Truesilver Deposit - Artisan Pick condition (Ref 92041)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92041, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Ooze Covered Truesilver Deposit - Master Pick condition (Ref 92042)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92042, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Ooze Covered Truesilver Deposit - Grand Master Pick condition (Ref 92043)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92043, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Ooze Covered Thorium Vein - Journeyman Pick condition (Ref 92044)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92044, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Ooze Covered Thorium Vein - Artisan Pick condition (Ref 92045)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92045, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Ooze Covered Thorium Vein - Master Pick condition (Ref 92046)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92046, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Ooze Covered Thorium Vein - Grand Master Pick condition (Ref 92047)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92047, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Dark Iron Deposit - Journeyman Pick condition (Ref 92048)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92048, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Dark Iron Deposit - Artisan Pick condition (Ref 92049)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92049, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Dark Iron Deposit - Master Pick condition (Ref 92050)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92050, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Dark Iron Deposit - Grand Master Pick condition (Ref 92051)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92051, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Ooze Covered Rich Thorium Vein - Journeyman Pick condition (Ref 92052)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92052, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Ooze Covered Rich Thorium Vein - Artisan Pick condition (Ref 92053)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92053, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Ooze Covered Rich Thorium Vein - Master Pick condition (Ref 92054)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92054, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Ooze Covered Rich Thorium Vein - Grand Master Pick condition (Ref 92055)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92055, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Small Thorium Vein - Journeyman Pick condition (Ref 92056)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92056, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Small Thorium Vein - Artisan Pick condition (Ref 92057)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92057, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Small Thorium Vein - Master Pick condition (Ref 92058)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92058, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Small Thorium Vein - Grand Master Pick condition (Ref 92059)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92059, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Mithril Deposit - Journeyman Pick condition (Ref 92060)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92060, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Mithril Deposit - Artisan Pick condition (Ref 92061)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92061, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Mithril Deposit - Master Pick condition (Ref 92062)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92062, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Mithril Deposit - Grand Master Pick condition (Ref 92063)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92063, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Hakkari Thorium Vein - Journeyman Pick condition (Ref 92064)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92064, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Hakkari Thorium Vein - Artisan Pick condition (Ref 92065)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92065, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Hakkari Thorium Vein - Master Pick condition (Ref 92066)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92066, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Hakkari Thorium Vein - Grand Master Pick condition (Ref 92067)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92067, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Truesilver Deposit - Journeyman Pick condition (Ref 92068)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92068, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Truesilver Deposit - Artisan Pick condition (Ref 92069)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92069, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Truesilver Deposit - Master Pick condition (Ref 92070)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92070, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Truesilver Deposit - Grand Master Pick condition (Ref 92071)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92071, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Gold Vein - Journeyman Pick condition (Ref 92072)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92072, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Gold Vein - Artisan Pick condition (Ref 92073)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92073, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Gold Vein - Master Pick condition (Ref 92074)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92074, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Gold Vein - Grand Master Pick condition (Ref 92075)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92075, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Copper Vein - Journeyman Pick condition (Ref 92076)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92076, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Copper Vein - Artisan Pick condition (Ref 92077)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92077, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Copper Vein - Master Pick condition (Ref 92078)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92078, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Copper Vein - Grand Master Pick condition (Ref 92079)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92079, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Tin Vein - Journeyman Pick condition (Ref 92080)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92080, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Tin Vein - Artisan Pick condition (Ref 92081)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92081, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Tin Vein - Master Pick condition (Ref 92082)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92082, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Tin Vein - Grand Master Pick condition (Ref 92083)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92083, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Fel Iron Deposit - Journeyman Pick condition (Ref 92084)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92084, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Fel Iron Deposit - Artisan Pick condition (Ref 92085)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92085, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Fel Iron Deposit - Master Pick condition (Ref 92086)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92086, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Fel Iron Deposit - Grand Master Pick condition (Ref 92087)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92087, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Adamantite Deposit - Journeyman Pick condition (Ref 92088)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92088, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Adamantite Deposit - Artisan Pick condition (Ref 92089)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92089, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Adamantite Deposit - Master Pick condition (Ref 92090)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92090, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Adamantite Deposit - Grand Master Pick condition (Ref 92091)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92091, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Khorium Vein - Journeyman Pick condition (Ref 92092)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92092, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Khorium Vein - Artisan Pick condition (Ref 92093)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92093, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Khorium Vein - Master Pick condition (Ref 92094)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92094, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Khorium Vein - Grand Master Pick condition (Ref 92095)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92095, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Nethercite Deposit - Journeyman Pick condition (Ref 92096)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92096, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Nethercite Deposit - Artisan Pick condition (Ref 92097)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92097, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Nethercite Deposit - Master Pick condition (Ref 92098)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92098, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Nethercite Deposit - Grand Master Pick condition (Ref 92099)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92099, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Cobalt Deposit - Journeyman Pick condition (Ref 92100)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92100, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Cobalt Deposit - Artisan Pick condition (Ref 92101)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92101, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Cobalt Deposit - Master Pick condition (Ref 92102)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92102, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Cobalt Deposit - Grand Master Pick condition (Ref 92103)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92103, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Rich Cobalt Deposit - Journeyman Pick condition (Ref 92104)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92104, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Rich Cobalt Deposit - Artisan Pick condition (Ref 92105)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92105, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Rich Cobalt Deposit - Master Pick condition (Ref 92106)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92106, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Rich Cobalt Deposit - Grand Master Pick condition (Ref 92107)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92107, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Saronite Deposit - Journeyman Pick condition (Ref 92108)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92108, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Saronite Deposit - Artisan Pick condition (Ref 92109)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92109, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Saronite Deposit - Master Pick condition (Ref 92110)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92110, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Saronite Deposit - Grand Master Pick condition (Ref 92111)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92111, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Rich Saronite Deposit - Journeyman Pick condition (Ref 92112)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92112, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Rich Saronite Deposit - Artisan Pick condition (Ref 92113)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92113, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Rich Saronite Deposit - Master Pick condition (Ref 92114)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92114, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Rich Saronite Deposit - Grand Master Pick condition (Ref 92115)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92115, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Titanium Vein - Journeyman Pick condition (Ref 92116)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92116, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Titanium Vein - Artisan Pick condition (Ref 92117)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92117, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Titanium Vein - Master Pick condition (Ref 92118)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92118, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Titanium Vein - Grand Master Pick condition (Ref 92119)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92119, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Rich Adamantite Deposit - Journeyman Pick condition (Ref 92120)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92120, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Rich Adamantite Deposit - Artisan Pick condition (Ref 92121)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92121, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Rich Adamantite Deposit - Master Pick condition (Ref 92122)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92122, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Rich Adamantite Deposit - Grand Master Pick condition (Ref 92123)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92123, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Ancient Gem Vein - Journeyman Pick condition (Ref 92124)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92124, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Ancient Gem Vein - Artisan Pick condition (Ref 92125)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92125, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Ancient Gem Vein - Master Pick condition (Ref 92126)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92126, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Ancient Gem Vein - Grand Master Pick condition (Ref 92127)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92127, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Pure Saronite Deposit - Journeyman Pick condition (Ref 92128)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92128, 0, 0, 0, 1, 0, 91158, 1, 0);
-- Pure Saronite Deposit - Artisan Pick condition (Ref 92129)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92129, 0, 0, 0, 1, 0, 91159, 1, 0);
-- Pure Saronite Deposit - Master Pick condition (Ref 92130)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92130, 0, 0, 0, 1, 0, 91160, 1, 0);
-- Pure Saronite Deposit - Grand Master Pick condition (Ref 92131)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3) VALUES
    (10, 92131, 0, 0, 0, 1, 0, 91161, 1, 0);

-- Done!
