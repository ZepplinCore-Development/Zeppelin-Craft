-- ADD CLASSIC RARE AND EPIC PVP ARMOR PURCHASING WITH "Badge of Heroism"

-- `ExtendedCost` = 3002 -> 40 Tokens
-- `ExtendedCost` = 3001 -> 20 Tokens
-- `ExtendedCost` = 3000 -> 15 Tokens
-- `ExtendedCost` = 2998 -> 5 Tokens

-- HORDE ARMOR FROM LADY PALANSEER

    -- DELETE ITEMS
    DELETE FROM `npc_vendor` WHERE `entry` = 12792;

    --********** MAGE EPICS --**********

        -- Warlord's Silk Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16533,
            `ExtendedCost` = 3000;

        -- General's Silk Trousers
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16534,
            `ExtendedCost` = 3000;

        -- Warlord's Silk Raiment
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16535,
            `ExtendedCost` = 3000;

        -- Warlord's Silk Amice
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16536,
            `ExtendedCost` = 3000;

        -- General's Silk Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16539,
            `ExtendedCost` = 3000;

        -- General's Silk Handguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16540,
            `ExtendedCost` = 3000;

    --********** WARRIOR EPICS --**********

        -- Warlord's Plate Armor
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16541,
            `ExtendedCost` = 3000;

        -- Warlord's Plate Headpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16542,
            `ExtendedCost` = 3000;

        -- General's Plate Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16543,
            `ExtendedCost` = 3000;

        -- Warlord's Plate Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16544,
            `ExtendedCost` = 3000;

        -- General's Plate Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16545,
            `ExtendedCost` = 3000;

        -- General's Plate Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16548,
            `ExtendedCost` = 3000;

    --********** DRUID EPICS --**********

        -- Warlord's Dragonhide Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16549,
            `ExtendedCost` = 3000;

        -- Warlord's Dragonhide Helmet
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16550,
            `ExtendedCost` = 3000;

        -- Warlord's Dragonhide Epaulets
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16551,
            `ExtendedCost` = 3000;

        -- General's Dragonhide Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16552,
            `ExtendedCost` = 3000;

        -- General's Dragonhide Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16554,
            `ExtendedCost` = 3000;

        -- General's Dragonhide Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16555,
            `ExtendedCost` = 3000;

    --********** ROGUE EPICS --**********

        -- General's Leather Treads
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16558,
            `ExtendedCost` = 3000;

        -- General's Leather Mitts
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16560,
            `ExtendedCost` = 3000;

        -- Warlord's Leather Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16561,
            `ExtendedCost` = 3000;

        -- Warlord's Leather Spaulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16562,
            `ExtendedCost` = 3000;

        -- Warlord's Leather Breastplate
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16563,
            `ExtendedCost` = 3000;

        -- General's Leather Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16564,
            `ExtendedCost` = 3000;

    --********** HUNTER EPICS --**********

        -- Warlord's Chain Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16565,
            `ExtendedCost` = 3000;

        -- Warlord's Chain Helmet
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16566,
            `ExtendedCost` = 3000;

        -- General's Chain Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16567,
            `ExtendedCost` = 3000;

        -- Warlord's Chain Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16568,
            `ExtendedCost` = 3000;

        -- General's Chain Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16569,
            `ExtendedCost` = 3000;

        -- General's Chain Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16571,
            `ExtendedCost` = 3000;

    --********** SHAMAN EPICS --**********

        -- General's Mail Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16573,
            `ExtendedCost` = 3000;

        -- General's Mail Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16574,
            `ExtendedCost` = 3000;

        -- Warlord's Mail Armor
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16577,
            `ExtendedCost` = 3000;

        -- Warlord's Mail Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16578,
            `ExtendedCost` = 3000;

        -- General's Mail Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16579,
            `ExtendedCost` = 3000;

        -- Warlord's Mail Spaulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 16580,
            `ExtendedCost` = 3000;

    --********** WARLOCK EPICS --**********

        -- General's Dreadweave Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17586,
            `ExtendedCost` = 3000;

        -- General's Dreadweave Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17588,
            `ExtendedCost` = 3000;

        -- Warlord's Dreadweave Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17590,
            `ExtendedCost` = 3000;

        -- Warlord's Dreadweave Hood
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17591,
            `ExtendedCost` = 3000;

        -- Warlord's Dreadweave Robe
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17592,
            `ExtendedCost` = 3000;

        -- General's Dreadweave Pants
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17593,
            `ExtendedCost` = 3000;

    --********** PRIEST EPICS --**********

        -- General's Satin Boots
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17618,
            `ExtendedCost` = 3000;

        -- General's Satin Gloves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17620,
            `ExtendedCost` = 3000;

        -- Warlord's Satin Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17622,
            `ExtendedCost` = 3000;

        -- Warlord's Satin Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17623,
            `ExtendedCost` = 3000;

        -- Warlord's Satin Robes
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17624,
            `ExtendedCost` = 3000;

        -- General's Satin Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 17625,
            `ExtendedCost` = 3000;

    --********** HUNTER RARES --**********

        -- Blood Guard's Chain Greaves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22843,
            `ExtendedCost` = 2998;

        -- Blood Guard's Chain Vices
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22862,
            `ExtendedCost` = 2998;

        -- Legionnaire's Chain Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22874,
            `ExtendedCost` = 2998;

        -- Legionnaire's Chain Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22875,
            `ExtendedCost` = 2998;

        -- Champion's Chain Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23251,
            `ExtendedCost` = 2998;

        -- Champion's Chain Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23252,
            `ExtendedCost` = 2998;

    --********** DRUID RARES --**********

        -- Blood Guard's Dragonhide Treads
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22852,
            `ExtendedCost` = 2998;

        -- Blood Guard's Dragonhide Grips
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22863,
            `ExtendedCost` = 2998;

        -- Legionnaire's Dragonhide Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22877,
            `ExtendedCost` = 2998;

        -- Legionnaire's Dragonhide Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22878,
            `ExtendedCost` = 2998;

        -- Champion's Dragonhide Headguard
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23253,
            `ExtendedCost` = 2998;

        -- Champion's Dragonhide Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23254,
            `ExtendedCost` = 2998;

    --********** WARLOCK RARES --**********

        -- Blood Guard's Dreadweave Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22855,
            `ExtendedCost` = 2998;

        -- Blood Guard's Dreadweave Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22865,
            `ExtendedCost` = 2998;

        -- Legionnaire's Dreadweave Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22881,
            `ExtendedCost` = 2998;

        -- Legionnaire's Dreadweave Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22884,
            `ExtendedCost` = 2998;

        -- Champion's Dreadweave Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23255,
            `ExtendedCost` = 2998;
            
        -- Champion's Dreadweave Spaulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23256,
            `ExtendedCost` = 2998;

    --********** ROGUE RARES --**********

        -- Blood Guard's Leather Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22856,
            `ExtendedCost` = 2998;

        -- Blood Guard's Leather Grips
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22864,
            `ExtendedCost` = 2998;

        -- Legionnaire's Leather Chestpiece
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22879,
            `ExtendedCost` = 2998;

        -- Legionnaire's Leather Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22880,
            `ExtendedCost` = 2998;

        -- Champion's Leather Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23257,
            `ExtendedCost` = 2998;

        -- Champion's Leather Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23258,
            `ExtendedCost` = 2998;

    --********** SHAMAN RARES --**********

        -- Blood Guard's Mail Greaves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22857,
            `ExtendedCost` = 2998;

        -- Blood Guard's Mail Vices
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22867,
            `ExtendedCost` = 2998;

        -- Legionnaire's Mail Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22876,
            `ExtendedCost` = 2998;

        -- Legionnaire's Mail Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22887,
            `ExtendedCost` = 2998;

        -- Champion's Mail Headguard
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23259,
            `ExtendedCost` = 2998;

        -- Champion's Mail Pauldrons
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23260,
            `ExtendedCost` = 2998;

    --********** WARRIOR RARES --**********

        -- Blood Guard's Plate Greaves
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22858,
            `ExtendedCost` = 2998;

        -- Blood Guard's Plate Gauntlets
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22868,
            `ExtendedCost` = 2998;

        -- Legionnaire's Plate Hauberk
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22872,
            `ExtendedCost` = 2998;

        -- Legionnaire's Plate Leggings
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22873,
            `ExtendedCost` = 2998;

        -- Champion's Plate Shoulders
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23243,
            `ExtendedCost` = 2998;

        -- Champion's Plate Helm
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23244,
            `ExtendedCost` = 2998;

    --********** PRIEST RARES --**********

        -- Blood Guard's Satin Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22859,
            `ExtendedCost` = 2998;

        -- Blood Guard's Satin Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22869,
            `ExtendedCost` = 2998;

        -- Legionnaire's Satin Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22882,
            `ExtendedCost` = 2998;

        -- Legionnaire's Satin Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22885,
            `ExtendedCost` = 2998;

        -- Champion's Satin Hood
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23261,
            `ExtendedCost` = 2998;
        
        -- Champion's Satin Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23262,
            `ExtendedCost` = 2998;

    --********** MAGE RARES --**********

        -- Blood Guard's Silk Walkers
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22860,
            `ExtendedCost` = 2998;

        -- Blood Guard's Silk Handwraps
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22870,
            `ExtendedCost` = 2998;

        -- Legionnaire's Silk Legguards
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22883,
            `ExtendedCost` = 2998;

        -- Legionnaire's Silk Tunic
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 22886,
            `ExtendedCost` = 2998;

        -- Champion's Silk Cowl
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23263,
            `ExtendedCost` = 2998;
        
        -- Champion's Silk Mantle
        INSERT INTO `npc_vendor` SET
            `entry` = 12792,
            `item` = 23264,
            `ExtendedCost` = 2998;

-- HORDE WEAPONS FROM SERGEANT THUNDERHORN

    -- DELETE ITEMS
    DELETE FROM `npc_vendor` WHERE `entry` = 14581;

    -- High Warlord's Blade
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 16345,
        `ExtendedCost` = 3001;

    -- High Warlord's Shield Wall
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18826,
        `ExtendedCost` = 3001;

    -- High Warlord's Cleaver
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18828,
        `ExtendedCost` = 3001;

    -- High Warlord's Battle Axe
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18831,
        `ExtendedCost` = 3002;

    -- High Warlord's Recurve
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18835,
        `ExtendedCost` = 3001;

    -- High Warlord's Crossbow
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18837,
        `ExtendedCost` = 3001;

    -- High Warlord's Razor
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18840,
        `ExtendedCost` = 3001;

    -- High Warlord's Right Claw
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18844,
        `ExtendedCost` = 3001;

    -- High Warlord's Left Claw
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18848,
        `ExtendedCost` = 3001;

    -- High Warlord's Street Sweeper
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18860,
        `ExtendedCost` = 3001;

    -- High Warlord's Bludgeon
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18866,
        `ExtendedCost` = 3001;

    -- High Warlord's Pulverizer
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18868,
        `ExtendedCost` = 3002;

    -- High Warlord's Pig Sticker
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18871,
        `ExtendedCost` = 3002;

    -- High Warlord's War Staff
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18874,
        `ExtendedCost` = 3002;

    -- High Warlord's Greatsword
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 18877,
        `ExtendedCost` = 3002;

    -- High Warlord's Battle Mace
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23464,
        `ExtendedCost` = 3001;

    -- High Warlord's Destroyer
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23465,
        `ExtendedCost` = 3002;

    -- High Warlord's Spellblade
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23466,
        `ExtendedCost` = 3001;

    -- High Warlord's Quickblade
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23467,
        `ExtendedCost` = 3001;

    -- High Warlord's Tome of Destruction
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23468,
        `ExtendedCost` = 3001;
        
    -- High Warlord's Tome of Mending
    INSERT INTO `npc_vendor` SET
        `entry` = 14581,
        `item` = 23469,
        `ExtendedCost` = 3001;

-- HORDE MOUNTS FROM RAIDER BORK

    -- DELETE ITEMS
    DELETE FROM `npc_vendor` WHERE `entry` = 12796;

    -- Horn of the Black War Wolf
    INSERT INTO `npc_vendor` SET
        `entry` = 12796,
        `item` = 18245,
        `ExtendedCost` = 3001;

    -- Whistle of the Black War Raptor
    INSERT INTO `npc_vendor` SET
        `entry` = 12796,
        `item` = 18246,
        `ExtendedCost` = 3001;

    -- Black War Kodo
    INSERT INTO `npc_vendor` SET
        `entry` = 12796,
        `item` = 18247,
        `ExtendedCost` = 3001;

    -- Red Skeletal Warhorse
    INSERT INTO `npc_vendor` SET
    `entry` = 12796,
    `item` = 18248,
    `ExtendedCost` = 3001,
    `VerifiedBuild` = NULL;


