-- [F-164] Grant the Earthwarden skill line (9001) to all shamans.
--
-- F-164 moves several baseline shaman abilities onto skill line 9001
-- (rockbiter R1-R10, Stoneskin, Stoneclaw, Earth Shock, Earthbind) and adds
-- new spells there (Stonewall 900223, Bloodstone Totem 900224). A character only
-- sees spells whose skilllineability points at a skill it actually has, so
-- without skill 9001 those abilities are invisible in the spellbook.
--
-- The skillraceclassinfo grant (DBC id 1017, class_mask 64) alone is NOT
-- enough: it is only applied to NEW characters at creation, so shamans that
-- predate it never receive the skill. Player::LearnDefaultSkills() (called on
-- EVERY login via PlayerStorage.cpp) iterates playercreateinfo_skills, so
-- adding 9001 here grants it to ALL shamans the next time they log in
-- (existing + new) -- a self-healing data fix, no custom script needed.
-- Requires a worldserver restart to reload playercreateinfo into memory.
DELETE FROM `playercreateinfo_skills` WHERE `skill` = 9001;
INSERT INTO `playercreateinfo_skills` (`raceMask`, `classMask`, `skill`, `rank`, `comment`) VALUES
(0, 64, 9001, 0, 'Earthwarden skill line (F-164)');
