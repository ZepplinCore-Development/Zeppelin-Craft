-- =====================================================
-- F-168: Dynamic Food & Drink Spell Descriptions
-- Phase 2 (Food) + Phase 3 (Drink)
-- =====================================================
-- Per-second rate display with Cooking Pot modifier (F-001).
-- Variable 186: $<food1> = modified health/sec, $<drinkps> = modified mana/sec
--
-- Values update dynamically based on equipped Cooking Pot tier:
--   No pot:       base values
--   Journeyman:   +35%    Expert:       +45%
--   Artisan:      +55%    Master:       +65%
--   Grand Master: +75%
--
-- Skipped categories (Phase 4 / N/A):
--   - Percentage-based ($s1% / 4%)
--   - Cross-spell references ($XXXXXo1, ${$XXXXXm2/5*30})
--   - Refreshment combos (food+drink in one spell)
--   - Brewfest drinks ($m1-based mana)
--   - $o1 variant drinks (mana in effect 1)
--   - Dual-restore food ($o1 health and $o2 mana)
--   - Empty/no-amount descriptions


-- =====================================================
-- PHASE 2: FOOD SPELLS (67 spells)
-- =====================================================

-- ---------------------------------------------------
-- Group A: Standard food (26 spells)
-- "$o1 health over $d" → "$<food1> health per second for $d"
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (
    433, 434, 435, 1127, 1129, 1131, 7737,
    25700, 25886, 27094, 28616, 29008, 29073, 33725,
    35270, 40745, 42207, 42311, 43180, 45548, 46812,
    57069, 57084, 57649, 61829, 64355
);

-- ---------------------------------------------------
-- Group B: Well-fed food (24 spells)
-- "$o1 health" + unique well-fed suffix preserved
-- ---------------------------------------------------

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19705s1 Stamina and Spirit for $19705d.', `spell_desc_variable_id` = 186 WHERE `id` = 5004;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19706s1 Stamina and Spirit for $19706d.', `spell_desc_variable_id` = 186 WHERE `id` = 5005;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19708s1 Stamina and Spirit for $19708d.', `spell_desc_variable_id` = 186 WHERE `id` = 5006;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19709s1 Stamina and Spirit for $19709d.', `spell_desc_variable_id` = 186 WHERE `id` = 5007;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19710s1 Stamina and Spirit for $19710d.', `spell_desc_variable_id` = 186 WHERE `id` = 10256;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19711s1 Stamina and Spirit for $19711d.', `spell_desc_variable_id` = 186 WHERE `id` = 10257;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19705s1 Stamina and Spirit for $19705d.  Also packs quite a kick...', `spell_desc_variable_id` = 186 WHERE `id` = 21149;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $24799s1 Strength for $24799d.', `spell_desc_variable_id` = 186 WHERE `id` = 24800;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain 25 Stamina for $24799d.', `spell_desc_variable_id` = 186 WHERE `id` = 25660;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $18193s1 Spirit for $18193d.', `spell_desc_variable_id` = 186 WHERE `id` = 32112;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33254s1 Stamina and Spirit for $33254d.', `spell_desc_variable_id` = 186 WHERE `id` = 33253;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33256s1 Strength and Spirit for $33256d.', `spell_desc_variable_id` = 186 WHERE `id` = 33255;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33257s1 Stamina and $33257s2 Spirit for $33257d.', `spell_desc_variable_id` = 186 WHERE `id` = 33258;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33259s1 attack power and $33259s2 Spirit for $33259d.', `spell_desc_variable_id` = 186 WHERE `id` = 33260;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33261s1 Agility and Spirit for $33261d.', `spell_desc_variable_id` = 186 WHERE `id` = 33262;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33263s1 Spell Power and $33263s2 Spirit for $33263d.', `spell_desc_variable_id` = 186 WHERE `id` = 33264;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33265s1 Stamina and $33265s2 Mana every 5 seconds for $33265d.', `spell_desc_variable_id` = 186 WHERE `id` = 33266;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and increase Spell Power by $33268s1 and Spirit by $33268s2 for $33268d.', `spell_desc_variable_id` = 186 WHERE `id` = 33269;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $35272s1 Stamina and Spirit for $35272d.', `spell_desc_variable_id` = 186 WHERE `id` = 35271;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $42293s1 Stamina and $42293s2 Spirit for $42293d.', `spell_desc_variable_id` = 186 WHERE `id` = 41030;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $43764s1 Hit Rating and Spirit for $43764d.', `spell_desc_variable_id` = 186 WHERE `id` = 43763;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $45619s1 resistance to all schools of magic for $45619d.', `spell_desc_variable_id` = 186 WHERE `id` = 45618;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $46899s1 attack power for $46899d.', `spell_desc_variable_id` = 186 WHERE `id` = 46898;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $53284s1 Stamina and Spirit for $53284d.', `spell_desc_variable_id` = 186 WHERE `id` = 53283;

-- ---------------------------------------------------
-- Group C: Special suffix food (13 spells)
-- "$o1 health" + non-well-fed suffix preserved
-- ---------------------------------------------------

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Watch out for brain freeze!', `spell_desc_variable_id` = 186 WHERE `id` = 9177;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Strength by $18125s1 for $18125d.', `spell_desc_variable_id` = 186 WHERE `id` = 18124;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 18229;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you eat for 10 seconds will also increase your Agility by $18192s for $18192d.', `spell_desc_variable_id` = 186 WHERE `id` = 18230;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Spirit by $18193s for $18193d.', `spell_desc_variable_id` = 186 WHERE `id` = 18231;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also restores 6 health every 5 seconds for 10 min.', `spell_desc_variable_id` = 186 WHERE `id` = 18232;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also restores $18194s Mana every 5 seconds for $18194d.', `spell_desc_variable_id` = 186 WHERE `id` = 18233;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 18234;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Intellect by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 22731;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 26030;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 25 seconds eating, you''ll discover the fortune hidden in your meal!', `spell_desc_variable_id` = 186 WHERE `id` = 40768;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you eat for 10 seconds will also increase your spell power by $46687s1 for $46687d.', `spell_desc_variable_id` = 186 WHERE `id` = 46683;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<food1> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you aren''t real sure what will happen.', `spell_desc_variable_id` = 186 WHERE `id` = 58886;

-- ---------------------------------------------------
-- Group D: Brain food (4 spells)
-- "$o1 mana" via eating mechanic (effect 1 = mana)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<food1> mana per second for $d.  Must remain seated while eating.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (25701, 25887, 42308, 42312);


-- =====================================================
-- PHASE 3: DRINK SPELLS (17 spells)
-- =====================================================

-- ---------------------------------------------------
-- Group E+F: Standard drinks (16 spells)
-- "${$m2/5*N} mana over $d" → "$<drinkps> mana per second for $d"
-- Covers all durations: 18s, 21s, 24s, 27s, 30s
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<drinkps> mana per second for $d.  Must remain seated while drinking.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (
    430, 431, 432, 1133, 1135, 1137,
    10250, 22734, 27089, 34291,
    43182, 43183, 46755, 57073, 61830, 72623
);

-- ---------------------------------------------------
-- Group G: Coffee (1 spell)
-- Standard drink + "sobers you up" text
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<drinkps> mana per second for $d and sobers you up.  Must remain seated while drinking.',
    `spell_desc_variable_id` = 186
WHERE `id` = 49472;
