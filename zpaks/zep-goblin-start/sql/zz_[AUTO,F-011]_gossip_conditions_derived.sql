-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- [F-011] DERIVED gossip greeting gating (NOT from Neltharion source).
-- Menus with a before/after greeting pair but no source condition -> AC last-match-wins
-- showed the "after" text unconditionally. Gating inferred from each NPC's quest
-- relations; before = NOT rewarded, after = rewarded. Only high-confidence menus.

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
