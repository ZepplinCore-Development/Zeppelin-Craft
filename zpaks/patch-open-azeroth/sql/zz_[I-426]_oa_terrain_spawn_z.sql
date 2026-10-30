-- I-426 Open Azeroth re-sculpted terrain: spawns left on stock ground height
-- Generated 2026-10-29 by comparing each spawn's stock ADT ground with the shipped
-- patch-open-azeroth ADT ground (client triangulation). new z = old z + (OA ground - stock ground).
-- Skipped: spawns in OA water, triggers. Held for hand review: cliff edges, flooded spawns, no server height.
-- Floor check (2026-10-30, F-219 .gps FloorZ above each spawn + 3 yd E/W): spawns standing on a structure keep their stock z and are not in this file (I-426 note).
-- Rows owned elsewhere are fixed in their own files (I-228 Highperch, F-094).

-- AZEROTH_28_27.ADT
-- Scarlet Warrior (guid 37877, entry 1535) 32.01 -> 32.41
UPDATE `creature` SET `position_z` = 32.414000 WHERE `guid` = 37877;
-- Scarlet Warrior (guid 44259, entry 1535) 33.72 -> 33.41
UPDATE `creature` SET `position_z` = 33.407000 WHERE `guid` = 44259;
-- AZEROTH_28_29.ADT
-- Giant Grizzled Bear (guid 18228, entry 1797) 31.83 -> 30.54
UPDATE `creature` SET `position_z` = 30.544000 WHERE `guid` = 18228;
-- AZEROTH_29_33.ADT
-- Wallace the Blind (guid 17637, entry 3534) 17.10 -> 26.43
UPDATE `creature` SET `position_z` = 26.432000 WHERE `guid` = 17637;
-- Haggard Refugee (guid 17736, entry 2053) 17.21 -> 24.70
UPDATE `creature` SET `position_z` = 24.702000 WHERE `guid` = 17736;
-- Sickly Refugee (guid 17738, entry 2054) 17.59 -> 23.19
UPDATE `creature` SET `position_z` = 23.194000 WHERE `guid` = 17738;
-- Haggard Refugee (guid 17823, entry 2053) 17.30 -> 24.57
UPDATE `creature` SET `position_z` = 24.567000 WHERE `guid` = 17823;
-- Sickly Refugee (guid 17923, entry 2054) 16.96 -> 26.27
UPDATE `creature` SET `position_z` = 26.273000 WHERE `guid` = 17923;
-- Sickly Refugee (guid 17924, entry 2054) 16.83 -> 26.07
UPDATE `creature` SET `position_z` = 26.073000 WHERE `guid` = 17924;
-- Sickly Refugee (guid 17925, entry 2054) 17.25 -> 25.82
UPDATE `creature` SET `position_z` = 25.819000 WHERE `guid` = 17925;
-- Haggard Refugee (guid 17927, entry 2053) 17.00 -> 25.62
UPDATE `creature` SET `position_z` = 25.621000 WHERE `guid` = 17927;
-- Haggard Refugee (guid 17928, entry 2053) 16.33 -> 25.94
UPDATE `creature` SET `position_z` = 25.936000 WHERE `guid` = 17928;
-- Sickly Refugee (guid 17930, entry 2054) 16.15 -> 27.27
UPDATE `creature` SET `position_z` = 27.270000 WHERE `guid` = 17930;
-- Haggard Refugee (guid 18025, entry 2053) 18.17 -> 28.37
UPDATE `creature` SET `position_z` = 28.371000 WHERE `guid` = 18025;
-- Sickly Refugee (guid 18026, entry 2054) 18.08 -> 28.26
UPDATE `creature` SET `position_z` = 28.258000 WHERE `guid` = 18026;
-- Sickly Refugee (guid 18027, entry 2054) 14.78 -> 27.83
UPDATE `creature` SET `position_z` = 27.828000 WHERE `guid` = 18027;
-- Haggard Refugee (guid 18028, entry 2053) 17.28 -> 26.13
UPDATE `creature` SET `position_z` = 26.130000 WHERE `guid` = 18028;
-- Haggard Refugee (guid 18081, entry 2053) 18.74 -> 23.73
UPDATE `creature` SET `position_z` = 23.735000 WHERE `guid` = 18081;
-- Sickly Refugee (guid 18082, entry 2054) 18.88 -> 23.85
UPDATE `creature` SET `position_z` = 23.849000 WHERE `guid` = 18082;
-- Haggard Refugee (guid 18163, entry 2053) 15.71 -> 27.80
UPDATE `creature` SET `position_z` = 27.799000 WHERE `guid` = 18163;
-- Sickly Refugee (guid 18164, entry 2054) 15.64 -> 27.81
UPDATE `creature` SET `position_z` = 27.810000 WHERE `guid` = 18164;
-- Haggard Refugee (guid 18165, entry 2053) 17.95 -> 25.43
UPDATE `creature` SET `position_z` = 25.427000 WHERE `guid` = 18165;
-- Haggard Refugee (guid 18166, entry 2053) 16.24 -> 27.73
UPDATE `creature` SET `position_z` = 27.727000 WHERE `guid` = 18166;
-- Moonrage Bloodhowler (guid 18246, entry 1924) 8.13 -> 9.28
UPDATE `creature` SET `position_z` = 9.279000 WHERE `guid` = 18246;
-- Sickly Refugee (guid 18414, entry 2054) 14.35 -> 25.58
UPDATE `creature` SET `position_z` = 25.577000 WHERE `guid` = 18414;
-- Haggard Refugee (guid 18415, entry 2053) 14.49 -> 27.80
UPDATE `creature` SET `position_z` = 27.805000 WHERE `guid` = 18415;
-- Sickly Refugee (guid 19149, entry 2054) 13.11 -> 28.27
UPDATE `creature` SET `position_z` = 28.267000 WHERE `guid` = 19149;
-- Valdred Moray (guid 19150, entry 2332) 17.19 -> 25.81
UPDATE `creature` SET `position_z` = 25.808000 WHERE `guid` = 19150;
-- Dalin Forgewright (guid 19151, entry 5682) 15.20 -> 25.17
UPDATE `creature` SET `position_z` = 25.172000 WHERE `guid` = 19151;
-- Haggard Refugee (guid 19152, entry 2053) 9.17 -> 22.82
UPDATE `creature` SET `position_z` = 22.816000 WHERE `guid` = 19152;
-- Campfire (guid 33312, entry 2003) 17.27 -> 23.41
UPDATE `gameobject` SET `position_z` = 23.406000 WHERE `guid` = 33312;
-- Smoldering Fire (guid 33314, entry 2004) 15.76 -> 27.72
UPDATE `gameobject` SET `position_z` = 27.717000 WHERE `guid` = 33314;
-- Barrel of Milk (guid 35452, entry 3705) 17.35 -> 28.79
UPDATE `gameobject` SET `position_z` = 28.794000 WHERE `guid` = 35452;
-- Peacebloom (guid 201844, entry 1618) 7.65 -> 14.07
UPDATE `gameobject` SET `position_z` = 14.066000 WHERE `guid` = 201844;
-- AZEROTH_30_33.ADT
-- Rat (guid 18317, entry 4075) 91.02 -> 90.07
UPDATE `creature` SET `position_z` = 90.073000 WHERE `guid` = 18317;
-- Dalaran Watcher (guid 18366, entry 1888) 89.66 -> 89.25
UPDATE `creature` SET `position_z` = 89.252000 WHERE `guid` = 18366;
-- Silverleaf (guid 201757, entry 1617) 106.31 -> 104.29
UPDATE `gameobject` SET `position_z` = 104.294000 WHERE `guid` = 201757;
-- Earthroot (guid 201850, entry 1619) 108.86 -> 105.65
UPDATE `gameobject` SET `position_z` = 105.647000 WHERE `guid` = 201850;
-- Copper Vein (guid 202051, entry 1731) 128.13 -> 121.62
UPDATE `gameobject` SET `position_z` = 121.618000 WHERE `guid` = 202051;
-- Tin Vein (guid 202081, entry 1732) 99.89 -> 98.58
UPDATE `gameobject` SET `position_z` = 98.584000 WHERE `guid` = 202081;
-- Silver Vein (guid 202124, entry 1733) 99.89 -> 98.58
UPDATE `gameobject` SET `position_z` = 98.584000 WHERE `guid` = 202124;
-- AZEROTH_30_42.ADT
-- Leper Gnome (guid 2467, entry 1211) 385.74 -> 384.92
UPDATE `creature` SET `position_z` = 384.920000 WHERE `guid` = 2467;
-- Leper Gnome (guid 2468, entry 1211) 386.93 -> 385.20
UPDATE `creature` SET `position_z` = 385.199000 WHERE `guid` = 2468;
-- Ice Claw Bear (guid 2900, entry 1196) 387.27 -> 386.38
UPDATE `creature` SET `position_z` = 386.384000 WHERE `guid` = 2900;
-- Frostmane Troll (guid 2919, entry 1120) 393.04 -> 391.82
UPDATE `creature` SET `position_z` = 391.823000 WHERE `guid` = 2919;
-- Frostmane Headhunter (guid 2922, entry 1123) 391.62 -> 392.16
UPDATE `creature` SET `position_z` = 392.158000 WHERE `guid` = 2922;
-- AZEROTH_31_28.ADT
-- Ghostly Forsaken Celebrant (guid 53810, entry 35244) 59.78 -> 60.42
UPDATE `creature` SET `position_z` = 60.420000 WHERE `guid` = 53810;
-- Midsummer Celebrant (guid 94571, entry 16781) 59.93 -> 60.74
UPDATE `creature` SET `position_z` = 60.736000 WHERE `guid` = 94571;
-- Lordaeron Citizen (guid 132235, entry 3617) 60.00 -> 60.82
UPDATE `creature` SET `position_z` = 60.822000 WHERE `guid` = 132235;
-- Wild Turkey (guid 242722, entry 32820) 53.38 -> 53.73
UPDATE `creature` SET `position_z` = 53.726000 WHERE `guid` = 242722;
-- Wild Turkey (guid 242755, entry 32820) 62.26 -> 61.81
UPDATE `creature` SET `position_z` = 61.814000 WHERE `guid` = 242755;
-- Haybail 01 (guid 16706, entry 180037) 59.86 -> 60.41
UPDATE `gameobject` SET `position_z` = 60.409000 WHERE `guid` = 16706;
-- Haybail 01 (guid 20839, entry 180037) 59.96 -> 61.73
UPDATE `gameobject` SET `position_z` = 61.730000 WHERE `guid` = 20839;
-- T'chali's Voodoo Brew Festive Wagon (guid 20842, entry 186256) 59.95 -> 61.04
UPDATE `gameobject` SET `position_z` = 61.035000 WHERE `guid` = 20842;
-- Haybail 01 (guid 20844, entry 180037) 59.63 -> 60.13
UPDATE `gameobject` SET `position_z` = 60.127000 WHERE `guid` = 20844;
-- Brewfest Banner (guid 31922, entry 186717) 59.88 -> 60.51
UPDATE `gameobject` SET `position_z` = 60.512000 WHERE `guid` = 31922;
-- Brewfest Banner (guid 31923, entry 186717) 59.71 -> 60.39
UPDATE `gameobject` SET `position_z` = 60.394000 WHERE `guid` = 31923;
-- Cheer Speaker (guid 64641, entry 180749) 59.81 -> 60.33
UPDATE `gameobject` SET `position_z` = 60.329000 WHERE `guid` = 64641;
-- Peacebloom (guid 201530, entry 1618) 53.93 -> 54.30
UPDATE `gameobject` SET `position_z` = 54.295000 WHERE `guid` = 201530;
-- Haystack 01 (guid 240867, entry 179968) 60.05 -> 60.92
UPDATE `gameobject` SET `position_z` = 60.918000 WHERE `guid` = 240867;
-- Flame of the Undercity (guid 242659, entry 181335) 59.89 -> 60.42
UPDATE `gameobject` SET `position_z` = 60.423000 WHERE `guid` = 242659;
-- Midsummer Bonfire Spell Focus (guid 242667, entry 181371) 59.89 -> 60.42
UPDATE `gameobject` SET `position_z` = 60.423000 WHERE `guid` = 242667;
-- AZEROTH_31_48.ADT
-- Jorgen (guid 79654, entry 4959) 75.95 -> 74.67
UPDATE `creature` SET `position_z` = 74.670000 WHERE `guid` = 79654;
-- Stormwind Reveler (guid 420008, entry 15694) 72.79 -> 73.35
UPDATE `creature` SET `position_z` = 73.346000 WHERE `guid` = 420008;
-- Stormwind Reveler (guid 420010, entry 15694) 72.80 -> 73.26
UPDATE `creature` SET `position_z` = 73.257000 WHERE `guid` = 420010;
-- Festive Keg (guid 420167, entry 180699) 73.64 -> 74.08
UPDATE `gameobject` SET `position_z` = 74.075000 WHERE `guid` = 420167;
-- Festive Keg (guid 420168, entry 180699) 72.92 -> 73.99
UPDATE `gameobject` SET `position_z` = 73.985000 WHERE `guid` = 420168;
-- Hay Bale 1 (guid 420326, entry 180700) 73.25 -> 74.20
UPDATE `gameobject` SET `position_z` = 74.197000 WHERE `guid` = 420326;
-- Hay Bale 1 (guid 420328, entry 180700) 73.06 -> 73.59
UPDATE `gameobject` SET `position_z` = 73.586000 WHERE `guid` = 420328;
-- AZEROTH_32_28.ADT
-- Earthroot (guid 201597, entry 1619) 55.38 -> 55.91
UPDATE `gameobject` SET `position_z` = 55.910000 WHERE `guid` = 201597;
-- AZEROTH_33_26.ADT
-- Scarlet Magician (guid 41920, entry 4282) 159.25 -> 160.11
UPDATE `creature` SET `position_z` = 160.107000 WHERE `guid` = 41920;
-- Copper Vein (guid 201688, entry 1731) 154.95 -> 153.98
UPDATE `gameobject` SET `position_z` = 153.982000 WHERE `guid` = 201688;
-- AZEROTH_34_26.ADT
-- Food Crate (guid 45487, entry 153471) 146.35 -> 145.67
UPDATE `gameobject` SET `position_z` = 145.671000 WHERE `guid` = 45487;
-- AZEROTH_34_45.ADT
-- Faulty War Golem (guid 86600, entry 8279) 241.81 -> 242.72
UPDATE `creature` SET `position_z` = 242.720000 WHERE `guid` = 86600;
-- Firebloom (guid 205433, entry 2866) 269.36 -> 270.50
UPDATE `gameobject` SET `position_z` = 270.499000 WHERE `guid` = 205433;
-- Small Thorium Vein (guid 205465, entry 324) 255.28 -> 258.72
UPDATE `gameobject` SET `position_z` = 258.722000 WHERE `guid` = 205465;
-- Truesilver Deposit (guid 205481, entry 2047) 255.28 -> 258.72
UPDATE `gameobject` SET `position_z` = 258.722000 WHERE `guid` = 205481;
-- Dark Iron Deposit (guid 205497, entry 165658) 255.28 -> 258.72
UPDATE `gameobject` SET `position_z` = 258.722000 WHERE `guid` = 205497;
-- AZEROTH_35_43.ADT
-- Copper Vein (guid 205392, entry 1731) 432.13 -> 435.40
UPDATE `gameobject` SET `position_z` = 435.399000 WHERE `guid` = 205392;
-- Firebloom (guid 205451, entry 2866) 278.33 -> 278.73
UPDATE `gameobject` SET `position_z` = 278.726000 WHERE `guid` = 205451;
-- AZEROTH_35_44.ADT
-- Searing Lava Spider (guid 5748, entry 5857) 318.13 -> 318.92
UPDATE `creature` SET `position_z` = 318.921000 WHERE `guid` = 5748;
-- AZEROTH_35_45.ADT
-- Rumbler (guid 134452, entry 2752) 308.40 -> 309.72
UPDATE `creature` SET `position_z` = 309.720000 WHERE `guid` = 134452;
-- AZEROTH_36_39.ADT
-- Dragonmaw Scout (guid 10014, entry 2103) 208.08 -> 207.07
UPDATE `creature` SET `position_z` = 207.073000 WHERE `guid` = 10014;
-- AZEROTH_36_45.ADT
-- A tormented voice (guid 4603, entry 8887) 347.48 -> 361.98
UPDATE `creature` SET `position_z` = 361.979000 WHERE `guid` = 4603;
-- AZEROTH_36_54.ADT
-- Felguard Elite (guid 2648, entry 8717) -36.37 -> -26.11
UPDATE `creature` SET `position_z` = -26.110000 WHERE `guid` = 2648;
-- Manahound (guid 2650, entry 8718) -38.02 -> -25.22
UPDATE `creature` SET `position_z` = -25.215000 WHERE `guid` = 2650;
-- Doomguard Commander (guid 2651, entry 12396) 3.17 -> -4.60
UPDATE `creature` SET `position_z` = -4.598000 WHERE `guid` = 2651;
-- Felguard Elite (guid 2652, entry 8717) -4.81 -> 24.69
UPDATE `creature` SET `position_z` = 24.689000 WHERE `guid` = 2652;
-- Manahound (guid 2653, entry 8718) -5.54 -> 24.80
UPDATE `creature` SET `position_z` = 24.805000 WHERE `guid` = 2653;
-- Manahound (guid 2654, entry 8718) -19.65 -> 2.42
UPDATE `creature` SET `position_z` = 2.416000 WHERE `guid` = 2654;
-- Felguard Elite (guid 2658, entry 8717) -19.95 -> -20.76
UPDATE `creature` SET `position_z` = -20.760000 WHERE `guid` = 2658;
-- Dreadlord (guid 2740, entry 8716) 2.85 -> -9.01
UPDATE `creature` SET `position_z` = -9.006000 WHERE `guid` = 2740;
-- Doomguard Commander (guid 2742, entry 12396) -40.80 -> -25.44
UPDATE `creature` SET `position_z` = -25.443000 WHERE `guid` = 2742;
-- Felguard Elite (guid 2745, entry 8717) 10.88 -> 13.21
UPDATE `creature` SET `position_z` = 13.208000 WHERE `guid` = 2745;
-- Dreadlord (guid 2746, entry 8716) 3.20 -> 20.57
UPDATE `creature` SET `position_z` = 20.565000 WHERE `guid` = 2746;
-- Felguard Elite (guid 2790, entry 8717) -14.05 -> -9.59
UPDATE `creature` SET `position_z` = -9.589000 WHERE `guid` = 2790;
-- Felguard Elite (guid 2791, entry 8717) -4.14 -> -9.55
UPDATE `creature` SET `position_z` = -9.549000 WHERE `guid` = 2791;
-- Manahound (guid 2793, entry 8718) -11.12 -> -25.08
UPDATE `creature` SET `position_z` = -25.085000 WHERE `guid` = 2793;
-- Felguard Elite (guid 2797, entry 8717) -1.63 -> -13.22
UPDATE `creature` SET `position_z` = -13.222000 WHERE `guid` = 2797;
-- Felguard Elite (guid 2800, entry 8717) -39.12 -> -24.23
UPDATE `creature` SET `position_z` = -24.227000 WHERE `guid` = 2800;
-- Felguard Elite (guid 2839, entry 8717) -2.98 -> 2.01
UPDATE `creature` SET `position_z` = 2.007000 WHERE `guid` = 2839;
-- Felguard Elite (guid 2841, entry 8717) -38.71 -> -24.91
UPDATE `creature` SET `position_z` = -24.915000 WHERE `guid` = 2841;
-- Felguard Elite (guid 2843, entry 8717) -47.43 -> -26.07
UPDATE `creature` SET `position_z` = -26.066000 WHERE `guid` = 2843;
-- Felguard Elite (guid 2844, entry 8717) -36.33 -> -21.89
UPDATE `creature` SET `position_z` = -21.887000 WHERE `guid` = 2844;
-- Doomguard Commander (guid 2879, entry 12396) -37.80 -> -24.50
UPDATE `creature` SET `position_z` = -24.500000 WHERE `guid` = 2879;
-- Felguard Elite (guid 2881, entry 8717) -31.01 -> -25.74
UPDATE `creature` SET `position_z` = -25.736000 WHERE `guid` = 2881;
-- Felguard Elite (guid 2884, entry 8717) -36.52 -> -24.69
UPDATE `creature` SET `position_z` = -24.685000 WHERE `guid` = 2884;
-- Felguard Elite (guid 2888, entry 8717) -1.83 -> -1.11
UPDATE `creature` SET `position_z` = -1.113000 WHERE `guid` = 2888;
-- Dreadlord (guid 2989, entry 8716) -9.51 -> 6.56
UPDATE `creature` SET `position_z` = 6.561000 WHERE `guid` = 2989;
-- Manahound (guid 2994, entry 8718) -30.85 -> -25.94
UPDATE `creature` SET `position_z` = -25.944000 WHERE `guid` = 2994;
-- Felguard Elite (guid 2996, entry 8717) -0.65 -> -21.01
UPDATE `creature` SET `position_z` = -21.013000 WHERE `guid` = 2996;
-- Dreadlord (guid 3085, entry 8716) 2.43 -> 31.60
UPDATE `creature` SET `position_z` = 31.597000 WHERE `guid` = 3085;
-- Felguard Elite (guid 3089, entry 8717) -39.02 -> -23.71
UPDATE `creature` SET `position_z` = -23.709000 WHERE `guid` = 3089;
-- Felguard Elite (guid 3090, entry 8717) -35.07 -> -24.82
UPDATE `creature` SET `position_z` = -24.818000 WHERE `guid` = 3090;
-- Felguard Elite (guid 3098, entry 8717) -40.84 -> -25.82
UPDATE `creature` SET `position_z` = -25.821000 WHERE `guid` = 3098;
-- Felguard Elite (guid 3657, entry 8717) -16.43 -> -23.95
UPDATE `creature` SET `position_z` = -23.955000 WHERE `guid` = 3657;
-- Felguard Elite (guid 3659, entry 8717) -28.70 -> -23.20
UPDATE `creature` SET `position_z` = -23.197000 WHERE `guid` = 3659;
-- Felguard Elite (guid 3660, entry 8717) -0.24 -> 18.24
UPDATE `creature` SET `position_z` = 18.238000 WHERE `guid` = 3660;
-- Dreadlord (guid 3661, entry 8716) 0.27 -> 29.71
UPDATE `creature` SET `position_z` = 29.714000 WHERE `guid` = 3661;
-- Felguard Elite (guid 3662, entry 8717) -27.20 -> -25.80
UPDATE `creature` SET `position_z` = -25.800000 WHERE `guid` = 3662;
-- Lord Kazzak (guid 156950, entry 12397) 1.76 -> 41.63
UPDATE `creature` SET `position_z` = 41.627000 WHERE `guid` = 156950;
-- AZEROTH_36_55.ADT
-- Dreadlord (guid 2656, entry 8716) 5.42 -> 26.05
UPDATE `creature` SET `position_z` = 26.048000 WHERE `guid` = 2656;
-- Manahound (guid 2794, entry 8718) 2.73 -> 18.33
UPDATE `creature` SET `position_z` = 18.326000 WHERE `guid` = 2794;
-- Doomguard Commander (guid 2838, entry 12396) 8.96 -> 3.45
UPDATE `creature` SET `position_z` = 3.451000 WHERE `guid` = 2838;
-- AZEROTH_37_25.ADT
-- Stitched Horror (guid 91873, entry 8543) 135.71 -> 136.54
UPDATE `creature` SET `position_z` = 136.540000 WHERE `guid` = 91873;
-- Monstrous Plaguebat (guid 92029, entry 8602) 135.26 -> 136.38
UPDATE `creature` SET `position_z` = 136.380000 WHERE `guid` = 92029;
-- Eris Havenfire (guid 1976205, entry 14494) 165.59 -> 167.05
UPDATE `creature` SET `position_z` = 167.049000 WHERE `guid` = 1976205;
-- Large Termite Mound (guid 45857, entry 177464) 130.73 -> 131.72
UPDATE `gameobject` SET `position_z` = 131.724000 WHERE `guid` = 45857;
-- AZEROTH_37_38.ADT
-- Tin Vein (guid 204582, entry 1732) 24.78 -> 24.46
UPDATE `gameobject` SET `position_z` = 24.459000 WHERE `guid` = 204582;
-- Silver Vein (guid 204626, entry 1733) 24.78 -> 24.46
UPDATE `gameobject` SET `position_z` = 24.459000 WHERE `guid` = 204626;
-- AZEROTH_37_39.ADT
-- Mageroyal (guid 204241, entry 1620) 13.25 -> 12.94
UPDATE `gameobject` SET `position_z` = 12.940000 WHERE `guid` = 204241;
-- Bruiseweed (guid 204320, entry 1622) 29.15 -> 28.72
UPDATE `gameobject` SET `position_z` = 28.720000 WHERE `guid` = 204320;
-- Bruiseweed (guid 204332, entry 1622) 30.31 -> 29.93
UPDATE `gameobject` SET `position_z` = 29.931000 WHERE `guid` = 204332;
-- Tin Vein (guid 204574, entry 1732) 22.06 -> 21.66
UPDATE `gameobject` SET `position_z` = 21.662000 WHERE `guid` = 204574;
-- Silver Vein (guid 204618, entry 1733) 22.06 -> 21.66
UPDATE `gameobject` SET `position_z` = 21.662000 WHERE `guid` = 204618;
-- AZEROTH_37_47.ADT
-- Ember Worg (guid 5501, entry 9690) 134.62 -> 137.31
UPDATE `creature` SET `position_z` = 137.314000 WHERE `guid` = 5501;
-- Small Thorium Vein (guid 206154, entry 324) 159.85 -> 150.39
UPDATE `gameobject` SET `position_z` = 150.388000 WHERE `guid` = 206154;
-- Truesilver Deposit (guid 206187, entry 2047) 159.85 -> 150.39
UPDATE `gameobject` SET `position_z` = 150.388000 WHERE `guid` = 206187;
-- Dark Iron Deposit (guid 206220, entry 165658) 159.85 -> 150.39
UPDATE `gameobject` SET `position_z` = 150.388000 WHERE `guid` = 206220;
-- AZEROTH_37_53.ADT
-- Dreadmaul Mauler (guid 2715, entry 5977) -0.66 -> 0.33
UPDATE `creature` SET `position_z` = 0.332000 WHERE `guid` = 2715;
-- Dreadmaul Mauler (guid 2716, entry 5977) 2.44 -> 5.78
UPDATE `creature` SET `position_z` = 5.784000 WHERE `guid` = 2716;
-- Dreadmaul Warlock (guid 3819, entry 5978) 7.96 -> 7.21
UPDATE `creature` SET `position_z` = 7.207000 WHERE `guid` = 3819;
-- Dreadmaul Warlock (guid 3821, entry 5978) 4.16 -> 4.70
UPDATE `creature` SET `position_z` = 4.699000 WHERE `guid` = 3821;
-- Felbeast (guid 3849, entry 8675) 7.14 -> 8.42
UPDATE `creature` SET `position_z` = 8.422000 WHERE `guid` = 3849;
-- Dreadmaul Warlock (guid 3856, entry 5978) 3.28 -> 5.60
UPDATE `creature` SET `position_z` = 5.604000 WHERE `guid` = 3856;
-- Dreadmaul Mauler (guid 3894, entry 5977) 4.04 -> 5.86
UPDATE `creature` SET `position_z` = 5.862000 WHERE `guid` = 3894;
-- Snickerfang Hyena (guid 3914, entry 5985) 8.97 -> 9.53
UPDATE `creature` SET `position_z` = 9.530000 WHERE `guid` = 3914;
-- Snickerfang Hyena (guid 3915, entry 5985) 6.61 -> 7.85
UPDATE `creature` SET `position_z` = 7.852000 WHERE `guid` = 3915;
-- Bonepicker (guid 3918, entry 5983) 6.37 -> 7.06
UPDATE `creature` SET `position_z` = 7.061000 WHERE `guid` = 3918;
-- Clack the Reaver (guid 41881, entry 8301) 0.72 -> 1.75
UPDATE `creature` SET `position_z` = 1.746000 WHERE `guid` = 41881;
-- Clack the Reaver (guid 134295, entry 8301) 5.75 -> 6.26
UPDATE `creature` SET `position_z` = 6.264000 WHERE `guid` = 134295;
-- Clack the Reaver (guid 134296, entry 8301) 5.56 -> 5.92
UPDATE `creature` SET `position_z` = 5.916000 WHERE `guid` = 134296;
-- Clack the Reaver (guid 134304, entry 8301) 11.12 -> 10.43
UPDATE `creature` SET `position_z` = 10.429000 WHERE `guid` = 134304;
-- Magronos the Unyielding (guid 134344, entry 8297) -0.54 -> -1.53
UPDATE `creature` SET `position_z` = -1.533000 WHERE `guid` = 134344;
-- Magronos the Unyielding (guid 134347, entry 8297) 0.22 -> -0.70
UPDATE `creature` SET `position_z` = -0.704000 WHERE `guid` = 134347;
-- Magronos the Unyielding (guid 134348, entry 8297) -0.34 -> -0.84
UPDATE `creature` SET `position_z` = -0.841000 WHERE `guid` = 134348;
-- Ravage (guid 134353, entry 8300) 11.26 -> 10.95
UPDATE `creature` SET `position_z` = 10.950000 WHERE `guid` = 134353;
-- Spiteflayer (guid 134377, entry 8299) 11.63 -> 10.82
UPDATE `creature` SET `position_z` = 10.820000 WHERE `guid` = 134377;
-- Necrotic Shard (guid 660242, entry 616136) 0.40 -> -0.13
UPDATE `creature` SET `position_z` = -0.127000 WHERE `guid` = 660242;
-- Cultist Engineer (guid 660405, entry 616230) -1.35 -> -1.67
UPDATE `creature` SET `position_z` = -1.667000 WHERE `guid` = 660405;
-- Lumbering Horror (guid 660471, entry 614697) -1.10 -> -0.69
UPDATE `creature` SET `position_z` = -0.691000 WHERE `guid` = 660471;
-- Ghoul Berserker (guid 660835, entry 616141) 11.31 -> 10.02
UPDATE `creature` SET `position_z` = 10.023000 WHERE `guid` = 660835;
-- Ghoul Berserker (guid 660838, entry 616141) 5.66 -> 5.17
UPDATE `creature` SET `position_z` = 5.170000 WHERE `guid` = 660838;
-- Ghoul Berserker (guid 660849, entry 616141) -0.36 -> 0.11
UPDATE `creature` SET `position_z` = 0.107000 WHERE `guid` = 660849;
-- Ghoul Berserker (guid 660850, entry 616141) -1.17 -> -1.69
UPDATE `creature` SET `position_z` = -1.685000 WHERE `guid` = 660850;
-- Ghoul Berserker (guid 660852, entry 616141) -1.35 -> -1.69
UPDATE `creature` SET `position_z` = -1.687000 WHERE `guid` = 660852;
-- Ghoul Berserker (guid 660853, entry 616141) -0.89 -> -1.61
UPDATE `creature` SET `position_z` = -1.606000 WHERE `guid` = 660853;
-- Ghoul Berserker (guid 660854, entry 616141) 0.69 -> 1.07
UPDATE `creature` SET `position_z` = 1.069000 WHERE `guid` = 660854;
-- Spectral Soldier (guid 661238, entry 616298) 5.90 -> 5.28
UPDATE `creature` SET `position_z` = 5.278000 WHERE `guid` = 661238;
-- Spectral Soldier (guid 661249, entry 616298) -0.58 -> -1.55
UPDATE `creature` SET `position_z` = -1.555000 WHERE `guid` = 661249;
-- Spectral Soldier (guid 661251, entry 616298) -0.65 -> -1.68
UPDATE `creature` SET `position_z` = -1.684000 WHERE `guid` = 661251;
-- Spectral Soldier (guid 661255, entry 616298) 0.35 -> 1.28
UPDATE `creature` SET `position_z` = 1.278000 WHERE `guid` = 661255;
-- Skeletal Shocktrooper (guid 661635, entry 616299) -0.71 -> 2.02
UPDATE `creature` SET `position_z` = 2.015000 WHERE `guid` = 661635;
-- Skeletal Shocktrooper (guid 661648, entry 616299) 0.08 -> -1.01
UPDATE `creature` SET `position_z` = -1.006000 WHERE `guid` = 661648;
-- Skeletal Shocktrooper (guid 661649, entry 616299) 0.85 -> 0.51
UPDATE `creature` SET `position_z` = 0.509000 WHERE `guid` = 661649;
-- Undead Fire (guid 83785, entry 181173) 2.58 -> 4.09
UPDATE `gameobject` SET `position_z` = 4.093000 WHERE `guid` = 83785;
-- Undead Fire Aura (guid 83815, entry 181174) 2.58 -> 4.09
UPDATE `gameobject` SET `position_z` = 4.093000 WHERE `guid` = 83815;
-- Skullpile 01 (guid 83832, entry 181191) 6.28 -> 5.95
UPDATE `gameobject` SET `position_z` = 5.949000 WHERE `guid` = 83832;
-- Skullpile 02 (guid 83867, entry 181192) -0.53 -> -1.30
UPDATE `gameobject` SET `position_z` = -1.303000 WHERE `guid` = 83867;
-- Skullpile 02 (guid 83869, entry 181192) 0.32 -> 0.88
UPDATE `gameobject` SET `position_z` = 0.876000 WHERE `guid` = 83869;
-- Skullpile 03 (guid 83895, entry 181193) 3.28 -> 4.10
UPDATE `gameobject` SET `position_z` = 4.102000 WHERE `guid` = 83895;
-- Skullpile 03 (guid 83896, entry 181193) -0.92 -> -1.59
UPDATE `gameobject` SET `position_z` = -1.587000 WHERE `guid` = 83896;
-- Skullpile 04 (guid 83909, entry 181194) 6.45 -> 5.97
UPDATE `gameobject` SET `position_z` = 5.973000 WHERE `guid` = 83909;
-- Skullpile 04 (guid 83913, entry 181194) 3.67 -> 4.20
UPDATE `gameobject` SET `position_z` = 4.201000 WHERE `guid` = 83913;
-- Sungrass (guid 208445, entry 142142) 7.43 -> 7.87
UPDATE `gameobject` SET `position_z` = 7.872000 WHERE `guid` = 208445;
-- Gromsblood (guid 208468, entry 142145) 4.98 -> 6.00
UPDATE `gameobject` SET `position_z` = 6.000000 WHERE `guid` = 208468;
-- Gromsblood (guid 208473, entry 142145) 0.84 -> 1.74
UPDATE `gameobject` SET `position_z` = 1.740000 WHERE `guid` = 208473;
-- Circle (guid 660082, entry 181227) 0.40 -> -0.13
UPDATE `gameobject` SET `position_z` = -0.127000 WHERE `guid` = 660082;
-- AZEROTH_37_54.ADT
-- Manahound (guid 2739, entry 8718) 0.75 -> 3.53
UPDATE `creature` SET `position_z` = 3.527000 WHERE `guid` = 2739;
-- Manahound (guid 2741, entry 8718) 7.20 -> 1.56
UPDATE `creature` SET `position_z` = 1.556000 WHERE `guid` = 2741;
-- Doomguard Commander (guid 2744, entry 12396) 12.60 -> 2.08
UPDATE `creature` SET `position_z` = 2.077000 WHERE `guid` = 2744;
-- Manahound (guid 2883, entry 8718) 6.28 -> 2.35
UPDATE `creature` SET `position_z` = 2.347000 WHERE `guid` = 2883;
-- Felguard Elite (guid 2988, entry 8717) 0.33 -> -6.81
UPDATE `creature` SET `position_z` = -6.814000 WHERE `guid` = 2988;
-- Felguard Elite (guid 3021, entry 8717) 2.92 -> 0.94
UPDATE `creature` SET `position_z` = 0.940000 WHERE `guid` = 3021;
-- Felguard Elite (guid 3087, entry 8717) 6.13 -> 5.63
UPDATE `creature` SET `position_z` = 5.628000 WHERE `guid` = 3087;
-- AZEROTH_37_55.ADT
-- Doomguard Commander (guid 3658, entry 12396) 5.22 -> 1.22
UPDATE `creature` SET `position_z` = 1.217000 WHERE `guid` = 3658;
-- AZEROTH_38_38.ADT
-- Wild Steelbloom (guid 204357, entry 1623) 58.90 -> 58.59
UPDATE `gameobject` SET `position_z` = 58.587000 WHERE `guid` = 204357;
-- AZEROTH_38_41.ADT
-- Dark Iron Insurgent (guid 8927, entry 1169) 310.02 -> 309.62
UPDATE `creature` SET `position_z` = 309.623000 WHERE `guid` = 8927;
-- Wood Lurker (guid 9067, entry 1185) 300.91 -> 302.93
UPDATE `creature` SET `position_z` = 302.927000 WHERE `guid` = 9067;
-- Black Bear Patriarch (guid 9345, entry 1189) 304.86 -> 305.48
UPDATE `creature` SET `position_z` = 305.475000 WHERE `guid` = 9345;
-- Peacebloom (guid 204738, entry 1618) 308.38 -> 310.50
UPDATE `gameobject` SET `position_z` = 310.501000 WHERE `guid` = 204738;
-- AZEROTH_38_49.ADT
-- Horse (guid 6169, entry 385) 122.08 -> 122.74
UPDATE `creature` SET `position_z` = 122.736000 WHERE `guid` = 6169;
-- Blackrock Renegade (guid 6197, entry 437) 51.09 -> 50.35
UPDATE `creature` SET `position_z` = 50.353000 WHERE `guid` = 6197;
-- Boulderheart (guid 6710, entry 14273) 128.86 -> 128.47
UPDATE `creature` SET `position_z` = 128.470000 WHERE `guid` = 6710;
-- Blackrock Outrunner (guid 6737, entry 485) 49.81 -> 49.30
UPDATE `creature` SET `position_z` = 49.297000 WHERE `guid` = 6737;
-- Blackrock Renegade (guid 6738, entry 437) 49.81 -> 49.16
UPDATE `creature` SET `position_z` = 49.159000 WHERE `guid` = 6738;
-- Tin Vein (guid 206966, entry 1732) 118.91 -> 120.60
UPDATE `gameobject` SET `position_z` = 120.602000 WHERE `guid` = 206966;
-- Silver Vein (guid 207018, entry 1733) 118.91 -> 120.60
UPDATE `gameobject` SET `position_z` = 120.602000 WHERE `guid` = 207018;
-- AZEROTH_38_50.ADT
-- Cursed Lost One (guid 38847, entry 17115) 21.80 -> 23.85
UPDATE `creature` SET `position_z` = 23.850000 WHERE `guid` = 38847;
-- AZEROTH_38_52.ADT
-- Deathstrike Tarantula (guid 3830, entry 769) 23.68 -> 21.00
UPDATE `creature` SET `position_z` = 21.002000 WHERE `guid` = 3830;
-- AZEROTH_38_53.ADT
-- Shadowsworn Cultist (guid 3811, entry 6004) 8.69 -> 9.12
UPDATE `creature` SET `position_z` = 9.118000 WHERE `guid` = 3811;
-- Spiteflayer (guid 134371, entry 8299) 8.43 -> 8.09
UPDATE `creature` SET `position_z` = 8.095000 WHERE `guid` = 134371;
-- Stone of Binding (guid 42467, entry 141858) 11.54 -> 12.20
UPDATE `gameobject` SET `position_z` = 12.195000 WHERE `guid` = 42467;
-- Stone of Binding (guid 42475, entry 141858) 9.27 -> 7.98
UPDATE `gameobject` SET `position_z` = 7.979000 WHERE `guid` = 42475;
-- Mithril Deposit (guid 208542, entry 2040) 18.86 -> 7.47
UPDATE `gameobject` SET `position_z` = 7.471000 WHERE `guid` = 208542;
-- Gold Vein (guid 208561, entry 1734) 18.86 -> 7.47
UPDATE `gameobject` SET `position_z` = 7.471000 WHERE `guid` = 208561;
-- Truesilver Deposit (guid 208580, entry 2047) 18.86 -> 7.47
UPDATE `gameobject` SET `position_z` = 7.471000 WHERE `guid` = 208580;
-- AZEROTH_39_29.ADT
-- Plaguebat (guid 90972, entry 8600) 156.91 -> 155.72
UPDATE `creature` SET `position_z` = 155.719000 WHERE `guid` = 90972;
-- Mithril Deposit (guid 203457, entry 2040) 137.55 -> 140.24
UPDATE `gameobject` SET `position_z` = 140.239000 WHERE `guid` = 203457;
-- Gold Vein (guid 203536, entry 1734) 137.55 -> 140.24
UPDATE `gameobject` SET `position_z` = 140.239000 WHERE `guid` = 203536;
-- Truesilver Deposit (guid 203615, entry 2047) 137.55 -> 140.24
UPDATE `gameobject` SET `position_z` = 140.239000 WHERE `guid` = 203615;
-- AZEROTH_39_41.ADT
-- Elder Mountain Boar (guid 8325, entry 1192) 318.13 -> 317.44
UPDATE `creature` SET `position_z` = 317.445000 WHERE `guid` = 8325;
-- Squirrel (guid 8333, entry 1412) 320.79 -> 320.03
UPDATE `creature` SET `position_z` = 320.032000 WHERE `guid` = 8333;
-- Elder Mountain Boar (guid 8353, entry 1192) 327.48 -> 327.11
UPDATE `creature` SET `position_z` = 327.112000 WHERE `guid` = 8353;
-- Elder Mountain Boar (guid 8364, entry 1192) 319.57 -> 318.39
UPDATE `creature` SET `position_z` = 318.394000 WHERE `guid` = 8364;
-- Grizzled Black Bear (guid 9025, entry 1188) 321.22 -> 325.64
UPDATE `creature` SET `position_z` = 325.642000 WHERE `guid` = 9025;
-- Grizzled Black Bear (guid 9188, entry 1188) 325.84 -> 323.80
UPDATE `creature` SET `position_z` = 323.805000 WHERE `guid` = 9188;
-- Peacebloom (guid 204725, entry 1618) 332.13 -> 328.90
UPDATE `gameobject` SET `position_z` = 328.899000 WHERE `guid` = 204725;
-- Briarthorn (guid 204806, entry 1621) 324.68 -> 320.47
UPDATE `gameobject` SET `position_z` = 320.473000 WHERE `guid` = 204806;
-- Briarthorn (guid 204816, entry 1621) 332.17 -> 333.66
UPDATE `gameobject` SET `position_z` = 333.660000 WHERE `guid` = 204816;
-- AZEROTH_39_42.ADT
-- Mangy Mountain Boar (guid 8362, entry 1191) 387.14 -> 383.03
UPDATE `creature` SET `position_z` = 383.027000 WHERE `guid` = 8362;
-- Shanda the Spinner (guid 8370, entry 14266) 392.50 -> 391.24
UPDATE `creature` SET `position_z` = 391.238000 WHERE `guid` = 8370;
-- Cliff Lurker (guid 8380, entry 1184) 344.25 -> 344.87
UPDATE `creature` SET `position_z` = 344.868000 WHERE `guid` = 8380;
-- Mountain Buzzard (guid 8392, entry 1194) 344.88 -> 345.20
UPDATE `creature` SET `position_z` = 345.200000 WHERE `guid` = 8392;
-- Cliff Lurker (guid 8394, entry 1184) 339.82 -> 339.08
UPDATE `creature` SET `position_z` = 339.084000 WHERE `guid` = 8394;
-- Mountain Buzzard (guid 8683, entry 1194) 390.51 -> 387.06
UPDATE `creature` SET `position_z` = 387.060000 WHERE `guid` = 8683;
-- Lord Condar (guid 8690, entry 14268) 387.39 -> 381.15
UPDATE `creature` SET `position_z` = 381.149000 WHERE `guid` = 8690;
-- Grizzled Black Bear (guid 8800, entry 1188) 368.06 -> 366.14
UPDATE `creature` SET `position_z` = 366.142000 WHERE `guid` = 8800;
-- Mountain Buzzard (guid 8803, entry 1194) 377.06 -> 377.42
UPDATE `creature` SET `position_z` = 377.415000 WHERE `guid` = 8803;
-- Mountain Buzzard (guid 8806, entry 1194) 372.26 -> 374.50
UPDATE `creature` SET `position_z` = 374.496000 WHERE `guid` = 8806;
-- Mangy Mountain Boar (guid 8809, entry 1191) 349.69 -> 352.66
UPDATE `creature` SET `position_z` = 352.662000 WHERE `guid` = 8809;
-- Mountain Buzzard (guid 8810, entry 1194) 389.94 -> 386.57
UPDATE `creature` SET `position_z` = 386.567000 WHERE `guid` = 8810;
-- Mountain Buzzard (guid 8811, entry 1194) 380.59 -> 379.99
UPDATE `creature` SET `position_z` = 379.990000 WHERE `guid` = 8811;
-- Mountain Buzzard (guid 8849, entry 1194) 389.04 -> 386.58
UPDATE `creature` SET `position_z` = 386.578000 WHERE `guid` = 8849;
-- Mangy Mountain Boar (guid 9023, entry 1191) 325.20 -> 324.80
UPDATE `creature` SET `position_z` = 324.804000 WHERE `guid` = 9023;
-- Cliff Lurker (guid 9024, entry 1184) 317.53 -> 322.41
UPDATE `creature` SET `position_z` = 322.413000 WHERE `guid` = 9024;
-- Cliff Lurker (guid 9207, entry 1184) 324.35 -> 327.99
UPDATE `creature` SET `position_z` = 327.988000 WHERE `guid` = 9207;
-- Peacebloom (guid 204731, entry 1618) 318.80 -> 322.18
UPDATE `gameobject` SET `position_z` = 322.182000 WHERE `guid` = 204731;
-- Mageroyal (guid 204777, entry 1620) 376.31 -> 375.98
UPDATE `gameobject` SET `position_z` = 375.984000 WHERE `guid` = 204777;
-- Briarthorn (guid 204808, entry 1621) 341.43 -> 340.52
UPDATE `gameobject` SET `position_z` = 340.516000 WHERE `guid` = 204808;
-- Briarthorn (guid 204810, entry 1621) 316.03 -> 318.40
UPDATE `gameobject` SET `position_z` = 318.403000 WHERE `guid` = 204810;
-- Briarthorn (guid 204815, entry 1621) 383.19 -> 382.81
UPDATE `gameobject` SET `position_z` = 382.807000 WHERE `guid` = 204815;
-- Briarthorn (guid 204817, entry 1621) 328.32 -> 325.41
UPDATE `gameobject` SET `position_z` = 325.410000 WHERE `guid` = 204817;
-- Briarthorn (guid 204824, entry 1621) 346.72 -> 347.87
UPDATE `gameobject` SET `position_z` = 347.871000 WHERE `guid` = 204824;
-- Tin Vein (guid 204955, entry 1732) 392.25 -> 391.82
UPDATE `gameobject` SET `position_z` = 391.821000 WHERE `guid` = 204955;
-- Tin Vein (guid 204957, entry 1732) 417.79 -> 410.48
UPDATE `gameobject` SET `position_z` = 410.480000 WHERE `guid` = 204957;
-- Tin Vein (guid 204984, entry 1732) 392.56 -> 385.41
UPDATE `gameobject` SET `position_z` = 385.414000 WHERE `guid` = 204984;
-- Silver Vein (guid 204997, entry 1733) 392.25 -> 391.82
UPDATE `gameobject` SET `position_z` = 391.821000 WHERE `guid` = 204997;
-- Silver Vein (guid 204999, entry 1733) 417.79 -> 410.48
UPDATE `gameobject` SET `position_z` = 410.480000 WHERE `guid` = 204999;
-- Silver Vein (guid 205026, entry 1733) 392.56 -> 385.41
UPDATE `gameobject` SET `position_z` = 385.414000 WHERE `guid` = 205026;
-- AZEROTH_39_43.ADT
-- Scalding Whelp (guid 6903, entry 2725) 269.62 -> 264.25
UPDATE `creature` SET `position_z` = 264.245000 WHERE `guid` = 6903;
-- Scalding Whelp (guid 6904, entry 2725) 286.02 -> 261.98
UPDATE `creature` SET `position_z` = 261.980000 WHERE `guid` = 6904;
-- Scalding Whelp (guid 6905, entry 2725) 275.79 -> 269.46
UPDATE `creature` SET `position_z` = 269.458000 WHERE `guid` = 6905;
-- Scalding Whelp (guid 6906, entry 2725) 292.50 -> 261.39
UPDATE `creature` SET `position_z` = 261.394000 WHERE `guid` = 6906;
-- Scalding Whelp (guid 6908, entry 2725) 277.68 -> 256.35
UPDATE `creature` SET `position_z` = 256.349000 WHERE `guid` = 6908;
-- Mountain Buzzard (guid 8825, entry 1194) 394.40 -> 383.71
UPDATE `creature` SET `position_z` = 383.707000 WHERE `guid` = 8825;
-- Mountain Buzzard (guid 8826, entry 1194) 392.56 -> 383.82
UPDATE `creature` SET `position_z` = 383.816000 WHERE `guid` = 8826;
-- Mountain Buzzard (guid 8829, entry 1194) 389.58 -> 383.47
UPDATE `creature` SET `position_z` = 383.470000 WHERE `guid` = 8829;
-- Bruiseweed (guid 204841, entry 1622) 404.73 -> 392.95
UPDATE `gameobject` SET `position_z` = 392.955000 WHERE `guid` = 204841;
-- Copper Vein (guid 204909, entry 1731) 398.15 -> 395.67
UPDATE `gameobject` SET `position_z` = 395.671000 WHERE `guid` = 204909;
-- Copper Vein (guid 204911, entry 1731) 403.11 -> 390.58
UPDATE `gameobject` SET `position_z` = 390.583000 WHERE `guid` = 204911;
-- AZEROTH_39_44.ADT
-- Rabid Crag Coyote (guid 6914, entry 2730) 321.75 -> 345.45
UPDATE `creature` SET `position_z` = 345.446000 WHERE `guid` = 6914;
-- Rabid Crag Coyote (guid 6917, entry 2730) 303.53 -> 303.00
UPDATE `creature` SET `position_z` = 303.001000 WHERE `guid` = 6917;
-- Scalding Whelp (guid 6923, entry 2725) 264.18 -> 261.50
UPDATE `creature` SET `position_z` = 261.500000 WHERE `guid` = 6923;
-- Scalding Whelp (guid 6928, entry 2725) 264.57 -> 277.20
UPDATE `creature` SET `position_z` = 277.204000 WHERE `guid` = 6928;
-- Scalding Whelp (guid 7126, entry 2725) 290.36 -> 315.25
UPDATE `creature` SET `position_z` = 315.247000 WHERE `guid` = 7126;
-- Scalding Whelp (guid 7708, entry 2725) 268.26 -> 266.66
UPDATE `creature` SET `position_z` = 266.656000 WHERE `guid` = 7708;
-- Scalding Whelp (guid 7720, entry 2725) 279.98 -> 264.31
UPDATE `creature` SET `position_z` = 264.314000 WHERE `guid` = 7720;
-- Scalding Whelp (guid 7721, entry 2725) 264.53 -> 264.10
UPDATE `creature` SET `position_z` = 264.103000 WHERE `guid` = 7721;
-- Scalding Whelp (guid 7869, entry 2725) 283.59 -> 282.64
UPDATE `creature` SET `position_z` = 282.638000 WHERE `guid` = 7869;
-- Scalding Whelp (guid 7870, entry 2725) 267.09 -> 264.27
UPDATE `creature` SET `position_z` = 264.269000 WHERE `guid` = 7870;
-- Wild Steelbloom (guid 205678, entry 1623) 296.40 -> 298.39
UPDATE `gameobject` SET `position_z` = 298.389000 WHERE `guid` = 205678;
-- Mithril Deposit (guid 205958, entry 2040) 285.47 -> 316.44
UPDATE `gameobject` SET `position_z` = 316.444000 WHERE `guid` = 205958;
-- Gold Vein (guid 205997, entry 1734) 285.47 -> 316.44
UPDATE `gameobject` SET `position_z` = 316.444000 WHERE `guid` = 205997;
-- Truesilver Deposit (guid 206036, entry 2047) 285.47 -> 316.44
UPDATE `gameobject` SET `position_z` = 316.444000 WHERE `guid` = 206036;
-- AZEROTH_39_50.ADT
-- Shadow Panther (guid 38714, entry 768) 23.57 -> 33.82
UPDATE `creature` SET `position_z` = 33.819000 WHERE `guid` = 38714;
-- Sawtooth Crocolisk (guid 38735, entry 1082) 18.50 -> 18.05
UPDATE `creature` SET `position_z` = 18.046000 WHERE `guid` = 38735;
-- Shadow Panther (guid 38832, entry 768) 22.30 -> 21.93
UPDATE `creature` SET `position_z` = 21.926000 WHERE `guid` = 38832;
-- Stonard Explorer (guid 40213, entry 862) 21.76 -> 26.86
UPDATE `creature` SET `position_z` = 26.864000 WHERE `guid` = 40213;
-- Shadow Panther (guid 41805, entry 768) 23.30 -> 21.86
UPDATE `creature` SET `position_z` = 21.865000 WHERE `guid` = 41805;
-- Kingsblood (guid 208139, entry 1624) 23.79 -> 53.94
UPDATE `gameobject` SET `position_z` = 53.939000 WHERE `guid` = 208139;
-- Mithril Deposit (guid 208403, entry 2040) 28.74 -> 81.44
UPDATE `gameobject` SET `position_z` = 81.444000 WHERE `guid` = 208403;
-- Gold Vein (guid 208420, entry 1734) 28.74 -> 81.44
UPDATE `gameobject` SET `position_z` = 81.444000 WHERE `guid` = 208420;
-- Truesilver Deposit (guid 208437, entry 2047) 28.74 -> 81.44
UPDATE `gameobject` SET `position_z` = 81.444000 WHERE `guid` = 208437;
-- AZEROTH_40_25.ADT
-- Monstrous Plaguebat (guid 92039, entry 8602) 110.11 -> 109.61
UPDATE `creature` SET `position_z` = 109.610000 WHERE `guid` = 92039;
-- KALIMDOR_27_34.ADT
-- Iron Deposit (guid 214532, entry 1735) 117.81 -> 118.72
UPDATE `gameobject` SET `position_z` = 118.720000 WHERE `guid` = 214532;
-- Gold Vein (guid 214580, entry 1734) 117.81 -> 118.72
UPDATE `gameobject` SET `position_z` = 118.720000 WHERE `guid` = 214580;
-- Silver Vein (guid 214628, entry 1733) 117.81 -> 118.72
UPDATE `gameobject` SET `position_z` = 118.720000 WHERE `guid` = 214628;
-- KALIMDOR_28_26.ADT
-- Bruiseweed (guid 212614, entry 1622) 309.78 -> 308.86
UPDATE `gameobject` SET `position_z` = 308.862000 WHERE `guid` = 212614;
-- Wild Steelbloom (guid 212685, entry 1623) 309.43 -> 307.00
UPDATE `gameobject` SET `position_z` = 307.002000 WHERE `guid` = 212685;
-- KALIMDOR_28_27.ADT
-- Sap Beast (guid 30402, entry 4020) 293.21 -> 296.61
UPDATE `creature` SET `position_z` = 296.611000 WHERE `guid` = 30402;
-- Sap Beast (guid 30403, entry 4020) 288.97 -> 291.18
UPDATE `creature` SET `position_z` = 291.180000 WHERE `guid` = 30403;
-- Sap Beast (guid 30404, entry 4020) 300.49 -> 304.11
UPDATE `creature` SET `position_z` = 304.110000 WHERE `guid` = 30404;
-- Corrosive Sap Beast (guid 30418, entry 4021) 292.88 -> 293.68
UPDATE `creature` SET `position_z` = 293.676000 WHERE `guid` = 30418;
-- Wild Steelbloom (guid 212683, entry 1623) 334.74 -> 357.49
UPDATE `gameobject` SET `position_z` = 357.492000 WHERE `guid` = 212683;
-- Wild Steelbloom (guid 212693, entry 1623) 326.00 -> 332.08
UPDATE `gameobject` SET `position_z` = 332.083000 WHERE `guid` = 212693;
-- Kingsblood (guid 212720, entry 1624) 296.48 -> 300.72
UPDATE `gameobject` SET `position_z` = 300.716000 WHERE `guid` = 212720;
-- KALIMDOR_28_36.ADT
-- Elder Thunder Lizard (guid 28874, entry 4727) 135.04 -> 134.38
UPDATE `creature` SET `position_z` = 134.381000 WHERE `guid` = 28874;
-- KALIMDOR_28_39.ADT
-- Groddoc Thunderer (guid 50626, entry 5262) 69.19 -> 70.94
UPDATE `creature` SET `position_z` = 70.938000 WHERE `guid` = 50626;
-- Rabid Longtooth (guid 50953, entry 5288) 65.36 -> 75.92
UPDATE `creature` SET `position_z` = 75.922000 WHERE `guid` = 50953;
-- Sungrass (guid 214846, entry 142142) 66.53 -> 66.94
UPDATE `gameobject` SET `position_z` = 66.936000 WHERE `guid` = 214846;
-- Goldthorn (guid 214995, entry 2046) 74.89 -> 81.17
UPDATE `gameobject` SET `position_z` = 81.169000 WHERE `guid` = 214995;
-- KALIMDOR_29_30.ADT
-- Bloodfury Harpy (guid 30422, entry 4022) -13.68 -> -12.29
UPDATE `creature` SET `position_z` = -12.294000 WHERE `guid` = 30422;
-- Bloodfury Roguefeather (guid 31783, entry 4023) -21.21 -> -20.68
UPDATE `creature` SET `position_z` = -20.681000 WHERE `guid` = 31783;
-- Bloodfury Windcaller (guid 31952, entry 4026) -15.56 -> -14.90
UPDATE `creature` SET `position_z` = -14.900000 WHERE `guid` = 31952;
-- Charred Ancient (guid 32132, entry 4028) -24.90 -> -24.48
UPDATE `creature` SET `position_z` = -24.482000 WHERE `guid` = 32132;
-- Enraged Stone Spirit (guid 32141, entry 4034) -29.89 -> -29.35
UPDATE `creature` SET `position_z` = -29.347000 WHERE `guid` = 32141;
-- Rogue Flame Spirit (guid 32148, entry 4036) -7.25 -> -6.33
UPDATE `creature` SET `position_z` = -6.325000 WHERE `guid` = 32148;
-- Blackened Basilisk (guid 32185, entry 4044) 0.75 -> 1.86
UPDATE `creature` SET `position_z` = 1.858000 WHERE `guid` = 32185;
-- Kingsblood (guid 212714, entry 1624) -22.99 -> -22.42
UPDATE `gameobject` SET `position_z` = -22.424000 WHERE `guid` = 212714;
-- KALIMDOR_29_40.ADT
-- Longtooth Howler (guid 50918, entry 5287) 105.61 -> 105.26
UPDATE `creature` SET `position_z` = 105.263000 WHERE `guid` = 50918;
-- KALIMDOR_29_42.ADT
-- Groddoc Ape (guid 50574, entry 5260) 62.16 -> 66.87
UPDATE `creature` SET `position_z` = 66.869000 WHERE `guid` = 50574;
-- Khadgar's Whisker (guid 214950, entry 2043) 65.19 -> 72.52
UPDATE `gameobject` SET `position_z` = 72.521000 WHERE `guid` = 214950;
-- KALIMDOR_30_30.ADT
-- Deepmoss Venomspitter (guid 29753, entry 4007) 98.11 -> 98.53
UPDATE `creature` SET `position_z` = 98.531000 WHERE `guid` = 29753;
-- Briarthorn (guid 212581, entry 1621) 96.63 -> 100.06
UPDATE `gameobject` SET `position_z` = 100.059000 WHERE `guid` = 212581;
-- Kingsblood (guid 212725, entry 1624) 98.32 -> 98.84
UPDATE `gameobject` SET `position_z` = 98.836000 WHERE `guid` = 212725;
-- KALIMDOR_30_31.ADT
-- Hatefury Rogue (guid 27758, entry 4670) 175.24 -> 173.79
UPDATE `creature` SET `position_z` = 173.793000 WHERE `guid` = 27758;
-- Wild Steelbloom (guid 214340, entry 1623) 176.51 -> 176.17
UPDATE `gameobject` SET `position_z` = 176.171000 WHERE `guid` = 214340;
-- KALIMDOR_30_32.ADT
-- Gritjaw Basilisk (guid 28938, entry 4728) 92.15 -> 91.20
UPDATE `creature` SET `position_z` = 91.197000 WHERE `guid` = 28938;
-- KALIMDOR_30_40.ADT
-- Woodpaw Mystic (guid 50491, entry 5254) 140.46 -> 136.93
UPDATE `creature` SET `position_z` = 136.927000 WHERE `guid` = 50491;
-- Woodpaw Alpha (guid 50565, entry 5258) 143.69 -> 143.27
UPDATE `creature` SET `position_z` = 143.267000 WHERE `guid` = 50565;
-- Campfire (guid 50177, entry 41192) 140.43 -> 136.78
UPDATE `gameobject` SET `position_z` = 136.782000 WHERE `guid` = 50177;
-- Goldthorn (guid 215003, entry 2046) 141.48 -> 141.15
UPDATE `gameobject` SET `position_z` = 141.149000 WHERE `guid` = 215003;
-- KALIMDOR_30_41.ADT
-- Snake (guid 50152, entry 2914) 53.94 -> 55.18
UPDATE `creature` SET `position_z` = 55.181000 WHERE `guid` = 50152;
-- Woodpaw Mystic (guid 50488, entry 5254) 139.35 -> 137.29
UPDATE `creature` SET `position_z` = 137.286000 WHERE `guid` = 50488;
-- Woodpaw Reaver (guid 50536, entry 5255) 54.10 -> 59.30
UPDATE `creature` SET `position_z` = 59.296000 WHERE `guid` = 50536;
-- Grizzled Ironfur Bear (guid 50718, entry 5272) 62.07 -> 80.83
UPDATE `creature` SET `position_z` = 80.825000 WHERE `guid` = 50718;
-- Grizzled Ironfur Bear (guid 50720, entry 5272) 51.27 -> 61.20
UPDATE `creature` SET `position_z` = 61.200000 WHERE `guid` = 50720;
-- Grizzled Ironfur Bear (guid 50722, entry 5272) 50.71 -> 53.34
UPDATE `creature` SET `position_z` = 53.339000 WHERE `guid` = 50722;
-- Longtooth Howler (guid 50910, entry 5287) 53.24 -> 54.63
UPDATE `creature` SET `position_z` = 54.633000 WHERE `guid` = 50910;
-- Longtooth Howler (guid 50911, entry 5287) 56.56 -> 60.83
UPDATE `creature` SET `position_z` = 60.832000 WHERE `guid` = 50911;
-- KALIMDOR_31_19.ADT
-- Eroded Anubisath Warbringer (guid 650111, entry 15810) 30.29 -> 30.88
UPDATE `creature` SET `position_z` = 30.884000 WHERE `guid` = 650111;
-- KALIMDOR_31_29.ADT
-- Wild Steelbloom (guid 212657, entry 1623) 84.23 -> 88.08
UPDATE `gameobject` SET `position_z` = 88.080000 WHERE `guid` = 212657;
-- KALIMDOR_31_30.ADT
-- Copper Vein (guid 212753, entry 1731) 82.16 -> 134.06
UPDATE `gameobject` SET `position_z` = 134.060000 WHERE `guid` = 212753;
-- KALIMDOR_31_35.ADT
-- Bael'dun Digger (guid 29098, entry 2989) 136.66 -> 137.83
UPDATE `creature` SET `position_z` = 137.826000 WHERE `guid` = 29098;
-- KALIMDOR_31_39.ADT
-- Gordunni Brute (guid 50194, entry 5232) 135.71 -> 131.90
UPDATE `creature` SET `position_z` = 131.900000 WHERE `guid` = 50194;
-- Gordunni Brute (guid 50218, entry 5232) 134.50 -> 131.08
UPDATE `creature` SET `position_z` = 131.083000 WHERE `guid` = 50218;
-- Gordunni Trap (guid 50129, entry 144050) 123.86 -> 131.22
UPDATE `gameobject` SET `position_z` = 131.219000 WHERE `guid` = 50129;
-- Gordunni Trap (guid 50139, entry 144050) 122.33 -> 128.80
UPDATE `gameobject` SET `position_z` = 128.804000 WHERE `guid` = 50139;
-- Gordunni Trap (guid 50145, entry 144050) 129.17 -> 127.31
UPDATE `gameobject` SET `position_z` = 127.312000 WHERE `guid` = 50145;
-- Gordunni Trap (guid 50146, entry 144050) 126.76 -> 126.24
UPDATE `gameobject` SET `position_z` = 126.239000 WHERE `guid` = 50146;
-- Gordunni Trap (guid 50151, entry 144050) 130.45 -> 128.97
UPDATE `gameobject` SET `position_z` = 128.970000 WHERE `guid` = 50151;
-- KALIMDOR_32_19.ADT
-- Foreststrider Fledgling (guid 36666, entry 2321) 19.54 -> 20.03
UPDATE `creature` SET `position_z` = 20.027000 WHERE `guid` = 36666;
-- Briarthorn (guid 210912, entry 1621) 23.92 -> 23.01
UPDATE `gameobject` SET `position_z` = 23.008000 WHERE `guid` = 210912;
-- KALIMDOR_32_20.ADT
-- Sickly Deer (guid 36577, entry 12298) 32.58 -> 31.97
UPDATE `creature` SET `position_z` = 31.966000 WHERE `guid` = 36577;
-- Raging Moonkin (guid 38477, entry 10160) 28.66 -> 27.49
UPDATE `creature` SET `position_z` = 27.485000 WHERE `guid` = 38477;
-- KALIMDOR_32_30.ADT
-- Venture Co. Deforester (guid 29548, entry 3991) 9.66 -> 11.57
UPDATE `creature` SET `position_z` = 11.573000 WHERE `guid` = 29548;
-- KALIMDOR_32_32.ADT
-- Bruiseweed (guid 212600, entry 1622) 35.20 -> 43.54
UPDATE `gameobject` SET `position_z` = 43.540000 WHERE `guid` = 212600;
-- KALIMDOR_32_45.ADT
-- Frenzied Pterrordax (guid 24624, entry 9167) -232.87 -> -231.79
UPDATE `creature` SET `position_z` = -231.790000 WHERE `guid` = 24624;
-- Frenzied Pterrordax (guid 24630, entry 9167) -225.70 -> -211.10
UPDATE `creature` SET `position_z` = -211.100000 WHERE `guid` = 24630;
-- Frenzied Pterrordax (guid 24653, entry 9167) -227.67 -> -214.14
UPDATE `creature` SET `position_z` = -214.144000 WHERE `guid` = 24653;
-- Yellow Power Crystal (guid 17716, entry 164781) -219.93 -> -217.26
UPDATE `gameobject` SET `position_z` = -217.258000 WHERE `guid` = 17716;
-- Yellow Power Crystal (guid 17730, entry 164781) -275.18 -> -272.69
UPDATE `gameobject` SET `position_z` = -272.693000 WHERE `guid` = 17730;
-- Small Thorium Vein (guid 216710, entry 324) -265.19 -> -266.65
UPDATE `gameobject` SET `position_z` = -266.652000 WHERE `guid` = 216710;
-- Rich Thorium Vein (guid 216792, entry 175404) -265.19 -> -266.65
UPDATE `gameobject` SET `position_z` = -266.652000 WHERE `guid` = 216792;
-- KALIMDOR_33_19.ADT
-- Corrupted Whipper Root (guid 48915, entry 174606) 477.42 -> 476.46
UPDATE `gameobject` SET `position_z` = 476.464000 WHERE `guid` = 48915;
-- KALIMDOR_33_32.ADT
-- Cliff Stormer (guid 29834, entry 4008) 8.76 -> 9.26
UPDATE `creature` SET `position_z` = 9.263000 WHERE `guid` = 29834;
-- KALIMDOR_33_41.ADT
-- Sunscorched Shell (guid 16713, entry 89635) -1.76 -> 1.01
UPDATE `gameobject` SET `position_z` = 1.006000 WHERE `guid` = 16713;
-- Wild Steelbloom (guid 215635, entry 1623) -1.63 -> 1.58
UPDATE `gameobject` SET `position_z` = 1.579000 WHERE `guid` = 215635;
-- Wild Steelbloom (guid 215653, entry 1623) 1.74 -> 4.01
UPDATE `gameobject` SET `position_z` = 4.013000 WHERE `guid` = 215653;
-- Iron Deposit (guid 215889, entry 1735) -3.69 -> 0.61
UPDATE `gameobject` SET `position_z` = 0.610000 WHERE `guid` = 215889;
-- Iron Deposit (guid 215894, entry 1735) -3.03 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643000 WHERE `guid` = 215894;
-- Iron Deposit (guid 215906, entry 1735) -1.50 -> 1.72
UPDATE `gameobject` SET `position_z` = 1.721000 WHERE `guid` = 215906;
-- Gold Vein (guid 215977, entry 1734) -3.69 -> 0.61
UPDATE `gameobject` SET `position_z` = 0.610000 WHERE `guid` = 215977;
-- Gold Vein (guid 215982, entry 1734) -3.03 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643000 WHERE `guid` = 215982;
-- Gold Vein (guid 215994, entry 1734) -1.50 -> 1.72
UPDATE `gameobject` SET `position_z` = 1.721000 WHERE `guid` = 215994;
-- Silver Vein (guid 216065, entry 1733) -3.69 -> 0.61
UPDATE `gameobject` SET `position_z` = 0.610000 WHERE `guid` = 216065;
-- Silver Vein (guid 216070, entry 1733) -3.03 -> 1.64
UPDATE `gameobject` SET `position_z` = 1.643000 WHERE `guid` = 216070;
-- Silver Vein (guid 216082, entry 1733) -1.50 -> 1.72
UPDATE `gameobject` SET `position_z` = 1.721000 WHERE `guid` = 216082;
-- Mithril Deposit (guid 216101, entry 2040) -4.49 -> 2.33
UPDATE `gameobject` SET `position_z` = 2.335000 WHERE `guid` = 216101;
-- Gold Vein (guid 216112, entry 1734) -4.49 -> 2.33
UPDATE `gameobject` SET `position_z` = 2.335000 WHERE `guid` = 216112;
-- Truesilver Deposit (guid 216123, entry 2047) -4.49 -> 2.33
UPDATE `gameobject` SET `position_z` = 2.335000 WHERE `guid` = 216123;
-- KALIMDOR_33_46.ADT
-- Glutinous Ooze (guid 24384, entry 6559) -268.19 -> -268.93
UPDATE `creature` SET `position_z` = -268.928000 WHERE `guid` = 24384;
-- Frenzied Pterrordax (guid 24602, entry 9167) -261.27 -> -261.93
UPDATE `creature` SET `position_z` = -261.930000 WHERE `guid` = 24602;
-- Small Thorium Vein (guid 216679, entry 324) -263.83 -> -265.40
UPDATE `gameobject` SET `position_z` = -265.397000 WHERE `guid` = 216679;
-- Small Thorium Vein (guid 216681, entry 324) -266.21 -> -267.87
UPDATE `gameobject` SET `position_z` = -267.867000 WHERE `guid` = 216681;
-- Small Thorium Vein (guid 216682, entry 324) -260.53 -> -259.52
UPDATE `gameobject` SET `position_z` = -259.524000 WHERE `guid` = 216682;
-- Rich Thorium Vein (guid 216761, entry 175404) -263.83 -> -265.40
UPDATE `gameobject` SET `position_z` = -265.397000 WHERE `guid` = 216761;
-- Rich Thorium Vein (guid 216763, entry 175404) -266.21 -> -267.87
UPDATE `gameobject` SET `position_z` = -267.867000 WHERE `guid` = 216763;
-- Rich Thorium Vein (guid 216764, entry 175404) -260.53 -> -259.52
UPDATE `gameobject` SET `position_z` = -259.524000 WHERE `guid` = 216764;
-- Rich Thorium Vein (guid 216951, entry 175404) -236.50 -> -238.74
UPDATE `gameobject` SET `position_z` = -238.740000 WHERE `guid` = 216951;
-- Truesilver Deposit (guid 216962, entry 2047) -236.50 -> -238.74
UPDATE `gameobject` SET `position_z` = -238.740000 WHERE `guid` = 216962;
-- KALIMDOR_34_17.ADT
-- Giant Foreststrider (guid 36823, entry 2323) 40.08 -> 36.78
UPDATE `creature` SET `position_z` = 36.777000 WHERE `guid` = 36823;
-- KALIMDOR_34_21.ADT
-- Sungrass (guid 211140, entry 176636) 403.35 -> 403.77
UPDATE `gameobject` SET `position_z` = 403.766000 WHERE `guid` = 211140;
-- KALIMDOR_34_24.ADT
-- Jessir Moonbow (guid 39077, entry 11019) 253.62 -> 245.73
UPDATE `creature` SET `position_z` = 245.733000 WHERE `guid` = 39077;
-- Della (guid 39078, entry 11024) 253.76 -> 245.68
UPDATE `creature` SET `position_z` = 245.685000 WHERE `guid` = 39078;
-- Kelek Skykeeper (guid 39099, entry 10920) 254.26 -> 246.03
UPDATE `creature` SET `position_z` = 246.032000 WHERE `guid` = 39099;
-- Greta Mosshoof (guid 39100, entry 10922) 251.15 -> 244.67
UPDATE `creature` SET `position_z` = 244.665000 WHERE `guid` = 39100;
-- Tenell Leafrunner (guid 39102, entry 10923) 241.52 -> 238.99
UPDATE `creature` SET `position_z` = 238.989000 WHERE `guid` = 39102;
-- Ivy Leafrunner (guid 39103, entry 10924) 254.37 -> 246.03
UPDATE `creature` SET `position_z` = 246.026000 WHERE `guid` = 39103;
-- Gorrim (guid 39104, entry 22931) 251.12 -> 245.46
UPDATE `creature` SET `position_z` = 245.456000 WHERE `guid` = 39104;
-- Grazle (guid 39107, entry 11554) 220.49 -> 219.47
UPDATE `creature` SET `position_z` = 219.474000 WHERE `guid` = 39107;
-- Felpaw Wolf (guid 39191, entry 8959) 277.26 -> 277.90
UPDATE `creature` SET `position_z` = 277.897000 WHERE `guid` = 39191;
-- Felpaw Wolf (guid 39215, entry 8959) 233.15 -> 232.81
UPDATE `creature` SET `position_z` = 232.808000 WHERE `guid` = 39215;
-- Tainted Cockroach (guid 39283, entry 10017) 213.63 -> 214.69
UPDATE `creature` SET `position_z` = 214.688000 WHERE `guid` = 39283;
-- Angerclaw Bear (guid 39518, entry 8956) 236.22 -> 235.27
UPDATE `creature` SET `position_z` = 235.267000 WHERE `guid` = 39518;
-- Ironbeak Owl (guid 39528, entry 7097) 215.18 -> 211.62
UPDATE `creature` SET `position_z` = 211.623000 WHERE `guid` = 39528;
-- Tainted Cockroach (guid 39551, entry 10017) 266.59 -> 264.50
UPDATE `creature` SET `position_z` = 264.502000 WHERE `guid` = 39551;
-- Felpaw Wolf (guid 39652, entry 8959) 245.88 -> 245.51
UPDATE `creature` SET `position_z` = 245.507000 WHERE `guid` = 39652;
-- Felpaw Wolf (guid 39674, entry 8959) 263.64 -> 262.27
UPDATE `creature` SET `position_z` = 262.267000 WHERE `guid` = 39674;
-- Felpaw Wolf (guid 39679, entry 8959) 208.51 -> 207.67
UPDATE `creature` SET `position_z` = 207.667000 WHERE `guid` = 39679;
-- Ironbeak Owl (guid 39708, entry 7097) 251.82 -> 244.51
UPDATE `creature` SET `position_z` = 244.514000 WHERE `guid` = 39708;
-- Felpaw Wolf (guid 40333, entry 8959) 214.82 -> 211.67
UPDATE `creature` SET `position_z` = 211.669000 WHERE `guid` = 40333;
-- Felpaw Wolf (guid 40335, entry 8959) 209.57 -> 208.41
UPDATE `creature` SET `position_z` = 208.407000 WHERE `guid` = 40335;
-- Tainted Cockroach (guid 40412, entry 10017) 203.15 -> 201.47
UPDATE `creature` SET `position_z` = 201.475000 WHERE `guid` = 40412;
-- Felpaw Wolf (guid 40741, entry 8959) 203.70 -> 202.30
UPDATE `creature` SET `position_z` = 202.299000 WHERE `guid` = 40741;
-- Felpaw Wolf (guid 40836, entry 8959) 237.75 -> 237.26
UPDATE `creature` SET `position_z` = 237.260000 WHERE `guid` = 40836;
-- Standing, Exterior, Medium - MFF (guid 51334, entry 181355) 254.08 -> 245.40
UPDATE `gameobject` SET `position_z` = 245.401000 WHERE `guid` = 51334;
-- Standing, Exterior, Medium - Brewfest (guid 67444, entry 195256) 254.08 -> 245.40
UPDATE `gameobject` SET `position_z` = 245.401000 WHERE `guid` = 67444;
-- Golden Sansam (guid 211176, entry 176638) 209.63 -> 208.75
UPDATE `gameobject` SET `position_z` = 208.753000 WHERE `guid` = 211176;
-- Plaguebloom (guid 211245, entry 176641) 239.39 -> 237.10
UPDATE `gameobject` SET `position_z` = 237.097000 WHERE `guid` = 211245;
-- KALIMDOR_34_25.ADT
-- Deadwood Gardener (guid 40831, entry 7154) 212.81 -> 213.34
UPDATE `creature` SET `position_z` = 213.335000 WHERE `guid` = 40831;
-- KALIMDOR_34_28.ADT
-- Bloodtooth Guard (guid 32571, entry 3932) 114.86 -> 111.75
UPDATE `creature` SET `position_z` = 111.746000 WHERE `guid` = 32571;
-- KALIMDOR_34_31.ADT
-- Sunscale Screecher (guid 19896, entry 3255) 93.30 -> 92.78
UPDATE `creature` SET `position_z` = 92.780000 WHERE `guid` = 19896;
-- KALIMDOR_34_32.ADT
-- Sunscale Scytheclaw (guid 20016, entry 3256) 46.78 -> 51.41
UPDATE `creature` SET `position_z` = 51.413000 WHERE `guid` = 20016;
-- KALIMDOR_34_33.ADT
-- Earthroot (guid 213210, entry 3726) 107.60 -> 106.74
UPDATE `gameobject` SET `position_z` = 106.741000 WHERE `guid` = 213210;
-- KALIMDOR_34_43.ADT
-- Tar Lord (guid 24135, entry 6519) -271.65 -> -272.32
UPDATE `creature` SET `position_z` = -272.324000 WHERE `guid` = 24135;
-- KALIMDOR_34_47.ADT
-- Pterrordax (guid 24575, entry 9166) -236.85 -> -232.50
UPDATE `creature` SET `position_z` = -232.497000 WHERE `guid` = 24575;
-- Pterrordax (guid 24583, entry 9166) -228.83 -> -201.28
UPDATE `creature` SET `position_z` = -201.281000 WHERE `guid` = 24583;
-- Pterrordax (guid 24589, entry 9166) -227.33 -> -212.07
UPDATE `creature` SET `position_z` = -212.070000 WHERE `guid` = 24589;
-- Mountain Silversage (guid 216660, entry 176586) -226.39 -> -225.87
UPDATE `gameobject` SET `position_z` = -225.868000 WHERE `guid` = 216660;
-- Small Thorium Vein (guid 216667, entry 324) -249.44 -> -249.14
UPDATE `gameobject` SET `position_z` = -249.139000 WHERE `guid` = 216667;
-- Rich Thorium Vein (guid 216749, entry 175404) -249.44 -> -249.14
UPDATE `gameobject` SET `position_z` = -249.139000 WHERE `guid` = 216749;
-- KALIMDOR_35_26.ADT
-- Laughing Sister (guid 34198, entry 4054) 190.71 -> 191.44
UPDATE `creature` SET `position_z` = 191.442000 WHERE `guid` = 34198;
-- KALIMDOR_35_37.ADT
-- Copper Vein (guid 213572, entry 1731) 109.81 -> 109.23
UPDATE `gameobject` SET `position_z` = 109.230000 WHERE `guid` = 213572;
-- KALIMDOR_35_48.ADT
-- Thistleshrub Rootshaper (guid 23248, entry 5485) 11.28 -> 13.98
UPDATE `creature` SET `position_z` = 13.981000 WHERE `guid` = 23248;
-- KALIMDOR_36_27.ADT
-- Splintertree Guard (guid 32611, entry 12903) 100.79 -> 99.80
UPDATE `creature` SET `position_z` = 99.795000 WHERE `guid` = 32611;
-- Splintertree Guard (guid 32621, entry 12903) 86.52 -> 87.22
UPDATE `creature` SET `position_z` = 87.217000 WHERE `guid` = 32621;
-- Splintertree Guard (guid 32624, entry 12903) 86.46 -> 87.41
UPDATE `creature` SET `position_z` = 87.410000 WHERE `guid` = 32624;
-- Elder Shadowhorn Stag (guid 34765, entry 3818) 170.41 -> 169.09
UPDATE `creature` SET `position_z` = 169.087000 WHERE `guid` = 34765;
-- Ghostpaw Alpha (guid 35060, entry 3825) 161.21 -> 162.35
UPDATE `creature` SET `position_z` = 162.353000 WHERE `guid` = 35060;
-- G_Pumpkin_03 (guid 37337, entry 180407) 86.88 -> 87.61
UPDATE `gameobject` SET `position_z` = 87.613000 WHERE `guid` = 37337;
-- Mailbox (guid 48037, entry 178864) 101.63 -> 102.45
UPDATE `gameobject` SET `position_z` = 102.447000 WHERE `guid` = 48037;
-- Liferoot (guid 212204, entry 2041) 166.12 -> 166.99
UPDATE `gameobject` SET `position_z` = 166.995000 WHERE `guid` = 212204;
-- KALIMDOR_36_40.ADT
-- Razorfen Battleguard (guid 20272, entry 7873) 93.03 -> 93.97
UPDATE `creature` SET `position_z` = 93.970000 WHERE `guid` = 20272;
-- Razorfen Battleguard (guid 20285, entry 7873) 88.93 -> 88.56
UPDATE `creature` SET `position_z` = 88.561000 WHERE `guid` = 20285;
-- Razorfen Battleguard (guid 20292, entry 7873) 91.52 -> 90.30
UPDATE `creature` SET `position_z` = 90.299000 WHERE `guid` = 20292;
-- Razorfen Battleguard (guid 20295, entry 7873) 92.33 -> 92.99
UPDATE `creature` SET `position_z` = 92.994000 WHERE `guid` = 20295;
-- Razorfen Battleguard (guid 20310, entry 7873) 94.45 -> 86.29
UPDATE `creature` SET `position_z` = 86.291000 WHERE `guid` = 20310;
-- Razorfen Battleguard (guid 20318, entry 7873) 89.26 -> 90.20
UPDATE `creature` SET `position_z` = 90.197000 WHERE `guid` = 20318;
-- Razorfen Battleguard (guid 20326, entry 7873) 83.95 -> 84.80
UPDATE `creature` SET `position_z` = 84.802000 WHERE `guid` = 20326;
-- Razorfen Battleguard (guid 20329, entry 7873) 86.26 -> 85.21
UPDATE `creature` SET `position_z` = 85.211000 WHERE `guid` = 20329;
-- Razorfen Thornweaver (guid 20360, entry 7874) 83.13 -> 85.10
UPDATE `creature` SET `position_z` = 85.103000 WHERE `guid` = 20360;
-- Razorfen Thornweaver (guid 20367, entry 7874) 88.45 -> 88.91
UPDATE `creature` SET `position_z` = 88.913000 WHERE `guid` = 20367;
-- Razorfen Thornweaver (guid 20370, entry 7874) 83.95 -> 84.43
UPDATE `creature` SET `position_z` = 84.427000 WHERE `guid` = 20370;
-- KALIMDOR_36_44.ADT
-- Bloodpetal Lasher (guid 23892, entry 6509) -270.39 -> -269.89
UPDATE `creature` SET `position_z` = -269.892000 WHERE `guid` = 23892;
-- Young Diemetradon (guid 24453, entry 9162) -271.13 -> -269.63
UPDATE `creature` SET `position_z` = -269.634000 WHERE `guid` = 24453;
-- Green Power Crystal (guid 17536, entry 164659) -147.99 -> -146.61
UPDATE `gameobject` SET `position_z` = -146.609000 WHERE `guid` = 17536;
-- Yellow Power Crystal (guid 17571, entry 164661) -267.81 -> -265.10
UPDATE `gameobject` SET `position_z` = -265.099000 WHERE `guid` = 17571;
-- Yellow Power Crystal (guid 17580, entry 164661) -268.64 -> -267.27
UPDATE `gameobject` SET `position_z` = -267.269000 WHERE `guid` = 17580;
-- KALIMDOR_36_45.ADT
-- Toad (guid 24232, entry 1420) -275.24 -> -272.28
UPDATE `creature` SET `position_z` = -272.277000 WHERE `guid` = 24232;
-- Stone Guardian (guid 24426, entry 6560) -273.19 -> -267.71
UPDATE `creature` SET `position_z` = -267.712000 WHERE `guid` = 24426;
-- Stone Guardian (guid 24428, entry 6560) -269.44 -> -267.49
UPDATE `creature` SET `position_z` = -267.493000 WHERE `guid` = 24428;
-- Fledgling Pterrordax (guid 24560, entry 9165) -224.38 -> -211.49
UPDATE `creature` SET `position_z` = -211.494000 WHERE `guid` = 24560;
-- Fledgling Pterrordax (guid 24572, entry 9165) -225.87 -> -212.30
UPDATE `creature` SET `position_z` = -212.297000 WHERE `guid` = 24572;
-- Red Power Crystal (guid 17566, entry 164660) -243.53 -> -243.17
UPDATE `gameobject` SET `position_z` = -243.168000 WHERE `guid` = 17566;
-- Bloodpetal Sprout (guid 17669, entry 164958) -272.50 -> -270.38
UPDATE `gameobject` SET `position_z` = -270.384000 WHERE `guid` = 17669;
-- Green Power Crystal (guid 17704, entry 164779) -273.96 -> -272.86
UPDATE `gameobject` SET `position_z` = -272.861000 WHERE `guid` = 17704;
-- Mithril Deposit (guid 216906, entry 2040) -215.18 -> -213.40
UPDATE `gameobject` SET `position_z` = -213.395000 WHERE `guid` = 216906;
-- Gold Vein (guid 216916, entry 1734) -215.18 -> -213.40
UPDATE `gameobject` SET `position_z` = -213.395000 WHERE `guid` = 216916;
-- Truesilver Deposit (guid 216926, entry 2047) -215.18 -> -213.40
UPDATE `gameobject` SET `position_z` = -213.395000 WHERE `guid` = 216926;
-- KALIMDOR_36_48.ADT
-- Small Thorium Vein (guid 216267, entry 324) 21.24 -> 20.85
UPDATE `gameobject` SET `position_z` = 20.850000 WHERE `guid` = 216267;
-- Truesilver Deposit (guid 216280, entry 2047) 21.24 -> 20.85
UPDATE `gameobject` SET `position_z` = 20.850000 WHERE `guid` = 216280;
-- Mithril Deposit (guid 216374, entry 2040) 22.52 -> 23.55
UPDATE `gameobject` SET `position_z` = 23.553000 WHERE `guid` = 216374;
-- Gold Vein (guid 216426, entry 1734) 22.52 -> 23.55
UPDATE `gameobject` SET `position_z` = 23.553000 WHERE `guid` = 216426;
-- Truesilver Deposit (guid 216478, entry 2047) 22.52 -> 23.55
UPDATE `gameobject` SET `position_z` = 23.553000 WHERE `guid` = 216478;
-- KALIMDOR_36_49.ADT
-- Rabid Blisterpaw (guid 22651, entry 5427) 14.73 -> 16.02
UPDATE `creature` SET `position_z` = 16.025000 WHERE `guid` = 22651;
-- KALIMDOR_37_36.ADT
-- Stormsnout (guid 15264, entry 3240) 91.79 -> 92.54
UPDATE `creature` SET `position_z` = 92.542000 WHERE `guid` = 15264;
-- KALIMDOR_37_40.ADT
-- Searing Whelp (guid 31415, entry 4324) 34.92 -> 32.63
UPDATE `creature` SET `position_z` = 32.627000 WHERE `guid` = 31415;
-- KALIMDOR_37_41.ADT
-- Campfire (guid 16885, entry 20356) -8.70 -> -9.07
UPDATE `gameobject` SET `position_z` = -9.067000 WHERE `guid` = 16885;
-- Kingsblood (guid 215181, entry 1624) 36.34 -> 32.45
UPDATE `gameobject` SET `position_z` = 32.453000 WHERE `guid` = 215181;
-- KALIMDOR_37_49.ADT
-- Dune Smasher (guid 23122, entry 5469) 7.92 -> 8.80
UPDATE `creature` SET `position_z` = 8.800000 WHERE `guid` = 23122;
-- KALIMDOR_37_50.ADT
-- KALIMDOR_38_41.ADT
-- Searing Whelp (guid 30877, entry 4324) 65.55 -> 71.55
UPDATE `creature` SET `position_z` = 71.552000 WHERE `guid` = 30877;
-- Firemane Scout (guid 31125, entry 4329) 34.51 -> 40.42
UPDATE `creature` SET `position_z` = 40.420000 WHERE `guid` = 31125;
-- Firemane Ash Tail (guid 31126, entry 4331) 34.85 -> 35.62
UPDATE `creature` SET `position_z` = 35.618000 WHERE `guid` = 31126;
-- Searing Hatchling (guid 31401, entry 4323) 48.49 -> 117.69
UPDATE `creature` SET `position_z` = 117.686000 WHERE `guid` = 31401;
-- Searing Whelp (guid 31403, entry 4324) 52.40 -> 116.57
UPDATE `creature` SET `position_z` = 116.568000 WHERE `guid` = 31403;
-- Searing Whelp (guid 31418, entry 4324) 36.69 -> 36.17
UPDATE `creature` SET `position_z` = 36.173000 WHERE `guid` = 31418;
-- Searing Hatchling (guid 31419, entry 4323) 40.38 -> 51.18
UPDATE `creature` SET `position_z` = 51.184000 WHERE `guid` = 31419;
-- Searing Whelp (guid 31427, entry 4324) 33.85 -> 35.09
UPDATE `creature` SET `position_z` = 35.085000 WHERE `guid` = 31427;
-- Searing Hatchling (guid 31436, entry 4323) 61.78 -> 114.26
UPDATE `creature` SET `position_z` = 114.259000 WHERE `guid` = 31436;
-- Searing Hatchling (guid 31443, entry 4323) 36.69 -> 35.68
UPDATE `creature` SET `position_z` = 35.676000 WHERE `guid` = 31443;
-- KALIMDOR_40_30.ADT
-- Armored Scorpid (guid 7555, entry 3126) 56.77 -> 55.75
UPDATE `creature` SET `position_z` = 55.753000 WHERE `guid` = 7555;
-- KALIMDOR_40_31.ADT
-- G_Pumpkin_01 (guid 36312, entry 180405) 16.16 -> 15.65
UPDATE `gameobject` SET `position_z` = 15.654000 WHERE `guid` = 36312;
-- KALIMDOR_41_22.ADT
-- Frostmaul Giant (guid 40838, entry 7428) 844.92 -> 849.66
UPDATE `creature` SET `position_z` = 849.656000 WHERE `guid` = 40838;
-- Mountain Silversage (guid 211457, entry 176586) 874.76 -> 877.45
UPDATE `gameobject` SET `position_z` = 877.452000 WHERE `guid` = 211457;
-- Small Thorium Vein (guid 211578, entry 324) 867.90 -> 873.58
UPDATE `gameobject` SET `position_z` = 873.584000 WHERE `guid` = 211578;
-- Truesilver Deposit (guid 211592, entry 2047) 867.90 -> 873.58
UPDATE `gameobject` SET `position_z` = 873.584000 WHERE `guid` = 211592;
-- KALIMDOR_41_24.ADT
-- Timbermaw Den Watcher (guid 35249, entry 6187) 118.46 -> 117.27
UPDATE `creature` SET `position_z` = 117.267000 WHERE `guid` = 35249;
-- Timbermaw Den Watcher (guid 35257, entry 6187) 117.44 -> 115.64
UPDATE `creature` SET `position_z` = 115.640000 WHERE `guid` = 35257;
-- KALIMDOR_41_27.ADT
-- Blue Scalebane (guid 36402, entry 6130) 127.90 -> 129.61
UPDATE `creature` SET `position_z` = 129.615000 WHERE `guid` = 36402;
-- Draconic Mageweaver (guid 36417, entry 6131) 125.25 -> 127.98
UPDATE `creature` SET `position_z` = 127.981000 WHERE `guid` = 36417;
-- Draconic Mageweaver (guid 36427, entry 6131) 122.02 -> 121.61
UPDATE `creature` SET `position_z` = 121.613000 WHERE `guid` = 36427;
-- KALIMDOR_41_30.ADT
-- Armored Scorpid (guid 6663, entry 3126) 55.88 -> 55.32
UPDATE `creature` SET `position_z` = 55.323000 WHERE `guid` = 6663;
-- Armored Scorpid (guid 7999, entry 3126) 56.83 -> 56.10
UPDATE `creature` SET `position_z` = 56.101000 WHERE `guid` = 7999;

-- Waypoint paths of shifted creatures (points on stock ground)
UPDATE `waypoint_data` SET `position_z` = -9.548619 WHERE `id` = 27910 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = -5.972991 WHERE `id` = 27910 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = -3.529475 WHERE `id` = 27910 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = -2.101427 WHERE `id` = 27910 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = -2.394231 WHERE `id` = 27910 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = -2.985147 WHERE `id` = 27910 AND `point` = 25;
UPDATE `waypoint_data` SET `position_z` = -2.894230 WHERE `id` = 27910 AND `point` = 26;
UPDATE `waypoint_data` SET `position_z` = -3.922808 WHERE `id` = 27910 AND `point` = 27;
UPDATE `waypoint_data` SET `position_z` = -3.853159 WHERE `id` = 27910 AND `point` = 28;
UPDATE `waypoint_data` SET `position_z` = -7.177575 WHERE `id` = 27910 AND `point` = 29;
UPDATE `waypoint_data` SET `position_z` = -11.224615 WHERE `id` = 27910 AND `point` = 30;
UPDATE `waypoint_data` SET `position_z` = -14.099975 WHERE `id` = 27910 AND `point` = 31;
UPDATE `waypoint_data` SET `position_z` = -18.354901 WHERE `id` = 27910 AND `point` = 32;
UPDATE `waypoint_data` SET `position_z` = -23.479175 WHERE `id` = 27910 AND `point` = 33;
UPDATE `waypoint_data` SET `position_z` = -23.565644 WHERE `id` = 27910 AND `point` = 34;
UPDATE `waypoint_data` SET `position_z` = -23.522250 WHERE `id` = 27910 AND `point` = 35;
UPDATE `waypoint_data` SET `position_z` = -22.455158 WHERE `id` = 27910 AND `point` = 36;
UPDATE `waypoint_data` SET `position_z` = -24.855386 WHERE `id` = 27910 AND `point` = 37;
UPDATE `waypoint_data` SET `position_z` = -17.875810 WHERE `id` = 27910 AND `point` = 38;
UPDATE `waypoint_data` SET `position_z` = -8.432160 WHERE `id` = 27910 AND `point` = 39;
UPDATE `waypoint_data` SET `position_z` = -5.009019 WHERE `id` = 27910 AND `point` = 40;
UPDATE `waypoint_data` SET `position_z` = 2.343267 WHERE `id` = 27910 AND `point` = 41;
UPDATE `waypoint_data` SET `position_z` = 1.255682 WHERE `id` = 27910 AND `point` = 42;
UPDATE `waypoint_data` SET `position_z` = -5.623639 WHERE `id` = 27910 AND `point` = 43;
UPDATE `waypoint_data` SET `position_z` = -9.250473 WHERE `id` = 27910 AND `point` = 44;
UPDATE `waypoint_data` SET `position_z` = -20.879002 WHERE `id` = 27910 AND `point` = 45;
UPDATE `waypoint_data` SET `position_z` = -25.866867 WHERE `id` = 27910 AND `point` = 46;
UPDATE `waypoint_data` SET `position_z` = -24.702924 WHERE `id` = 27910 AND `point` = 47;
UPDATE `waypoint_data` SET `position_z` = -22.173425 WHERE `id` = 27910 AND `point` = 48;
UPDATE `waypoint_data` SET `position_z` = -22.645995 WHERE `id` = 27910 AND `point` = 49;
UPDATE `waypoint_data` SET `position_z` = -23.848926 WHERE `id` = 27910 AND `point` = 50;
UPDATE `waypoint_data` SET `position_z` = -21.800718 WHERE `id` = 27910 AND `point` = 51;
UPDATE `waypoint_data` SET `position_z` = -13.168033 WHERE `id` = 27910 AND `point` = 52;
UPDATE `waypoint_data` SET `position_z` = -10.852833 WHERE `id` = 27910 AND `point` = 53;
UPDATE `waypoint_data` SET `position_z` = 128.675909 WHERE `id` = 67100 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 127.268689 WHERE `id` = 67100 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 92.470829 WHERE `id` = 67100 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 103.967963 WHERE `id` = 67100 AND `point` = 13;
UPDATE `waypoint_data` SET `position_z` = 123.613937 WHERE `id` = 67100 AND `point` = 18;
UPDATE `waypoint_data` SET `position_z` = 391.238388 WHERE `id` = 83700 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 390.403026 WHERE `id` = 83700 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 391.422193 WHERE `id` = 83700 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 391.077088 WHERE `id` = 83700 AND `point` = 17;
UPDATE `waypoint_data` SET `position_z` = 389.715795 WHERE `id` = 83700 AND `point` = 18;
UPDATE `waypoint_data` SET `position_z` = 387.683094 WHERE `id` = 83700 AND `point` = 19;
UPDATE `waypoint_data` SET `position_z` = 389.408195 WHERE `id` = 83700 AND `point` = 20;
UPDATE `waypoint_data` SET `position_z` = 23.845408 WHERE `id` = 191500 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 23.821542 WHERE `id` = 191500 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 21.953000 WHERE `id` = 191500 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 23.880422 WHERE `id` = 191500 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 27.019136 WHERE `id` = 191500 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 28.138551 WHERE `id` = 191500 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = 28.492500 WHERE `id` = 191500 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 28.449058 WHERE `id` = 191500 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 27.177183 WHERE `id` = 191500 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 23.394861 WHERE `id` = 191500 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 25.592021 WHERE `id` = 191510 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 25.436154 WHERE `id` = 191510 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 25.504947 WHERE `id` = 191510 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 26.360964 WHERE `id` = 191510 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 25.927201 WHERE `id` = 191510 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 25.271930 WHERE `id` = 191510 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = 24.444202 WHERE `id` = 191510 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 26.200424 WHERE `id` = 191510 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 26.553897 WHERE `id` = 191510 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 26.407758 WHERE `id` = 191510 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 26.036315 WHERE `id` = 191510 AND `point` = 11;
UPDATE `waypoint_data` SET `position_z` = 26.376804 WHERE `id` = 191510 AND `point` = 12;
UPDATE `waypoint_data` SET `position_z` = 27.198553 WHERE `id` = 191510 AND `point` = 13;
UPDATE `waypoint_data` SET `position_z` = 26.401118 WHERE `id` = 191510 AND `point` = 14;
UPDATE `waypoint_data` SET `position_z` = 25.758559 WHERE `id` = 191510 AND `point` = 15;
UPDATE `waypoint_data` SET `position_z` = 26.152526 WHERE `id` = 191510 AND `point` = 16;
UPDATE `waypoint_data` SET `position_z` = 26.115286 WHERE `id` = 191510 AND `point` = 17;
UPDATE `waypoint_data` SET `position_z` = 25.576295 WHERE `id` = 191510 AND `point` = 18;
UPDATE `waypoint_data` SET `position_z` = 23.476522 WHERE `id` = 191510 AND `point` = 19;
UPDATE `waypoint_data` SET `position_z` = 21.304796 WHERE `id` = 191510 AND `point` = 20;
UPDATE `waypoint_data` SET `position_z` = 20.042762 WHERE `id` = 191510 AND `point` = 21;
UPDATE `waypoint_data` SET `position_z` = 17.514572 WHERE `id` = 191510 AND `point` = 22;
UPDATE `waypoint_data` SET `position_z` = 15.308736 WHERE `id` = 191510 AND `point` = 23;
UPDATE `waypoint_data` SET `position_z` = 14.224171 WHERE `id` = 191510 AND `point` = 24;
UPDATE `waypoint_data` SET `position_z` = 14.966421 WHERE `id` = 191510 AND `point` = 25;
UPDATE `waypoint_data` SET `position_z` = 19.348103 WHERE `id` = 191510 AND `point` = 26;
UPDATE `waypoint_data` SET `position_z` = 20.156634 WHERE `id` = 191510 AND `point` = 27;
UPDATE `waypoint_data` SET `position_z` = 20.075750 WHERE `id` = 191510 AND `point` = 28;
UPDATE `waypoint_data` SET `position_z` = 22.230933 WHERE `id` = 191510 AND `point` = 29;
UPDATE `waypoint_data` SET `position_z` = 22.453554 WHERE `id` = 191510 AND `point` = 30;
UPDATE `waypoint_data` SET `position_z` = -267.712365 WHERE `id` = 244260 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = -268.051402 WHERE `id` = 244260 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = -269.346111 WHERE `id` = 244260 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = -269.361865 WHERE `id` = 244260 AND `point` = 26;
UPDATE `waypoint_data` SET `position_z` = -268.051402 WHERE `id` = 244260 AND `point` = 34;
UPDATE `waypoint_data` SET `position_z` = -267.492737 WHERE `id` = 244280 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = -269.581230 WHERE `id` = 244280 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = -269.679815 WHERE `id` = 244280 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = -269.679815 WHERE `id` = 244280 AND `point` = 32;
UPDATE `waypoint_data` SET `position_z` = -269.581230 WHERE `id` = 244280 AND `point` = 33;
UPDATE `waypoint_data` SET `position_z` = 40.399354 WHERE `id` = 311250 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 37.229999 WHERE `id` = 311250 AND `point` = 21;
UPDATE `waypoint_data` SET `position_z` = 45.578720 WHERE `id` = 311250 AND `point` = 22;
UPDATE `waypoint_data` SET `position_z` = 50.246328 WHERE `id` = 311250 AND `point` = 23;
UPDATE `waypoint_data` SET `position_z` = 73.483204 WHERE `id` = 311250 AND `point` = 24;
UPDATE `waypoint_data` SET `position_z` = 86.595522 WHERE `id` = 311250 AND `point` = 25;
UPDATE `waypoint_data` SET `position_z` = 97.042139 WHERE `id` = 311250 AND `point` = 26;
UPDATE `waypoint_data` SET `position_z` = 97.849606 WHERE `id` = 311250 AND `point` = 27;
UPDATE `waypoint_data` SET `position_z` = 100.355381 WHERE `id` = 311250 AND `point` = 28;
UPDATE `waypoint_data` SET `position_z` = 102.089828 WHERE `id` = 311250 AND `point` = 29;
UPDATE `waypoint_data` SET `position_z` = 114.092885 WHERE `id` = 311250 AND `point` = 30;
UPDATE `waypoint_data` SET `position_z` = 57.036969 WHERE `id` = 311250 AND `point` = 31;
UPDATE `waypoint_data` SET `position_z` = 47.615383 WHERE `id` = 311250 AND `point` = 32;
UPDATE `waypoint_data` SET `position_z` = 51.431522 WHERE `id` = 311250 AND `point` = 33;
UPDATE `waypoint_data` SET `position_z` = 48.293441 WHERE `id` = 311250 AND `point` = 34;
UPDATE `waypoint_data` SET `position_z` = 44.928036 WHERE `id` = 311250 AND `point` = 35;
UPDATE `waypoint_data` SET `position_z` = 50.383379 WHERE `id` = 311250 AND `point` = 36;
UPDATE `waypoint_data` SET `position_z` = 55.821857 WHERE `id` = 311250 AND `point` = 37;
UPDATE `waypoint_data` SET `position_z` = 74.020183 WHERE `id` = 311250 AND `point` = 38;
UPDATE `waypoint_data` SET `position_z` = 76.458381 WHERE `id` = 311250 AND `point` = 39;
UPDATE `waypoint_data` SET `position_z` = 68.135262 WHERE `id` = 311250 AND `point` = 40;
UPDATE `waypoint_data` SET `position_z` = 60.461348 WHERE `id` = 311250 AND `point` = 41;
UPDATE `waypoint_data` SET `position_z` = 52.333050 WHERE `id` = 311250 AND `point` = 42;
UPDATE `waypoint_data` SET `position_z` = 56.704697 WHERE `id` = 311250 AND `point` = 43;
UPDATE `waypoint_data` SET `position_z` = 60.452713 WHERE `id` = 311250 AND `point` = 44;
UPDATE `waypoint_data` SET `position_z` = 55.401093 WHERE `id` = 311250 AND `point` = 45;
UPDATE `waypoint_data` SET `position_z` = 55.439579 WHERE `id` = 311250 AND `point` = 46;
UPDATE `waypoint_data` SET `position_z` = 55.240690 WHERE `id` = 311250 AND `point` = 50;
UPDATE `waypoint_data` SET `position_z` = 55.027856 WHERE `id` = 311250 AND `point` = 51;
UPDATE `waypoint_data` SET `position_z` = 59.945345 WHERE `id` = 311250 AND `point` = 52;
UPDATE `waypoint_data` SET `position_z` = 52.833155 WHERE `id` = 311250 AND `point` = 53;
UPDATE `waypoint_data` SET `position_z` = 52.503118 WHERE `id` = 311250 AND `point` = 54;
UPDATE `waypoint_data` SET `position_z` = 61.317415 WHERE `id` = 311250 AND `point` = 55;
UPDATE `waypoint_data` SET `position_z` = 77.896769 WHERE `id` = 311250 AND `point` = 56;
UPDATE `waypoint_data` SET `position_z` = 67.349971 WHERE `id` = 311250 AND `point` = 57;
UPDATE `waypoint_data` SET `position_z` = 49.309658 WHERE `id` = 311250 AND `point` = 58;
UPDATE `waypoint_data` SET `position_z` = 44.252694 WHERE `id` = 311250 AND `point` = 59;
UPDATE `waypoint_data` SET `position_z` = 45.638705 WHERE `id` = 311250 AND `point` = 60;
UPDATE `waypoint_data` SET `position_z` = 51.764281 WHERE `id` = 311250 AND `point` = 61;
UPDATE `waypoint_data` SET `position_z` = 46.002496 WHERE `id` = 311250 AND `point` = 62;
UPDATE `waypoint_data` SET `position_z` = 61.849519 WHERE `id` = 311250 AND `point` = 63;
UPDATE `waypoint_data` SET `position_z` = 114.798082 WHERE `id` = 311250 AND `point` = 64;
UPDATE `waypoint_data` SET `position_z` = 104.871239 WHERE `id` = 311250 AND `point` = 65;
UPDATE `waypoint_data` SET `position_z` = 101.175250 WHERE `id` = 311250 AND `point` = 66;
UPDATE `waypoint_data` SET `position_z` = 97.415133 WHERE `id` = 311250 AND `point` = 67;
UPDATE `waypoint_data` SET `position_z` = 93.372452 WHERE `id` = 311250 AND `point` = 68;
UPDATE `waypoint_data` SET `position_z` = 85.603885 WHERE `id` = 311250 AND `point` = 69;
UPDATE `waypoint_data` SET `position_z` = 74.048159 WHERE `id` = 311250 AND `point` = 70;
UPDATE `waypoint_data` SET `position_z` = 48.312767 WHERE `id` = 311250 AND `point` = 71;
UPDATE `waypoint_data` SET `position_z` = 239.147788 WHERE `id` = 391020 AND `point` = 1;
UPDATE `waypoint_data` SET `position_z` = 240.862628 WHERE `id` = 391020 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 243.124116 WHERE `id` = 391020 AND `point` = 3;
UPDATE `waypoint_data` SET `position_z` = 244.248734 WHERE `id` = 391020 AND `point` = 4;
UPDATE `waypoint_data` SET `position_z` = 245.153342 WHERE `id` = 391020 AND `point` = 5;
UPDATE `waypoint_data` SET `position_z` = 243.848052 WHERE `id` = 391020 AND `point` = 6;
UPDATE `waypoint_data` SET `position_z` = 241.692883 WHERE `id` = 391020 AND `point` = 7;
UPDATE `waypoint_data` SET `position_z` = 239.410884 WHERE `id` = 391020 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 236.965234 WHERE `id` = 391020 AND `point` = 9;
UPDATE `waypoint_data` SET `position_z` = 234.876889 WHERE `id` = 391020 AND `point` = 10;
UPDATE `waypoint_data` SET `position_z` = 230.363077 WHERE `id` = 391020 AND `point` = 12;
UPDATE `waypoint_data` SET `position_z` = 228.200149 WHERE `id` = 391020 AND `point` = 13;
UPDATE `waypoint_data` SET `position_z` = 225.923697 WHERE `id` = 391020 AND `point` = 14;
UPDATE `waypoint_data` SET `position_z` = 226.782123 WHERE `id` = 391020 AND `point` = 20;
UPDATE `waypoint_data` SET `position_z` = 228.670782 WHERE `id` = 391020 AND `point` = 21;
UPDATE `waypoint_data` SET `position_z` = 230.528048 WHERE `id` = 391020 AND `point` = 22;
UPDATE `waypoint_data` SET `position_z` = 234.627114 WHERE `id` = 391020 AND `point` = 24;
UPDATE `waypoint_data` SET `position_z` = 236.793854 WHERE `id` = 391020 AND `point` = 25;
UPDATE `waypoint_data` SET `position_z` = 237.817889 WHERE `id` = 391020 AND `point` = 26;
UPDATE `waypoint_data` SET `position_z` = 7.982348 WHERE `id` = 1343710 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 7.982348 WHERE `id` = 1343710 AND `point` = 8;
UPDATE `waypoint_data` SET `position_z` = 7.982348 WHERE `id` = 1343770 AND `point` = 2;
UPDATE `waypoint_data` SET `position_z` = 7.982348 WHERE `id` = 1343770 AND `point` = 8;
