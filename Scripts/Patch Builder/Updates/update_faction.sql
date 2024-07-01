UPDATE `dbc`.`faction` SET 
    `ReputationBase2` = 0 /* was 3500 */,
    `ReputationBase3` = 0 /* was -3500 */,
    `ParentFactionMod1` = 1.0 /* was -1.1 */
WHERE `ID` = 932;

UPDATE `dbc`.`faction` SET 
    `ReputationBase2` = 0 /* was -3500 */,
    `ReputationBase3` = 0 /* was 3500 */,
    `ParentFactionMod1` = 1.0 /* was -1.1 */
WHERE `ID` = 934;

