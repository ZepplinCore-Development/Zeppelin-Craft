-- [F-164] Stonebond conditional totem descriptions
-- When the Stonebond talent (any rank: 900225/900227/900228/900229/900236) is
-- specced, Stoneclaw Totem and Earth Elemental Totem no longer taunt/tank --
-- they soak a portion of the shaman's damage (exact % shown on the talent).
-- So their tooltips switch via $?s: specced -> soak text, else -> stock text.
--
-- The unspecced branch is the STOCK description pulled live from original_dbc, so
-- this is fully idempotent (re-running never double-wraps) and never needs the
-- stock text hand-copied. $d resolves to 60s for a specced viewer (SPELLMOD_
-- DURATION on the talent extends Stoneclaw), and to the stock 15s otherwise.
-- Detection mirrors the project's existing talent-conditional pattern ($?s on a
-- passive talent spell, as used by Improved Rockbiter Weapon 900129/900130).

-- Stoneclaw Totem (all 10 player ranks)
UPDATE `spell` AS s
JOIN `original_dbc`.`spell` AS o ON o.`id` = s.`id`
SET s.`spell_desc_enus` = CONCAT(
  '$?s900225[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[$?s900227[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[$?s900228[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[$?s900229[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[$?s900236[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[', o.`spell_desc_enus`, ']]]]]')
WHERE s.`id` IN (5730, 6390, 6391, 6392, 10427, 10428, 25525, 58580, 58581, 58582);

-- Earth Elemental Totem (2062)
UPDATE `spell` AS s
JOIN `original_dbc`.`spell` AS o ON o.`id` = s.`id`
SET s.`spell_desc_enus` = CONCAT(
  '$?s900225[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[$?s900227[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[$?s900228[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[$?s900229[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[$?s900236[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[', o.`spell_desc_enus`, ']]]]]')
WHERE s.`id` = 2062;
