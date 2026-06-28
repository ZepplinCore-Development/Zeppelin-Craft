-- [F-164B] Crag Strike rank chains (spell_ranks) + trainer wiring for the 8-rank
-- armor-leech rework. Split from F-164. R1 (900262) is talent-granted; R2-R8 are
-- learned from the Shaman trainer (TrainerId 14), each requiring the previous rank.
-- spell_ranks chains: Crag Strike (900262..), Splinter Armor debuff (900264..),
-- Crag Plating self-buff (900320..).
DELETE FROM `spell_ranks` WHERE `first_spell_id` IN (900262,900264,900320);
INSERT INTO `spell_ranks` (`first_spell_id`,`spell_id`,`rank`) VALUES
(900262,900262,1),
(900262,900300,2),
(900262,900301,3),
(900262,900302,4),
(900262,900303,5),
(900262,900304,6),
(900262,900305,7),
(900262,900306,8),
(900264,900264,1),
(900264,900310,2),
(900264,900311,3),
(900264,900312,4),
(900264,900313,5),
(900264,900314,6),
(900264,900315,7),
(900264,900316,8),
(900320,900320,1),
(900320,900321,2),
(900320,900322,3),
(900320,900323,4),
(900320,900324,5),
(900320,900325,6),
(900320,900326,7),
(900320,900327,8);

-- Crag Strike R2-R8 on Shaman trainer (TrainerId 14); each rank requires the previous (R1 = talent).
DELETE FROM `trainer_spell` WHERE `SpellId` IN (900300,900301,900302,900303,900304,900305,900306);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`) VALUES
(14, 900300, 1400, 0, 0, 900262, 0, 0, 28),
(14, 900301, 1800, 0, 0, 900300, 0, 0, 36),
(14, 900302, 2200, 0, 0, 900301, 0, 0, 44),
(14, 900303, 2600, 0, 0, 900302, 0, 0, 52),
(14, 900304, 3000, 0, 0, 900303, 0, 0, 60),
(14, 900305, 3400, 0, 0, 900304, 0, 0, 68),
(14, 900306, 3800, 0, 0, 900305, 0, 0, 76);
