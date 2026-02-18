-- F-150: Custom Orc Skins - Face, Pelvis, and DK entries
-- Restores missing CharSections entries for custom orc male skins
-- Also fixes flags on worgoblin body entries to include playable bit
--
-- Flag reference:
--   17 (0x11) = standard playable (body, pelvis)
--    1 (0x01) = standard playable (face)
--    5 (0x05) = DK playable
--    8 (0x08) = NOT visible in character creation (missing playable bit)
--
-- Custom skin color_index mapping:
--   Regular: 9=100, 10=101, 11=102, 12=103, 13=104, 14=105
--   DK:      18=100, 19=101, 20=103, 21=105

-- ============================================================
-- Fix existing worgoblin body entries (base_section=0)
-- Change flags from 8 to 17 so they appear in character creation
-- ============================================================
DELETE FROM charsections WHERE id IN (4641, 4642, 4861, 4941, 4942, 6461);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4641, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_100.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_100_Extra.blp', '', 17, 0, 9);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4642, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_101.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_101_Extra.blp', '', 17, 0, 10);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4861, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_102.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_102_Extra.blp', '', 8, 0, 11);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4941, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_103.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_103_Extra.blp', '', 17, 0, 12);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4942, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_104.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_104_Extra.blp', '', 8, 0, 13);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (6461, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_105.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_105_Extra.blp', '', 17, 0, 14);

-- ============================================================
-- Regular Face entries (base_section=1, flags=1)
-- Types 0-8 for each custom skin so faces work on all selections
-- ============================================================
DELETE FROM charsections WHERE id BETWEEN 25001 AND 25100;

-- color_index 9 (skin 100) - all 9 face types
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25001, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 0, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25002, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 1, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25003, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 2, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25004, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 3, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25005, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 4, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25006, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 5, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25007, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 6, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25008, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 7, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25009, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 8, 9);

-- color_index 10 (skin 101) - all 9 face types
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25010, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 0, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25011, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 1, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25012, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 2, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25013, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 3, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25014, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 4, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25015, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 5, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25016, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 6, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25017, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 7, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25018, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 8, 10);

-- color_index 12 (skin 103) - all 9 face types
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25019, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 0, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25020, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 1, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25021, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 2, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25022, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 3, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25023, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 4, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25024, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 5, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25025, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 6, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25026, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 7, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25027, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 8, 12);

-- color_index 14 (skin 105) - all 9 face types
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25028, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 0, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25029, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 1, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25030, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 2, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25031, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 3, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25032, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 4, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25033, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 5, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25034, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 6, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25035, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 7, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25036, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 8, 14);

-- ============================================================
-- Regular Pelvis entries (base_section=4, flags=17)
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25037, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_100.blp', '', '', 17, 0, 9);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25038, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_101.blp', '', '', 17, 0, 10);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25039, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_103.blp', '', '', 17, 0, 12);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25040, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_105.blp', '', '', 17, 0, 14);

-- ============================================================
-- DK Body skins (base_section=0, flags=5)
-- color_index 18-21 continues after existing DK skins at 15-17
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25041, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_100.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_100_Extra.blp', '', 5, 0, 18);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25042, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_101.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_101_Extra.blp', '', 5, 0, 19);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25043, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_103.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_103_Extra.blp', '', 5, 0, 20);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25044, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_105.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_105_Extra.blp', '', 5, 0, 21);

-- ============================================================
-- DK Face entries (base_section=1, flags=5)
-- Types 0, 1, 5 matching worgoblin DK face pattern
-- Uses DK-specific face upper textures (1000, 1010, etc.)
-- ============================================================

-- color_index 18 (DK skin 100) - types 0, 1, 5
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25045, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 0, 18);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25046, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 1, 18);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25047, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 5, 18);

-- color_index 19 (DK skin 101) - types 0, 1, 5
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25048, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 0, 19);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25049, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 1, 19);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25050, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 5, 19);

-- color_index 20 (DK skin 103) - types 0, 1, 5
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25051, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 0, 20);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25052, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 1, 20);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25053, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 5, 20);

-- color_index 21 (DK skin 105) - types 0, 1, 5
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25054, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 0, 21);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25055, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 1, 21);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25056, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 5, 21);

-- ============================================================
-- DK Pelvis entries (base_section=4, flags=5)
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25057, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_100.blp', '', '', 5, 0, 18);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25058, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_101.blp', '', '', 5, 0, 19);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25059, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_103.blp', '', '', 5, 0, 20);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25060, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_105.blp', '', '', 5, 0, 21);
