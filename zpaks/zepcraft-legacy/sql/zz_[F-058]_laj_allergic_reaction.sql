-- Stop Laj Allergic Reaction from stacking on the same target.
-- Priority now handled via spell_group_stack_rules (special_flag column removed from spell_group)

DELETE FROM `spell_group` WHERE `id` = 1115;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 1115;

INSERT INTO `spell_group` SET `id` = 1115, `spell_id` = 34697;
INSERT INTO `spell_group` SET `id` = 1115, `spell_id` = 34700;

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(1115, 1, 'Laj Allergic Reaction in Botanica');