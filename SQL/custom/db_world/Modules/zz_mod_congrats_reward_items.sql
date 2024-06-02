DELETE FROM `mod_congrats_on_level_items`;
INSERT INTO `mod_congrats_on_level_items` (`level`, `money`, `spell`, `learn`, `itemId1`, `itemId2`, `race`, `class`) VALUES
-- Level 10
-- 1 Gold / Blessing of Kings
-- Clam Knight Conch / Zeppelin Bag
(10, 1, 20217, 0, 902329, 1977, 0, 0),
-- Level 20
-- 10 Gold / Power Word Fortitude
-- Zeppelin Bag
(20, 10, 48161, 0, 1977, 0, 0, 0),
-- Level 30
-- 15 Gold / Mark of the Wild
-- Zeppelin Bag 
(30, 15, 48469, 0, 1977, 0, 0, 0),
-- Level 40
-- 20 Gold / Blessing of Kings
-- Zeppelin Bag 
(40, 20, 20217, 0, 1977, 0, 0, 0),
-- Level 50
-- 25 Gold / Power Word Fortutude
-- Zeppelin Bag
(50, 25, 48161, 0, 1977, 0, 0, 0),
-- Level 60
-- 30 Gold / Mark of the Wild
-- Direbrew's Remote / TCG: Goblin Gumbo Kettle
(60, 30, 48469, 0, 37863, 33219, 0, 0),
-- Level 70
-- 35 Gold / Power Word Fortitude
-- Cuergo's Gold / TCG: Instant Statue Pedestal
(70, 35, 48161, 0, 9360, 54212, 0, 0),
-- Level 80
-- 100 Gold / Blessing of Kings
-- Cuergo's Gold with Worm / Haunted Momento
(80, 100, 20217, 0, 9361, 40110, 0, 0);
