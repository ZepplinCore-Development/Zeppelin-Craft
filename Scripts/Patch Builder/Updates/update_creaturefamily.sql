UPDATE `dbc`.`creaturefamily` SET 
    `maxScale` = 0.72 /* was 0.8 */
WHERE `ID` = 21;

UPDATE `dbc`.`creaturefamily` SET 
    `maxScale` = 0.63 /* was 0.7 */
WHERE `ID` = 24;

UPDATE `dbc`.`creaturefamily` SET 
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Moth' /* was 'Interface\\Icons\\Ability_Druid_TreeofLife' */
WHERE `ID` = 37;

UPDATE `dbc`.`creaturefamily` SET 
    `maxScale` = 0.63 /* was 0.7 */,
    `nameFlags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Chimera' /* was 'Interface\\Icons\\Ability_Shaman_Stormstrike' */
WHERE `ID` = 38;

UPDATE `dbc`.`creaturefamily` SET 
    `minScale` = 0.3 /* was 0.4 */,
    `maxScale` = 0.5 /* was 0.6 */,
    `nameFlags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Devilsaur' /* was 'Interface\\Icons\\Ability_Hunter_Pet_Raptor' */
WHERE `ID` = 39;

UPDATE `dbc`.`creaturefamily` SET 
    `nameFlags` = 16712190 /* was 16711934 */
WHERE `ID` = 40;

UPDATE `dbc`.`creaturefamily` SET 
    `nameFlags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Silithid' /* was 'Interface\\Icons\\Ability_Hunter_CombatExperience' */
WHERE `ID` = 41;

UPDATE `dbc`.`creaturefamily` SET 
    `nameFlags` = 16712190 /* was 16711932 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Worm' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `ID` = 42;

UPDATE `dbc`.`creaturefamily` SET 
    `minScale` = 0.35 /* was 0.6 */,
    `maxScale` = 0.56 /* was 0.9 */,
    `nameFlags` = 16712190 /* was 16711680 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Rhino' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `ID` = 43;

UPDATE `dbc`.`creaturefamily` SET 
    `nameFlags` = 16712190 /* was 16711680 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Wasp' /* was 'Interface\\Icons\\Ability_PoisonArrow' */
WHERE `ID` = 44;

DELETE FROM `dbc`.`creaturefamily` WHERE `ID` = 45;
INSERT INTO `dbc`.`creaturefamily` SET 
    `ID` = 45,
    `minScale` = 0.3,
    `minScaleLevel` = 1,
    `maxScale` = 0.5,
    `maxScaleLevel` = 60,
    `skillline_1` = 787,
    `skillline_2` = 270,
    `petfoodmask` = 1,
    `categoryenumid` = 59,
    `name1` = 'Core Hound',
    `nameFlags` = 16712190,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_CoreHound';

DELETE FROM `dbc`.`creaturefamily` WHERE `ID` = 46;
INSERT INTO `dbc`.`creaturefamily` SET 
    `ID` = 46,
    `minScale` = 0.7,
    `minScaleLevel` = 1,
    `maxScale` = 1.1,
    `maxScaleLevel` = 60,
    `skillline_1` = 788,
    `skillline_2` = 270,
    `petfoodmask` = 3,
    `categoryenumid` = 58,
    `name1` = 'Spirit Beast',
    `nameFlags` = 16712190,
    `iconpath` = 'Interface\\Icons\\Ability_Druid_PrimalPrecision';

DELETE FROM `dbc`.`creaturefamily` WHERE `ID` = 47;
INSERT INTO `dbc`.`creaturefamily` SET 
    `ID` = 47,
    `minScale` = 0.4,
    `minScaleLevel` = 1,
    `maxScale` = 0.5,
    `maxScaleLevel` = 60,
    `skillline_1` = 789,
    `skillline_2` = 270,
    `petfoodmask` = 1,
    `pettalenttype` = 1,
    `categoryenumid` = 64,
    `name1` = 'Cloud Serpent',
    `nameFlags` = 16712190,
    `iconpath` = 'InterfaceIconsSpell_Nature_GuardianWard';

