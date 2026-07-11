-- [F-011] DERIVED gossip greeting gating (NOT from Neltharion source).
-- These menus have a before/after greeting pair but no source condition, so AC's
-- last-match-wins gossip selection showed the "after" text unconditionally (greeting
-- read as if the quest was already done). Gating inferred from each NPC's quest
-- relations; each pair gated order-independently: before = NOT rewarded, after = rewarded.
-- Only the 3 high-confidence menus (others deferred: 510023 ambiguous, 510087 ambient).

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup` IN (510013,510025,510053);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
-- 510013 Foreman Dampwick (mine) — gate by 14075 "Trouble in the Mines"
(14, 510013, 500012, 0, 0, 8, 0, 14075, 0, 0, 1, 0, 0, '', 'before: not yet helped'),
(14, 510013, 500021, 0, 0, 8, 0, 14075, 0, 0, 0, 0, 0, '', 'after: mine quest done'),
-- 510025 Fizz Lighter (mage trainer) — gate by 14008 "Arcane Missiles"
(14, 510025, 500026, 0, 0, 8, 0, 14008, 0, 0, 1, 0, 0, '', 'before'),
(14, 510025, 500027, 0, 0, 8, 0, 14008, 0, 0, 0, 0, 0, '', 'after'),
-- 510053 Warrior-Matic NX-01 (warrior trainer) — gate by 14013 "Charge"
(14, 510053, 500055, 0, 0, 8, 0, 14013, 0, 0, 1, 0, 0, '', 'before: offline'),
(14, 510053, 500056, 0, 0, 8, 0, 14013, 0, 0, 0, 0, 0, '', 'after: online');
