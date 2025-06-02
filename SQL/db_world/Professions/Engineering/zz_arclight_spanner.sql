-- Reduce skill requirement for Arclight Spanner (was 50)
UPDATE `item_template` SET `RequiredSkillRank` = 1 WHERE (`entry` = 6219);