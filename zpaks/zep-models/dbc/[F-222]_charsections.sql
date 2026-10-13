-- F-222: Gnome female skin colours 5 and 6 (GnomeFemaleSkin00_100 / _101) selectable at character create
-- Stock rows 4922/4923 are NPC-only (flags 8) and had no face or underwear rows.
-- Textures (zep-models source-assets, Character/Gnome/Female):
--   face 0      = the face already painted in the skin atlas (keeps _100's face paint)
--   faces 1-13  = colour 2 (for _100) / colour 4 (for _101) faces recoloured to the tone; eyes untouched
--   underwear   = recoloured the same way
-- Flags: 17 body/underwear, 1 faces 0-6, 5 faces 7-13 (DK-only, as for colours 0-4).
-- Rows 4922/4923 texture_2 (_Extra) is set by the HD pack imports; this file owns only their flags.

UPDATE charsections SET flags = 17 WHERE id = 4922;
UPDATE charsections SET flags = 17 WHERE id = 4923;

-- colour 5 (_100)
DELETE FROM charsections WHERE id = 25104;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25104, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower00_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper00_100.blp', '', 1, 0, 5);
DELETE FROM charsections WHERE id = 25105;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25105, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower01_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper01_100.blp', '', 1, 1, 5);
DELETE FROM charsections WHERE id = 25106;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25106, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower02_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper02_100.blp', '', 1, 2, 5);
DELETE FROM charsections WHERE id = 25107;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25107, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower03_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper03_100.blp', '', 1, 3, 5);
DELETE FROM charsections WHERE id = 25108;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25108, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower04_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper04_100.blp', '', 1, 4, 5);
DELETE FROM charsections WHERE id = 25109;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25109, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower05_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper05_100.blp', '', 1, 5, 5);
DELETE FROM charsections WHERE id = 25110;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25110, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower06_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper06_100.blp', '', 1, 6, 5);
DELETE FROM charsections WHERE id = 25111;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25111, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower07_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper07_100.blp', '', 5, 7, 5);
DELETE FROM charsections WHERE id = 25112;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25112, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower08_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper08_100.blp', '', 5, 8, 5);
DELETE FROM charsections WHERE id = 25113;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25113, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower09_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper09_100.blp', '', 5, 9, 5);
DELETE FROM charsections WHERE id = 25114;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25114, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower10_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper10_100.blp', '', 5, 10, 5);
DELETE FROM charsections WHERE id = 25115;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25115, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower11_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper11_100.blp', '', 5, 11, 5);
DELETE FROM charsections WHERE id = 25116;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25116, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower12_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper12_100.blp', '', 5, 12, 5);
DELETE FROM charsections WHERE id = 25117;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25117, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower13_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper13_100.blp', '', 5, 13, 5);
DELETE FROM charsections WHERE id = 25118;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25118, 7, 1, 4, 'Character\\Gnome\\Female\\GnomeFemaleNakedPelvisSkin00_100.blp', 'Character\\Gnome\\Female\\GnomeFemaleNakedTorsoSkin00_100.blp', '', 17, 0, 5);

-- colour 6 (_101)
DELETE FROM charsections WHERE id = 25119;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25119, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower00_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper00_101.blp', '', 1, 0, 6);
DELETE FROM charsections WHERE id = 25120;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25120, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower01_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper01_101.blp', '', 1, 1, 6);
DELETE FROM charsections WHERE id = 25121;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25121, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower02_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper02_101.blp', '', 1, 2, 6);
DELETE FROM charsections WHERE id = 25122;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25122, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower03_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper03_101.blp', '', 1, 3, 6);
DELETE FROM charsections WHERE id = 25123;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25123, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower04_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper04_101.blp', '', 1, 4, 6);
DELETE FROM charsections WHERE id = 25124;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25124, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower05_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper05_101.blp', '', 1, 5, 6);
DELETE FROM charsections WHERE id = 25125;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25125, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower06_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper06_101.blp', '', 1, 6, 6);
DELETE FROM charsections WHERE id = 25126;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25126, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower07_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper07_101.blp', '', 5, 7, 6);
DELETE FROM charsections WHERE id = 25127;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25127, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower08_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper08_101.blp', '', 5, 8, 6);
DELETE FROM charsections WHERE id = 25128;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25128, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower09_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper09_101.blp', '', 5, 9, 6);
DELETE FROM charsections WHERE id = 25129;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25129, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower10_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper10_101.blp', '', 5, 10, 6);
DELETE FROM charsections WHERE id = 25130;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25130, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower11_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper11_101.blp', '', 5, 11, 6);
DELETE FROM charsections WHERE id = 25131;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25131, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower12_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper12_101.blp', '', 5, 12, 6);
DELETE FROM charsections WHERE id = 25132;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25132, 7, 1, 1, 'Character\\Gnome\\Female\\GnomeFemaleFaceLower13_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleFaceUpper13_101.blp', '', 5, 13, 6);
DELETE FROM charsections WHERE id = 25133;
INSERT INTO charsections (id, race, gender, base_section, texture_1, texture_2, texture_3, flags, type, color_index) VALUES (25133, 7, 1, 4, 'Character\\Gnome\\Female\\GnomeFemaleNakedPelvisSkin00_101.blp', 'Character\\Gnome\\Female\\GnomeFemaleNakedTorsoSkin00_101.blp', '', 17, 0, 6);
