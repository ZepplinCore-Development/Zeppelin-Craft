-- Move the Chest to the Ancient Stone Keeper
DELETE FROM `gameobject` WHERE `id` = 123329;
INSERT INTO `gameobject` SET
    `guid` = '40673',
    `id` = 123329,
    `map` = 70,
    `position_x` = -37.8287,
    `position_y` = 221.357,
    `position_z` = -48.3416,
    `orientation` = 3.18789,
    `rotation2` = -0.999732,
    `rotation3` = 0.0231445,
    `VerifiedBuild` = NULL,
    `Comment` = NULL;


-- Update the Journal text to guide players to the new chest location.
DELETE FROM `page_text` WHERE `ID` = 1011;
INSERT INTO `page_text` SET
    `ID` = 1011,
    `Text` = 'I have found a method to enter the Chamber of Khazmul!$B$BTake the Medallion of Gnikiv from my chest.$B$BI lost the chest in the Temple Hall, it is guarded by the Ancient Stone Keeper.$B$BDefeat the trogg Revelosh in the chamber before the map room and retrieve the Shaft of Tsol.$B$BJoin the medallion and the shaft into the Staff of Prehistoria.$B$BUse the staff in the map room to unlock the door to the Chamber of Khazmul.$B$BDo these things, and the chamber will be yours!$B-Baelog',
    `VerifiedBuild` = 12340;