-- [F-164C] Rockbiter Weapon ranks 5-10 trainer entries (split from F-164).
-- Re-added TBC ranks + new WotLK R10 on the Shaman trainer (TrainerId 14).
DELETE FROM `trainer_spell` WHERE `SpellId` IN (900230, 900231, 900232, 900233, 900234, 900235);
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES
    (14, 900230,  1000, 0, 0, 0, 0, 0, 34),
    (14, 900231,  2500, 0, 0, 0, 0, 0, 44),
    (14, 900232,  5000, 0, 0, 0, 0, 0, 54),
    (14, 900233, 10000, 0, 0, 0, 0, 0, 62),
    (14, 900234, 20000, 0, 0, 0, 0, 0, 70),
    (14, 900235, 35000, 0, 0, 0, 0, 0, 78);
