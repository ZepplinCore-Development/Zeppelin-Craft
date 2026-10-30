-- [F-030] mod-worgoblin: worgen male Hair Color (CharSections facial hair rows, race 12 gender 0 section 2)
-- The base import points these rows at Character\Worgen\FacialLowerHair0N_0C.blp / FacialUpperHair..., files that
-- exist nowhere (the retail ones live under Male\, only style 00, with no alpha). Hair Color therefore changed
-- nothing on a male worgen: the M2 has no hair texture (type 6), so these rows are its only visible effect.
-- Every facial style now uses the hair colour's keyed layer from Scripts/Character Skins/worgen_male_hair_colour.py.

UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20076;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20077;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20078;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20079;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20080;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20081;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20082;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20083;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20084;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20085;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20086;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20087;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20088;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20089;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20090;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20091;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20092;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20093;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20094;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20095;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20096;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20097;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20098;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20099;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20100;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20101;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20102;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20103;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20104;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20105;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20106;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20107;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20108;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20109;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20110;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20111;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20112;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20113;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20114;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20115;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_00.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_00.blp' WHERE `id` = 20116;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_01.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_01.blp' WHERE `id` = 20117;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_02.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_02.blp' WHERE `id` = 20118;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_03.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_03.blp' WHERE `id` = 20119;
UPDATE `charsections` SET `texture_1` = 'Character\\Worgen\\Male\\WorgenMaleHairLower00_04.blp', `texture_2` = 'Character\\Worgen\\Male\\WorgenMaleHairUpper00_04.blp' WHERE `id` = 20120;
