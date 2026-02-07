-- F-150: Custom Orc Skins - Face, Pelvis, and DK entries
-- Restores missing CharSections entries for custom orc male skins
-- Also fixes flags on worgoblin body entries to include playable bit
--
-- Flag reference:
--   17 (0x11) = standard playable (body, pelvis)
--    1 (0x01) = standard playable (face)
--    5 (0x05) = DK playable
--    8 (0x08) = NOT visible in character creation (missing playable bit)

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
VALUES (4861, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_102.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_102_Extra.blp', '', 17, 0, 11);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4941, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_103.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_103_Extra.blp', '', 17, 0, 12);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (4942, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_104.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_104_Extra.blp', '', 17, 0, 13);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (6461, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_105.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_105_Extra.blp', '', 17, 0, 14);

-- ============================================================
-- Regular Face entries (base_section=1, flags=1)
-- ============================================================
DELETE FROM charsections WHERE id BETWEEN 25001 AND 25020;

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25001, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_100.blp', '', 1, 0, 9);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25002, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_101.blp', '', 1, 0, 10);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25003, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_103.blp', '', 1, 0, 12);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25004, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_105.blp', '', 1, 0, 14);

-- ============================================================
-- Regular Pelvis entries (base_section=4, flags=17)
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25005, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_100.blp', '', '', 17, 0, 9);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25006, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_101.blp', '', '', 17, 0, 10);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25007, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_103.blp', '', '', 17, 0, 12);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25008, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_105.blp', '', '', 17, 0, 14);

-- ============================================================
-- DK Body skins (base_section=0, flags=5)
-- color_index 18-21 continues after existing DK skins at 15-17
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25009, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_100.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_100_Extra.blp', '', 5, 0, 18);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25010, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_101.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_101_Extra.blp', '', 5, 0, 19);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25011, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_103.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_103_Extra.blp', '', 5, 0, 20);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25012, 2, 0, 0, 'Character\\Orc\\Male\\OrcMaleSkin00_105.blp', 'Character\\Orc\\Male\\OrcMaleSkin00_105_Extra.blp', '', 5, 0, 21);

-- ============================================================
-- DK Face entries (base_section=1, flags=5)
-- Uses DK-specific face upper textures (1000, 1010, etc.)
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25013, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_100.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1000.blp', '', 5, 0, 18);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25014, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_101.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1010.blp', '', 5, 0, 19);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25015, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_103.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1030.blp', '', 5, 0, 20);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25016, 2, 0, 1, 'Character\\Orc\\Male\\OrcMaleFaceLower00_105.blp', 'Character\\Orc\\Male\\OrcMaleFaceUpper00_1050.blp', '', 5, 0, 21);

-- ============================================================
-- DK Pelvis entries (base_section=4, flags=5)
-- ============================================================
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25017, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_100.blp', '', '', 5, 0, 18);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25018, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_101.blp', '', '', 5, 0, 19);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25019, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_103.blp', '', '', 5, 0, 20);

INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index)
VALUES (25020, 2, 0, 4, 'Character\\Orc\\Male\\OrcMaleNakedPelvisSkin00_105.blp', '', '', 5, 0, 21);
