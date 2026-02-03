UPDATE `dbc`.`spellvisual` SET 
    `ChannelKit` = 16003 /* was 3729 */
WHERE `id` = 100;

DELETE FROM `dbc`.`spellvisual` WHERE `id` = 17000;
INSERT INTO `dbc`.`spellvisual` SET 
    `id` = 17000,
    `PrecastKit` = 60,
    `CastKit` = 61,
    `StateKit` = 235,
    `ChannelKit` = 716,
    `MissileDestinationAttachment` = 1,
    `MissileAttachment` = 4294967295,
    `InstantAreaKit` = 16000;

