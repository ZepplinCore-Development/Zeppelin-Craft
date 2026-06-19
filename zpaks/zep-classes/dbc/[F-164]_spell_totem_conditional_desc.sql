-- [F-164] Stonebond conditional totem descriptions
-- When the Stonebond talent (any rank: 900225/900227/900228/900229/900236) is
-- specced, Stoneclaw Totem and Earth Elemental Totem no longer taunt/tank --
-- they soak a portion of the shaman's damage (exact % shown on the talent).
-- So their tooltips switch via $?: specced -> soak text, else -> stock text.
--
-- The unspecced branch is the STOCK description pulled live from original_dbc, so
-- this is fully idempotent (re-running never double-wraps) and never needs the
-- stock text hand-copied. $d resolves to 60s for a specced viewer (SPELLMOD_
-- DURATION on the talent extends Stoneclaw), and to the stock 15s otherwise.
--
-- IMPORTANT: a single FLAT conditional with an OR of all five ranks --
--   $?s900225|s900227|s900228|s900229|s900236[soak][stock]
-- NOT a NESTED $?s900225[..][$?s900227[..][..]] cascade. The 3.3.5a client cannot
-- recurse a conditional inside another conditional's false branch: when the outer
-- test is true it fails to skip the nested-bracket false branch and dumps the raw
-- markers into the tooltip (the "$900227s[Summons..." garbage we saw). The OR
-- operator (|), NOT (!) and grouping () are all supported by the stock client --
-- proven by Blizzard's own leftover debug strings (spells 66109/69420/69427:
-- "$?(s56810|s25306|!((!a48165)|a66109))[...]"). Stock totem descs are plain text
-- with no brackets, so they nest safely as the single false branch.

-- Stoneclaw Totem (all 10 player ranks)
UPDATE `spell` AS s
JOIN `original_dbc`.`spell` AS o ON o.`id` = s.`id`
SET s.`spell_desc_enus` = CONCAT(
  '$?s900225|s900227|s900228|s900229|s900236',
  '[Summons a Stoneclaw Totem with $s1 health at your feet for $d.  While it stands it absorbs a portion of your incoming damage, draining the totem''s health, and shields your other totems.  (See Stonebond.)]',
  '[', o.`spell_desc_enus`, ']')
WHERE s.`id` IN (5730, 6390, 6391, 6392, 10427, 10428, 25525, 58580, 58581, 58582);

-- Earth Elemental Totem (2062)
UPDATE `spell` AS s
JOIN `original_dbc`.`spell` AS o ON o.`id` = s.`id`
SET s.`spell_desc_enus` = CONCAT(
  '$?s900225|s900227|s900228|s900229|s900236',
  '[Summon an elemental totem that calls forth a greater earth elemental.  While it stands it absorbs a portion of the damage you take instead of attacking.  Lasts $d.  (See Stonebond.)]',
  '[', o.`spell_desc_enus`, ']')
WHERE s.`id` = 2062;
