-- [F-059] zepcraft-legacy: achievement
-- Sunken Temple Lower achievements (Normal, Heroic, Mythic)
-- Also renames existing Upper achievements for clarity

-- Register Achievement_Boss_Trollgore as a spellicon (not in stock DBC)
DELETE FROM `spellicon` WHERE `id` = 514644;
INSERT INTO `spellicon` (`id`, `name`) VALUES (514644, 'Interface\\Icons\\Achievement_Boss_Trollgore');

-- Rename existing Upper achievements
UPDATE `achievement` SET `name_enus` = 'Sunken Temple Upper' WHERE `id` = 641;
UPDATE `achievement` SET `name_enus` = 'Heroic: Sunken Temple Upper' WHERE `id` = 5016;
UPDATE `achievement` SET `name_enus` = 'Mythic: Sunken Temple Upper' WHERE `id` = 5116;

-- Sunken Temple Lower (Normal)
DELETE FROM `achievement` WHERE `id` = 5123;
INSERT INTO `achievement` (`id`, `faction`, `map`, `previous`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `category`, `points`, `order_in_category`, `flags`, `spell_icon`, `reward_enus`, `reward_flags`, `min_criteria_demand`, `linked_achievement`) VALUES (5123, -1, -1, 0, 'Sunken Temple Lower', 16712190, 'Defeat Atal''alarion.', 16712190, 14808, 10, 14, 0, 514644, '', 16712174, 1, 0);

-- Heroic: Sunken Temple Lower
DELETE FROM `achievement` WHERE `id` = 5124;
INSERT INTO `achievement` (`id`, `faction`, `map`, `previous`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `category`, `points`, `order_in_category`, `flags`, `spell_icon`, `reward_enus`, `reward_flags`, `min_criteria_demand`, `linked_achievement`) VALUES (5124, -1, -1, 0, 'Heroic: Sunken Temple Lower', 16712190, 'Defeat Atal''alarion.', 16712190, 15063, 10, 14, 0, 514644, '', 16712174, 1, 0);

-- Mythic: Sunken Temple Lower
DELETE FROM `achievement` WHERE `id` = 5125;
INSERT INTO `achievement` (`id`, `faction`, `map`, `previous`, `name_enus`, `name_flags`, `desc_enus`, `desc_flags`, `category`, `points`, `order_in_category`, `flags`, `spell_icon`, `reward_enus`, `reward_flags`, `min_criteria_demand`, `linked_achievement`) VALUES (5125, -1, -1, 0, 'Mythic: Sunken Temple Lower', 16712190, 'Defeat Atal''alarion.', 16712190, 15064, 10, 14, 0, 514644, '', 16712174, 1, 0);
