-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 Lost Isles spellclick mechanics (npc_spellclick_spells + SourceType-18 conditions)
-- 4 clickable NPCs, 2 conditions (7 NPCs skipped: spellclick spell absent from 3.3.5a DBC).
-- Each click casts its spell on the NPC; the NPC's SmartAI reacts (spellhit) and gives quest credit.

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (35995,38802,39039,39592);
INSERT INTO npc_spellclick_spells (npc_entry,spell_id,cast_flags,user_type) VALUES
  (35995,46598,1,0),
  (38802,72971,0,0),
  (39039,46598,1,0),
  (39592,56685,1,0);

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup IN (35995,38802,39039,39592);
INSERT INTO conditions
  (SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,ConditionValue3,NegativeCondition,ErrorType,ErrorTextId,ScriptName,Comment)
VALUES
  (18,39592,56685,0,0,9,0,25251,0,0,0,0,0,'',''),
  (18,39592,56685,0,0,1,0,73989,0,0,1,0,0,'','');
