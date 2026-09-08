-- =============================================================================
-- I-367  "Warchief's Emissary" (25266) — retail's ending does not fit this server
--
-- Justin's call: the Cataclysm ending has Thrall hand you a package for "the new
-- warchief" and send you to a Kor'kron Loyalist at Bladefist Bay in Durotar, so the
-- goblins can be presented to **Garrosh Hellscream**. On a WotLK server Thrall IS
-- the Warchief, so the quest contradicts its own giver. Redirected to Orgrimmar to
-- report to **Overlord Runthak**.
--
-- This is a deliberate divergence from the donor, not a port fix.
--
-- It also repairs two things that made the quest unfinishable regardless:
--
--   * **No quest ender existed at all.** `creature_questender` had no row for 25266,
--     so there was nothing to hand the package to. And the NPC retail names, the
--     "Kor'kron Loyalist", is not in `creature_template` at all — that whole
--     Bladefist Bay arrival scene is Cataclysm content we do not have.
--
--   * **NextQuestID pointed at 25267, which does not exist** in our
--     `quest_template`. 25266 is the last quest of the chain here.
--
-- Overlord Runthak 14392 chosen over 31431: 14392 carries npcflag 3 (gossip +
-- questgiver) and already ends other Zeppelin quests, while 31431 is npcflag 0 and
-- cannot take a turn-in. He is spawned in Orgrimmar at (1568.0, -4405.9, 8.4).
--
-- The delivery item is unchanged — 84339 Sealed Package, bonding 4.
-- =============================================================================

DELETE FROM `creature_questender` WHERE `quest` = 25266;
INSERT INTO `creature_questender` (`id`, `quest`) VALUES (14392, 25266);

UPDATE `quest_template` SET
  `LogDescription` = 'Deliver the Sealed Package to Overlord Runthak in Orgrimmar.',
  `QuestDescription` = 'The goblins and orcs have accomplished too much together to part ways now, $c. I intend for the Bilgewater Cartel to become part of the Horde.$B$BI have something I want you to carry to Orgrimmar for me. Give this package to Overlord Runthak - he will see that the Cartel is properly received.$B$BSpeak with Sassy Hardwrench on the ship when you are ready to set sail.$B$BUntil we meet again. Aka''Magosh, a blessing on you and yours, $N!',
  `QuestCompletionLog` = 'Return the Sealed Package to Overlord Runthak in Orgrimmar.'
WHERE `ID` = 25266;

-- 25267 does not exist; a dangling NextQuestID is reported by ObjectMgr at load.
UPDATE `quest_template_addon` SET `NextQuestID` = 0 WHERE `ID` = 25266;
