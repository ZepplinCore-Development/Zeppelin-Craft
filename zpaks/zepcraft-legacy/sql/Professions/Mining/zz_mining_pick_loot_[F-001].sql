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
-- Reference loot tables that duplicate node loot
-- Provides bonus 'second roll' when gathering with tools
-- Tiers: Journeyman (10%), Artisan (20%), Master (30%), Grand Master (40%)
-- =====================================================

-- Cleanup existing entries
DELETE FROM reference_loot_template WHERE Entry BETWEEN 92000 AND 92999;
DELETE FROM gameobject_loot_template WHERE Reference BETWEEN 92000 AND 92999;
DELETE FROM conditions WHERE SourceTypeOrReferenceId = 10 AND SourceGroup BETWEEN 92000 AND 92999;

-- Copper Vein (Loot ID: 1502)
-- Copper Vein - Journeyman Mining Pick Bonus (Ref 92000)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92000, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Journeyman Mining Pick');

-- Copper Vein - Artisan Mining Pick Bonus (Ref 92001)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92001, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Artisan Mining Pick');

-- Copper Vein - Master Mining Pick Bonus (Ref 92002)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92002, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Master Mining Pick');

-- Copper Vein - Grand Master Mining Pick Bonus (Ref 92003)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92003, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Grand Master Mining Pick');


-- Tin Vein (Loot ID: 1503)
-- Tin Vein - Journeyman Mining Pick Bonus (Ref 92004)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92004, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Journeyman Mining Pick');

-- Tin Vein - Artisan Mining Pick Bonus (Ref 92005)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92005, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Artisan Mining Pick');

-- Tin Vein - Master Mining Pick Bonus (Ref 92006)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92006, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Master Mining Pick');

-- Tin Vein - Grand Master Mining Pick Bonus (Ref 92007)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92007, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Grand Master Mining Pick');


-- Ooze Covered Silver Vein (Loot ID: 1504)
-- Ooze Covered Silver Vein - Journeyman Mining Pick Bonus (Ref 92008)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1206, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Moss Agate - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1210, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 1705, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92008, 2775, 100.0, 0, 2, 4, 'Ooze Covered Silver Vein - Silver Vein - Silver Ore - Journeyman Mining Pick');

-- Ooze Covered Silver Vein - Artisan Mining Pick Bonus (Ref 92009)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1206, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Moss Agate - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1210, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 1705, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92009, 2775, 100.0, 0, 2, 4, 'Ooze Covered Silver Vein - Silver Vein - Silver Ore - Artisan Mining Pick');

-- Ooze Covered Silver Vein - Master Mining Pick Bonus (Ref 92010)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1206, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Moss Agate - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1210, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 1705, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92010, 2775, 100.0, 0, 2, 4, 'Ooze Covered Silver Vein - Silver Vein - Silver Ore - Master Mining Pick');

-- Ooze Covered Silver Vein - Grand Master Mining Pick Bonus (Ref 92011)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1206, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Moss Agate - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1210, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 1705, 5.0, 0, 1, 1, 'Ooze Covered Silver Vein - Silver Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92011, 2775, 100.0, 0, 2, 4, 'Ooze Covered Silver Vein - Silver Vein - Silver Ore - Grand Master Mining Pick');


-- Iron Deposit (Loot ID: 1505)
-- Iron Deposit - Journeyman Mining Pick Bonus (Ref 92012)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 1529, 5.0, 0, 1, 1, 'Iron Deposit - Jade - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 1705, 5.0, 0, 1, 1, 'Iron Deposit - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 2772, 100.0, 0, 1, 4, 'Iron Deposit - Iron Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 2838, 50.0, 0, 1, 5, 'Iron Deposit - Heavy Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 3864, 5.0, 0, 1, 1, 'Iron Deposit - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92012, 7909, 5.0, 0, 1, 1, 'Iron Deposit - Aquamarine - Journeyman Mining Pick');

-- Iron Deposit - Artisan Mining Pick Bonus (Ref 92013)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 1529, 5.0, 0, 1, 1, 'Iron Deposit - Jade - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 1705, 5.0, 0, 1, 1, 'Iron Deposit - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 2772, 100.0, 0, 1, 4, 'Iron Deposit - Iron Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 2838, 50.0, 0, 1, 5, 'Iron Deposit - Heavy Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 3864, 5.0, 0, 1, 1, 'Iron Deposit - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92013, 7909, 5.0, 0, 1, 1, 'Iron Deposit - Aquamarine - Artisan Mining Pick');

-- Iron Deposit - Master Mining Pick Bonus (Ref 92014)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 1529, 5.0, 0, 1, 1, 'Iron Deposit - Jade - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 1705, 5.0, 0, 1, 1, 'Iron Deposit - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 2772, 100.0, 0, 1, 4, 'Iron Deposit - Iron Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 2838, 50.0, 0, 1, 5, 'Iron Deposit - Heavy Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 3864, 5.0, 0, 1, 1, 'Iron Deposit - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92014, 7909, 5.0, 0, 1, 1, 'Iron Deposit - Aquamarine - Master Mining Pick');

-- Iron Deposit - Grand Master Mining Pick Bonus (Ref 92015)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 1529, 5.0, 0, 1, 1, 'Iron Deposit - Jade - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 1705, 5.0, 0, 1, 1, 'Iron Deposit - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 2772, 100.0, 0, 1, 4, 'Iron Deposit - Iron Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 2838, 50.0, 0, 1, 5, 'Iron Deposit - Heavy Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 3864, 5.0, 0, 1, 1, 'Iron Deposit - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92015, 7909, 5.0, 0, 1, 1, 'Iron Deposit - Aquamarine - Grand Master Mining Pick');


-- Gold Vein (Loot ID: 1506)
-- Gold Vein - Journeyman Mining Pick Bonus (Ref 92016)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92016, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Journeyman Mining Pick');

-- Gold Vein - Artisan Mining Pick Bonus (Ref 92017)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92017, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Artisan Mining Pick');

-- Gold Vein - Master Mining Pick Bonus (Ref 92018)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92018, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Master Mining Pick');

-- Gold Vein - Grand Master Mining Pick Bonus (Ref 92019)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92019, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Grand Master Mining Pick');


-- Copper Vein (Loot ID: 1735)
-- Copper Vein - Journeyman Mining Pick Bonus (Ref 92020)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2798, 100.0, 0, 1, 4, 'Copper Vein - Rethban Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92020, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Journeyman Mining Pick');

-- Copper Vein - Artisan Mining Pick Bonus (Ref 92021)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2798, 100.0, 0, 1, 4, 'Copper Vein - Rethban Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92021, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Artisan Mining Pick');

-- Copper Vein - Master Mining Pick Bonus (Ref 92022)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2798, 100.0, 0, 1, 4, 'Copper Vein - Rethban Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92022, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Master Mining Pick');

-- Copper Vein - Grand Master Mining Pick Bonus (Ref 92023)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2798, 100.0, 0, 1, 4, 'Copper Vein - Rethban Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92023, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Grand Master Mining Pick');


-- Tin Vein (Loot ID: 1736)
-- Tin Vein - Journeyman Mining Pick Bonus (Ref 92024)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2798, 100.0, 0, 1, 2, 'Tin Vein - Rethban Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92024, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Journeyman Mining Pick');

-- Tin Vein - Artisan Mining Pick Bonus (Ref 92025)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2798, 100.0, 0, 1, 2, 'Tin Vein - Rethban Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92025, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Artisan Mining Pick');

-- Tin Vein - Master Mining Pick Bonus (Ref 92026)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2798, 100.0, 0, 1, 2, 'Tin Vein - Rethban Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92026, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Master Mining Pick');

-- Tin Vein - Grand Master Mining Pick Bonus (Ref 92027)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2798, 100.0, 0, 1, 2, 'Tin Vein - Rethban Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92027, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Grand Master Mining Pick');


-- Mithril Deposit (Loot ID: 1742)
-- Mithril Deposit - Journeyman Mining Pick Bonus (Ref 92028)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92028, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Journeyman Mining Pick');

-- Mithril Deposit - Artisan Mining Pick Bonus (Ref 92029)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92029, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Artisan Mining Pick');

-- Mithril Deposit - Master Mining Pick Bonus (Ref 92030)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92030, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Master Mining Pick');

-- Mithril Deposit - Grand Master Mining Pick Bonus (Ref 92031)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92031, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Grand Master Mining Pick');


-- Copper Vein (Loot ID: 2626)
-- Copper Vein - Journeyman Mining Pick Bonus (Ref 92032)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92032, 5075, 5.0, 0, 1, 3, 'Copper Vein - Blood Shard - Journeyman Mining Pick');

-- Copper Vein - Artisan Mining Pick Bonus (Ref 92033)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92033, 5075, 5.0, 0, 1, 3, 'Copper Vein - Blood Shard - Artisan Mining Pick');

-- Copper Vein - Master Mining Pick Bonus (Ref 92034)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92034, 5075, 5.0, 0, 1, 3, 'Copper Vein - Blood Shard - Master Mining Pick');

-- Copper Vein - Grand Master Mining Pick Bonus (Ref 92035)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92035, 5075, 5.0, 0, 1, 3, 'Copper Vein - Blood Shard - Grand Master Mining Pick');


-- Tin Vein (Loot ID: 2627)
-- Tin Vein - Journeyman Mining Pick Bonus (Ref 92036)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92036, 5075, 5.0, 0, 1, 4, 'Tin Vein - Blood Shard - Journeyman Mining Pick');

-- Tin Vein - Artisan Mining Pick Bonus (Ref 92037)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92037, 5075, 5.0, 0, 1, 4, 'Tin Vein - Blood Shard - Artisan Mining Pick');

-- Tin Vein - Master Mining Pick Bonus (Ref 92038)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92038, 5075, 5.0, 0, 1, 4, 'Tin Vein - Blood Shard - Master Mining Pick');

-- Tin Vein - Grand Master Mining Pick Bonus (Ref 92039)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92039, 5075, 5.0, 0, 1, 4, 'Tin Vein - Blood Shard - Grand Master Mining Pick');


-- Ooze Covered Truesilver Deposit (Loot ID: 5045)
-- Ooze Covered Truesilver Deposit - Journeyman Mining Pick Bonus (Ref 92040)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 3864, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7909, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Aquamarine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7910, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Star Ruby - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92040, 7911, 100.0, 0, 2, 4, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Truesilver Ore - Journeyman Mining Pick');

-- Ooze Covered Truesilver Deposit - Artisan Mining Pick Bonus (Ref 92041)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 3864, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7909, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Aquamarine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7910, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Star Ruby - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92041, 7911, 100.0, 0, 2, 4, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Truesilver Ore - Artisan Mining Pick');

-- Ooze Covered Truesilver Deposit - Master Mining Pick Bonus (Ref 92042)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 3864, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7909, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Aquamarine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7910, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Star Ruby - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92042, 7911, 100.0, 0, 2, 4, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Truesilver Ore - Master Mining Pick');

-- Ooze Covered Truesilver Deposit - Grand Master Mining Pick Bonus (Ref 92043)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 3864, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7909, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Aquamarine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7910, 5.0, 0, 1, 1, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Star Ruby - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92043, 7911, 100.0, 0, 2, 4, 'Ooze Covered Truesilver Deposit - Truesilver Deposit - Truesilver Ore - Grand Master Mining Pick');


-- Ooze Covered Thorium Vein (Loot ID: 9597)
-- Ooze Covered Thorium Vein - Journeyman Mining Pick Bonus (Ref 92044)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92044, 10620, 100.0, 0, 1, 3, 'Ooze Covered Thorium Vein - Small Thorium Vein - Thorium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92044, 12365, 50.0, 0, 1, 5, 'Ooze Covered Thorium Vein - Small Thorium Vein - Dense Stone - Journeyman Mining Pick');

-- Ooze Covered Thorium Vein - Artisan Mining Pick Bonus (Ref 92045)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92045, 10620, 100.0, 0, 1, 3, 'Ooze Covered Thorium Vein - Small Thorium Vein - Thorium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92045, 12365, 50.0, 0, 1, 5, 'Ooze Covered Thorium Vein - Small Thorium Vein - Dense Stone - Artisan Mining Pick');

-- Ooze Covered Thorium Vein - Master Mining Pick Bonus (Ref 92046)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92046, 10620, 100.0, 0, 1, 3, 'Ooze Covered Thorium Vein - Small Thorium Vein - Thorium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92046, 12365, 50.0, 0, 1, 5, 'Ooze Covered Thorium Vein - Small Thorium Vein - Dense Stone - Master Mining Pick');

-- Ooze Covered Thorium Vein - Grand Master Mining Pick Bonus (Ref 92047)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92047, 10620, 100.0, 0, 1, 3, 'Ooze Covered Thorium Vein - Small Thorium Vein - Thorium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92047, 12365, 50.0, 0, 1, 5, 'Ooze Covered Thorium Vein - Small Thorium Vein - Dense Stone - Grand Master Mining Pick');


-- Dark Iron Deposit (Loot ID: 11213)
-- Dark Iron Deposit - Journeyman Mining Pick Bonus (Ref 92048)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 9262, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Vitriol - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11370, 100.0, 0, 2, 4, 'Dark Iron Deposit - Dark Iron Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11382, 5.0, 0, 1, 1, 'Dark Iron Deposit - Blood of the Mountain - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92048, 11754, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Diamond - Journeyman Mining Pick');

-- Dark Iron Deposit - Artisan Mining Pick Bonus (Ref 92049)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 9262, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Vitriol - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11370, 100.0, 0, 2, 4, 'Dark Iron Deposit - Dark Iron Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11382, 5.0, 0, 1, 1, 'Dark Iron Deposit - Blood of the Mountain - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92049, 11754, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Diamond - Artisan Mining Pick');

-- Dark Iron Deposit - Master Mining Pick Bonus (Ref 92050)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 9262, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Vitriol - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11370, 100.0, 0, 2, 4, 'Dark Iron Deposit - Dark Iron Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11382, 5.0, 0, 1, 1, 'Dark Iron Deposit - Blood of the Mountain - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92050, 11754, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Diamond - Master Mining Pick');

-- Dark Iron Deposit - Grand Master Mining Pick Bonus (Ref 92051)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 9262, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Vitriol - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11370, 100.0, 0, 2, 4, 'Dark Iron Deposit - Dark Iron Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11382, 5.0, 0, 1, 1, 'Dark Iron Deposit - Blood of the Mountain - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92051, 11754, 5.0, 0, 1, 1, 'Dark Iron Deposit - Black Diamond - Grand Master Mining Pick');


-- Ooze Covered Rich Thorium Vein (Loot ID: 12883)
-- Ooze Covered Rich Thorium Vein - Journeyman Mining Pick Bonus (Ref 92052)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92052, 10620, 100.0, 0, 3, 5, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Thorium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92052, 12365, 50.0, 0, 4, 7, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Dense Stone - Journeyman Mining Pick');

-- Ooze Covered Rich Thorium Vein - Artisan Mining Pick Bonus (Ref 92053)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92053, 10620, 100.0, 0, 3, 5, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Thorium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92053, 12365, 50.0, 0, 4, 7, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Dense Stone - Artisan Mining Pick');

-- Ooze Covered Rich Thorium Vein - Master Mining Pick Bonus (Ref 92054)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92054, 10620, 100.0, 0, 3, 5, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Thorium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92054, 12365, 50.0, 0, 4, 7, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Dense Stone - Master Mining Pick');

-- Ooze Covered Rich Thorium Vein - Grand Master Mining Pick Bonus (Ref 92055)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92055, 10620, 100.0, 0, 3, 5, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Thorium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92055, 12365, 50.0, 0, 4, 7, 'Ooze Covered Rich Thorium Vein - Rich Thorium Vein - Dense Stone - Grand Master Mining Pick');


-- Small Thorium Vein (Loot ID: 13960)
-- Small Thorium Vein - Journeyman Mining Pick Bonus (Ref 92056)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 10620, 100.0, 0, 1, 3, 'Small Thorium Vein - Thorium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 11513, 50.0, 0, 1, 1, 'Small Thorium Vein - Tainted Vitriol - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92056, 12365, 50.0, 0, 1, 5, 'Small Thorium Vein - Dense Stone - Journeyman Mining Pick');

-- Small Thorium Vein - Artisan Mining Pick Bonus (Ref 92057)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 10620, 100.0, 0, 1, 3, 'Small Thorium Vein - Thorium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 11513, 50.0, 0, 1, 1, 'Small Thorium Vein - Tainted Vitriol - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92057, 12365, 50.0, 0, 1, 5, 'Small Thorium Vein - Dense Stone - Artisan Mining Pick');

-- Small Thorium Vein - Master Mining Pick Bonus (Ref 92058)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 10620, 100.0, 0, 1, 3, 'Small Thorium Vein - Thorium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 11513, 50.0, 0, 1, 1, 'Small Thorium Vein - Tainted Vitriol - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92058, 12365, 50.0, 0, 1, 5, 'Small Thorium Vein - Dense Stone - Master Mining Pick');

-- Small Thorium Vein - Grand Master Mining Pick Bonus (Ref 92059)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 10620, 100.0, 0, 1, 3, 'Small Thorium Vein - Thorium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 11513, 50.0, 0, 1, 1, 'Small Thorium Vein - Tainted Vitriol - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92059, 12365, 50.0, 0, 1, 5, 'Small Thorium Vein - Dense Stone - Grand Master Mining Pick');


-- Mithril Deposit (Loot ID: 13961)
-- Mithril Deposit - Journeyman Mining Pick Bonus (Ref 92060)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92060, 11513, 25.0, 0, 1, 4, 'Mithril Deposit - Tainted Vitriol - Journeyman Mining Pick');

-- Mithril Deposit - Artisan Mining Pick Bonus (Ref 92061)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92061, 11513, 25.0, 0, 1, 4, 'Mithril Deposit - Tainted Vitriol - Artisan Mining Pick');

-- Mithril Deposit - Master Mining Pick Bonus (Ref 92062)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92062, 11513, 25.0, 0, 1, 4, 'Mithril Deposit - Tainted Vitriol - Master Mining Pick');

-- Mithril Deposit - Grand Master Mining Pick Bonus (Ref 92063)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 3858, 100.0, 0, 1, 4, 'Mithril Deposit - Mithril Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 3864, 5.0, 0, 1, 1, 'Mithril Deposit - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7909, 5.0, 0, 1, 1, 'Mithril Deposit - Aquamarine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7910, 5.0, 0, 1, 1, 'Mithril Deposit - Star Ruby - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 7912, 50.0, 0, 1, 8, 'Mithril Deposit - Solid Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 9262, 5.0, 0, 1, 1, 'Mithril Deposit - Black Vitriol - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92063, 11513, 25.0, 0, 1, 4, 'Mithril Deposit - Tainted Vitriol - Grand Master Mining Pick');


-- Hakkari Thorium Vein (Loot ID: 17241)
-- Hakkari Thorium Vein - Journeyman Mining Pick Bonus (Ref 92064)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 10620, 100.0, 0, 1, 5, 'Hakkari Thorium Vein - Thorium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 12365, 50.0, 0, 1, 7, 'Hakkari Thorium Vein - Dense Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92064, 19774, 40.0, 0, 1, 2, 'Hakkari Thorium Vein - Souldarite - Journeyman Mining Pick');

-- Hakkari Thorium Vein - Artisan Mining Pick Bonus (Ref 92065)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 10620, 100.0, 0, 1, 5, 'Hakkari Thorium Vein - Thorium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 12365, 50.0, 0, 1, 7, 'Hakkari Thorium Vein - Dense Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92065, 19774, 40.0, 0, 1, 2, 'Hakkari Thorium Vein - Souldarite - Artisan Mining Pick');

-- Hakkari Thorium Vein - Master Mining Pick Bonus (Ref 92066)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 10620, 100.0, 0, 1, 5, 'Hakkari Thorium Vein - Thorium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 12365, 50.0, 0, 1, 7, 'Hakkari Thorium Vein - Dense Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92066, 19774, 40.0, 0, 1, 2, 'Hakkari Thorium Vein - Souldarite - Master Mining Pick');

-- Hakkari Thorium Vein - Grand Master Mining Pick Bonus (Ref 92067)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 10620, 100.0, 0, 1, 5, 'Hakkari Thorium Vein - Thorium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 12365, 50.0, 0, 1, 7, 'Hakkari Thorium Vein - Dense Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92067, 19774, 40.0, 0, 1, 2, 'Hakkari Thorium Vein - Souldarite - Grand Master Mining Pick');


-- Truesilver Deposit (Loot ID: 17938)
-- Truesilver Deposit - Journeyman Mining Pick Bonus (Ref 92068)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 3864, 5.0, 0, 1, 1, 'Truesilver Deposit - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7909, 5.0, 0, 1, 1, 'Truesilver Deposit - Aquamarine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7910, 5.0, 0, 1, 1, 'Truesilver Deposit - Star Ruby - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 7911, 100.0, 0, 2, 8, 'Truesilver Deposit - Truesilver Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92068, 11513, 50.0, 0, 1, 1, 'Truesilver Deposit - Tainted Vitriol - Journeyman Mining Pick');

-- Truesilver Deposit - Artisan Mining Pick Bonus (Ref 92069)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 3864, 5.0, 0, 1, 1, 'Truesilver Deposit - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7909, 5.0, 0, 1, 1, 'Truesilver Deposit - Aquamarine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7910, 5.0, 0, 1, 1, 'Truesilver Deposit - Star Ruby - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 7911, 100.0, 0, 2, 8, 'Truesilver Deposit - Truesilver Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92069, 11513, 50.0, 0, 1, 1, 'Truesilver Deposit - Tainted Vitriol - Artisan Mining Pick');

-- Truesilver Deposit - Master Mining Pick Bonus (Ref 92070)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 3864, 5.0, 0, 1, 1, 'Truesilver Deposit - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7909, 5.0, 0, 1, 1, 'Truesilver Deposit - Aquamarine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7910, 5.0, 0, 1, 1, 'Truesilver Deposit - Star Ruby - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 7911, 100.0, 0, 2, 8, 'Truesilver Deposit - Truesilver Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92070, 11513, 50.0, 0, 1, 1, 'Truesilver Deposit - Tainted Vitriol - Master Mining Pick');

-- Truesilver Deposit - Grand Master Mining Pick Bonus (Ref 92071)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 3864, 5.0, 0, 1, 1, 'Truesilver Deposit - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7909, 5.0, 0, 1, 1, 'Truesilver Deposit - Aquamarine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7910, 5.0, 0, 1, 1, 'Truesilver Deposit - Star Ruby - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 7911, 100.0, 0, 2, 8, 'Truesilver Deposit - Truesilver Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92071, 11513, 50.0, 0, 1, 1, 'Truesilver Deposit - Tainted Vitriol - Grand Master Mining Pick');


-- Gold Vein (Loot ID: 17939)
-- Gold Vein - Journeyman Mining Pick Bonus (Ref 92072)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92072, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Journeyman Mining Pick');

-- Gold Vein - Artisan Mining Pick Bonus (Ref 92073)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92073, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Artisan Mining Pick');

-- Gold Vein - Master Mining Pick Bonus (Ref 92074)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92074, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Master Mining Pick');

-- Gold Vein - Grand Master Mining Pick Bonus (Ref 92075)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 1705, 5.0, 0, 1, 1, 'Gold Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 2776, 100.0, 0, 2, 4, 'Gold Vein - Gold Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 3864, 5.0, 0, 1, 1, 'Gold Vein - Citrine - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92075, 7909, 5.0, 0, 1, 1, 'Gold Vein - Aquamarine - Grand Master Mining Pick');


-- Copper Vein (Loot ID: 18092)
-- Copper Vein - Journeyman Mining Pick Bonus (Ref 92076)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92076, 22634, 100.0, 0, 1, 2, 'Copper Vein - Underlight Ore - Journeyman Mining Pick');

-- Copper Vein - Artisan Mining Pick Bonus (Ref 92077)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92077, 22634, 100.0, 0, 1, 2, 'Copper Vein - Underlight Ore - Artisan Mining Pick');

-- Copper Vein - Master Mining Pick Bonus (Ref 92078)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92078, 22634, 100.0, 0, 1, 2, 'Copper Vein - Underlight Ore - Master Mining Pick');

-- Copper Vein - Grand Master Mining Pick Bonus (Ref 92079)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 774, 5.0, 0, 1, 1, 'Copper Vein - Malachite - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 818, 5.0, 0, 1, 1, 'Copper Vein - Tigerseye - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 1210, 5.0, 0, 1, 1, 'Copper Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 2770, 100.0, 0, 1, 4, 'Copper Vein - Copper Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 2835, 50.0, 0, 1, 6, 'Copper Vein - Rough Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92079, 22634, 100.0, 0, 1, 2, 'Copper Vein - Underlight Ore - Grand Master Mining Pick');


-- Tin Vein (Loot ID: 18093)
-- Tin Vein - Journeyman Mining Pick Bonus (Ref 92080)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92080, 22634, 100.0, 0, 1, 2, 'Tin Vein - Underlight Ore - Journeyman Mining Pick');

-- Tin Vein - Artisan Mining Pick Bonus (Ref 92081)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92081, 22634, 100.0, 0, 1, 2, 'Tin Vein - Underlight Ore - Artisan Mining Pick');

-- Tin Vein - Master Mining Pick Bonus (Ref 92082)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92082, 22634, 100.0, 0, 1, 2, 'Tin Vein - Underlight Ore - Master Mining Pick');

-- Tin Vein - Grand Master Mining Pick Bonus (Ref 92083)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1206, 5.0, 0, 1, 1, 'Tin Vein - Moss Agate - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1210, 5.0, 0, 1, 1, 'Tin Vein - Shadowgem - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1529, 5.0, 0, 1, 1, 'Tin Vein - Jade - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 1705, 5.0, 0, 1, 1, 'Tin Vein - Lesser Moonstone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 2771, 100.0, 0, 1, 4, 'Tin Vein - Tin Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 2836, 50.0, 0, 1, 6, 'Tin Vein - Coarse Stone - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92083, 22634, 100.0, 0, 1, 2, 'Tin Vein - Underlight Ore - Grand Master Mining Pick');


-- Fel Iron Deposit (Loot ID: 18359)
-- Fel Iron Deposit - Journeyman Mining Pick Bonus (Ref 92084)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 22573, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 22574, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Fire - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 23424, 100.0, 0, 2, 4, 'Fel Iron Deposit - Fel Iron Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 23427, 5.0, 0, 1, 2, 'Fel Iron Deposit - Eternium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92084, 35229, 25.0, 0, 1, 1, 'Fel Iron Deposit - Nether Residue - Journeyman Mining Pick');

-- Fel Iron Deposit - Artisan Mining Pick Bonus (Ref 92085)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 22573, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 22574, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Fire - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 23424, 100.0, 0, 2, 4, 'Fel Iron Deposit - Fel Iron Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 23427, 5.0, 0, 1, 2, 'Fel Iron Deposit - Eternium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92085, 35229, 25.0, 0, 1, 1, 'Fel Iron Deposit - Nether Residue - Artisan Mining Pick');

-- Fel Iron Deposit - Master Mining Pick Bonus (Ref 92086)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 22573, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 22574, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Fire - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 23424, 100.0, 0, 2, 4, 'Fel Iron Deposit - Fel Iron Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 23427, 5.0, 0, 1, 2, 'Fel Iron Deposit - Eternium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92086, 35229, 25.0, 0, 1, 1, 'Fel Iron Deposit - Nether Residue - Master Mining Pick');

-- Fel Iron Deposit - Grand Master Mining Pick Bonus (Ref 92087)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 22573, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 22574, 10.0, 0, 1, 2, 'Fel Iron Deposit - Mote of Fire - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 23424, 100.0, 0, 2, 4, 'Fel Iron Deposit - Fel Iron Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 23427, 5.0, 0, 1, 2, 'Fel Iron Deposit - Eternium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92087, 35229, 25.0, 0, 1, 1, 'Fel Iron Deposit - Nether Residue - Grand Master Mining Pick');


-- Adamantite Deposit (Loot ID: 18361)
-- Adamantite Deposit - Journeyman Mining Pick Bonus (Ref 92088)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 22573, 10.0, 0, 1, 8, 'Adamantite Deposit - Mote of Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 23425, 100.0, 0, 2, 4, 'Adamantite Deposit - Adamantite Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 23427, 10.0, 0, 1, 2, 'Adamantite Deposit - Eternium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92088, 35229, 25.0, 0, 1, 1, 'Adamantite Deposit - Nether Residue - Journeyman Mining Pick');

-- Adamantite Deposit - Artisan Mining Pick Bonus (Ref 92089)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 22573, 10.0, 0, 1, 8, 'Adamantite Deposit - Mote of Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 23425, 100.0, 0, 2, 4, 'Adamantite Deposit - Adamantite Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 23427, 10.0, 0, 1, 2, 'Adamantite Deposit - Eternium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92089, 35229, 25.0, 0, 1, 1, 'Adamantite Deposit - Nether Residue - Artisan Mining Pick');

-- Adamantite Deposit - Master Mining Pick Bonus (Ref 92090)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 22573, 10.0, 0, 1, 8, 'Adamantite Deposit - Mote of Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 23425, 100.0, 0, 2, 4, 'Adamantite Deposit - Adamantite Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 23427, 10.0, 0, 1, 2, 'Adamantite Deposit - Eternium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92090, 35229, 25.0, 0, 1, 1, 'Adamantite Deposit - Nether Residue - Master Mining Pick');

-- Adamantite Deposit - Grand Master Mining Pick Bonus (Ref 92091)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 22573, 10.0, 0, 1, 8, 'Adamantite Deposit - Mote of Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 23425, 100.0, 0, 2, 4, 'Adamantite Deposit - Adamantite Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 23427, 10.0, 0, 1, 2, 'Adamantite Deposit - Eternium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92091, 35229, 25.0, 0, 1, 1, 'Adamantite Deposit - Nether Residue - Grand Master Mining Pick');


-- Khorium Vein (Loot ID: 18363)
-- Khorium Vein - Journeyman Mining Pick Bonus (Ref 92092)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 22573, 35.0, 0, 2, 5, 'Khorium Vein - Mote of Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 22574, 10.0, 0, 2, 5, 'Khorium Vein - Mote of Fire - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 23426, 100.0, 0, 2, 4, 'Khorium Vein - Khorium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 23427, 10.0, 0, 1, 3, 'Khorium Vein - Eternium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92092, 35229, 25.0, 0, 1, 1, 'Khorium Vein - Nether Residue - Journeyman Mining Pick');

-- Khorium Vein - Artisan Mining Pick Bonus (Ref 92093)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 22573, 35.0, 0, 2, 5, 'Khorium Vein - Mote of Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 22574, 10.0, 0, 2, 5, 'Khorium Vein - Mote of Fire - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 23426, 100.0, 0, 2, 4, 'Khorium Vein - Khorium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 23427, 10.0, 0, 1, 3, 'Khorium Vein - Eternium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92093, 35229, 25.0, 0, 1, 1, 'Khorium Vein - Nether Residue - Artisan Mining Pick');

-- Khorium Vein - Master Mining Pick Bonus (Ref 92094)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 22573, 35.0, 0, 2, 5, 'Khorium Vein - Mote of Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 22574, 10.0, 0, 2, 5, 'Khorium Vein - Mote of Fire - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 23426, 100.0, 0, 2, 4, 'Khorium Vein - Khorium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 23427, 10.0, 0, 1, 3, 'Khorium Vein - Eternium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92094, 35229, 25.0, 0, 1, 1, 'Khorium Vein - Nether Residue - Master Mining Pick');

-- Khorium Vein - Grand Master Mining Pick Bonus (Ref 92095)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 22573, 35.0, 0, 2, 5, 'Khorium Vein - Mote of Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 22574, 10.0, 0, 2, 5, 'Khorium Vein - Mote of Fire - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 23426, 100.0, 0, 2, 4, 'Khorium Vein - Khorium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 23427, 10.0, 0, 1, 3, 'Khorium Vein - Eternium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92095, 35229, 25.0, 0, 1, 1, 'Khorium Vein - Nether Residue - Grand Master Mining Pick');


-- Nethercite Deposit (Loot ID: 22070)
-- Nethercite Deposit - Journeyman Mining Pick Bonus (Ref 92096)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 22573, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 22574, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Fire - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 32464, 100.0, 0, 1, 4, 'Nethercite Deposit - Nethercite Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92096, 32506, 1.0, 0, 1, 1, 'Nethercite Deposit - Netherwing Egg - Journeyman Mining Pick');

-- Nethercite Deposit - Artisan Mining Pick Bonus (Ref 92097)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 22573, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 22574, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Fire - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 32464, 100.0, 0, 1, 4, 'Nethercite Deposit - Nethercite Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92097, 32506, 1.0, 0, 1, 1, 'Nethercite Deposit - Netherwing Egg - Artisan Mining Pick');

-- Nethercite Deposit - Master Mining Pick Bonus (Ref 92098)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 22573, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 22574, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Fire - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 32464, 100.0, 0, 1, 4, 'Nethercite Deposit - Nethercite Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92098, 32506, 1.0, 0, 1, 1, 'Nethercite Deposit - Netherwing Egg - Master Mining Pick');

-- Nethercite Deposit - Grand Master Mining Pick Bonus (Ref 92099)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 22573, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 22574, 10.0, 0, 1, 6, 'Nethercite Deposit - Mote of Fire - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 32464, 100.0, 0, 1, 4, 'Nethercite Deposit - Nethercite Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92099, 32506, 1.0, 0, 1, 1, 'Nethercite Deposit - Netherwing Egg - Grand Master Mining Pick');


-- Cobalt Deposit (Loot ID: 24153)
-- Cobalt Deposit - Journeyman Mining Pick Bonus (Ref 92100)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 36909, 100.0, 0, 2, 4, 'Cobalt Deposit - Cobalt Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 37701, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92100, 37705, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Water - Journeyman Mining Pick');

-- Cobalt Deposit - Artisan Mining Pick Bonus (Ref 92101)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 36909, 100.0, 0, 2, 4, 'Cobalt Deposit - Cobalt Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 37701, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92101, 37705, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Water - Artisan Mining Pick');

-- Cobalt Deposit - Master Mining Pick Bonus (Ref 92102)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 36909, 100.0, 0, 2, 4, 'Cobalt Deposit - Cobalt Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 37701, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92102, 37705, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Water - Master Mining Pick');

-- Cobalt Deposit - Grand Master Mining Pick Bonus (Ref 92103)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 36909, 100.0, 0, 2, 4, 'Cobalt Deposit - Cobalt Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 37701, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92103, 37705, 30.0, 0, 1, 2, 'Cobalt Deposit - Crystallized Water - Grand Master Mining Pick');


-- Rich Cobalt Deposit (Loot ID: 24154)
-- Rich Cobalt Deposit - Journeyman Mining Pick Bonus (Ref 92104)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 36909, 100.0, 0, 4, 8, 'Rich Cobalt Deposit - Cobalt Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 37701, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92104, 37705, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Water - Journeyman Mining Pick');

-- Rich Cobalt Deposit - Artisan Mining Pick Bonus (Ref 92105)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 36909, 100.0, 0, 4, 8, 'Rich Cobalt Deposit - Cobalt Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 37701, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92105, 37705, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Water - Artisan Mining Pick');

-- Rich Cobalt Deposit - Master Mining Pick Bonus (Ref 92106)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 36909, 100.0, 0, 4, 8, 'Rich Cobalt Deposit - Cobalt Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 37701, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92106, 37705, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Water - Master Mining Pick');

-- Rich Cobalt Deposit - Grand Master Mining Pick Bonus (Ref 92107)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 36909, 100.0, 0, 4, 8, 'Rich Cobalt Deposit - Cobalt Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 37701, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92107, 37705, 30.0, 0, 1, 2, 'Rich Cobalt Deposit - Crystallized Water - Grand Master Mining Pick');


-- Saronite Deposit (Loot ID: 24155)
-- Saronite Deposit - Journeyman Mining Pick Bonus (Ref 92108)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 36912, 100.0, 0, 2, 4, 'Saronite Deposit - Saronite Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 37701, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92108, 37703, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Shadow - Journeyman Mining Pick');

-- Saronite Deposit - Artisan Mining Pick Bonus (Ref 92109)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 36912, 100.0, 0, 2, 4, 'Saronite Deposit - Saronite Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 37701, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92109, 37703, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Shadow - Artisan Mining Pick');

-- Saronite Deposit - Master Mining Pick Bonus (Ref 92110)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 36912, 100.0, 0, 2, 4, 'Saronite Deposit - Saronite Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 37701, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92110, 37703, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Shadow - Master Mining Pick');

-- Saronite Deposit - Grand Master Mining Pick Bonus (Ref 92111)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 36912, 100.0, 0, 2, 4, 'Saronite Deposit - Saronite Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 37701, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92111, 37703, 40.0, 0, 1, 2, 'Saronite Deposit - Crystallized Shadow - Grand Master Mining Pick');


-- Rich Saronite Deposit (Loot ID: 24156)
-- Rich Saronite Deposit - Journeyman Mining Pick Bonus (Ref 92112)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 36912, 100.0, 0, 5, 7, 'Rich Saronite Deposit - Saronite Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 37701, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92112, 37703, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Shadow - Journeyman Mining Pick');

-- Rich Saronite Deposit - Artisan Mining Pick Bonus (Ref 92113)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 36912, 100.0, 0, 5, 7, 'Rich Saronite Deposit - Saronite Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 37701, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92113, 37703, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Shadow - Artisan Mining Pick');

-- Rich Saronite Deposit - Master Mining Pick Bonus (Ref 92114)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 36912, 100.0, 0, 5, 7, 'Rich Saronite Deposit - Saronite Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 37701, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92114, 37703, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Shadow - Master Mining Pick');

-- Rich Saronite Deposit - Grand Master Mining Pick Bonus (Ref 92115)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 36912, 100.0, 0, 5, 7, 'Rich Saronite Deposit - Saronite Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 37701, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92115, 37703, 40.0, 0, 1, 8, 'Rich Saronite Deposit - Crystallized Shadow - Grand Master Mining Pick');


-- Titanium Vein (Loot ID: 24157)
-- Titanium Vein - Journeyman Mining Pick Bonus (Ref 92116)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 36910, 100.0, 0, 2, 4, 'Titanium Vein - Titanium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37700, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Air - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37701, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37702, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Fire - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92116, 37705, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Water - Journeyman Mining Pick');

-- Titanium Vein - Artisan Mining Pick Bonus (Ref 92117)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 36910, 100.0, 0, 2, 4, 'Titanium Vein - Titanium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37700, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Air - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37701, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37702, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Fire - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92117, 37705, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Water - Artisan Mining Pick');

-- Titanium Vein - Master Mining Pick Bonus (Ref 92118)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 36910, 100.0, 0, 2, 4, 'Titanium Vein - Titanium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37700, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Air - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37701, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37702, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Fire - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92118, 37705, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Water - Master Mining Pick');

-- Titanium Vein - Grand Master Mining Pick Bonus (Ref 92119)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 36910, 100.0, 0, 2, 4, 'Titanium Vein - Titanium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37700, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Air - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37701, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37702, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Fire - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92119, 37705, 50.0, 0, 3, 6, 'Titanium Vein - Crystallized Water - Grand Master Mining Pick');


-- Rich Adamantite Deposit (Loot ID: 26861)
-- Rich Adamantite Deposit - Journeyman Mining Pick Bonus (Ref 92120)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 22573, 10.0, 0, 4, 8, 'Rich Adamantite Deposit - Mote of Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 23425, 100.0, 0, 5, 7, 'Rich Adamantite Deposit - Adamantite Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 23427, 10.0, 0, 2, 3, 'Rich Adamantite Deposit - Eternium Ore - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92120, 35229, 25.0, 0, 1, 1, 'Rich Adamantite Deposit - Nether Residue - Journeyman Mining Pick');

-- Rich Adamantite Deposit - Artisan Mining Pick Bonus (Ref 92121)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 22573, 10.0, 0, 4, 8, 'Rich Adamantite Deposit - Mote of Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 23425, 100.0, 0, 5, 7, 'Rich Adamantite Deposit - Adamantite Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 23427, 10.0, 0, 2, 3, 'Rich Adamantite Deposit - Eternium Ore - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92121, 35229, 25.0, 0, 1, 1, 'Rich Adamantite Deposit - Nether Residue - Artisan Mining Pick');

-- Rich Adamantite Deposit - Master Mining Pick Bonus (Ref 92122)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 22573, 10.0, 0, 4, 8, 'Rich Adamantite Deposit - Mote of Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 23425, 100.0, 0, 5, 7, 'Rich Adamantite Deposit - Adamantite Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 23427, 10.0, 0, 2, 3, 'Rich Adamantite Deposit - Eternium Ore - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92122, 35229, 25.0, 0, 1, 1, 'Rich Adamantite Deposit - Nether Residue - Master Mining Pick');

-- Rich Adamantite Deposit - Grand Master Mining Pick Bonus (Ref 92123)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 22573, 10.0, 0, 4, 8, 'Rich Adamantite Deposit - Mote of Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 23425, 100.0, 0, 5, 7, 'Rich Adamantite Deposit - Adamantite Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 23427, 10.0, 0, 2, 3, 'Rich Adamantite Deposit - Eternium Ore - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92123, 35229, 25.0, 0, 1, 1, 'Rich Adamantite Deposit - Nether Residue - Grand Master Mining Pick');


-- Ancient Gem Vein (Loot ID: 26862)
-- Pure Saronite Deposit (Loot ID: 27244)
-- Pure Saronite Deposit - Journeyman Mining Pick Bonus (Ref 92124)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92124, 35624, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Earth - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92124, 35627, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Shadow - Journeyman Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92124, 36912, 100.0, 0, 22, 38, 'Pure Saronite Deposit - Saronite Ore - Journeyman Mining Pick');

-- Pure Saronite Deposit - Artisan Mining Pick Bonus (Ref 92125)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92125, 35624, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Earth - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92125, 35627, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Shadow - Artisan Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92125, 36912, 100.0, 0, 22, 38, 'Pure Saronite Deposit - Saronite Ore - Artisan Mining Pick');

-- Pure Saronite Deposit - Master Mining Pick Bonus (Ref 92126)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92126, 35624, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Earth - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92126, 35627, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Shadow - Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92126, 36912, 100.0, 0, 22, 38, 'Pure Saronite Deposit - Saronite Ore - Master Mining Pick');

-- Pure Saronite Deposit - Grand Master Mining Pick Bonus (Ref 92127)
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92127, 35624, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Earth - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92127, 35627, 60.0, 0, 2, 4, 'Pure Saronite Deposit - Eternal Shadow - Grand Master Mining Pick');
INSERT INTO reference_loot_template (Entry, Item, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (92127, 36912, 100.0, 0, 22, 38, 'Pure Saronite Deposit - Saronite Ore - Grand Master Mining Pick');


-- =====================================================
-- LINK REFERENCES TO GAMEOBJECTS
-- =====================================================

-- Journeyman bonus for loot table 1502 (GOs: 1731, 103713)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1502, 9500, 92000, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1502 (GOs: 1731, 103713)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1502, 9501, 92001, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1502 (GOs: 1731, 103713)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1502, 9502, 92002, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1502 (GOs: 1731, 103713)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1502, 9503, 92003, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1503 (GOs: 1732, 103711)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1503, 9504, 92004, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1503 (GOs: 1732, 103711)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1503, 9505, 92005, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1503 (GOs: 1732, 103711)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1503, 9506, 92006, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1503 (GOs: 1732, 103711)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1503, 9507, 92007, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1504 (GOs: 1733, 73940, 105569)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1504, 9508, 92008, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1504 (GOs: 1733, 73940, 105569)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1504, 9509, 92009, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1504 (GOs: 1733, 73940, 105569)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1504, 9510, 92010, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1504 (GOs: 1733, 73940, 105569)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1504, 9511, 92011, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1505 (GOs: 1735, 73939)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1505, 9512, 92012, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1505 (GOs: 1735, 73939)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1505, 9513, 92013, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1505 (GOs: 1735, 73939)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1505, 9514, 92014, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1505 (GOs: 1735, 73939)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1505, 9515, 92015, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1506 (GOs: 1734, 73941, 150080)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1506, 9516, 92016, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1506 (GOs: 1734, 73941, 150080)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1506, 9517, 92017, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1506 (GOs: 1734, 73941, 150080)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1506, 9518, 92018, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1506 (GOs: 1734, 73941, 150080)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1506, 9519, 92019, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1735 (GOs: 2055)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9520, 92020, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1735 (GOs: 2055)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9521, 92021, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1735 (GOs: 2055)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9522, 92022, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1735 (GOs: 2055)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1735, 9523, 92023, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1736 (GOs: 2054)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1736, 9524, 92024, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1736 (GOs: 2054)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1736, 9525, 92025, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1736 (GOs: 2054)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1736, 9526, 92026, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1736 (GOs: 2054)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1736, 9527, 92027, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 1742 (GOs: 2040, 123310, 150079)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1742, 9528, 92028, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 1742 (GOs: 2040, 123310, 150079)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1742, 9529, 92029, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 1742 (GOs: 2040, 123310, 150079)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1742, 9530, 92030, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 1742 (GOs: 2040, 123310, 150079)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (1742, 9531, 92031, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 2626 (GOs: 3763)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2626, 9532, 92032, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 2626 (GOs: 3763)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2626, 9533, 92033, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 2626 (GOs: 3763)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2626, 9534, 92034, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 2626 (GOs: 3763)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2626, 9535, 92035, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 2627 (GOs: 3764)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2627, 9536, 92036, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 2627 (GOs: 3764)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2627, 9537, 92037, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 2627 (GOs: 3764)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2627, 9538, 92038, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 2627 (GOs: 3764)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (2627, 9539, 92039, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 5045 (GOs: 2047, 123309, 150081)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (5045, 9540, 92040, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 5045 (GOs: 2047, 123309, 150081)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (5045, 9541, 92041, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 5045 (GOs: 2047, 123309, 150081)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (5045, 9542, 92042, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 5045 (GOs: 2047, 123309, 150081)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (5045, 9543, 92043, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 9597 (GOs: 324, 123848, 150082)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (9597, 9544, 92044, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 9597 (GOs: 324, 123848, 150082)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (9597, 9545, 92045, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 9597 (GOs: 324, 123848, 150082)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (9597, 9546, 92046, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 9597 (GOs: 324, 123848, 150082)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (9597, 9547, 92047, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 11213 (GOs: 165658)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (11213, 9548, 92048, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 11213 (GOs: 165658)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (11213, 9549, 92049, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 11213 (GOs: 165658)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (11213, 9550, 92050, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 11213 (GOs: 165658)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (11213, 9551, 92051, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 12883 (GOs: 175404, 177388)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (12883, 9552, 92052, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 12883 (GOs: 175404, 177388)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (12883, 9553, 92053, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 12883 (GOs: 175404, 177388)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (12883, 9554, 92054, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 12883 (GOs: 175404, 177388)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (12883, 9555, 92055, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 13960 (GOs: 176643)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13960, 9556, 92056, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 13960 (GOs: 176643)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13960, 9557, 92057, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 13960 (GOs: 176643)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13960, 9558, 92058, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 13960 (GOs: 176643)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13960, 9559, 92059, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 13961 (GOs: 176645)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13961, 9560, 92060, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 13961 (GOs: 176645)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13961, 9561, 92061, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 13961 (GOs: 176645)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13961, 9562, 92062, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 13961 (GOs: 176645)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (13961, 9563, 92063, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 17241 (GOs: 180215)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17241, 9564, 92064, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 17241 (GOs: 180215)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17241, 9565, 92065, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 17241 (GOs: 180215)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17241, 9566, 92066, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 17241 (GOs: 180215)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17241, 9567, 92067, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 17938 (GOs: 181108)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17938, 9568, 92068, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 17938 (GOs: 181108)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17938, 9569, 92069, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 17938 (GOs: 181108)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17938, 9570, 92070, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 17938 (GOs: 181108)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17938, 9571, 92071, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 17939 (GOs: 181109)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17939, 9572, 92072, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 17939 (GOs: 181109)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17939, 9573, 92073, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 17939 (GOs: 181109)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17939, 9574, 92074, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 17939 (GOs: 181109)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (17939, 9575, 92075, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 18092 (GOs: 181248)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18092, 9576, 92076, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 18092 (GOs: 181248)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18092, 9577, 92077, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 18092 (GOs: 181248)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18092, 9578, 92078, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 18092 (GOs: 181248)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18092, 9579, 92079, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 18093 (GOs: 181249)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18093, 9580, 92080, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 18093 (GOs: 181249)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18093, 9581, 92081, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 18093 (GOs: 181249)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18093, 9582, 92082, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 18093 (GOs: 181249)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18093, 9583, 92083, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 18359 (GOs: 181555)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18359, 9584, 92084, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 18359 (GOs: 181555)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18359, 9585, 92085, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 18359 (GOs: 181555)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18359, 9586, 92086, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 18359 (GOs: 181555)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18359, 9587, 92087, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 18361 (GOs: 181556)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18361, 9588, 92088, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 18361 (GOs: 181556)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18361, 9589, 92089, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 18361 (GOs: 181556)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18361, 9590, 92090, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 18361 (GOs: 181556)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18361, 9591, 92091, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 18363 (GOs: 181557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18363, 9592, 92092, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 18363 (GOs: 181557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18363, 9593, 92093, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 18363 (GOs: 181557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18363, 9594, 92094, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 18363 (GOs: 181557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (18363, 9595, 92095, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 22070 (GOs: 185877)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (22070, 9596, 92096, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 22070 (GOs: 185877)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (22070, 9597, 92097, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 22070 (GOs: 185877)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (22070, 9598, 92098, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 22070 (GOs: 185877)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (22070, 9599, 92099, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 24153 (GOs: 189978)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24153, 9600, 92100, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 24153 (GOs: 189978)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24153, 9601, 92101, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 24153 (GOs: 189978)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24153, 9602, 92102, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 24153 (GOs: 189978)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24153, 9603, 92103, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 24154 (GOs: 189979)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24154, 9604, 92104, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 24154 (GOs: 189979)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24154, 9605, 92105, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 24154 (GOs: 189979)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24154, 9606, 92106, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 24154 (GOs: 189979)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24154, 9607, 92107, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 24155 (GOs: 189980)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24155, 9608, 92108, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 24155 (GOs: 189980)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24155, 9609, 92109, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 24155 (GOs: 189980)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24155, 9610, 92110, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 24155 (GOs: 189980)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24155, 9611, 92111, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 24156 (GOs: 189981)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24156, 9612, 92112, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 24156 (GOs: 189981)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24156, 9613, 92113, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 24156 (GOs: 189981)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24156, 9614, 92114, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 24156 (GOs: 189981)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24156, 9615, 92115, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 24157 (GOs: 191133)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24157, 9616, 92116, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 24157 (GOs: 191133)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24157, 9617, 92117, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 24157 (GOs: 191133)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24157, 9618, 92118, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 24157 (GOs: 191133)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (24157, 9619, 92119, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 26861 (GOs: 181569, 181570)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26861, 9620, 92120, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 26861 (GOs: 181569, 181570)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26861, 9621, 92121, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 26861 (GOs: 181569, 181570)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26861, 9622, 92122, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 26861 (GOs: 181569, 181570)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26861, 9623, 92123, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 26862 (GOs: 185557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26862, 9624, 92124, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 26862 (GOs: 185557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26862, 9625, 92125, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 26862 (GOs: 185557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26862, 9626, 92126, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 26862 (GOs: 185557)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (26862, 9627, 92127, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- Journeyman bonus for loot table 27244 (GOs: 195036)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (27244, 9628, 92128, 10, 0, 1, 1, 'Journeyman Mining Pick Bonus');
-- Artisan bonus for loot table 27244 (GOs: 195036)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (27244, 9629, 92129, 20, 0, 1, 1, 'Artisan Mining Pick Bonus');
-- Master bonus for loot table 27244 (GOs: 195036)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (27244, 9630, 92130, 30, 0, 1, 1, 'Master Mining Pick Bonus');
-- Grand Master bonus for loot table 27244 (GOs: 195036)
INSERT INTO gameobject_loot_template (Entry, Item, Reference, Chance, QuestRequired, MinCount, MaxCount, Comment) VALUES
    (27244, 9631, 92131, 40, 0, 1, 1, 'Grand Master Mining Pick Bonus');

-- =====================================================
-- CONDITIONS (Check for active Mining Pick auras)
-- =====================================================
-- IMPORTANT: Uses mutually exclusive conditions to prevent bonus stacking
-- Each tier bonus ONLY triggers if that specific tier is active
-- AND no higher tier is active (prevents multiple bonuses)
-- =====================================================

-- Copper Vein - Journeyman Mining Pick conditions (Ref 92000)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 818, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 818, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2835, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2835, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92000, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');

-- Copper Vein - Artisan Mining Pick conditions (Ref 92001)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 818, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2835, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92001, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');

-- Copper Vein - Master Mining Pick conditions (Ref 92002)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 818, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 2835, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92002, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');

-- Copper Vein - Grand Master Mining Pick conditions (Ref 92003)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92003, 774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92003, 818, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92003, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92003, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92003, 2835, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');


-- Tin Vein - Journeyman Mining Pick conditions (Ref 92004)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92004, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');

-- Tin Vein - Artisan Mining Pick conditions (Ref 92005)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92005, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');

-- Tin Vein - Master Mining Pick conditions (Ref 92006)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92006, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');

-- Tin Vein - Grand Master Mining Pick conditions (Ref 92007)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92007, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');


-- Ooze Covered Silver Vein - Journeyman Mining Pick conditions (Ref 92008)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 2775, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 2775, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 2775, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92008, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Silver Vein');

-- Ooze Covered Silver Vein - Artisan Mining Pick conditions (Ref 92009)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 2775, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 2775, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92009, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Silver Vein');

-- Ooze Covered Silver Vein - Master Mining Pick conditions (Ref 92010)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 2775, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92010, 2775, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Silver Vein');

-- Ooze Covered Silver Vein - Grand Master Mining Pick conditions (Ref 92011)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92011, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92011, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92011, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Silver Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92011, 2775, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Silver Vein');


-- Iron Deposit - Journeyman Mining Pick conditions (Ref 92012)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2772, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2772, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2772, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2838, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2838, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2838, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92012, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Iron Deposit');

-- Iron Deposit - Artisan Mining Pick conditions (Ref 92013)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2772, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2772, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2838, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2838, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92013, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Iron Deposit');

-- Iron Deposit - Master Mining Pick conditions (Ref 92014)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 2772, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 2772, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 2838, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 2838, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92014, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Iron Deposit');

-- Iron Deposit - Grand Master Mining Pick conditions (Ref 92015)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 2772, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 2838, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92015, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Iron Deposit');


-- Gold Vein - Journeyman Mining Pick conditions (Ref 92016)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 2776, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 2776, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92016, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');

-- Gold Vein - Artisan Mining Pick conditions (Ref 92017)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 2776, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92017, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');

-- Gold Vein - Master Mining Pick conditions (Ref 92018)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 2776, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92018, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');

-- Gold Vein - Grand Master Mining Pick conditions (Ref 92019)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92019, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92019, 2776, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92019, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92019, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');


-- Copper Vein - Journeyman Mining Pick conditions (Ref 92020)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 818, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 818, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2798, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2798, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2798, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2835, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2835, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92020, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');

-- Copper Vein - Artisan Mining Pick conditions (Ref 92021)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 818, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2798, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2798, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2835, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92021, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');

-- Copper Vein - Master Mining Pick conditions (Ref 92022)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 818, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2798, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2835, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92022, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');

-- Copper Vein - Grand Master Mining Pick conditions (Ref 92023)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 818, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 2798, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92023, 2835, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');


-- Tin Vein - Journeyman Mining Pick conditions (Ref 92024)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2798, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2798, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2798, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92024, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');

-- Tin Vein - Artisan Mining Pick conditions (Ref 92025)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2798, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2798, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92025, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');

-- Tin Vein - Master Mining Pick conditions (Ref 92026)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2798, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2798, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92026, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');

-- Tin Vein - Grand Master Mining Pick conditions (Ref 92027)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 2798, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92027, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');


-- Mithril Deposit - Journeyman Mining Pick conditions (Ref 92028)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3858, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3858, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 9262, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 9262, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92028, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Artisan Mining Pick conditions (Ref 92029)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3858, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 9262, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92029, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Master Mining Pick conditions (Ref 92030)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 3858, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 9262, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92030, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Grand Master Mining Pick conditions (Ref 92031)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 3858, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 7912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92031, 9262, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');


-- Copper Vein - Journeyman Mining Pick conditions (Ref 92032)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 818, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 818, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2835, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2835, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 5075, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 5075, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 5075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92032, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');

-- Copper Vein - Artisan Mining Pick conditions (Ref 92033)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 818, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2835, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 5075, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 5075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92033, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');

-- Copper Vein - Master Mining Pick conditions (Ref 92034)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 818, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 2835, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 5075, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92034, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');

-- Copper Vein - Grand Master Mining Pick conditions (Ref 92035)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 818, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 2835, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92035, 5075, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');


-- Tin Vein - Journeyman Mining Pick conditions (Ref 92036)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 5075, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 5075, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 5075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92036, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');

-- Tin Vein - Artisan Mining Pick conditions (Ref 92037)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 5075, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 5075, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92037, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');

-- Tin Vein - Master Mining Pick conditions (Ref 92038)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 5075, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92038, 5075, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');

-- Tin Vein - Grand Master Mining Pick conditions (Ref 92039)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92039, 5075, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');


-- Ooze Covered Truesilver Deposit - Journeyman Mining Pick conditions (Ref 92040)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7911, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7911, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92040, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Truesilver Deposit');

-- Ooze Covered Truesilver Deposit - Artisan Mining Pick conditions (Ref 92041)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7911, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92041, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Truesilver Deposit');

-- Ooze Covered Truesilver Deposit - Master Mining Pick conditions (Ref 92042)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7911, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92042, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Truesilver Deposit');

-- Ooze Covered Truesilver Deposit - Grand Master Mining Pick conditions (Ref 92043)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92043, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92043, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92043, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92043, 7911, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Truesilver Deposit');


-- Ooze Covered Thorium Vein - Journeyman Mining Pick conditions (Ref 92044)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92044, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Thorium Vein');

-- Ooze Covered Thorium Vein - Artisan Mining Pick conditions (Ref 92045)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92045, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Thorium Vein');

-- Ooze Covered Thorium Vein - Master Mining Pick conditions (Ref 92046)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92046, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92046, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92046, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92046, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Thorium Vein');

-- Ooze Covered Thorium Vein - Grand Master Mining Pick conditions (Ref 92047)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92047, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92047, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Thorium Vein');


-- Dark Iron Deposit - Journeyman Mining Pick conditions (Ref 92048)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 9262, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 9262, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11370, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11370, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11382, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11382, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11754, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11754, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11754, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92048, 11754, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Dark Iron Deposit');

-- Dark Iron Deposit - Artisan Mining Pick conditions (Ref 92049)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 9262, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11370, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11370, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11382, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11382, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11754, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11754, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92049, 11754, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Dark Iron Deposit');

-- Dark Iron Deposit - Master Mining Pick conditions (Ref 92050)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 9262, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11370, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11370, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11382, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11382, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11754, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92050, 11754, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Dark Iron Deposit');

-- Dark Iron Deposit - Grand Master Mining Pick conditions (Ref 92051)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92051, 9262, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92051, 11370, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92051, 11382, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Dark Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92051, 11754, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Dark Iron Deposit');


-- Ooze Covered Rich Thorium Vein - Journeyman Mining Pick conditions (Ref 92052)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92052, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Ooze Covered Rich Thorium Vein');

-- Ooze Covered Rich Thorium Vein - Artisan Mining Pick conditions (Ref 92053)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92053, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Ooze Covered Rich Thorium Vein');

-- Ooze Covered Rich Thorium Vein - Master Mining Pick conditions (Ref 92054)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92054, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92054, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92054, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92054, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Ooze Covered Rich Thorium Vein');

-- Ooze Covered Rich Thorium Vein - Grand Master Mining Pick conditions (Ref 92055)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92055, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Rich Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92055, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Ooze Covered Rich Thorium Vein');


-- Small Thorium Vein - Journeyman Mining Pick conditions (Ref 92056)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 11513, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 11513, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92056, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Small Thorium Vein');

-- Small Thorium Vein - Artisan Mining Pick conditions (Ref 92057)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 11513, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92057, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Small Thorium Vein');

-- Small Thorium Vein - Master Mining Pick conditions (Ref 92058)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 11513, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92058, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Small Thorium Vein');

-- Small Thorium Vein - Grand Master Mining Pick conditions (Ref 92059)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92059, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92059, 11513, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Small Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92059, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Small Thorium Vein');


-- Mithril Deposit - Journeyman Mining Pick conditions (Ref 92060)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3858, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3858, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 9262, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 9262, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 11513, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 11513, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92060, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Artisan Mining Pick conditions (Ref 92061)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3858, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3858, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 9262, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 9262, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 11513, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92061, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Master Mining Pick conditions (Ref 92062)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 3858, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 3858, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 7912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 9262, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 9262, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 11513, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92062, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Mithril Deposit');

-- Mithril Deposit - Grand Master Mining Pick conditions (Ref 92063)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 3858, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 7912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 9262, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92063, 11513, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Mithril Deposit');


-- Hakkari Thorium Vein - Journeyman Mining Pick conditions (Ref 92064)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 10620, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 10620, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 12365, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 12365, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 19774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 19774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92064, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Hakkari Thorium Vein');

-- Hakkari Thorium Vein - Artisan Mining Pick conditions (Ref 92065)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 10620, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 10620, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 12365, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 12365, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 19774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 19774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92065, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Hakkari Thorium Vein');

-- Hakkari Thorium Vein - Master Mining Pick conditions (Ref 92066)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 10620, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 10620, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 12365, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 12365, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 19774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92066, 19774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Hakkari Thorium Vein');

-- Hakkari Thorium Vein - Grand Master Mining Pick conditions (Ref 92067)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92067, 10620, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92067, 12365, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Hakkari Thorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92067, 19774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Hakkari Thorium Vein');


-- Truesilver Deposit - Journeyman Mining Pick conditions (Ref 92068)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7911, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7911, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 11513, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 11513, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92068, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Truesilver Deposit');

-- Truesilver Deposit - Artisan Mining Pick conditions (Ref 92069)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7911, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7911, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 11513, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 11513, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92069, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Truesilver Deposit');

-- Truesilver Deposit - Master Mining Pick conditions (Ref 92070)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7911, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 7911, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 11513, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92070, 11513, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Truesilver Deposit');

-- Truesilver Deposit - Grand Master Mining Pick conditions (Ref 92071)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92071, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92071, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92071, 7910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92071, 7911, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Truesilver Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92071, 11513, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Truesilver Deposit');


-- Gold Vein - Journeyman Mining Pick conditions (Ref 92072)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 2776, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 2776, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 3864, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 3864, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 7909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 7909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92072, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Gold Vein');

-- Gold Vein - Artisan Mining Pick conditions (Ref 92073)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 2776, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 2776, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 3864, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 3864, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 7909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 7909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92073, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Gold Vein');

-- Gold Vein - Master Mining Pick conditions (Ref 92074)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 2776, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 2776, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 3864, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 3864, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 7909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92074, 7909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Gold Vein');

-- Gold Vein - Grand Master Mining Pick conditions (Ref 92075)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92075, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92075, 2776, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92075, 3864, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92075, 7909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Gold Vein');


-- Copper Vein - Journeyman Mining Pick conditions (Ref 92076)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 774, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 774, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 818, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 818, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2770, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2770, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2835, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2835, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 22634, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 22634, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 22634, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92076, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Copper Vein');

-- Copper Vein - Artisan Mining Pick conditions (Ref 92077)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 774, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 774, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 818, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 818, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2770, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2770, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2835, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2835, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 22634, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 22634, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92077, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Copper Vein');

-- Copper Vein - Master Mining Pick conditions (Ref 92078)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 774, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 774, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 818, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 818, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 2770, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 2770, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 2835, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 2835, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 22634, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92078, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Copper Vein');

-- Copper Vein - Grand Master Mining Pick conditions (Ref 92079)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 774, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 818, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 2770, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 2835, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92079, 22634, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Copper Vein');


-- Tin Vein - Journeyman Mining Pick conditions (Ref 92080)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1206, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1206, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1210, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1210, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1529, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1529, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2771, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2771, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2836, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2836, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 22634, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 22634, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 22634, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92080, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Tin Vein');

-- Tin Vein - Artisan Mining Pick conditions (Ref 92081)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1206, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1206, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1210, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1210, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1529, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1529, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2771, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2771, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2836, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2836, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 22634, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 22634, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92081, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Tin Vein');

-- Tin Vein - Master Mining Pick conditions (Ref 92082)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1206, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1206, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1210, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1210, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1529, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1529, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 1705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 2771, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 2771, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 2836, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 2836, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 22634, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92082, 22634, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Tin Vein');

-- Tin Vein - Grand Master Mining Pick conditions (Ref 92083)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 1206, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 1210, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 1529, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 1705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 2771, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 2836, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92083, 22634, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Tin Vein');


-- Fel Iron Deposit - Journeyman Mining Pick conditions (Ref 92084)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23424, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23424, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23424, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 35229, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 35229, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92084, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Fel Iron Deposit');

-- Fel Iron Deposit - Artisan Mining Pick conditions (Ref 92085)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23424, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23424, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 35229, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92085, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Fel Iron Deposit');

-- Fel Iron Deposit - Master Mining Pick conditions (Ref 92086)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 23424, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 23424, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 35229, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92086, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Fel Iron Deposit');

-- Fel Iron Deposit - Grand Master Mining Pick conditions (Ref 92087)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92087, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92087, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92087, 23424, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92087, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Fel Iron Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92087, 35229, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Fel Iron Deposit');


-- Adamantite Deposit - Journeyman Mining Pick conditions (Ref 92088)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23425, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23425, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 35229, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 35229, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92088, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Adamantite Deposit');

-- Adamantite Deposit - Artisan Mining Pick conditions (Ref 92089)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23425, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 35229, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92089, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Adamantite Deposit');

-- Adamantite Deposit - Master Mining Pick conditions (Ref 92090)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 23425, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 35229, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92090, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Adamantite Deposit');

-- Adamantite Deposit - Grand Master Mining Pick conditions (Ref 92091)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92091, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92091, 23425, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92091, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92091, 35229, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Adamantite Deposit');


-- Khorium Vein - Journeyman Mining Pick conditions (Ref 92092)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23426, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23426, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23426, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 35229, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 35229, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92092, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Khorium Vein');

-- Khorium Vein - Artisan Mining Pick conditions (Ref 92093)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23426, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23426, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 35229, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92093, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Khorium Vein');

-- Khorium Vein - Master Mining Pick conditions (Ref 92094)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 23426, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 23426, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 35229, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92094, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Khorium Vein');

-- Khorium Vein - Grand Master Mining Pick conditions (Ref 92095)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92095, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92095, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92095, 23426, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92095, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Khorium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92095, 35229, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Khorium Vein');


-- Nethercite Deposit - Journeyman Mining Pick conditions (Ref 92096)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22574, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22574, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32464, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32464, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32464, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32464, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32506, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32506, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32506, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92096, 32506, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Nethercite Deposit');

-- Nethercite Deposit - Artisan Mining Pick conditions (Ref 92097)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22574, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22574, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32464, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32464, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32464, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32506, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32506, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92097, 32506, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Nethercite Deposit');

-- Nethercite Deposit - Master Mining Pick conditions (Ref 92098)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 22574, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 22574, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 32464, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 32464, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 32506, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92098, 32506, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Nethercite Deposit');

-- Nethercite Deposit - Grand Master Mining Pick conditions (Ref 92099)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92099, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92099, 22574, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92099, 32464, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Nethercite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92099, 32506, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Nethercite Deposit');


-- Cobalt Deposit - Journeyman Mining Pick conditions (Ref 92100)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 36909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 36909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 36909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92100, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Cobalt Deposit');

-- Cobalt Deposit - Artisan Mining Pick conditions (Ref 92101)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 36909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 36909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92101, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Cobalt Deposit');

-- Cobalt Deposit - Master Mining Pick conditions (Ref 92102)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 36909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 37705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92102, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Cobalt Deposit');

-- Cobalt Deposit - Grand Master Mining Pick conditions (Ref 92103)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92103, 36909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92103, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92103, 37705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Cobalt Deposit');


-- Rich Cobalt Deposit - Journeyman Mining Pick conditions (Ref 92104)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 36909, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 36909, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 36909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92104, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Cobalt Deposit');

-- Rich Cobalt Deposit - Artisan Mining Pick conditions (Ref 92105)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 36909, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 36909, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92105, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Cobalt Deposit');

-- Rich Cobalt Deposit - Master Mining Pick conditions (Ref 92106)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 36909, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 36909, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 37705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92106, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Cobalt Deposit');

-- Rich Cobalt Deposit - Grand Master Mining Pick conditions (Ref 92107)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92107, 36909, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92107, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Cobalt Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92107, 37705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Cobalt Deposit');


-- Saronite Deposit - Journeyman Mining Pick conditions (Ref 92108)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 36912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 36912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37703, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37703, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37703, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92108, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Saronite Deposit');

-- Saronite Deposit - Artisan Mining Pick conditions (Ref 92109)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 36912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37703, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37703, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92109, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Saronite Deposit');

-- Saronite Deposit - Master Mining Pick conditions (Ref 92110)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 36912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 37703, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92110, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Saronite Deposit');

-- Saronite Deposit - Grand Master Mining Pick conditions (Ref 92111)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92111, 36912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92111, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92111, 37703, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Saronite Deposit');


-- Rich Saronite Deposit - Journeyman Mining Pick conditions (Ref 92112)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 36912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 36912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37703, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37703, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37703, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92112, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Saronite Deposit');

-- Rich Saronite Deposit - Artisan Mining Pick conditions (Ref 92113)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 36912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37703, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37703, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92113, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Saronite Deposit');

-- Rich Saronite Deposit - Master Mining Pick conditions (Ref 92114)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 36912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 37703, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92114, 37703, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Saronite Deposit');

-- Rich Saronite Deposit - Grand Master Mining Pick conditions (Ref 92115)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92115, 36912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92115, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92115, 37703, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Saronite Deposit');


-- Titanium Vein - Journeyman Mining Pick conditions (Ref 92116)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 36910, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 36910, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 36910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 36910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37700, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37700, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37700, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37700, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37701, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37701, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37702, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37702, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37702, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37702, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37705, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37705, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92116, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Titanium Vein');

-- Titanium Vein - Artisan Mining Pick conditions (Ref 92117)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 36910, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 36910, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 36910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37700, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37700, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37700, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37701, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37701, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37702, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37702, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37702, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37705, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37705, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92117, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Titanium Vein');

-- Titanium Vein - Master Mining Pick conditions (Ref 92118)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 36910, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 36910, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37700, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37700, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37701, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37701, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37702, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37702, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37705, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92118, 37705, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Titanium Vein');

-- Titanium Vein - Grand Master Mining Pick conditions (Ref 92119)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92119, 36910, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92119, 37700, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92119, 37701, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92119, 37702, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Titanium Vein');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92119, 37705, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Titanium Vein');


-- Rich Adamantite Deposit - Journeyman Mining Pick conditions (Ref 92120)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 22573, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 22573, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23425, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23425, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23427, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23427, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 35229, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 35229, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92120, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Rich Adamantite Deposit');

-- Rich Adamantite Deposit - Artisan Mining Pick conditions (Ref 92121)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 22573, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 22573, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23425, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23425, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23427, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23427, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 35229, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 35229, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92121, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Rich Adamantite Deposit');

-- Rich Adamantite Deposit - Master Mining Pick conditions (Ref 92122)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 22573, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 22573, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 23425, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 23425, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 23427, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 23427, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 35229, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92122, 35229, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Rich Adamantite Deposit');

-- Rich Adamantite Deposit - Grand Master Mining Pick conditions (Ref 92123)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92123, 22573, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92123, 23425, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92123, 23427, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Adamantite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92123, 35229, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Rich Adamantite Deposit');


-- Ancient Gem Vein - Journeyman Mining Pick conditions (Ref 92124)

-- Ancient Gem Vein - Artisan Mining Pick conditions (Ref 92125)

-- Ancient Gem Vein - Master Mining Pick conditions (Ref 92126)

-- Ancient Gem Vein - Grand Master Mining Pick conditions (Ref 92127)


-- Pure Saronite Deposit - Journeyman Mining Pick conditions (Ref 92128)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35624, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35624, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35624, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35624, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35627, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35627, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35627, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 35627, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 36912, 0, 0, 1, 0, 91158, 0, 0, 0, 'Journeyman Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 36912, 0, 0, 1, 0, 91159, 0, 0, 1, 'Block Journeyman if Artisan active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Journeyman if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92128, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Journeyman if Grand Master active - Pure Saronite Deposit');

-- Pure Saronite Deposit - Artisan Mining Pick conditions (Ref 92129)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35624, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35624, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35624, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35627, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35627, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 35627, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 36912, 0, 0, 1, 0, 91159, 0, 0, 0, 'Artisan Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 36912, 0, 0, 1, 0, 91160, 0, 0, 1, 'Block Artisan if Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92129, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Artisan if Grand Master active - Pure Saronite Deposit');

-- Pure Saronite Deposit - Master Mining Pick conditions (Ref 92130)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 35624, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 35624, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 35627, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 35627, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 36912, 0, 0, 1, 0, 91160, 0, 0, 0, 'Master Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92130, 36912, 0, 0, 1, 0, 91161, 0, 0, 1, 'Block Master if Grand Master active - Pure Saronite Deposit');

-- Pure Saronite Deposit - Grand Master Mining Pick conditions (Ref 92131)
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92131, 35624, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92131, 35627, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Pure Saronite Deposit');
INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, Comment) VALUES
    (10, 92131, 36912, 0, 0, 1, 0, 91161, 0, 0, 0, 'Grand Master Mining Pick - Pure Saronite Deposit');


-- Done!
