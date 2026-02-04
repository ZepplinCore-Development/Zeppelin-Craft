UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.72 /* was 0.8 */
WHERE `id` = 21;

UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.63 /* was 0.7 */
WHERE `id` = 24;

UPDATE `dbc`.`creaturefamily` SET 
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Moth' /* was 'Interface\\Icons\\Ability_Druid_TreeofLife' */
WHERE `id` = 37;

UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.63 /* was 0.7 */,
    `name_flags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Chimera' /* was 'Interface\\Icons\\Ability_Shaman_Stormstrike' */
WHERE `id` = 38;

UPDATE `dbc`.`creaturefamily` SET 
    `min_scale` = 0.3 /* was 0.4 */,
    `max_scale` = 0.5 /* was 0.6 */,
    `name_flags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Devilsaur' /* was 'Interface\\Icons\\Ability_Hunter_Pet_Raptor' */
WHERE `id` = 39;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711934 */
WHERE `id` = 40;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711934 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Silithid' /* was 'Interface\\Icons\\Ability_Hunter_CombatExperience' */
WHERE `id` = 41;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711932 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Worm' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `id` = 42;

UPDATE `dbc`.`creaturefamily` SET 
    `min_scale` = 0.35 /* was 0.6 */,
    `max_scale` = 0.56 /* was 0.9 */,
    `name_flags` = 16712190 /* was 16711680 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Rhino' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `id` = 43;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711680 */,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_Wasp' /* was 'Interface\\Icons\\Ability_PoisonArrow' */
WHERE `id` = 44;

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 45;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 45,
    `min_scale` = 0.3,
    `min_scale_level` = 1,
    `max_scale` = 0.5,
    `max_scale_level` = 60,
    `skillline_1` = 787,
    `skillline_2` = 270,
    `petfoodmask` = 1,
    `categoryenumid` = 59,
    `name_1` = 'Core Hound',
    `name_flags` = 16712190,
    `iconpath` = 'Interface\\Icons\\Ability_Hunter_Pet_CoreHound';

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 46;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 46,
    `min_scale` = 0.7,
    `min_scale_level` = 1,
    `max_scale` = 1.1,
    `max_scale_level` = 60,
    `skillline_1` = 788,
    `skillline_2` = 270,
    `petfoodmask` = 3,
    `categoryenumid` = 58,
    `name_1` = 'Spirit Beast',
    `name_flags` = 16712190,
    `iconpath` = 'Interface\\Icons\\Ability_Druid_PrimalPrecision';

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 47;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 47,
    `min_scale` = 0.4,
    `min_scale_level` = 1,
    `max_scale` = 0.5,
    `max_scale_level` = 60,
    `skillline_1` = 789,
    `skillline_2` = 270,
    `petfoodmask` = 1,
    `pettalenttype` = 1,
    `categoryenumid` = 64,
    `name_1` = 'Cloud Serpent',
    `name_flags` = 16712190,
    `iconpath` = 'InterfaceIconsSpell_Nature_GuardianWard';

