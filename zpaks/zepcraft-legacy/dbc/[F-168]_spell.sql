-- =====================================================
-- F-168: Food and Drink Overhaul
-- =====================================================
-- Comprehensive overhaul of food/drink consumption spells:
--   1. Tick rate: 5-sec → 1-sec ticks (amplitude 0/2200 → 1000)
--   2. Duration: all standardised to 30 seconds (duration_index 9)
--   3. Base points: divided by 5 to maintain per-second rate
--   4. Dynamic descriptions via SpellDescriptionVariable 186
--   5. Tooltip alignment ($<foodps>/$<drinkps> in both fields)
--
-- Cooking kit bonuses (F-001 spells 91271-91275) scale via variable 186:
--   No kit: base values     Journeyman: +35%    Expert:       +45%
--   Artisan: +55%           Master:     +65%    Grand Master: +75%
--
-- Idempotency: tick rate UPDATEs guarded by amplitude != 1000 to prevent
-- double-application on DBC rebuild. Description UPDATEs are naturally
-- idempotent (SET to fixed values).
--
-- Excluded from tick rate changes:
--   - Percentage-based foods (base_points=-1, "4%" text) — different mechanic
--   - Joke food 40543 ("does nothing")


-- =====================================================
-- SECTION 1: TOOLTIP FIX
-- =====================================================
-- 64 food spells have $<food1> (per-tick = 5x inflated) in spell_tooltip_enus.
-- Fix to $<foodps> (per-second, matches spell_desc_enus).
-- Drink spells already use $<drinkps> in both fields — no fix needed.

UPDATE `spell` SET `spell_tooltip_enus` = 'Restores $<foodps> health per second.'
WHERE `spell_tooltip_enus` = 'Restores $<food1> health per second.';


-- =====================================================
-- SECTION 2: DESCRIPTION UPDATES
-- =====================================================
-- Per-second rate display with Cooking Pot modifier.
-- Variable 186: $<foodps> = modified health/sec, $<drinkps> = modified mana/sec

-- ---------------------------------------------------
-- Group A: Standard food (26 spells)
-- "$o1 health over $d" → "$<foodps> health per second for $d"
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.',
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

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19705s1 Stamina and Spirit for $19705d.', `spell_desc_variable_id` = 186 WHERE `id` = 5004;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19706s1 Stamina and Spirit for $19706d.', `spell_desc_variable_id` = 186 WHERE `id` = 5005;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19708s1 Stamina and Spirit for $19708d.', `spell_desc_variable_id` = 186 WHERE `id` = 5006;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19709s1 Stamina and Spirit for $19709d.', `spell_desc_variable_id` = 186 WHERE `id` = 5007;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19710s1 Stamina and Spirit for $19710d.', `spell_desc_variable_id` = 186 WHERE `id` = 10256;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19711s1 Stamina and Spirit for $19711d.', `spell_desc_variable_id` = 186 WHERE `id` = 10257;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $19705s1 Stamina and Spirit for $19705d.  Also packs quite a kick...', `spell_desc_variable_id` = 186 WHERE `id` = 21149;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $24799s1 Strength for $24799d.', `spell_desc_variable_id` = 186 WHERE `id` = 24800;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain 25 Stamina for $24799d.', `spell_desc_variable_id` = 186 WHERE `id` = 25660;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $18193s1 Spirit for $18193d.', `spell_desc_variable_id` = 186 WHERE `id` = 32112;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33254s1 Stamina and Spirit for $33254d.', `spell_desc_variable_id` = 186 WHERE `id` = 33253;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33256s1 Strength and Spirit for $33256d.', `spell_desc_variable_id` = 186 WHERE `id` = 33255;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33257s1 Stamina and $33257s2 Spirit for $33257d.', `spell_desc_variable_id` = 186 WHERE `id` = 33258;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33259s1 attack power and $33259s2 Spirit for $33259d.', `spell_desc_variable_id` = 186 WHERE `id` = 33260;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33261s1 Agility and Spirit for $33261d.', `spell_desc_variable_id` = 186 WHERE `id` = 33262;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33263s1 Spell Power and $33263s2 Spirit for $33263d.', `spell_desc_variable_id` = 186 WHERE `id` = 33264;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $33265s1 Stamina and $33265s2 Mana every 5 seconds for $33265d.', `spell_desc_variable_id` = 186 WHERE `id` = 33266;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and increase Spell Power by $33268s1 and Spirit by $33268s2 for $33268d.', `spell_desc_variable_id` = 186 WHERE `id` = 33269;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $35272s1 Stamina and Spirit for $35272d.', `spell_desc_variable_id` = 186 WHERE `id` = 35271;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $42293s1 Stamina and $42293s2 Spirit for $42293d.', `spell_desc_variable_id` = 186 WHERE `id` = 41030;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $43764s1 Hit Rating and Spirit for $43764d.', `spell_desc_variable_id` = 186 WHERE `id` = 43763;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $45619s1 resistance to all schools of magic for $45619d.', `spell_desc_variable_id` = 186 WHERE `id` = 45618;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $46899s1 attack power for $46899d.', `spell_desc_variable_id` = 186 WHERE `id` = 46898;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $53284s1 Stamina and Spirit for $53284d.', `spell_desc_variable_id` = 186 WHERE `id` = 53283;

-- ---------------------------------------------------
-- Group C: Special suffix food (13 spells)
-- "$o1 health" + non-well-fed suffix preserved
-- ---------------------------------------------------

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Watch out for brain freeze!', `spell_desc_variable_id` = 186 WHERE `id` = 9177;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Strength by $18125s1 for $18125d.', `spell_desc_variable_id` = 186 WHERE `id` = 18124;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 18229;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you eat for 10 seconds will also increase your Agility by $18192s for $18192d.', `spell_desc_variable_id` = 186 WHERE `id` = 18230;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Spirit by $18193s for $18193d.', `spell_desc_variable_id` = 186 WHERE `id` = 18231;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also restores 6 health every 5 seconds for 10 min.', `spell_desc_variable_id` = 186 WHERE `id` = 18232;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also restores $18194s Mana every 5 seconds for $18194d.', `spell_desc_variable_id` = 186 WHERE `id` = 18233;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 18234;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Intellect by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 22731;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  Also increases your Stamina by $18191s for $18191d.', `spell_desc_variable_id` = 186 WHERE `id` = 26030;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 25 seconds eating, you''ll discover the fortune hidden in your meal!', `spell_desc_variable_id` = 186 WHERE `id` = 40768;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you eat for 10 seconds will also increase your spell power by $46687s1 for $46687d.', `spell_desc_variable_id` = 186 WHERE `id` = 46683;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you aren''t real sure what will happen.', `spell_desc_variable_id` = 186 WHERE `id` = 58886;

-- ---------------------------------------------------
-- Group D: Brain food (4 spells)
-- "$o1 mana" via eating mechanic (effect 1 = mana)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while eating.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (25701, 25887, 42308, 42312);


-- ---------------------------------------------------
-- Group E+F: Standard drinks (16 spells)
-- "${$m2/5*N} mana over $d" → "$<drinkps> mana per second for $d"
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


-- ---------------------------------------------------
-- Group H: Dual-restore food → food-only (3 spells)
-- "$o1 health and $o2 mana" → "$<foodps> health per second"
-- ---------------------------------------------------

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.', `spell_desc_variable_id` = 186 WHERE `id` = 2639;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.', `spell_desc_variable_id` = 186 WHERE `id` = 25697;

UPDATE `spell` SET `spell_desc_enus` = 'Restores $<foodps> health per second for $d.  Must remain seated while eating.  If you spend at least 10 seconds eating you will become well fed and gain $64057s1 attack power and $64057s2 spell power for $64057d.', `spell_desc_variable_id` = 186 WHERE `id` = 64056;


-- =====================================================
-- SECTION 3: TOOLTIP UPDATES
-- =====================================================
-- Ensure all food/drink tooltips (buff hover) use variable references
-- matching their spell_desc_enus (item/spellbook) descriptions.

-- Stock food tooltips → $<foodps>
UPDATE `spell` SET `spell_tooltip_enus` = 'Restores $<foodps> health per second.'
WHERE `spell_desc_variable_id` = 186
AND `spell_tooltip_enus` = 'Restores $/5;s1 health per second.';

-- Stock drink tooltips → $<drinkps>
UPDATE `spell` SET `spell_tooltip_enus` = 'Restores $<drinkps> mana per second.'
WHERE `spell_desc_variable_id` = 186
AND `spell_tooltip_enus` = 'Restores ${$m2/5} mana per second.';

-- Brain food tooltips (mana via eating, effect 1)
UPDATE `spell` SET `spell_tooltip_enus` = 'Restores $<foodps> mana per second.'
WHERE `id` IN (25701, 25887, 42308, 42312);

-- Dual-restore food tooltips → food-only
UPDATE `spell` SET `spell_tooltip_enus` = 'Restores $<foodps> health per second.'
WHERE `id` IN (2639, 25697);


-- =====================================================
-- SECTION 4: DURATION STANDARDISATION
-- =====================================================
-- Standardise all food/drink durations to 30 seconds.
--
-- NOTE: Food (aura 84 = MOD_REGEN) and Drink (aura 85 = MOD_POWER_REGEN)
-- are NOT periodic auras — the server regen system handles them every 2 seconds
-- in Player::RegenerateHealth() and Player::Regenerate() respectively.
-- The DBC amplitude field is IGNORED for food, and only controls the initial
-- delay for the PERIODIC_DUMMY (aura 226) drink mechanism.
-- Base points are treated as "per 5 seconds" by the engine (divided by 5000ms),
-- so they must NOT be modified — only duration is standardised here.

-- ---------------------------------------------------
-- 4a: Food health regen — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_1` = 84
AND `aura_interrupt_flags` = 262272
AND `id` NOT IN (40543);  -- exclude joke food "does nothing"

-- ---------------------------------------------------
-- 4b: Drink mana regen — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_2` IN (85, 226)
AND `aura_interrupt_flags` = 262272;

-- ---------------------------------------------------
-- 4c: Brain food / Brewfest drinks (effect 1) — standardise duration to 30s
-- ---------------------------------------------------
UPDATE `spell` SET `duration_index` = 9
WHERE `effect_apply_aura_name_1` = 85
AND `aura_interrupt_flags` = 262272;


-- =====================================================
-- SECTION 5: REMAINING DESCRIPTION CONVERSIONS
-- =====================================================
-- Spells not converted in the original F-168 work.
-- Tick rate changes (Section 4) already applied to these spells.
-- Now convert descriptions + tooltips to use variable 186.

-- ---------------------------------------------------
-- 5a: Food with special description (1 spell)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> health per second for $d, assuming you don''t bite down on a poison sac.',
    `spell_tooltip_enus` = 'Restores $<foodps> health per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 6410;

-- ---------------------------------------------------
-- 5b: Empty-description food spells (9 spells)
-- No spell_desc_enus needed (unused/internal), just set variable + tooltip
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_tooltip_enus` = 'Restores $<foodps> health per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (25695, 25702, 25888, 26260, 26401, 26472, 26474, 29038, 33773);

-- ---------------------------------------------------
-- 5c: Empty-description drink spells (6 spells)
-- No spell_desc_enus needed, just set variable + tooltip
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_tooltip_enus` = 'Restores $<drinkps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (25696, 26261, 26402, 26473, 26475, 33774);

-- ---------------------------------------------------
-- 5d: Empty-description brain food (3 spells)
-- Uses $<foodps> since mana is in effect 1
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (25703, 25889, 29039);

-- ---------------------------------------------------
-- 5e: Green Tea (833) — instant heal + mana over time in effect 2
-- Uses $<drinkps> since mana regen is in effect 2
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Instantly heals $s1 damage.  Also restores $<drinkps> mana per second for $d.  Must remain seated while drinking.',
    `spell_tooltip_enus` = 'Restores $<drinkps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 833;

-- ---------------------------------------------------
-- 5f: Simple $o1 drinks via effect 1 (2 spells)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (29007, 43154);

-- ---------------------------------------------------
-- 5g: Drinks via effect 1 with stat suffix (2 spells)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  Also increases your Spirit by $18141s1 for $18141d.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (18140, 23698);

-- ---------------------------------------------------
-- 5h: Tipsy drink (52911) and 60s drink (64356)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Gets you tipsy and restores $<foodps> mana per second for $d.  Must remain seated while drinking.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 52911;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 64356;

-- ---------------------------------------------------
-- 5i: Thunderbrew's Hard Ale (53373)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you are likely to grow in size.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 53373;

-- ---------------------------------------------------
-- 5j: Brewfest drinks (10 spells)
-- ${$m1/5*N} and $o1 → $<foodps> per second, preserve well-fed suffixes
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44097s1 Stamina and Spirit for $44097d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44107;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44098s1 Stamina and Spirit for $44098d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44109;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44099s1 Stamina and Spirit for $44099d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44110;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44100s1 Stamina and Spirit for $44100d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44111;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44101s1 Stamina and Spirit for $44101d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44112;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44102s1 Stamina and Spirit for $44102d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44113;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44104s1 Stamina and Spirit for $44104d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44114;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44105s1 Stamina and Spirit for $44105d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44115;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $44106s1 Strength and Spirit for $44106d. Strong alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 44116;

-- ---------------------------------------------------
-- 5k: Holiday drinks (2 spells)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become well fed and gain $44101s1 Stamina and Spirit for $44101d.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 45019;

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become well fed and gain $44105s1 Stamina and Spirit for $44105d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 45020;

-- ---------------------------------------------------
-- 5l: WotLK Brewfest drinks (3 spells)
-- ---------------------------------------------------
UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $65365s1 critical strike rating for $65365d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` IN (65363, 69561);

UPDATE `spell` SET
    `spell_desc_enus` = 'Restores $<foodps> mana per second for $d.  Must remain seated while drinking.  If you spend at least 10 seconds drinking you will become "well fed" and gain $69559s1 Stamina and resilience rating for $69559d. Standard alcohol.',
    `spell_tooltip_enus` = 'Restores $<foodps> mana per second.',
    `spell_desc_variable_id` = 186
WHERE `id` = 69560;
