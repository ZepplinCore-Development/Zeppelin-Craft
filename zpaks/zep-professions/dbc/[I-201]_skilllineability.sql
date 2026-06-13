-- I-201: Disable skill-point gain from Minor Inscription Research (61288)
-- Now that the 20h cooldown is removed (churnable), research must not be a
-- skill-up vector. Player::UpdateCraftSkill -> SkillGainChance returns the
-- grey chance (0) whenever current skill >= grey level, so forcing grey=1
-- (and yellow=1) makes the spell trivial at every skill level → no points.
-- The glyph DISCOVERY (MECHANIC_DISCOVERY -> learnSpell) is independent of
-- the skill-gain roll and keeps working.
-- SkillLineAbility id 20506 = spell_id 61288, skill_line 773 (Inscription).
UPDATE `skilllineability` SET `skill_grey_level` = 1, `skill_yellow_level` = 1 WHERE `spell_id` = 61288;
