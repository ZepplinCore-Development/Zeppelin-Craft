-- Stop Laj Allergic Reaction from stacking on the same target.
-- Priority now handled via spell_group_stack_rules (special_flag column removed from spell_group)

DELETE FROM `spell_group` WHERE `id` = 1115;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1115;

INSERT INTO `spell_group` SET `id` = 1115, `spell_id` = 34697;
INSERT INTO `spell_group` SET `id` = 1115, `spell_id` = 34700;

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1115, 1, 'Laj Allergic Reaction in Botanica');

-- Remove unintentional inclusion of group 1115 in group 1126 (Stamina Buffs)
-- Stock AC data references -1115 in group 1126, but Allergic Reaction is not a stamina buff
DELETE FROM `spell_group` WHERE `id` = 1126 AND `spell_id` = -1115;