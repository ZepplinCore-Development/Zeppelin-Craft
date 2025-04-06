-- Bloodmage Potions
-- Set the potion ingredients to quest items
-- Increases drop chances to 100% for the ingredients

SET @Basilisk_Brain := 8394;
SET @Blasted_Boar_Lung := 8392;
SET @Scorpok_Pincer := 8393;
SET @Snickerfang_Jowl := 8391;
SET @Vulture_Gizzard := 8396;


------------- Basilisk Brain -------------
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = @Basilisk_Brain);

-- Redstone Basilisk Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5990 AND `ItemId` = @Basilisk_Brain);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5990,
    `ItemId` = @Basilisk_Brain;

-- Redstone Basilisk Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5990 AND `Item` = @Basilisk_Brain);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5990,
    `Item` = @Basilisk_Brain,
    `Comment` = 'Redstone Basilisk - Basilisk Brain';

-- Redstone Crystalhide Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5991 AND `ItemId` = @Basilisk_Brain);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5991,
    `ItemId` = @Basilisk_Brain;

-- Redstone Crystalhide Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5991 AND `Item` = @Basilisk_Brain);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5991,
    `Item` = @Basilisk_Brain,
    `Comment` = 'Redstone Crystalhide - Basilisk Brain';

-- Deatheye Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8302 AND `ItemId` = @Basilisk_Brain);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 8302,
    `ItemId` = @Basilisk_Brain;

-- Deatheye Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8302 AND `Item` = @Basilisk_Brain);
INSERT INTO `creature_loot_template` SET
    `Entry` = 8302,
    `Item` = @Basilisk_Brain,
    `Comment` = 'Deatheye - Basilisk Brain';



------------- Blasted Boar Lung -------------
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = @Blasted_Boar_Lung);

-- Ashmane Boar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5992 AND `ItemId` = @Blasted_Boar_Lung);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5992,
    `ItemId` = @Blasted_Boar_Lung;

-- Ashmane Boar Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5992 AND `Item` = @Blasted_Boar_Lung);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5992,
    `Item` = @Blasted_Boar_Lung,
    `Comment` = 'Ashmane Boar - Blasted Boar Lung';

-- Helboar Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5993 AND `ItemId` = @Blasted_Boar_Lung);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5993,
    `ItemId` = @Blasted_Boar_Lung;

-- Helboar Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5993 AND `Item` = @Blasted_Boar_Lung);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5993,
    `Item` = @Blasted_Boar_Lung,
    `Comment` = 'Helboar - Blasted Boar Lung';

-- Grunter Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8303 AND `ItemId` = @Blasted_Boar_Lung);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 8303,
    `ItemId` = @Blasted_Boar_Lung;

-- Grunter Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8303 AND `Item` = @Blasted_Boar_Lung);
INSERT INTO `creature_loot_template` SET
    `Entry` = 8303,
    `Item` = @Blasted_Boar_Lung,
    `Comment` = 'Grunter - Blasted Boar Lung';




------------- Scorpok Pincer -------------
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = @Scorpok_Pincer);

-- Scorpok Stinger Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5988 AND `ItemId` = @Scorpok_Pincer);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5988,
    `ItemId` = @Scorpok_Pincer;

-- Scorpok Stinger Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5988 AND `Item` = @Scorpok_Pincer);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5988,
    `Item` = @Scorpok_Pincer,
    `Comment` = 'Scorpok Stinger - Scorpok Pincer';

-- Clack the Reaver Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8301 AND `ItemId` = @Scorpok_Pincer);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 8301,
    `ItemId` = @Scorpok_Pincer;

-- Clack the Reaver Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8301 AND `Item` = @Scorpok_Pincer);
INSERT INTO `creature_loot_template` SET
    `Entry` = 8301,
    `Item` = @Scorpok_Pincer,
    `Comment` = 'Clack the Reaver - Scorpok Pincer';




------------- Snickerfang Jowl -------------
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = @Snickerfang_Jowl);

-- Snickerfang Hyena Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5985 AND `ItemId` = @Snickerfang_Jowl);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5985,
    `ItemId` = @Snickerfang_Jowl;

-- Snickerfang Hyena Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5985 AND `Item` = @Snickerfang_Jowl);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5985,
    `Item` = @Snickerfang_Jowl,
    `Comment` = 'Snickerfang Hyena - Snickerfang Jowl';

-- Ravage Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8300 AND `ItemId` = @Snickerfang_Jowl);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 8300,
    `ItemId` = @Snickerfang_Jowl;

-- Ravage Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8300 AND `Item` = @Snickerfang_Jowl);
INSERT INTO `creature_loot_template` SET
    `Entry` = 8300,
    `Item` = @Snickerfang_Jowl,
    `Comment` = 'Ravage - Snickerfang Jowl';

-- Starving Snickerfang Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5984 AND `ItemId` = @Snickerfang_Jowl);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5984,
    `ItemId` = @Snickerfang_Jowl;

-- Starving Snickerfang Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5984 AND `Item` = @Snickerfang_Jowl);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5984,
    `Item` = @Snickerfang_Jowl,
    `Comment` = 'Starving Snickerfang - Snickerfang Jowl';



------------- Vulture Gizzard -------------
UPDATE `item_template` SET `bonding` = 4 WHERE (`entry` = @Vulture_Gizzard);

-- Spiteflayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 8299 AND `ItemId` = @Vulture_Gizzard);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 8299,
    `ItemId` = @Vulture_Gizzard;

-- Spiteflayer Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 8299 AND `Item` = @Vulture_Gizzard);
INSERT INTO `creature_loot_template` SET
    `Entry` = 8299,
    `Item` = @Vulture_Gizzard,
    `Comment` = 'Spiteflayer - Vulture Gizzard';

-- Black Slayer Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5982 AND `ItemId` = @Vulture_Gizzard);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5982,
    `ItemId` = @Vulture_Gizzard;

-- Black Slayer Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5982 AND `Item` = @Vulture_Gizzard);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5982,
    `Item` = @Vulture_Gizzard,
    `Comment` = 'Black Slayer - Vulture Gizzard';

-- Bonepicker Quest Item
DELETE FROM `creature_questitem` WHERE (`CreatureEntry` = 5983 AND `ItemId` = @Vulture_Gizzard);
INSERT INTO `creature_questitem` SET
    `CreatureEntry` = 5983,
    `ItemId` = @Vulture_Gizzard;


-- Bonepicker Creature Loot
DELETE FROM `creature_loot_template` WHERE (`Entry` = 5983 AND `Item` = @Vulture_Gizzard);
INSERT INTO `creature_loot_template` SET
    `Entry` = 5983,
    `Item` = @Vulture_Gizzard,
    `Comment` = 'Bonepicker - Vulture Gizzard';