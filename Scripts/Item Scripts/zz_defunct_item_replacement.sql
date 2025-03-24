UPDATE acore_characters.item_instance
SET `itemEntry` = CASE
    -- Engineering
    WHEN `itemEntry` = 902306 THEN 57200    -- Skill Injector Schematic    
    WHEN `itemEntry` = 902307 THEN 57201    -- Skill Injector
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
    -- Stockades
    WHEN `itemEntry` = 900106 THEN 901100
    WHEN `itemEntry` = 900107 THEN 901101
    WHEN `itemEntry` = 900108 THEN 901102
    WHEN `itemEntry` = 900109 THEN 901103
    WHEN `itemEntry` = 900110 THEN 901104
    WHEN `itemEntry` = 900111 THEN 901105
    WHEN `itemEntry` = 900112 THEN 901106
    WHEN `itemEntry` = 900113 THEN 901107
    WHEN `itemEntry` = 900114 THEN 901108
    WHEN `itemEntry` = 900115 THEN 901109
    WHEN `itemEntry` = 900116 THEN 901110
    -- Vanilla Recipes
    WHEN `itemEntry` = 900105 THEN 902300
    -- Quest Items Vanilla
    WHEN `itemEntry` = 900191 THEN 902200
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