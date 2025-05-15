-- Stop Laj Allergic Reaction from stacking on the same target.

-- Create Spell Group
    INSERT INTO `spell_group` (`id`,`spell_id`,`special_flag`) VALUES
    (1115,34697,0),
    (1115,34700,0);

-- Create Spell Group Stack Rule
    INSERT INTO `spell_group_stack_rules` (`group_id`,`stack_rule`,`description`) VALUES
    (1115,1,'Laj Allergic Reaction in Botanica');     