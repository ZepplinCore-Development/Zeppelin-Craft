UPDATE `item_instance`
SET `itemEntry` = CASE
    WHEN `itemEntry` = 16068 THEN 902329 -- Clam Knight Conch
    WHEN `itemEntry` = 1977 THEN 902330 -- Zeppelin Bag
    WHEN `itemEntry` = 941 THEN 902305 -- Elementium Targeting Matrix
    WHEN `itemEntry` = 1184 THEN 902303 -- Elementium Aegis
    WHEN `itemEntry` = 1186 THEN 902301 -- Elementium Talisman
    WHEN `itemEntry` = 734 THEN 902307 -- Skill Injector
    WHEN `itemEntry` = 38385 THEN 902310 -- Black Diamond Dragonling
    WHEN `itemEntry` = 32566 THEN 902311 -- Compressed Thermal Anvil
    WHEN `itemEntry` = 41605 THEN 902313 -- Mystic Resonator
    WHEN `itemEntry` = 836 THEN 902316 -- Drums of Forgotten Kings
    WHEN `itemEntry` = 741 THEN 902318 -- Drums of Fortitude
    WHEN `itemEntry` = 761 THEN 902320 -- Drums of Intellect
    WHEN `itemEntry` = 1163 THEN 902322 -- Drums of the Nights Watch
    WHEN `itemEntry` = 951 THEN 902324 -- Drums of the Wild
    WHEN `itemEntry` = 1128 THEN 902326 -- Drums of the Raid Leader
    WHEN `itemEntry` = 33223 THEN 902327 -- Portable Guild Bank
    WHEN `itemEntry` = 54452 THEN 902328 -- Reagent Portal
    -- AQ Crystals
    WHEN `itemEntry` = 900100 THEN 901000   
    WHEN `itemEntry` = 900101 THEN 901001
    WHEN `itemEntry` = 900102 THEN 901002   
    WHEN `itemEntry` = 900103 THEN 901003
    -- Emblems and Satchels
    WHEN `itemEntry` = 900104 THEN 901200
    WHEN `itemEntry` = 900117 THEN 901201
    WHEN `itemEntry` = 900118 THEN 901202
    WHEN `itemEntry` = 900189 THEN 901203
    WHEN `itemEntry` = 900190 THEN 901204
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
