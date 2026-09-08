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


-- ---------------------------------------------------------------------------
-- Thrall's finale dialogue — same lore divergence, two quests earlier.
--
-- His ported line 2 read "I will send a representative from amongst your people to
-- the new warchief, Garrosh Hellscream in Orgrimmar", which contradicts its own
-- speaker here: Thrall IS the Warchief on this server. Rewritten to send a
-- delegation to join the Horde and hand them to Overlord Runthak, so the finale
-- sets up the redirected Warchief's Emissary above.
--
-- Deliberately an UPDATE in this file rather than an edit to the INSERT in
-- zz_[I-366]_thrall_39594.sql: that file is a faithful port of Neltharion's
-- creature_text and should stay comparable to the donor. This file owns every
-- divergence. It sorts after I-366, so the UPDATE lands on the inserted row.
-- ---------------------------------------------------------------------------
UPDATE `creature_text` SET
  `Text` = 'I will send a delegation from amongst your people to Orgrimmar to join the Horde. Overlord Runthak will have their first duties waiting for them.'
WHERE `CreatureID` = 39594 AND `GroupID` = 2 AND `ID` = 0;
