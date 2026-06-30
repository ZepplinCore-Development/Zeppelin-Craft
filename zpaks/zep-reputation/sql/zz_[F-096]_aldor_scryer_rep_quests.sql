-- F-096: Aldor/Scryer entry-tier rep turn-ins available at any reputation.
--
-- These tier-0 repeatable turn-ins are gated by quest_template_addon
-- RequiredMaxRepFaction = their own reward faction, RequiredMaxRepValue = 0:
--   10017 Strained Supplies   -> 10019 More Venom Sacs     (reward Aldor 932)
--   10024 Voren'thal's Visions -> 10025 More Basilisk Eyes  (reward Scryers 934)
-- Player::SatisfyQuestReputation rejects when
--   GetReputation(RequiredMaxRepFaction) >= RequiredMaxRepValue
-- so with value 0 they are only offered while rep with that faction is below Neutral;
-- once Neutral+ they can never be picked up again.
--
-- F-072 Peacekeeping Diplomacy intended these reachable at any rep but only edited the
-- `conditions` table (wrong layer / no matching rows), leaving the addon gate active.
-- Clear it so the turn-ins are offered regardless of current reputation. Reward
-- factions and chain prereqs (10019<-10017, 10025<-10024) unchanged.
-- Takes effect on worldserver restart or `.reload quest_template`.
UPDATE `quest_template_addon`
SET `RequiredMaxRepFaction` = 0, `RequiredMaxRepValue` = 0
WHERE `ID` IN (10017, 10019, 10024, 10025);
