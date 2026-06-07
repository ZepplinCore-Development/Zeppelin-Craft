-- Stop Laj Allergic Reaction from stacking on the same target.
-- Priority now handled via spell_group_stack_rules (special_flag column removed from spell_group)

DELETE FROM `spell_group` WHERE `id` = 2015;
DELETE FROM `spell_group_stack_rules` WHERE `group_id` = 2015;

INSERT INTO `spell_group` SET `id` = 2015, `spell_id` = 34697;
INSERT INTO `spell_group` SET `id` = 2015, `spell_id` = 34700;

INSERT INTO `spell_group_stack_rules` (`group_id`, `stack_rule`, `description`) VALUES
(2015, 1, 'Laj Allergic Reaction in Botanica');