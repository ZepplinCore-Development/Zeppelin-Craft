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
    -- Reputation Tabards (F-019, I-186): 9020xx -> 583xx (compliance fix, May 2026)
    WHEN `itemEntry` = 902001 THEN 58330    -- Netherwing Tabard
    WHEN `itemEntry` = 902002 THEN 58331    -- Violet Eye Tabard
    WHEN `itemEntry` = 902003 THEN 58332    -- Tranquillien Tabard
    WHEN `itemEntry` = 902004 THEN 58333    -- Ashtongue Deathsworn Tabard
    WHEN `itemEntry` = 902005 THEN 58334    -- Scale of the Sands Tabard
    -- Daily Dungeon Teleport Orbs (F-018, I-186): 9019xx -> 586xx (compliance fix, May 2026)
    WHEN `itemEntry` = 901901 THEN 58600
    WHEN `itemEntry` = 901902 THEN 58601
    WHEN `itemEntry` = 901903 THEN 58602
    WHEN `itemEntry` = 901904 THEN 58603
    WHEN `itemEntry` = 901905 THEN 58604
    WHEN `itemEntry` = 901906 THEN 58605
    WHEN `itemEntry` = 901907 THEN 58606
    WHEN `itemEntry` = 901908 THEN 58607
    WHEN `itemEntry` = 901909 THEN 58608
    WHEN `itemEntry` = 901910 THEN 58609
    WHEN `itemEntry` = 901911 THEN 58610
    WHEN `itemEntry` = 901912 THEN 58611
    WHEN `itemEntry` = 901913 THEN 58612
    WHEN `itemEntry` = 901914 THEN 58613
    WHEN `itemEntry` = 901915 THEN 58614
    WHEN `itemEntry` = 901916 THEN 58615
    WHEN `itemEntry` = 901917 THEN 58616
    WHEN `itemEntry` = 901918 THEN 58617
    WHEN `itemEntry` = 901919 THEN 58618
    WHEN `itemEntry` = 901920 THEN 58619
    WHEN `itemEntry` = 901921 THEN 58620
    WHEN `itemEntry` = 901922 THEN 58621
    WHEN `itemEntry` = 901923 THEN 58622
    WHEN `itemEntry` = 901924 THEN 58623
    WHEN `itemEntry` = 901925 THEN 58624
    WHEN `itemEntry` = 901926 THEN 58625
    WHEN `itemEntry` = 901927 THEN 58626
    WHEN `itemEntry` = 901928 THEN 58627
    WHEN `itemEntry` = 901929 THEN 58628
    WHEN `itemEntry` = 901930 THEN 58629
    WHEN `itemEntry` = 901931 THEN 58630
    WHEN `itemEntry` = 901932 THEN 58631
    WHEN `itemEntry` = 901933 THEN 58632
    WHEN `itemEntry` = 901934 THEN 58633
    WHEN `itemEntry` = 901935 THEN 58634
    WHEN `itemEntry` = 901936 THEN 58635
    WHEN `itemEntry` = 901937 THEN 58636
    WHEN `itemEntry` = 901938 THEN 58637
    WHEN `itemEntry` = 901939 THEN 58638
    WHEN `itemEntry` = 901940 THEN 58639
    WHEN `itemEntry` = 901941 THEN 58640
    WHEN `itemEntry` = 901942 THEN 58641
    WHEN `itemEntry` = 901943 THEN 58642
    WHEN `itemEntry` = 901944 THEN 58643
    WHEN `itemEntry` = 901945 THEN 58644
    WHEN `itemEntry` = 901946 THEN 58645
    WHEN `itemEntry` = 901947 THEN 58646
    WHEN `itemEntry` = 901948 THEN 58647
    WHEN `itemEntry` = 901949 THEN 58648
    WHEN `itemEntry` = 901950 THEN 58649
    WHEN `itemEntry` = 901951 THEN 58650
    WHEN `itemEntry` = 901952 THEN 58651
    WHEN `itemEntry` = 901953 THEN 58652
    WHEN `itemEntry` = 901954 THEN 58653
    WHEN `itemEntry` = 901955 THEN 58654
    WHEN `itemEntry` = 901956 THEN 58655
    WHEN `itemEntry` = 901957 THEN 58656
    WHEN `itemEntry` = 901958 THEN 58657
    WHEN `itemEntry` = 901959 THEN 58658
    WHEN `itemEntry` = 901960 THEN 58659
    WHEN `itemEntry` = 901961 THEN 58660
    WHEN `itemEntry` = 901962 THEN 58661
    -- Daily Dungeon Quest Rewards (F-018, I-186): 9017xx -> 587xx (compliance fix, May 2026)
    -- These are bind-on-pickup quest items so live ownership is normally 0; clauses added for safety.
    WHEN `itemEntry` = 901700 THEN 58700
    WHEN `itemEntry` = 901701 THEN 58701
    WHEN `itemEntry` = 901702 THEN 58702
    WHEN `itemEntry` = 901703 THEN 58703
    WHEN `itemEntry` = 901704 THEN 58704
    WHEN `itemEntry` = 901705 THEN 58705
    WHEN `itemEntry` = 901706 THEN 58706
    WHEN `itemEntry` = 901707 THEN 58707
    WHEN `itemEntry` = 901708 THEN 58708
    WHEN `itemEntry` = 901709 THEN 58709
    WHEN `itemEntry` = 901710 THEN 58710
    WHEN `itemEntry` = 901711 THEN 58711
    WHEN `itemEntry` = 901712 THEN 58712
    WHEN `itemEntry` = 901713 THEN 58713
    WHEN `itemEntry` = 901714 THEN 58714
    WHEN `itemEntry` = 901715 THEN 58715
    WHEN `itemEntry` = 901716 THEN 58716
    WHEN `itemEntry` = 901717 THEN 58717
    WHEN `itemEntry` = 901718 THEN 58718
    WHEN `itemEntry` = 901719 THEN 58719
    WHEN `itemEntry` = 901720 THEN 58720
    WHEN `itemEntry` = 901721 THEN 58721
    WHEN `itemEntry` = 901722 THEN 58722
    WHEN `itemEntry` = 901723 THEN 58723
    WHEN `itemEntry` = 901724 THEN 58724
    WHEN `itemEntry` = 901725 THEN 58725
    WHEN `itemEntry` = 901726 THEN 58726
    WHEN `itemEntry` = 901727 THEN 58727
    WHEN `itemEntry` = 901728 THEN 58728
    WHEN `itemEntry` = 901729 THEN 58729
    WHEN `itemEntry` = 901730 THEN 58730
    WHEN `itemEntry` = 901731 THEN 58731
    WHEN `itemEntry` = 901732 THEN 58732
    WHEN `itemEntry` = 901733 THEN 58733
    WHEN `itemEntry` = 901734 THEN 58734
    WHEN `itemEntry` = 901735 THEN 58735
    WHEN `itemEntry` = 901736 THEN 58736
    WHEN `itemEntry` = 901737 THEN 58737
    WHEN `itemEntry` = 901738 THEN 58738
    WHEN `itemEntry` = 901739 THEN 58739
    WHEN `itemEntry` = 901740 THEN 58740
    WHEN `itemEntry` = 901741 THEN 58741
    WHEN `itemEntry` = 901742 THEN 58742
    WHEN `itemEntry` = 901743 THEN 58743
    WHEN `itemEntry` = 901744 THEN 58744
    WHEN `itemEntry` = 901745 THEN 58745
    WHEN `itemEntry` = 901746 THEN 58746
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