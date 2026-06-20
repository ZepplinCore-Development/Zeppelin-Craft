-- SQL queries generated automatically
-- Created by Spell School Immunity Balancing (F-187)

-- Target mitigation: 35%  (R = round(2.692 * level))

-- Water Elemental (510) lvl 65: immune -> 35% resist (Frost = 175)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 510;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 510 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (510, 4, 175);

-- Lieutenant Fangore (703) lvl 26: immune -> 35% resist (Shadow = 70)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 703;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 703 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (703, 5, 70);

-- Dust Devil (832) lvl 18: immune -> 35% resist (Nature = 48)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 832;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 832 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (832, 3, 48);

-- Lost Whelp (1043) lvl 24: immune -> 35% resist (Shadow = 65)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 1043;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 1043 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (1043, 5, 65);

-- Balgaras the Foul (1364) lvl 34: immune -> 35% resist (Shadow = 92)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 1364;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 1364 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (1364, 5, 92);

-- Chieftain Nek''rosh (2091) lvl 32: immune -> 35% resist (Fire = 86)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2091;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2091 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2091, 2, 86);

-- Garneg Charskull (2108) lvl 29: immune -> 35% resist (Fire = 78)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2108;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2108 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2108, 2, 78);

-- Stone Fury (2258) lvl 37: immune -> 35% resist (Nature = 100)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2258;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2258 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2258, 3, 100);

-- Rumbling Exile (2592) lvl 38: immune -> 35% resist (Nature = 102)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2592;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2592 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2592, 3, 102);

-- Scorched Guardian (2726) lvl 44: immune -> 35% resist (Fire = 118)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2726;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2726 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2726, 2, 118);

-- Greater Rock Elemental (2736) lvl 43: immune -> 35% resist (Nature = 116)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2736;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2736 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2736, 3, 116);

-- Rumbler (2752) lvl 45: immune -> 35% resist (Nature = 121)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2752;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2752 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2752, 3, 121);

-- Cresting Exile (2761) lvl 38: immune -> 35% resist (Frost = 102)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2761;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2761 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2761, 4, 102);

-- Thundering Exile (2762) lvl 38: immune -> 35% resist (Nature = 102)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2762;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2762 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2762, 3, 102);

-- Vengeful Surge (2776) lvl 40: immune -> 35% resist (Frost = 108)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2776;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2776 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2776, 4, 108);

-- Summoned Guardian (2794) lvl 38: immune -> 35% resist (Frost = 102)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 2794;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 2794 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (2794, 4, 102);

-- Shadowfang Whitescalp (3851) lvl 18: immune -> 35% resist (Frost = 48)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 3851;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 3851 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (3851, 4, 48);

-- Bleak Worg (3861) lvl 18: immune -> 35% resist (Frost = 48)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 3861;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 3861 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (3861, 4, 48);

-- Minor Water Guardian (3950) lvl 1: immune -> 35% resist (Frost = 3)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 3950;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 3950 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (3950, 4, 3);

-- Enraged Stone Spirit (4034) lvl 24: immune -> 35% resist (Nature = 65)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4034;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4034 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4034, 3, 65);

-- Furious Stone Spirit (4035) lvl 26: immune -> 35% resist (Nature = 70)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4035;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4035 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4035, 3, 70);

-- Brimgore (4339) lvl 45: immune -> 35% resist (Fire = 121)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4339;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4339 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4339, 2, 121);

-- Rok''Alim the Pounder (4499) lvl 30: immune -> 35% resist (Nature = 81)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4499;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4499 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4499, 3, 81);

-- Wind Howler (4526) lvl 26: immune -> 35% resist (Nature = 70)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4526;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4526 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4526, 3, 70);

-- Lesser Infernal (4676) lvl 36: immune -> 35% resist (Fire = 97)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4676;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4676 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4676, 2, 97);

-- Aku''mai Servant (4978) lvl 26: immune -> 35% resist (Frost = 70)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 4978;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 4978 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (4978, 4, 70);

-- Sea Spray (5462) lvl 48: immune -> 35% resist (Frost = 129)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5462;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5462 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5462, 4, 129);

-- Corrupt Minor Manifestation of Water (5894) lvl 22: immune -> 35% resist (Frost = 59)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5894;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5894 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5894, 4, 59);

-- Minor Manifestation of Water (5895) lvl 22: immune -> 35% resist (Frost = 59)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5895;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5895 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5895, 4, 59);

-- Corrupt Water Spirit (5897) lvl 20: immune -> 35% resist (Frost = 54)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5897;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5897 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5897, 4, 54);

-- Air Spirit (5898) lvl 30: immune -> 35% resist (Nature = 81)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5898;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5898 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5898, 3, 81);

-- Minor Manifestation of Air (5902) lvl 1: immune -> 35% resist (Nature = 3)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 5902;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 5902 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (5902, 3, 3);

-- Aqua Guardian (6047) lvl 22: immune -> 35% resist (Frost = 59)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6047;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6047 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6047, 4, 59);

-- Searing Infernal (6073) lvl 30: immune -> 35% resist (Fire = 81)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6073;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6073 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6073, 2, 81);

-- Irradiated Horror (6220) lvl 28: immune -> 35% resist (Frost = 75)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6220;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6220 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6220, 4, 75);

-- Cyclonian (6239) lvl 40: immune -> 35% resist (Nature = 108)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6239;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6239 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6239, 3, 108);

-- Rift Spawn (6492) lvl 16: immune -> 35% resist (Arcane = 43)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6492;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6492 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6492, 6, 43);

-- Mana Surge (6550) lvl 40: immune -> 35% resist (Arcane = 108)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6550;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6550 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6550, 6, 108);

-- Water Spirit (6748) lvl 19: immune -> 35% resist (Frost = 51)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 6748;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 6748 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (6748, 4, 51);

-- Toxic Horror (7132) lvl 54: immune -> 35% resist (Frost = 145)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7132;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7132 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7132, 4, 145);

-- Infernal Bodyguard (7135) lvl 54: immune -> 35% resist (Fire = 145)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7135;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7135 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7135, 2, 145);

-- Infernal Sentry (7136) lvl 52: immune -> 35% resist (Fire = 140)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7136;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7136 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7136, 2, 140);

-- Immolatus (7137) lvl 56: immune -> 35% resist (Fire = 151)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7137;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7137 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7137, 2, 151);

-- Frostmaul Giant (7428) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7428;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7428 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7428, 4, 162);

-- Frostmaul Preserver (7429) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7429;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7429 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7429, 4, 162);

-- Ilifar (7734) lvl 60: immune -> 35% resist (Fire/Frost/Shadow/Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7734;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7734 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7734, 2, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7734 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7734, 4, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7734 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7734, 5, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7734 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7734, 6, 162);

-- Felcular (7735) lvl 60: immune -> 35% resist (Fire/Frost/Shadow/Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 7735;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7735 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7735, 2, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7735 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7735, 4, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7735 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7735, 5, 162);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 7735 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (7735, 6, 162);

-- Blighted Surge (8519) lvl 54: immune -> 35% resist (Frost = 145)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8519;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8519 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8519, 4, 145);

-- Plague Ravager (8520) lvl 56: immune -> 35% resist (Frost = 151)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8520;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8520 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8520, 4, 151);

-- Blighted Horror (8521) lvl 56: immune -> 35% resist (Frost = 151)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8521;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8521 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8521, 4, 151);

-- Plague Monstrosity (8522) lvl 58: immune -> 35% resist (Frost = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8522;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8522 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8522, 4, 156);

-- Angered Infernal (8608) lvl 52: immune -> 35% resist (Fire = 140)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8608;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8608 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8608, 2, 140);

-- Infernal Servant (8616) lvl 55: immune -> 35% resist (Fire = 148)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8616;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8616 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8616, 2, 148);

-- Gusting Vortex (8667) lvl 44: immune -> 35% resist (Nature = 118)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8667;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8667 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8667, 3, 118);

-- Muck Splash (8837) lvl 48: immune -> 35% resist (Frost = 129)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 8837;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 8837 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (8837, 4, 129);

-- Swirling Vortex (9377) lvl 34: immune -> 35% resist (Nature = 92)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9377;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9377 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9377, 3, 92);

-- Living Storm (9397) lvl 48: immune -> 35% resist (Nature = 129)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9397;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9397 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9397, 3, 129);

-- Aquementas (9453) lvl 54: immune -> 35% resist (Frost = 145)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9453;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9453 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9453, 4, 145);

-- Kashoch the Reaver (10198) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 10198;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 10198 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (10198, 4, 162);

-- Eck''alom (10642) lvl 27: immune -> 35% resist (Frost = 73)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 10642;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 10642 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (10642, 4, 73);

-- Manifestation of Water (11256) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11256;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11256 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11256, 4, 162);

-- Arcane Aberration (11480) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11480;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11480 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11480, 6, 162);

-- Mana Remnant (11483) lvl 58: immune -> 35% resist (Arcane = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11483;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11483 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11483, 6, 156);

-- Residual Monstrosity (11484) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11484;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11484 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11484, 6, 162);

-- Whirlwind Ripper (11576) lvl 33: immune -> 35% resist (Nature = 89)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11576;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11576 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11576, 3, 89);

-- Whirlwind Stormwalker (11577) lvl 36: immune -> 35% resist (Nature = 97)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11577;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11577 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11577, 3, 97);

-- Whirlwind Shredder (11578) lvl 33: immune -> 35% resist (Nature = 89)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11578;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11578 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11578, 3, 89);

-- Dust Stormer (11744) lvl 56: immune -> 35% resist (Nature = 151)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11744;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11744 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11744, 3, 151);

-- Cyclone Warrior (11745) lvl 58: immune -> 35% resist (Nature = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11745;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11745 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11745, 3, 156);

-- Shadowshard Rumbler (11777) lvl 40: immune -> 35% resist (Nature = 108)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11777;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11777 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11777, 3, 108);

-- Shadowshard Smasher (11778) lvl 42: immune -> 35% resist (Nature = 113)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11778;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11778 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11778, 3, 113);

-- Shadowshard Thunderer (11779) lvl 38: immune -> 35% resist (Nature = 102)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11779;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11779 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11779, 3, 102);

-- Tsunaman (11862) lvl 25: immune -> 35% resist (Frost = 67)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 11862;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 11862 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (11862, 4, 67);

-- Tideress (12759) lvl 27: immune -> 35% resist (Frost = 73)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 12759;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 12759 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (12759, 4, 73);

-- Duke Hydraxis (13278) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13278;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13278 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13278, 4, 162);

-- Discordant Surge (13279) lvl 56: immune -> 35% resist (Frost = 151)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13279;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13279 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13279, 4, 151);

-- Hydraxian Honor Guard (13322) lvl 58: immune -> 35% resist (Frost = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13322;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13322 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13322, 4, 156);

-- Noxxion''s Spawn (13456) lvl 46: immune -> 35% resist (Frost = 124)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13456;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13456 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13456, 4, 124);

-- Noxxious Scion (13696) lvl 46: immune -> 35% resist (Frost = 124)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13696;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13696 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13696, 4, 124);

-- Noxxious Essence (13736) lvl 46: immune -> 35% resist (Frost = 124)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 13736;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 13736 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (13736, 4, 124);

-- Seeker Aqualon (14269) lvl 21: immune -> 35% resist (Frost = 57)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14269;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14269 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14269, 4, 57);

-- Hydroling (14350) lvl 57: immune -> 35% resist (Frost = 153)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14350;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14350 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14350, 4, 153);

-- Mana Burst (14397) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14397;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14397 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14397, 6, 162);

-- Arcane Torrent (14399) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14399;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14399 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14399, 3, 162);

-- Arcane Feedback (14400) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14400;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14400 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14400, 3, 162);

-- Huricanian (14478) lvl 58: immune -> 35% resist (Nature = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14478;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14478 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14478, 3, 156);

-- Corrupted Infernal (14668) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 14668;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 14668 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (14668, 2, 162);

-- Crimson Templar (15209) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 15209;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 15209 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (15209, 2, 162);

-- Azure Templar (15211) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 15211;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 15211 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (15211, 4, 162);

-- Greater Earth Elemental (15352) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 15352;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 15352 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (15352, 3, 162);

-- Greater Fire Elemental (15438) lvl 74: immune -> 35% resist (Fire = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 15438;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 15438 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (15438, 2, 199);

-- Mana Fiend (15527) lvl 58: immune -> 35% resist (Arcane = 156)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 15527;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 15527 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (15527, 6, 156);

-- Magma Lord Bokk (16043) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 16043;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16043 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16043, 3, 162);

-- Mana Feeder (16491) lvl 70: immune -> 35% resist (Holy/Fire/Nature/Frost/Shadow/Arcane = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 16491;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 1;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 1, 188);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 2, 188);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 3, 188);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 4, 188);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 5, 188);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16491 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16491, 6, 188);

-- Mana Warp (16530) lvl 70: immune -> 35% resist (Arcane = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 16530;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16530 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16530, 6, 188);

-- Crazed Water Spirit (16570) lvl 76: immune -> 35% resist (Frost = 205)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 16570;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16570 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16570, 4, 205);

-- Eldinarcus (16854) lvl 11: immune -> 35% resist (Arcane = 30)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 16854;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 16854 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (16854, 6, 30);

-- Aeranas (17085) lvl 63: immune -> 35% resist (Nature = 170)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17085;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17085 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17085, 3, 170);

-- Lake Spirit (17153) lvl 64: immune -> 35% resist (Frost = 172)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17153;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17153 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17153, 4, 172);

-- Muck Spawn (17154) lvl 65: immune -> 35% resist (Nature = 175)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17154;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17154 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17154, 3, 175);

-- Lake Surger (17155) lvl 66: immune -> 35% resist (Frost = 178)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17155;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17155 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17155, 4, 178);

-- Tortured Earth Spirit (17156) lvl 64: immune -> 35% resist (Nature = 172)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17156;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17156 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17156, 3, 172);

-- Shattered Rumbler (17157) lvl 66: immune -> 35% resist (Nature = 178)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17157;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17157 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17157, 3, 178);

-- Dust Howler (17158) lvl 64: immune -> 35% resist (Nature = 172)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17158;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17158 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17158, 3, 172);

-- Storm Rager (17159) lvl 66: immune -> 35% resist (Nature = 178)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17159;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17159 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17159, 3, 178);

-- Living Cyclone (17160) lvl 66: immune -> 35% resist (Nature = 178)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17160;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17160 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17160, 3, 178);

-- Conjured Elemental (17167) lvl 73: immune -> 35% resist (Frost = 197)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17167;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17167 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17167, 4, 197);

-- Naias (17207) lvl 37: immune -> 35% resist (Frost = 100)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17207;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17207 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17207, 4, 100);

-- Fiendish Imp (17267) lvl 70: immune -> 35% resist (Fire = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17267;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17267 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17267, 2, 188);

-- Fouled Water Spirit (17358) lvl 18: immune -> 35% resist (Frost = 48)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 17358;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 17358 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (17358, 4, 48);

-- Enraged Crusher (18062) lvl 66: immune -> 35% resist (Nature = 178)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18062;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18062 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18062, 3, 178);

-- Minion of Gurok (18181) lvl 64: immune -> 35% resist (Nature = 172)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18181;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18181 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18181, 3, 172);

-- Mana Wraith (18864) lvl 68: immune -> 35% resist (Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18864;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18864 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18864, 6, 183);

-- Warp Aberration (18865) lvl 68: immune -> 35% resist (Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18865;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18865 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18865, 6, 183);

-- Mageslayer (18866) lvl 68: immune -> 35% resist (Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18866;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18866 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18866, 6, 183);

-- Mana Seeker (18867) lvl 68: immune -> 35% resist (Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 18867;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 18867 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (18867, 6, 183);

-- Syth Fire Elemental (19203) lvl 69: immune -> 35% resist (Fire = 186)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 19203;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 19203 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (19203, 2, 186);

-- Syth Frost Elemental (19204) lvl 69: immune -> 35% resist (Frost = 186)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 19204;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 19204 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (19204, 4, 186);

-- Syth Arcane Elemental (19205) lvl 69: immune -> 35% resist (Arcane = 186)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 19205;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 19205 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (19205, 6, 186);

-- Syth Shadow Elemental (19206) lvl 69: immune -> 35% resist (Shadow = 186)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 19206;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 19206 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (19206, 5, 186);

-- Abyssal Flamebringer (19973) lvl 70: immune -> 35% resist (Fire = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 19973;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 19973 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (19973, 2, 188);

-- Warp Monstrosity (20516) lvl 68: immune -> 35% resist (Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 20516;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 20516 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (20516, 6, 183);

-- Syth Arcane Elemental (1) (20702) lvl 72: immune -> 35% resist (Arcane = 194)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 20702;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 20702 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (20702, 6, 194);

-- Syth Fire Elemental (1) (20703) lvl 72: immune -> 35% resist (Fire = 194)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 20703;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 20703 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (20703, 2, 194);

-- Syth Frost Elemental (1) (20704) lvl 72: immune -> 35% resist (Frost = 194)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 20704;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 20704 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (20704, 4, 194);

-- Syth Shadow Elemental (1) (20705) lvl 72: immune -> 35% resist (Shadow = 194)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 20705;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 20705 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (20705, 5, 194);

-- Dreadwing (21032) lvl 68: immune -> 35% resist (Shadow/Arcane = 183)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 21032;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21032 AND `School` = 5;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21032, 5, 183);
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21032 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21032, 6, 183);

-- Corrupted Water Elemental (21428) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 21428;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21428 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21428, 4, 188);

-- Corrupted Fire Elemental (21706) lvl 70: immune -> 35% resist (Fire = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 21706;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21706 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21706, 2, 188);

-- Corrupted Air Elemental (21707) lvl 70: immune -> 35% resist (Nature = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 21707;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21707 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21707, 3, 188);

-- Skettis Surger (21728) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 21728;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 21728 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (21728, 4, 188);

-- Pure Spawn of Hydross (22035) lvl 71: immune -> 35% resist (Frost = 191)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 22035;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 22035 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (22035, 4, 191);

-- Tainted Spawn of Hydross (22036) lvl 71: immune -> 35% resist (Nature = 191)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 22036;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 22036 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (22036, 3, 191);

-- Crashing Wave-Spirit (22309) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 22309;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 22309 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (22309, 4, 188);

-- Storming Wind-Ripper (22310) lvl 70: immune -> 35% resist (Arcane = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 22310;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 22310 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (22310, 6, 188);

-- Incandescent Fel Spark (22323) lvl 70: immune -> 35% resist (Fire = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 22323;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 22323 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (22323, 2, 188);

-- Talonsworn Forest-Rager (23029) lvl 72: immune -> 35% resist (Nature = 194)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 23029;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 23029 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (23029, 3, 194);

-- Iceshard Elemental (24228) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 24228;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 24228 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (24228, 4, 188);

-- Steam Rager (24601) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 24601;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 24601 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (24601, 4, 188);

-- Scalder (25226) lvl 71: immune -> 35% resist (Frost = 191)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25226;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25226 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25226, 4, 191);

-- Raging Boiler (25417) lvl 70: immune -> 35% resist (Fire = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25417;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25417 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25417, 2, 188);

-- Rocknar (25514) lvl 71: immune -> 35% resist (Frost = 191)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25514;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25514 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25514, 4, 191);

-- Frozen Elemental (25715) lvl 70: immune -> 35% resist (Frost = 188)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25715;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25715 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25715, 4, 188);

-- Ahunite Hailstone (25755) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25755;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25755 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25755, 4, 215);

-- Ahunite Coldwave (25756) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25756;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25756 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25756, 4, 215);

-- Ahunite Frostwind (25757) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 25757;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 25757 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (25757, 4, 215);

-- Frostwave Lieutenant (26116) lvl 22: immune -> 35% resist (Frost = 59)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26116;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26116 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26116, 4, 59);

-- Hailstone Lieutenant (26178) lvl 32: immune -> 35% resist (Frost = 86)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26178;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26178 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26178, 4, 86);

-- Chillwind Lieutenant (26204) lvl 43: immune -> 35% resist (Frost = 116)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26204;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26204 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26204, 4, 116);

-- Frigid Lieutenant (26214) lvl 51: immune -> 35% resist (Frost = 137)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26214;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26214 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26214, 4, 137);

-- Glacial Lieutenant (26215) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26215;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26215 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26215, 4, 162);

-- Glacial Templar (26216) lvl 69: immune -> 35% resist (Frost = 186)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26216;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26216 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26216, 4, 186);

-- Crystalline Ice Elemental (26316) lvl 74: immune -> 35% resist (Frost = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26316;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26316 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26316, 4, 199);

-- Ahunite Coldwave (1) (26340) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26340;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26340 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26340, 4, 215);

-- Ahunite Frostwind (1) (26341) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26341;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26341 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26341, 4, 215);

-- Ahunite Hailstone (1) (26342) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26342;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26342 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26342, 4, 215);

-- Arcanimus (26370) lvl 73: immune -> 35% resist (Arcane = 197)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26370;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26370 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26370, 6, 197);

-- Lightning Sentry (26407) lvl 74: immune -> 35% resist (Nature = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 26407;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 26407 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (26407, 3, 199);

-- Frozen Earth (28411) lvl 76: immune -> 35% resist (Nature = 205)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 28411;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 28411 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (28411, 3, 205);

-- Storming Vortex (28547) lvl 80: immune -> 35% resist (Nature = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 28547;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 28547 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (28547, 3, 215);

-- Unbound Firestorm (28584) lvl 80: immune -> 35% resist (Fire = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 28584;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 28584 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (28584, 2, 215);

-- Slag (28585) lvl 79: immune -> 35% resist (Nature = 213)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 28585;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 28585 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (28585, 3, 213);

-- Cyclone (28825) lvl 80: immune -> 35% resist (Nature = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 28825;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 28825 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (28825, 3, 215);

-- Bound Fire Elemental (30416) lvl 74: immune -> 35% resist (Fire = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30416;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30416 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30416, 2, 199);

-- Bound Air Elemental (30418) lvl 74: immune -> 35% resist (Nature = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30418;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30418 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30418, 3, 199);

-- Bound Water Elemental (30419) lvl 74: immune -> 35% resist (Frost = 199)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30419;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30419 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30419, 4, 199);

-- Glacial Spirit (30846) lvl 80: immune -> 35% resist (Frost = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30846;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30846 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30846, 4, 215);

-- Raging Flame (30847) lvl 80: immune -> 35% resist (Fire = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30847;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30847 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30847, 2, 215);

-- Whispering Wind (30848) lvl 80: immune -> 35% resist (Arcane = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30848;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30848 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30848, 6, 215);

-- Cyclone (1) (30965) lvl 80: immune -> 35% resist (Nature = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30965;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30965 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30965, 3, 215);

-- Slag (1) (30970) lvl 80: immune -> 35% resist (Nature = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30970;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30970 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30970, 3, 215);

-- Storming Vortex (1) (30979) lvl 80: immune -> 35% resist (Nature = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30979;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30979 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30979, 3, 215);

-- Unbound Firestorm (1) (30983) lvl 80: immune -> 35% resist (Fire = 215)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 30983;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 30983 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (30983, 2, 215);

-- Bound Air Elemental (1) (31452) lvl 81: immune -> 35% resist (Nature = 218)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 31452;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 31452 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (31452, 3, 218);

-- Bound Fire Elemental (1) (31453) lvl 81: immune -> 35% resist (Fire = 218)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 31453;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 31453 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (31453, 2, 218);

-- Bound Water Elemental (1) (31454) lvl 81: immune -> 35% resist (Frost = 218)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 31454;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 31454 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (31454, 4, 218);

-- Water Elemental (37994) lvl 63: immune -> 35% resist (Frost = 170)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 37994;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 37994 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (37994, 4, 170);

-- Heroic Bleak Worg (9100300) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100300;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100300 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100300, 4, 162);

-- Heroic Shadowfang Whitescalp (9100311) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100311;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100311 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100311, 4, 162);

-- Mythic Bleak Worg (9100334) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100334;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100334 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100334, 4, 162);

-- Mythic Shadowfang Whitescalp (9100345) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100345;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100345 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100345, 4, 162);

-- Heroic Aku''mai Servant (9100510) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100510;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100510 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100510, 4, 162);

-- Heroic Aqua Guardian (9100529) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100529;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100529 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100529, 4, 162);

-- Mythic Aku''mai Servant (9100544) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100544;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100544 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100544, 4, 162);

-- Mythic Aqua Guardian (9100563) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100563;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100563 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100563, 4, 162);

-- Heroic Irradiated Horror (9100610) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100610;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100610 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100610, 4, 162);

-- Mythic Irradiated Horror (9100648) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100648;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100648 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100648, 4, 162);

-- Heroic Wind Howler (9100731) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100731;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100731 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100731, 3, 162);

-- Mythic Wind Howler (9100774) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9100774;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9100774 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9100774, 3, 162);

-- Heroic Noxxious Scion (9101235) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9101235;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9101235 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9101235, 4, 162);

-- Heroic Noxxion''s Spawn (9101236) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9101236;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9101236 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9101236, 4, 162);

-- Mythic Noxxious Scion (9101276) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9101276;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9101276 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9101276, 4, 162);

-- Mythic Noxxion''s Spawn (9101277) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9101277;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9101277 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9101277, 4, 162);

-- Heroic Greater Fire Elemental (9102000) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102000;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102000 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102000, 2, 162);

-- Mythic Greater Fire Elemental (9102059) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102059;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102059 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102059, 2, 162);

-- Heroic Greater Fire Elemental (9102223) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102223;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102223 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102223, 2, 162);

-- Mythic Greater Fire Elemental (9102311) lvl 60: immune -> 35% resist (Fire = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102311;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102311 AND `School` = 2;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102311, 2, 162);

-- Heroic Arcane Aberration (9102414) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102414;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102414 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102414, 6, 162);

-- Heroic Arcane Torrent (9102415) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102415;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102415 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102415, 3, 162);

-- Heroic Residual Monstrosity (9102418) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102418;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102418 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102418, 6, 162);

-- Heroic Mana Remnant (9102428) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102428;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102428 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102428, 6, 162);

-- Heroic Arcane Feedback (9102489) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102489;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102489 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102489, 3, 162);

-- Heroic Mana Burst (9102491) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102491;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102491 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102491, 6, 162);

-- Heroic Hydroling (9102495) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102495;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102495 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102495, 4, 162);

-- Mythic Arcane Aberration (9102511) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102511;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102511 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102511, 6, 162);

-- Mythic Arcane Torrent (9102512) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102512;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102512 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102512, 3, 162);

-- Mythic Residual Monstrosity (9102515) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102515;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102515 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102515, 6, 162);

-- Mythic Mana Remnant (9102525) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102525;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102525 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102525, 6, 162);

-- Mythic Arcane Feedback (9102586) lvl 60: immune -> 35% resist (Nature = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102586;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102586 AND `School` = 3;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102586, 3, 162);

-- Mythic Mana Burst (9102588) lvl 60: immune -> 35% resist (Arcane = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102588;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102588 AND `School` = 6;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102588, 6, 162);

-- Mythic Hydroling (9102592) lvl 60: immune -> 35% resist (Frost = 162)
UPDATE `creature_template` SET `CreatureImmunitiesId` = 0 WHERE `entry` = 9102592;
DELETE FROM `creature_template_resistance` WHERE `CreatureID` = 9102592 AND `School` = 4;
INSERT INTO `creature_template_resistance` (`CreatureID`, `School`, `Resistance`) VALUES (9102592, 4, 162);

