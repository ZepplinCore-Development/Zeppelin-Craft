-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 Kezan spellclick mechanics (npc_spellclick_spells + SourceType-18 conditions)
-- 5 clickable NPCs, 3 conditions (0 NPCs skipped: spellclick spell absent from 3.3.5a DBC).
-- Each click casts its spell on the NPC; the NPC's SmartAI reacts (spellhit) and gives quest credit.

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34830,35999,48526,48721,75106);
INSERT INTO npc_spellclick_spells (npc_entry,spell_id,cast_flags,user_type) VALUES
  (34830,66306,1,0),
  (35999,46598,0,0),
  (48526,56685,1,0),
  (48721,46598,1,0),
  (75106,56685,1,0);

DELETE FROM conditions WHERE SourceTypeOrReferenceId=18 AND SourceGroup IN (34830,35999,48526,48721,75106);
INSERT INTO conditions
  (SourceTypeOrReferenceId,SourceGroup,SourceEntry,SourceId,ElseGroup,ConditionTypeOrReference,ConditionTarget,ConditionValue1,ConditionValue2,ConditionValue3,NegativeCondition,ErrorType,ErrorTextId,ScriptName,Comment)
VALUES
  (18,34830,66306,0,0,9,0,14069,0,0,0,0,0,'',''),
  (18,48526,56685,0,0,9,0,28414,0,0,0,0,0,'',''),
  (18,75106,56685,0,0,9,0,24502,0,0,0,0,0,'','');
