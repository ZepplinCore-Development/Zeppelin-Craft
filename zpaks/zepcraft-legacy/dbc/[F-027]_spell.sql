UPDATE spell SET spell_desc_enus = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.' WHERE id IN (91200, 91201, 91202, 91203);

-- Revert debug flags: restore hidden aura bar attributes
UPDATE spell SET attributes = 128, attributes_ex_1 = 268437504 WHERE id IN (91200, 91201, 91202, 91203);
