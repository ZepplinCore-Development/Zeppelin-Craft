-- I-421: Open Azeroth moved some building placements (ADT MODF) up or down versus stock, so
-- the stock-measured NPC and object heights on those floors sink or float by the same amount.
-- Each spawn standing on a floor face of the STOCK placement (|nz| >= 0.5, within 0.35 yd of its z)
-- gets stock z + the placement shift. Absolute values, so re-applying is safe.
-- Placements with no spawns on their floors, or moved sideways or turned, are not covered (see I-421).

-- KALIMDOR_30_41.ADT MD_MUSHROOMDEN.WMO uid 268049 dz -2.168
UPDATE creature SET position_z = 133.813 WHERE guid = 50483; -- entry 5254, was 135.981
UPDATE creature SET position_z = 133.957 WHERE guid = 50526; -- entry 5255, was 136.125
UPDATE creature SET position_z = 135.148 WHERE guid = 50562; -- entry 5258, was 137.316

-- KALIMDOR_30_32.ADT CLASSICALELFRUIN04.WMO uid 268669 dz -1.794
UPDATE creature SET position_z = 93.882 WHERE guid = 27852; -- entry 4674, was 95.6761
UPDATE creature SET position_z = 95.686 WHERE guid = 27854; -- entry 4674, was 97.48

-- AZEROTH_37_47.ADT WESTFALLFARMHOUSEBURNT.WMO uid 310982 dz +1.031
UPDATE gameobject SET position_z = 190.613 WHERE guid = 79105; -- entry 181391, was 189.582

-- KALIMDOR_30_33.ADT CENTAURTENTCOMMAND.WMO uid 268597 dz +0.945
UPDATE creature SET position_z = 97.248 WHERE guid = 27042; -- entry 5600, was 96.303

-- KALIMDOR_36_27.ADT ORCHUT.WMO uid 268858 dz +0.389
UPDATE creature SET position_z = 103.516 WHERE guid = 33156; -- entry 12723, was 103.127
UPDATE gameobject SET position_z = 103.611 WHERE guid = 47966; -- entry 126050, was 103.222
UPDATE gameobject SET position_z = 103.611 WHERE guid = 47968; -- entry 126051, was 103.222

-- AZEROTH_37_48.ADT MD_MUSHROOMDEN.WMO uid 310958 dz -0.337
UPDATE creature SET position_z = 107.940 WHERE guid = 6159; -- entry 568, was 108.277
UPDATE creature SET position_z = 107.838 WHERE guid = 6160; -- entry 568, was 108.175
UPDATE creature SET position_z = 107.757 WHERE guid = 6161; -- entry 429, was 108.094
UPDATE creature SET position_z = 108.405 WHERE guid = 6754; -- entry 431, was 108.742
UPDATE creature SET position_z = 107.729 WHERE guid = 10172; -- entry 568, was 108.066
UPDATE creature SET position_z = 108.703 WHERE guid = 134158; -- entry 947, was 109.04
UPDATE gameobject SET position_z = 107.923 WHERE guid = 18917; -- entry 2850, was 108.26

-- KALIMDOR_36_27.ADT ORCINN.WMO uid 268859 dz +0.32
UPDATE creature SET position_z = 103.177 WHERE guid = 32342; -- entry 12837, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 33073; -- entry 12196, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 33148; -- entry 12722, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 52757; -- entry 32823, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 52798; -- entry 34654, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 66837; -- entry 15760, was 102.857
UPDATE creature SET position_z = 103.177 WHERE guid = 66838; -- entry 15760, was 102.857
UPDATE gameobject SET position_z = 103.093 WHERE guid = 3369; -- entry 195664, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 16397; -- entry 180353, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 16398; -- entry 180353, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 16399; -- entry 180353, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 16400; -- entry 180353, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 16401; -- entry 180353, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 36493; -- entry 180405, was 102.773
UPDATE gameobject SET position_z = 110.470 WHERE guid = 36494; -- entry 180405, was 110.15
UPDATE gameobject SET position_z = 110.821 WHERE guid = 36920; -- entry 180406, was 110.501
UPDATE gameobject SET position_z = 110.649 WHERE guid = 37338; -- entry 180407, was 110.329
UPDATE gameobject SET position_z = 103.093 WHERE guid = 37339; -- entry 180407, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 37721; -- entry 190079, was 102.773
UPDATE gameobject SET position_z = 110.888 WHERE guid = 39760; -- entry 180472, was 110.568
UPDATE gameobject SET position_z = 110.862 WHERE guid = 39761; -- entry 180472, was 110.542
UPDATE gameobject SET position_z = 110.945 WHERE guid = 39762; -- entry 180472, was 110.625
UPDATE gameobject SET position_z = 110.845 WHERE guid = 39763; -- entry 180472, was 110.525
UPDATE gameobject SET position_z = 110.854 WHERE guid = 39764; -- entry 180472, was 110.534
UPDATE gameobject SET position_z = 103.364 WHERE guid = 39897; -- entry 180523, was 103.044
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43769; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43770; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43771; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43772; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43773; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43774; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43775; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43776; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43777; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 43778; -- entry 179968, was 102.773
UPDATE gameobject SET position_z = 103.089 WHERE guid = 47854; -- entry 149038, was 102.769
UPDATE gameobject SET position_z = 103.227 WHERE guid = 47918; -- entry 106325, was 102.907
UPDATE gameobject SET position_z = 103.227 WHERE guid = 47928; -- entry 106326, was 102.907
UPDATE gameobject SET position_z = 103.227 WHERE guid = 47940; -- entry 106327, was 102.907
UPDATE gameobject SET position_z = 103.227 WHERE guid = 47961; -- entry 106335, was 102.907
UPDATE gameobject SET position_z = 103.227 WHERE guid = 47963; -- entry 106336, was 102.907
UPDATE gameobject SET position_z = 103.093 WHERE guid = 51278; -- entry 181355, was 102.773
UPDATE gameobject SET position_z = 103.093 WHERE guid = 51522; -- entry 181355, was 102.773
UPDATE gameobject SET position_z = 110.753 WHERE guid = 71561; -- entry 180844, was 110.433

-- KALIMDOR_29_43.ADT MINI-HIVE_E.WMO uid 267980 dz -0.305
UPDATE creature SET position_z = -47.593 WHERE guid = 43185; -- entry 11698, was -47.2876
UPDATE creature SET position_z = -32.169 WHERE guid = 43186; -- entry 11698, was -31.8643
UPDATE creature SET position_z = -20.785 WHERE guid = 43225; -- entry 11721, was -20.4802
UPDATE creature SET position_z = -50.233 WHERE guid = 43227; -- entry 11721, was -49.928
UPDATE creature SET position_z = -40.455 WHERE guid = 43229; -- entry 11721, was -40.1503
UPDATE creature SET position_z = -34.049 WHERE guid = 43231; -- entry 11721, was -33.7442
UPDATE creature SET position_z = -24.441 WHERE guid = 43234; -- entry 11721, was -24.1356
UPDATE creature SET position_z = -16.477 WHERE guid = 43238; -- entry 11722, was -16.1716
UPDATE creature SET position_z = -18.083 WHERE guid = 43244; -- entry 11722, was -17.7782
UPDATE creature SET position_z = -43.177 WHERE guid = 43246; -- entry 11722, was -42.8717
UPDATE creature SET position_z = -24.100 WHERE guid = 43250; -- entry 11722, was -23.7953
UPDATE creature SET position_z = -18.415 WHERE guid = 43255; -- entry 11722, was -18.1101
UPDATE creature SET position_z = -19.350 WHERE guid = 43257; -- entry 11722, was -19.0448
UPDATE creature SET position_z = -26.939 WHERE guid = 43258; -- entry 11722, was -26.6338
UPDATE creature SET position_z = -33.265 WHERE guid = 43259; -- entry 11722, was -32.9602
UPDATE creature SET position_z = -20.152 WHERE guid = 43260; -- entry 11722, was -19.8475
UPDATE creature SET position_z = -20.937 WHERE guid = 43264; -- entry 11723, was -20.6321
UPDATE creature SET position_z = -16.830 WHERE guid = 43265; -- entry 11723, was -16.5253
UPDATE creature SET position_z = -23.939 WHERE guid = 43268; -- entry 11723, was -23.6339
UPDATE creature SET position_z = -21.087 WHERE guid = 43274; -- entry 11723, was -20.7824
UPDATE creature SET position_z = -41.497 WHERE guid = 43275; -- entry 11723, was -41.1922
UPDATE creature SET position_z = -45.727 WHERE guid = 43276; -- entry 11723, was -45.4218
UPDATE creature SET position_z = -42.920 WHERE guid = 43278; -- entry 11724, was -42.6154
UPDATE creature SET position_z = -21.073 WHERE guid = 43281; -- entry 11724, was -20.7682
UPDATE creature SET position_z = -41.847 WHERE guid = 43283; -- entry 11724, was -41.5417
UPDATE creature SET position_z = -46.098 WHERE guid = 43293; -- entry 11724, was -45.793
UPDATE creature SET position_z = -15.191 WHERE guid = 43295; -- entry 11724, was -14.8858
UPDATE creature SET position_z = -20.827 WHERE guid = 43299; -- entry 11724, was -20.5221
UPDATE creature SET position_z = -33.242 WHERE guid = 43304; -- entry 11724, was -32.9372
UPDATE creature SET position_z = -20.797 WHERE guid = 43309; -- entry 11724, was -20.4922
UPDATE creature SET position_z = -24.924 WHERE guid = 43312; -- entry 11724, was -24.6192
UPDATE creature SET position_z = -40.515 WHERE guid = 46166; -- entry 15611, was -40.2096
UPDATE gameobject SET position_z = -21.220 WHERE guid = 217151; -- entry 177388, was -20.9147
UPDATE gameobject SET position_z = -20.374 WHERE guid = 217152; -- entry 177388, was -20.0686
UPDATE gameobject SET position_z = -25.708 WHERE guid = 217154; -- entry 177388, was -25.4027
UPDATE gameobject SET position_z = -21.220 WHERE guid = 217180; -- entry 123309, was -20.9147
UPDATE gameobject SET position_z = -20.374 WHERE guid = 217181; -- entry 123309, was -20.0686
UPDATE gameobject SET position_z = -25.708 WHERE guid = 217183; -- entry 123309, was -25.4027

-- AZEROTH_38_49.ADT REDRIDGE_MAGETOWER.WMO uid 310912 dz -0.294
UPDATE creature SET position_z = 149.931 WHERE guid = 6147; -- entry 429, was 150.225
UPDATE creature SET position_z = 149.931 WHERE guid = 6148; -- entry 429, was 150.225
UPDATE creature SET position_z = 132.087 WHERE guid = 6149; -- entry 429, was 132.381
UPDATE creature SET position_z = 149.939 WHERE guid = 6268; -- entry 397, was 150.233
UPDATE creature SET position_z = 149.931 WHERE guid = 6269; -- entry 819, was 150.225
UPDATE creature SET position_z = 149.931 WHERE guid = 6278; -- entry 819, was 150.225
UPDATE creature SET position_z = 149.931 WHERE guid = 6279; -- entry 429, was 150.225
UPDATE creature SET position_z = 115.515 WHERE guid = 7586; -- entry 431, was 115.809
UPDATE creature SET position_z = 115.523 WHERE guid = 7594; -- entry 431, was 115.817
UPDATE creature SET position_z = 115.558 WHERE guid = 7654; -- entry 579, was 115.852
UPDATE creature SET position_z = 120.224 WHERE guid = 7768; -- entry 819, was 120.518
UPDATE creature SET position_z = 123.002 WHERE guid = 7771; -- entry 819, was 123.296
UPDATE creature SET position_z = 128.823 WHERE guid = 8167; -- entry 431, was 129.117
UPDATE creature SET position_z = 115.558 WHERE guid = 8314; -- entry 429, was 115.852
UPDATE creature SET position_z = 125.875 WHERE guid = 8315; -- entry 819, was 126.169
UPDATE creature SET position_z = 125.875 WHERE guid = 8316; -- entry 819, was 126.169
UPDATE creature SET position_z = 135.490 WHERE guid = 8317; -- entry 819, was 135.784
UPDATE creature SET position_z = 141.064 WHERE guid = 8671; -- entry 431, was 141.358
UPDATE creature SET position_z = 141.149 WHERE guid = 8672; -- entry 819, was 141.443
UPDATE creature SET position_z = 141.149 WHERE guid = 8673; -- entry 819, was 141.443
UPDATE creature SET position_z = 149.931 WHERE guid = 8676; -- entry 819, was 150.225
UPDATE creature SET position_z = 149.931 WHERE guid = 8700; -- entry 819, was 150.225
UPDATE creature SET position_z = 149.931 WHERE guid = 8701; -- entry 429, was 150.225
UPDATE gameobject SET position_z = 115.374 WHERE guid = 18580; -- entry 3659, was 115.668
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42587; -- entry 148662, was 150.255
UPDATE gameobject SET position_z = 149.840 WHERE guid = 42588; -- entry 148664, was 150.134
UPDATE gameobject SET position_z = 149.795 WHERE guid = 42589; -- entry 148665, was 150.089
UPDATE gameobject SET position_z = 125.787 WHERE guid = 42590; -- entry 148659, was 126.081
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42591; -- entry 148682, was 150.255
UPDATE gameobject SET position_z = 149.913 WHERE guid = 42592; -- entry 148714, was 150.207
UPDATE gameobject SET position_z = 149.840 WHERE guid = 42593; -- entry 148683, was 150.134
UPDATE gameobject SET position_z = 149.808 WHERE guid = 42594; -- entry 148684, was 150.102
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42595; -- entry 148686, was 141.379
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42596; -- entry 148680, was 141.379
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42597; -- entry 148677, was 141.379
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42598; -- entry 148674, was 141.379
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42599; -- entry 148658, was 150.255
UPDATE gameobject SET position_z = 115.414 WHERE guid = 42600; -- entry 148695, was 115.708
UPDATE gameobject SET position_z = 115.414 WHERE guid = 42601; -- entry 148696, was 115.708
UPDATE gameobject SET position_z = 115.414 WHERE guid = 42602; -- entry 148694, was 115.708
UPDATE gameobject SET position_z = 149.913 WHERE guid = 42603; -- entry 148707, was 150.207
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42604; -- entry 148671, was 141.379
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42605; -- entry 148668, was 141.379
UPDATE gameobject SET position_z = 141.085 WHERE guid = 42606; -- entry 148670, was 141.379
UPDATE gameobject SET position_z = 149.907 WHERE guid = 42607; -- entry 148697, was 150.201
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42608; -- entry 148660, was 150.255
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42609; -- entry 148691, was 150.255
UPDATE gameobject SET position_z = 115.414 WHERE guid = 42610; -- entry 148692, was 115.708
UPDATE gameobject SET position_z = 115.414 WHERE guid = 42611; -- entry 148693, was 115.708
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42612; -- entry 148669, was 150.255
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42613; -- entry 148675, was 150.255
UPDATE gameobject SET position_z = 149.961 WHERE guid = 42614; -- entry 148661, was 150.255
UPDATE gameobject SET position_z = 149.942 WHERE guid = 42615; -- entry 148725, was 150.236
UPDATE gameobject SET position_z = 149.942 WHERE guid = 42616; -- entry 148663, was 150.236
