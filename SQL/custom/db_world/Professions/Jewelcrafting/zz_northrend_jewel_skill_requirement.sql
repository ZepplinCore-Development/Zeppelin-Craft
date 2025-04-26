-- Make Northrend gems require a minimum of 385 Jewelcrafting to use, that prevents players (Justin) in TBC content from accessing forbidden gems.
-- Alternative option was to make gems BOP but that removes buying from AH as a source for gems.
-- Better to just put the skill requirement in, forces players to level their JC skill which all have access to.
-- Needs skill requirement above 375 (Outland) + 5 (Draenei Racial)
UPDATE `item_template` SET `RequiredSkill` = 755, `RequiredSkillRank` = 385 WHERE (`GemProperties` != 0 AND`entry` >= 39900);

UPDATE `item_template` SET `RequiredSkill` = 755, `RequiredSkillRank` = 385 WHERE (`GemProperties` != 0 AND`entry` IN (36767, 36766));