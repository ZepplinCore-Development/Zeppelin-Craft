-- [F-011] I-230 crash guard: strip SmartAI actions referencing spells STILL absent from Spell.dbc.
-- Regenerated after the creature-spell port (2026-07-08): 57 spells now exist, so far fewer actions
-- are stripped. Loads AFTER zz_[F-011]_smartai.sql. Idempotent.
DELETE FROM smart_scripts WHERE source_type=0 AND (entryorguid, action_type, action_param1) IN ((34668,28,151137),(34668,28,151138),(37602,28,151137),(37602,28,151138),(38124,85,151158),(38318,11,71663),(38432,85,151146),(38448,11,66772),(38448,11,72035),(38448,11,72055),(38448,11,72076),(38448,11,75903),(38448,11,98240),(38644,11,72580),(39066,85,151152));
