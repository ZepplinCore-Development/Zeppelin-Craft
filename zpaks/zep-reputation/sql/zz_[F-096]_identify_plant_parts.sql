-- F-096: Allow the Cenarion Expedition "Unidentified Plant Parts" (item 24401)
-- turn-in chain to be completed at any reputation rank with Cenarion Expedition (942).
--   9802 Plants of Zangarmarsh -> 9784 Identify Plant Parts  (both reward CE rep)
-- Stock gates 9802 with RequiredMaxRepFaction = 942, RequiredMaxRepValue = 8999, so it
-- is only offered while below Honored; once Honored+ the chain can never be started.
-- (An earlier version of this file cleared 9784, which carries no gate -- the real lock
-- is on 9802.) Player::SatisfyQuestReputation rejects when
-- GetReputation(RequiredMaxRepFaction) >= RequiredMaxRepValue, so clearing the columns
-- removes the gate. Reward faction / chain prereqs unchanged.
-- Takes effect on worldserver restart or `.reload quest_template`.
UPDATE `quest_template_addon`
SET `RequiredMaxRepFaction` = 0, `RequiredMaxRepValue` = 0
WHERE `ID` IN (9784, 9802);
