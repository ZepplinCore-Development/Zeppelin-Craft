UPDATE acore_characters.item_instance
SET `itemEntry` = CASE
    -- Engineering
    WHEN `itemEntry` = 902306 THEN 57211    -- Skill Injector Schematic
    WHEN `itemEntry` = 902307 THEN 57212    -- Skill Injector
                                            -- SPARE
                                            -- SPARE
    WHEN `itemEntry` = 902304 THEN 57204    -- Schematic: Elementium Targeting Matrix  
    WHEN `itemEntry` = 902305 THEN 57205    -- Elementium Targeting Matrix 
    WHEN `itemEntry` = 902308 THEN 57206    -- Schematic: Thorium Headed Arrows
    WHEN `itemEntry` = 902331 THEN 57207    -- Schematic: Fel Iron Arrows 
    WHEN `itemEntry` = 902332 THEN 57208    -- Fel Iron Arrows   
    -- Jewelcrafting
    WHEN `itemEntry` = 902300 THEN 57500    -- Design: Elementium Talisman   
    WHEN `itemEntry` = 902301 THEN 57501    -- Elementium Talisman
    WHEN `itemEntry` = 57202 THEN 57502     -- Design: Black Diamond Dragonling
    WHEN `itemEntry` = 57203 THEN 57503     -- Black Diamond Dragonling
    -- Leatherworking
    WHEN `itemEntry` = 902315 THEN 57600     -- Drums of the Raid Leader
    WHEN `itemEntry` = 902316 THEN 57601      -- Drums of Forgotten Kings
    WHEN `itemEntry` = 902317 THEN 57602      -- Drums of Fortitude
    WHEN `itemEntry` = 902318 THEN 57603      -- Drums of Intellect
    WHEN `itemEntry` = 902319 THEN 57604     -- Drums of the Nights Watch
    WHEN `itemEntry` = 902320 THEN 57605      -- Drums of the Wild
    WHEN `itemEntry` = 902321 THEN 57606     -- Drums of the Raid Leader
    WHEN `itemEntry` = 902322 THEN 57607      -- Drums of Forgotten Kings
    WHEN `itemEntry` = 902323 THEN 57608      -- Drums of Fortitude
    WHEN `itemEntry` = 902324 THEN 57609      -- Drums of Intellect
    WHEN `itemEntry` = 902325 THEN 57610     -- Drums of the Nights Watch
    WHEN `itemEntry` = 902326 THEN 57611      -- Drums of the Wild
    -- Blacksmithing
    WHEN `itemEntry` = 902311 THEN 57000    -- Compressed Thermal Anvil
    WHEN `itemEntry` = 902302 THEN 57001    -- Plans: Elementium Aegis
    WHEN `itemEntry` = 902303 THEN 57002    -- Elementium Aegis
    -- Enchanting
    WHEN `itemEntry` = 902312 THEN 57100    -- Formula: Mystic Resonator
    WHEN `itemEntry` = 902313 THEN 41605    -- Mystic Resonator
    WHEN `itemEntry` = 902314 THEN 57101    -- Formula: Nexus Shard
    -- Skinnning
    WHEN `itemEntry` = 746 THEN 57800       -- Pristine Hide of Magmadar
    WHEN `itemEntry` = 17967 THEN 57801     -- Ancient Dragonscale
    -- OTHER
    WHEN `itemEntry` = 33223 THEN 902327    -- Portable Guild Bank
    WHEN `itemEntry` = 54452 THEN 902328    -- Reagent Portal
    WHEN `itemEntry` = 16068 THEN 902329    -- Clam Knight Conch
    WHEN `itemEntry` = 1977 THEN 902330     -- Zeppelin Bag
    -- Mounts
    WHEN `itemEntry` = 902801 THEN 58100    -- Giant Murloc
    WHEN `itemEntry` = 902800 THEN 58101    -- Butt Zeppelin
    -- AQ Crystals
    WHEN `itemEntry` = 900100 THEN 901000   
    WHEN `itemEntry` = 900101 THEN 901001
    WHEN `itemEntry` = 900102 THEN 901002   
    WHEN `itemEntry` = 900103 THEN 901003
    -- Emblems and Satchels
    WHEN `itemEntry` = 901200 THEN 58200    -- Badge of Heroism
    WHEN `itemEntry` = 900117 THEN 901201
    WHEN `itemEntry` = 900189 THEN 901203
    WHEN `itemEntry` = 900214 THEN 901205
    -- Stockades (F-063): 900xxx -> 59xxx (skip the defunct 901xxx generation)
    WHEN `itemEntry` = 900106 THEN 59091
    WHEN `itemEntry` = 900107 THEN 59092
    WHEN `itemEntry` = 900108 THEN 59093
    WHEN `itemEntry` = 900109 THEN 59094
    WHEN `itemEntry` = 900110 THEN 59095
    WHEN `itemEntry` = 900111 THEN 59096
    WHEN `itemEntry` = 900112 THEN 59097
    WHEN `itemEntry` = 900113 THEN 59098
    WHEN `itemEntry` = 900114 THEN 59099
    WHEN `itemEntry` = 900115 THEN 59100
    WHEN `itemEntry` = 900116 THEN 59101
    -- Clan Centaur (I-179, I-186): 2003xx -> 583xx (compliance fix, May 2026)
    WHEN `itemEntry` = 200300 THEN 58311
    WHEN `itemEntry` = 200301 THEN 58312
    WHEN `itemEntry` = 200302 THEN 58313
    WHEN `itemEntry` = 200303 THEN 58314
    WHEN `itemEntry` = 200304 THEN 58315
    WHEN `itemEntry` = 200305 THEN 58316
    WHEN `itemEntry` = 200306 THEN 58317
    WHEN `itemEntry` = 200307 THEN 58318
    WHEN `itemEntry` = 200308 THEN 58319
    WHEN `itemEntry` = 200309 THEN 58320
    WHEN `itemEntry` = 200310 THEN 58321
    WHEN `itemEntry` = 200311 THEN 58322
    WHEN `itemEntry` = 200312 THEN 58323
    WHEN `itemEntry` = 200313 THEN 58324
    WHEN `itemEntry` = 200314 THEN 58325
    WHEN `itemEntry` = 200315 THEN 58326
    WHEN `itemEntry` = 200316 THEN 58327
    WHEN `itemEntry` = 200317 THEN 58328
    WHEN `itemEntry` = 200318 THEN 58329
    -- Riding Crops (F-005, I-186): 1000xx -> 576xx (compliance fix, May 2026)
    WHEN `itemEntry` = 100010 THEN 57617    -- Apprentice Riding Crop
    WHEN `itemEntry` = 100011 THEN 57618    -- Journeyman Riding Crop
    WHEN `itemEntry` = 100012 THEN 57619    -- Expert Riding Crop
    WHEN `itemEntry` = 100013 THEN 57620    -- Artisan Riding Crop
    WHEN `itemEntry` = 100014 THEN 57621    -- Master Riding Crop
    WHEN `itemEntry` = 100015 THEN 57622    -- Pattern: Apprentice Riding Crop
    WHEN `itemEntry` = 100016 THEN 57623    -- Pattern: Journeyman Riding Crop
    WHEN `itemEntry` = 100017 THEN 57624    -- Pattern: Expert Riding Crop
    WHEN `itemEntry` = 100018 THEN 57625    -- Pattern: Artisan Riding Crop
    WHEN `itemEntry` = 100019 THEN 57626    -- Pattern: Master Riding Crop
    WHEN `itemEntry` = 100020 THEN 57627    -- Grand Master Riding Crop
    WHEN `itemEntry` = 100021 THEN 57628    -- Pattern: Grand Master Riding Crop
    -- Stockades (F-063): 901xxx -> 59xxx (compliance fix, May 2026)
    WHEN `itemEntry` = 901100 THEN 59091
    WHEN `itemEntry` = 901101 THEN 59092
    WHEN `itemEntry` = 901102 THEN 59093
    WHEN `itemEntry` = 901103 THEN 59094
    WHEN `itemEntry` = 901104 THEN 59095
    WHEN `itemEntry` = 901105 THEN 59096
    WHEN `itemEntry` = 901106 THEN 59097
    WHEN `itemEntry` = 901107 THEN 59098
    WHEN `itemEntry` = 901108 THEN 59099
    WHEN `itemEntry` = 901109 THEN 59100
    WHEN `itemEntry` = 901110 THEN 59101
    -- Vanilla Recipes
    WHEN `itemEntry` = 900105 THEN 902300
    -- Quest Items Vanilla
    WHEN `itemEntry` = 900191 THEN 58310    -- Raptor Flank (F-094): reroute 900xxx → 58xxx (skip defunct 902200 gen)
    WHEN `itemEntry` = 902200 THEN 58310    -- Raptor Flank (F-094): 902xxx → 58xxx compliance fix May 2026
    WHEN `itemEntry` = 900284 THEN 902224
    -- Add more conditions as needed
    ELSE `itemEntry`
END;

-- Items in Reagent Bank

UPDATE acore_characters.custom_reagent_bank_account
SET `item_Entry` = CASE
    -- AQ Crystals
    WHEN `item_Entry` = 900100 THEN 901000   
    WHEN `item_Entry` = 900101 THEN 901001
    WHEN `item_Entry` = 900102 THEN 901002   
    WHEN `item_Entry` = 900103 THEN 901003
    -- Skinning
    WHEN `item_Entry` = 17967 THEN 57801     -- Ancient Dragonscale
    -- Add more conditions as needed
    ELSE `item_Entry`
END;