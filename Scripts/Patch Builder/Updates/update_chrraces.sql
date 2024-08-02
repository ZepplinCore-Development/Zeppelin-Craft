UPDATE `dbc`.`chrraces` SET 
    `Flags` = 4 /* was 1 */,
    `FactionId` = 2 /* was 1 */,
    `ExploreationSoundId` = 4141 /* was 0 */,
    `BaseLanguage` = 1 /* was 7 */,
    `CinematicSequenceId` = 141 /* was 0 */,
    `Alliance` = 1 /* was 2 */,
    `FacialHairCustom1` = 'PIERCINGS' /* was 'NORMAL' */,
    `FacialHairCustom2` = 'PIERCINGS' /* was 'NONE' */
WHERE `Id` = 9;

UPDATE `dbc`.`chrraces` SET 
    `Flags` = 6 /* was 5 */,
    `ExploreationSoundId` = 4143 /* was 0 */,
    `MaleDisplayId` = 29422 /* was 16981 */,
    `FemaleDisplayId` = 29423 /* was 16980 */,
    `ClientPrefix` = 'Wo' /* was 'Fo' */,
    `ClientFileString` = 'Worgen' /* was 'FelOrc' */,
    `CinematicSequenceId` = 61 /* was 0 */,
    `Alliance` = 0 /* was 2 */,
    `Name1` = 'Worgen' /* was 'Fel Orc' */,
    `FacialHairCustom1` = 'FEATURES' /* was 'NORMAL' */,
    `FacialHairCustom2` = 'EARS' /* was 'NORMAL' */
WHERE `Id` = 12;

