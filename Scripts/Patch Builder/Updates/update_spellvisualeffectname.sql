UPDATE `dbc`.`spellvisualeffectname` SET 
    `FilePath` = 'spells\arcaneforceshield_purple.mdx' /* was Spells\ManaShield_State_Base.mdx */,
    `AreaEffectSize` = '1.0' /* was 0.0 */,
    `Scale` = '1.2' /* was 1.0 */
WHERE `ID` = '718';

DELETE FROM `dbc`.`spellvisualeffectname` WHERE `ID` = '7100';
INSERT INTO `dbc`.`spellvisualeffectname` SET 
`ID` = '7100',
`Name` = 'Divine Fury',
`FilePath` = 'spells\shadowfury_impact_base_yellow.mdx',
`AreaEffectSize` = '1.0',
`Scale` = '1.0',
`MinAllowedScale` = '0.01',
`MaxAllowedScale` = '100.0';

DELETE FROM `dbc`.`spellvisualeffectname` WHERE `ID` = '7101';
INSERT INTO `dbc`.`spellvisualeffectname` SET 
`ID` = '7101',
`Name` = 'Mana Shield State Base',
`FilePath` = 'Spells\ShadowWard_Impact_Chest.mdx',
`AreaEffectSize` = '1.0',
`Scale` = '1.0',
`MinAllowedScale` = '0.01',
`MaxAllowedScale` = '100.0';

DELETE FROM `dbc`.`spellvisualeffectname` WHERE `ID` = '7102';
INSERT INTO `dbc`.`spellvisualeffectname` SET 
`ID` = '7102',
`Name` = 'Mana Shield State Base',
`FilePath` = 'spells\banish_chest_purple.mdx',
`AreaEffectSize` = '1.0',
`Scale` = '1.0',
`MinAllowedScale` = '0.01',
`MaxAllowedScale` = '100.0';

DELETE FROM `dbc`.`spellvisualeffectname` WHERE `ID` = '7103';
INSERT INTO `dbc`.`spellvisualeffectname` SET 
`ID` = '7103',
`Name` = 'Mana Shield State Base',
`FilePath` = 'spells\ArcaneForceShield_Purple.mdx',
`AreaEffectSize` = '1.0',
`Scale` = '1.0',
`MinAllowedScale` = '0.01',
`MaxAllowedScale` = '100.0';

