UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.72 /* was 0.8 */
WHERE `id` = 21;

UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.63 /* was 0.7 */
WHERE `id` = 24;

UPDATE `dbc`.`creaturefamily` SET 
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Moth' /* was 'Interface\\Icons\\Ability_Druid_TreeofLife' */
WHERE `id` = 37;

UPDATE `dbc`.`creaturefamily` SET 
    `max_scale` = 0.63 /* was 0.7 */,
    `name_flags` = 16712190 /* was 16711934 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Chimera' /* was 'Interface\\Icons\\Ability_Shaman_Stormstrike' */
WHERE `id` = 38;

UPDATE `dbc`.`creaturefamily` SET 
    `min_scale` = 0.3 /* was 0.4 */,
    `max_scale` = 0.5 /* was 0.6 */,
    `name_flags` = 16712190 /* was 16711934 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Devilsaur' /* was 'Interface\\Icons\\Ability_Hunter_Pet_Raptor' */
WHERE `id` = 39;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711934 */
WHERE `id` = 40;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711934 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Silithid' /* was 'Interface\\Icons\\Ability_Hunter_CombatExperience' */
WHERE `id` = 41;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711932 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Worm' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `id` = 42;

UPDATE `dbc`.`creaturefamily` SET 
    `min_scale` = 0.35 /* was 0.6 */,
    `max_scale` = 0.56 /* was 0.9 */,
    `name_flags` = 16712190 /* was 16711680 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Rhino' /* was 'Interface\\Icons\\Ability_Devour' */
WHERE `id` = 43;

UPDATE `dbc`.`creaturefamily` SET 
    `name_flags` = 16712190 /* was 16711680 */,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_Wasp' /* was 'Interface\\Icons\\Ability_PoisonArrow' */
WHERE `id` = 44;

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 45;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 45,
    `min_scale` = 0.3,
    `min_scale_level` = 1,
    `max_scale` = 0.5,
    `max_scale_level` = 60,
    `skill_line_1` = 787,
    `skill_line_2` = 270,
    `pet_food_mask` = 1,
    `category_enum_id` = 59,
    `name_enus` = 'Core Hound',
    `name_flags` = 16712190,
    `icon` = 'Interface\\Icons\\Ability_Hunter_Pet_CoreHound';

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 46;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 46,
    `min_scale` = 0.7,
    `min_scale_level` = 1,
    `max_scale` = 1.1,
    `max_scale_level` = 60,
    `skill_line_1` = 788,
    `skill_line_2` = 270,
    `pet_food_mask` = 3,
    `category_enum_id` = 58,
    `name_enus` = 'Spirit Beast',
    `name_flags` = 16712190,
    `icon` = 'Interface\\Icons\\Ability_Druid_PrimalPrecision';

DELETE FROM `dbc`.`creaturefamily` WHERE `id` = 47;
INSERT INTO `dbc`.`creaturefamily` SET 
    `id` = 47,
    `min_scale` = 0.4,
    `min_scale_level` = 1,
    `max_scale` = 0.5,
    `max_scale_level` = 60,
    `skill_line_1` = 789,
    `skill_line_2` = 270,
    `pet_food_mask` = 1,
    `pet_talent_type` = 1,
    `category_enum_id` = 64,
    `name_enus` = 'Cloud Serpent',
    `name_flags` = 16712190,
    `icon` = 'InterfaceIconsSpell_Nature_GuardianWard';

