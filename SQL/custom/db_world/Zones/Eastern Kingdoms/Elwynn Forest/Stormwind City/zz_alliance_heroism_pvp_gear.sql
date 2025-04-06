-- ADD CLASSIC RARE AND EPIC PVP ARMOR PURCHASING WITH "Badge of Heroism"

-- `ExtendedCost` = 3002 -> 40 Tokens
-- `ExtendedCost` = 3001 -> 20 Tokens
-- `ExtendedCost` = 3000 -> 15 Tokens
-- `ExtendedCost` = 2998 -> 5 Tokens

-- ALLIANCE ARMOR FROM CAPTAIN DIRGEHAMMER

    -- DELETE ITEMS
    DELETE FROM `npc_vendor` WHERE `entry` = 12777;

    ---------- MAGE EPICS ----------

        -- Marshal's Silk Footwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16437,
            `ExtendedCost` = 3000;

        -- Marshal's Silk Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16440,
            `ExtendedCost` = 3000;

        -- Field Marshal's Coronet
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16441,
            `ExtendedCost` = 3000;

        -- Marshal's Silk Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16442,
            `ExtendedCost` = 3000;

        -- Field Marshal's Silk Vestments
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16443,
            `ExtendedCost` = 3000;

        -- Field Marshal's Silk Spaulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16444,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- ROGUE EPICS ----------

        -- Marshal's Leather Footguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16446,
            `ExtendedCost` = 3000;

        -- Field Marshal's Leather Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16453,
            `ExtendedCost` = 3000;

        -- Marshal's Leather Handgrips
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16454,
            `ExtendedCost` = 3000;

        -- Field Marshal's Leather Mask
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16455,
            `ExtendedCost` = 3000;

        -- Marshal's Leather Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16456,
            `ExtendedCost` = 3000;

        -- Field Marshal's Leather Epaulets
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16457,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- DRUID EPICS ----------

        -- Marshal's Dragonhide Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16448,
            `ExtendedCost` = 3000;

        -- Field Marshal's Dragonhide Spaulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16449,
            `ExtendedCost` = 3000;

        -- Marshal's Dragonhide Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16450,
            `ExtendedCost` = 3000;

        -- Field Marshal's Dragonhide Helmet
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16451,
            `ExtendedCost` = 3000;

        -- Field Marshal's Dragonhide Breastplate
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16452,
            `ExtendedCost` = 3000;

        -- Marshal's Dragonhide Boots
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16459,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- HUNTER EPICS ----------

        -- Marshal's Chain Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16462,
            `ExtendedCost` = 3000;

        -- Marshal's Chain Grips
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16463,
            `ExtendedCost` = 3000;

        -- Field Marshal's Chain Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16465,
            `ExtendedCost` = 3000;

        -- Field Marshal's Chain Breastplate
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16466,
            `ExtendedCost` = 3000;

        -- Marshal's Chain Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16467,
            `ExtendedCost` = 3000;

        -- Field Marshal's Chain Spaulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16468,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- PALADIN EPICS ----------

        -- Marshal's Lamellar Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16471,
            `ExtendedCost` = 3000;

        -- Marshal's Lamellar Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16472,
            `ExtendedCost` = 3000;

        -- Field Marshal's Lamellar Chestplate
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16473,
            `ExtendedCost` = 3000;

        -- Field Marshal's Lamellar Faceguard
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16474,
            `ExtendedCost` = 3000;

        -- Marshal's Lamellar Legplates
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16475,
            `ExtendedCost` = 3000;

        -- Field Marshal's Lamellar Pauldrons
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16476,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- WARRIOR EPICS ----------

        -- Field Marshal's Plate Armor
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16477,
            `ExtendedCost` = 3000;

        -- Field Marshal's Plate Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16478,
            `ExtendedCost` = 3000;

        -- Marshal's Plate Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16479,
            `ExtendedCost` = 3000;

        -- Field Marshal's Plate Shoulderguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16480,
            `ExtendedCost` = 3000;

        -- Marshal's Plate Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 16483,
            `ExtendedCost` = 3000;

        -- Marshal's Plate Gauntlets
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 16484,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- WARLOCK EPICS ----------

        -- Field Marshal's Coronal
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17578,
            `ExtendedCost` = 3000;

        -- Marshal's Dreadweave Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17579,
            `ExtendedCost` = 3000;

        -- Field Marshal's Dreadweave Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17580,
            `ExtendedCost` = 3000;

        -- Field Marshal's Dreadweave Robe
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17581,
            `ExtendedCost` = 3000;

        -- Marshal's Dreadweave Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17583,
            `ExtendedCost` = 3000;

        -- Marshal's Dreadweave Gloves
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 17584,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- PRIEST EPICS ----------

        -- Field Marshal's Headdress
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17602,
            `ExtendedCost` = 3000;

        -- Marshal's Satin Pants
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17603,
            `ExtendedCost` = 3000;

        -- Field Marshal's Satin Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17604,
            `ExtendedCost` = 3000;

        -- Field Marshal's Satin Vestments
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17605,
            `ExtendedCost` = 3000;

        -- Marshal's Satin Sandals
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 17607,
            `ExtendedCost` = 3000;

        -- Marshal's Satin Gloves
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 17608,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- PALADIN RARES ----------

        -- Knight-Captain's Lamellar Breastplate
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23272,
            `ExtendedCost` = 3000;

        -- Knight-Captain's Lamellar Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23273,
            `ExtendedCost` = 3000;

        -- Knight-Lieutenant's Lamellar Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23274,
            `ExtendedCost` = 3000;

        -- Knight-Lieutenant's Lamellar Sabatons
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23275,
            `ExtendedCost` = 3000;

        -- Lieutenant Commander's Lamellar Headguard
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23276,
            `ExtendedCost` = 3000;

        -- Lieutenant Commander's Lamellar Shoulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23277,
        `ExtendedCost` = 3000,
        `VerifiedBuild` = NULL;

    ---------- HUNTER RARES ----------

        -- Knight-Lieutenant's Chain Greaves
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23278,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Chain Vices
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23279,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Chain Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23292,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Chain Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23293,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Chain Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23306,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Chain Shoulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23307,
        `ExtendedCost` = 2998,
        `VerifiedBuild` = NULL;

    ---------- DRUID RARES ----------

        -- Knight-Lieutenant's Dragonhide Grips
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23280,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Dragonhide Treads
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23281,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Dragonhide Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23294,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Dragonhide Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23295,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Dragonhide Headguard
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23308,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Dragonhide Shoulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23309,
        `ExtendedCost` = 2998,
        `VerifiedBuild` = NULL;

    ---------- WARLOCK RARES ----------

        -- Knight-Lieutenant's Dreadweave Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23282,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Dreadweave Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23283,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Dreadweave Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23296,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Dreadweave Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23297,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Dreadweave Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23310,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Dreadweave Spaulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23311,
            `ExtendedCost` = 2998;
            
    ---------- ROGUE RARES ----------

        -- Knight-Lieutenant's Leather Grips
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23284,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Leather Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23285,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Leather Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23298,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Leather Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23299,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Leather Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23312,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Leather Shoulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23313,
        `ExtendedCost` = 2998,
        `VerifiedBuild` = NULL;

    ---------- WARRIOR RARES ----------

        -- Knight-Lieutenant's Plate Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23286,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Plate Greaves
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23287,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Plate Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23300,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Plate Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23301,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Plate Helmet
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23314,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Plate Shoulders
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23315,
        `ExtendedCost` = 2998,
        `VerifiedBuild` = NULL;

    ---------- PRIEST RARES ----------

        -- Knight-Lieutenant's Satin Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23288,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Satin Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23289,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Satin Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23302,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Satin Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23303,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Satin Hood
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23316,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Satin Mantle
        INSERT INTO `npc_vendor` SET
        `entry` = 12777,
        `item` = 23317,
        `ExtendedCost` = 2998,
        `VerifiedBuild` = NULL;

    ---------- MAGE RARES ----------

        -- Knight-Lieutenant's Silk Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23290,
            `ExtendedCost` = 2998;

        -- Knight-Lieutenant's Silk Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23291,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Silk Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23304,
            `ExtendedCost` = 2998;

        -- Knight-Captain's Silk Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23305,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Silk Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23318,
            `ExtendedCost` = 2998;

        -- Lieutenant Commander's Silk Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12777,
            `item` = 23319,
            `ExtendedCost` = 2998;

-- ALLIANCE WEAPONS FROM LIEUTENANT JACKSPRING

    -- REMOVE EXISTING ITEMS
    DELETE FROM `npc_vendor` WHERE `entry` = 12784;

    -- Grand Marshal's Longsword
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 12584,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Aegis
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18825,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Handaxe
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18827,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Sunderer
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18830,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Bullseye
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18833,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Repeater
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18836,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Dirk
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18838,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Right Hand Blade
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18843,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Left Hand Blade
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18847,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Hand Cannon
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18855,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Punisher
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18865,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Battle Hammer
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18867,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Glaive
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18869,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Stave
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18873,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Claymore
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 18876,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Mageblade
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23451,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Tome of Power
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23452,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Tome of Restoration
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23453,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Warhammer
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23454,
        `ExtendedCost` = 3001;

    -- Grand Marshal's Demolisher
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23455,
        `ExtendedCost` = 3002;

    -- Grand Marshal's Swiftblade
    INSERT INTO `npc_vendor` SET
        `entry` = 12784,
        `item` = 23456,
        `ExtendedCost` = 3001;

-- ALLIANCE MOUNTS FROM LIEUTENANT KARTER

    -- Black War Steed Bridle
    INSERT INTO `npc_vendor` SET
        `entry` = 12783,
        `item` = 18241,
        `ExtendedCost` = 3001;

    -- Reins of the Black War Tiger
    INSERT INTO `npc_vendor` SET
        `entry` = 12783,
        `item` = 18242,
        `ExtendedCost` = 3001;

    -- Black Battlestrider
    INSERT INTO `npc_vendor` SET
        `entry` = 12783,
        `item` = 18243,
        `ExtendedCost` = 3001;

    -- Black War Ram
    INSERT INTO `npc_vendor` SET
    `entry` = 12783,
    `item` = 18244,
    `ExtendedCost` = 3001,
    `VerifiedBuild` = NULL;


