-- Blacksmithing
UPDATE `spell` s
JOIN `skilllineability` sa
ON s.`ID` = sa.`spellId`
SET s.`SpellFamilyName` = 14,
    s.`SpellFamilyFlags` = 0x00000001
WHERE sa.`skillId` = 164;
