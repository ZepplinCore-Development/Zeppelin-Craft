-- F-150: Custom Orc Skins - Face, Pelvis, and DK entries
-- Restores missing CharSections entries for custom orc male skins
-- Also fixes flags on worgoblin body entries to include playable bit
-- Also expands standard DK skins (CI 15-17) from 3 face entries to 9
--
-- Flag reference:
--   17 (0x11) = standard playable (body, pelvis)
--    1 (0x01) = standard playable (face)
--    5 (0x05) = DK playable
--    8 (0x08) = NOT visible in character creation (missing playable bit)
--
-- Custom skin color_index mapping:
--   9=100, 10=101, 11=102, 12=103, 13=104, 14=105
--
-- DK face pattern: ALL DK skins use types 9-17 (9 entries per skin, flags=5)
--   Stock CI 0-8: 9 unique BLPs per skin (already correct)
--   Standard DK CI 15-17 (BLP suffix _09,_10,_11): 3 BLPs cycled across 9 slots
--   Custom CI 9,10,12,14 (BLP suffix _100,_101,_103,_105): 1 BLP repeated across 9 slots

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
-- Single BLP repeated across all 9 face types per skin
-- ============================================================
DELETE FROM charsections WHERE id BETWEEN 25001 AND 25200;

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
-- DK Face entries for custom skins (base_section=1, flags=5)
-- Types 9-17 matching stock DK pattern (CI 0-8 uses types 9-17)
-- Same BLP reused across all 9 face types per skin color
-- ============================================================

-- color_index 9 (DK skin 100) - types 9-17
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25041, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 9, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25042, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 10, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25043, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 11, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25044, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 12, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25045, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 13, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25046, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 14, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25047, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 15, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25048, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 16, 9);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25049, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 17, 9);

-- color_index 10 (DK skin 101) - types 9-17
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25050, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 9, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25051, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 10, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25052, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 11, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25053, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 12, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25054, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 13, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25055, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 14, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25056, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 15, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25057, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 16, 10);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25058, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 17, 10);

-- color_index 12 (DK skin 103) - types 9-17
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25059, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 9, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25060, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 10, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25061, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 11, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25062, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 12, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25063, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 13, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25064, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 14, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25065, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 15, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25066, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 16, 12);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25067, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 17, 12);

-- color_index 14 (DK skin 105) - types 9-17
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25068, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 9, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25069, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 10, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25070, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 11, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25071, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 12, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25072, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 13, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25073, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 14, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25074, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 15, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25075, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 16, 14);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25076, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 17, 14);

-- ============================================================
-- DK Face entries for standard DK skins (base_section=1, flags=5)
-- Stock has CI 15-17 with only 3 entries at types 0,1,5.
-- Replace with 9 entries at types 9-17 to match the worgoblin
-- pattern used by CI 0-8. Cycle the 3 available BLPs across 9 slots.
-- ============================================================
DELETE FROM charsections WHERE id IN (10618, 10619, 10620, 10623, 10624, 10625, 10628, 10629, 10630);

-- color_index 15 (DK skin _09) - types 9-17, cycling BLPs: 00, 01, 05
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25077, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_09.blp', '', 5, 9, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25078, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_09.blp', '', 5, 10, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25079, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_09.blp', '', 5, 11, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25080, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_09.blp', '', 5, 12, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25081, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_09.blp', '', 5, 13, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25082, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_09.blp', '', 5, 14, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25083, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_09.blp', '', 5, 15, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25084, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_09.blp', '', 5, 16, 15);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25085, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_09.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_09.blp', '', 5, 17, 15);

-- color_index 16 (DK skin _10) - types 9-17, cycling BLPs: 00, 01, 05
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25086, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_10.blp', '', 5, 9, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25087, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_10.blp', '', 5, 10, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25088, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_10.blp', '', 5, 11, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25089, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_10.blp', '', 5, 12, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25090, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_10.blp', '', 5, 13, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25091, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_10.blp', '', 5, 14, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25092, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_10.blp', '', 5, 15, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25093, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_10.blp', '', 5, 16, 16);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25094, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_10.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_10.blp', '', 5, 17, 16);

-- color_index 17 (DK skin _11) - types 9-17, cycling BLPs: 00, 01, 05
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25095, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_11.blp', '', 5, 9, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25096, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_11.blp', '', 5, 10, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25097, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_11.blp', '', 5, 11, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25098, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_11.blp', '', 5, 12, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25099, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_11.blp', '', 5, 13, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25100, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_11.blp', '', 5, 14, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25101, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_11.blp', '', 5, 15, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25102, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower01_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper01_11.blp', '', 5, 16, 17);
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25103, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower05_11.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper05_11.blp', '', 5, 17, 17);
