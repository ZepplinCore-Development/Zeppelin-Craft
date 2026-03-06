UPDATE spell SET spell_desc_enus = 'Reduces craft time for Alchemy recipes by $s1%. Increases potion potency by $s2%. Does not stack with other Alchemy Mortar effects.' WHERE id IN (91200, 91201, 91202, 91203);

-- Revert debug flags: restore hidden aura bar attributes
UPDATE spell SET attributes = 128, attributes_ex_1 = 268437504 WHERE id IN (91200, 91201, 91202, 91203);

-- =====================================================
-- F-027 Phase 4: Dynamic potion descriptions
-- Assign SpellDescriptionVariableID=183 and update
-- descriptions to use $<potion1>/$<potion1max> format.
-- (Rejuv potions already handled in [BASE,F-044]_spell.sql)
-- Rage/Energy potions skipped (non-standard descriptions)
-- =====================================================

-- Health Potions: standard "Restores $s1 health." -> dynamic range
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health.', spell_desc_variable_id = 183
  WHERE id IN (439,440,441,2024,4042,17534,28495,43185,53144,54572,58862,62352);

-- Health Potions: unique suffixes preserved
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. This item may only be used in PvP Battlegrounds.', spell_desc_variable_id = 183
  WHERE id IN (21393,21394);
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. Only works in the Blade''s Edge Plateaus.', spell_desc_variable_id = 183
  WHERE id = 41306;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. Only works inside Coilfang: The Serpentshrine, The Underbog, The Steamvaults, The Slave Pens.', spell_desc_variable_id = 183
  WHERE id = 41619;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. Only works inside Tempest Keep: The Eye, The Arcatraz, The Botanica, The Mechanar.', spell_desc_variable_id = 183
  WHERE id = 41620;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. The potion will refill itself every 2 min.', spell_desc_variable_id = 183
  WHERE id = 53670;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health. Increased effect for engineers!', spell_desc_variable_id = 183
  WHERE id IN (67486,67489);

-- Mana Potions: standard "Restores $s1 mana." -> dynamic range
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana.', spell_desc_variable_id = 183
  WHERE id IN (436,437,438,2023,11903,17530,17531,28499,28718,29236,43186,58864);

-- Mana Potions: unique suffixes preserved
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. This item may only be used in PvP Battlegrounds.', spell_desc_variable_id = 183
  WHERE id IN (21395,21396);
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. Only works in the Blade''s Edge Plateaus.', spell_desc_variable_id = 183
  WHERE id = 41304;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. Only works inside Coilfang: The Serpentshrine, The Underbog, The Steamvaults, The Slave Pens.', spell_desc_variable_id = 183
  WHERE id = 41617;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. Only works inside Tempest Keep: The Eye, The Arcatraz, The Botanica, The Mechanar.', spell_desc_variable_id = 183
  WHERE id = 41618;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. Drinking mana potions inflicts Mana Sickness, draining all of your mana after 1 min.', spell_desc_variable_id = 183
  WHERE id = 49748;
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> mana. Increased effect for engineers!', spell_desc_variable_id = 183
  WHERE id IN (67487,67490);

-- Rejuvenation Potions: 5 missing from [BASE,F-044] migration
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health and $<potion2> to $<potion2max> mana.', spell_desc_variable_id = 183
  WHERE id IN (11387,18832,19199,52697);
UPDATE spell SET spell_desc_enus = 'Restores $<potion1> to $<potion1max> health and $<potion2> to $<potion2max> mana. Also has random effects.', spell_desc_variable_id = 183
  WHERE id = 53750;
