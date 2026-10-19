-- [F-031] zep-professions: skillraceclassinfo
-- Universal Lockpicking: open skill 633 to all classes (stock is rogue-only, class_mask=8).
-- class_mask=0 means no class restriction (GetSkillRaceClassInfo treats 0 as wildcard).
-- Without this row match, LearnDefaultSkill(633) refuses the skill and _LoadSkills
-- DELETES existing skill 633 rows for non-rogues on login.

-- skillraceclassinfo: 1 updates
UPDATE `skillraceclassinfo` SET `class_mask` = 0 WHERE `id` = 601;
