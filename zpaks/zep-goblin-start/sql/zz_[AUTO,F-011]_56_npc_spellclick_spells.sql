-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 npc_spellclick_spells (one file per table; rows carry final state)

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34840,35995,38802,39039,39592);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34830,35999,37179,48526,48721,75106);

INSERT INTO npc_spellclick_spells (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
  (34840, 66392, 1, 0),
  (35995, 46598, 1, 0),
  (38802, 72971, 0, 0),
  (39039, 46598, 1, 0),
  (39592, 56685, 1, 0),
  (34830, 66306, 1, 0),
  (35999, 46598, 0, 0),
  (37179, 70016, 1, 0),
  (48526, 56685, 1, 0),
  (48721, 46598, 1, 0),
  (75106, 56685, 1, 0);

