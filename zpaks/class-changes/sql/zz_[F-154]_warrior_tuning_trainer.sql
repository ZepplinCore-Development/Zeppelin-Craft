
-- Warrior Counter
DELETE FROM `trainer_spell` WHERE `SpellId` = 91001;
INSERT INTO `trainer_spell` (`TrainerId`, `SpellId`, `MoneyCost`, `ReqSkillLine`, `ReqSkillRank`, `ReqAbility1`, `ReqAbility2`, `ReqAbility3`, `ReqLevel`)
VALUES (1, 91001, 100, 0, 0, 0, 0, 0, 6);

-- Counter - 10% AP scaling
DELETE FROM `spell_bonus_data` WHERE `entry` = 91001;
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`)
VALUES (91001, 0, 0, 0.10, 0, 'Counter - 10% AP as bonus physical damage');
