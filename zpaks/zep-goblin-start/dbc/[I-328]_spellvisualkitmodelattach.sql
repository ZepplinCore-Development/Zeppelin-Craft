-- I-328 Mechashark X-Steam appearance — SpellVisualKit 14016 attachments.
-- Effectnames and the full six-attachment inventory: [I-328]_spellvisualeffectname.sql.

-- Rockets: right mesh, wrong scale. Repoint both to 90102 (the donor's 6279 at scale
-- 1.25) — geometry is already the 4.3.4 row verbatim and is NOT touched.
-- AUTO-owned rows -> UPDATE, one per id.
UPDATE spellvisualkitmodelattach SET `spell_vis_effect_name_id` = 90102 WHERE id = 90008;
UPDATE spellvisualkitmodelattach SET `spell_vis_effect_name_id` = 90102 WHERE id = 90009;

-- The periscope, restored from 4.3.4 attach row 3710 verbatim: attachment 17 (head,
-- model-space 2.208, 0, 1.111), offset back and up along the skull, yawed -90 degrees so
-- the pipe stands vertical, with a slight roll. The smoke flare already shipped as 90007
-- and is aimed at this pipe's mouth (-3.75, 0.3, 0.6) — without the pipe it has been
-- venting out of thin air.
--
-- Id 91001, NOT the next free 90037: `[AUTO,F-011]_spellvisualkitmodelattach.sql` opens
-- with `DELETE ... WHERE id BETWEEN 90001 AND 90999`, so anything added inside that band
-- is wiped the next time the AUTO file applies, and a regen that grows the emitter's own
-- 90xxx run would collide with it besides.
DELETE FROM spellvisualkitmodelattach WHERE id = 91001;
INSERT INTO spellvisualkitmodelattach SET
  `id` = 91001,
  `parent_spell_vis_kit_id` = 14016,
  `spell_vis_effect_name_id` = 90103,
  `attachment_id` = 17,
  `offset_x` = -3.5,
  `offset_y` = 0.3,
  `offset_z` = 0.5,
  `yaw` = -1.5708,
  `pitch` = 0,
  `roll` = -0.0873;
