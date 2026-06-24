-- F-072 Peacekeeping Diplomacy: Allow both Aldor and Scryer factions
-- Remove mutual exclusivity on allegiance quests (both can be completed)
UPDATE `quest_template_addon` SET `ExclusiveGroup` = 0 WHERE `ID` IN (10551, 10552);

-- Remove negative rep spillover to opposing faction, keep Sha'tar (935) bonus
UPDATE `reputation_spillover_template` SET `faction1`=935, `rate_1`=0.5, `rank_1`=4, `faction2`=0, `rate_2`=0, `rank_2`=0 WHERE `faction` IN (932, 934);

-- Make the entry-tier rep turn-ins available at any reputation stage.
-- Stock data locks the intro quests behind an inverted reputation condition:
--   10017 'Strained Supplies'   (Sha'nir, Aldor)   -> only if Unfriendly or lower w/ 932
--   10024 'Voren'thal's Visions' (Arcanist Adyria, Scryers) -> only if Unfriendly or lower w/ 934
-- Once a player reaches Neutral+, the intro is no longer offered, so the repeatable
-- turn-ins (10019 Dreadfang Venom Sac / 10025 Dampscale Basilisk Eye) can never unlock.
-- Removing the condition keeps the one-time intro but lets it be picked up at any rep.
DELETE FROM `conditions`
WHERE `SourceTypeOrReferenceId` = 19
  AND `ConditionTypeOrReference` = 5
  AND `SourceEntry` IN (10017, 10024)
  AND `ConditionValue1` IN (932, 934);
