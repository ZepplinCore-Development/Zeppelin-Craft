-- I-328 Mechashark X-Steam appearance — SpellVisualKit 14016 attachments.
-- Effectnames and the full six-attachment inventory: [I-328]_spellvisualeffectname.sql.
--
-- ROUND 3. The donor's attachment geometry is authored against the STOCK 3.3.5a
-- hammerhead, and our client does not run it: `patch-hd-everything` (ON, priority 500)
-- replaces `Creature\Shark\HammerHead.m2` in place — same DBC path, different mesh, so
-- creaturemodeldata 230 gives no hint that the model was swapped. Both meshes were
-- parsed; the HD one is a different animal:
--
--                       stock 3.3.5a          patch-hd-everything
--   vertices            464                   1000
--   length (x)          -3.671 .. 2.250       -4.237 .. 2.435
--   width (y)           -1.650 .. 1.644       -1.214 .. 1.214     <- 26% narrower
--   attachment 17       (2.208, 0, 1.111)     (1.733, 0, 0.776)   <- moved back and down
--   attachment 21/22    (-0.236, ±1.208, .056) same                  (bones 27/28 now)
--   attachment 18       (-0.077, 0, 2.849)    same
--
-- That explains both reports exactly:
--   * Rockets in the wrong place — attachments 21/22 are the pectoral fin TIPS, and on
--     the narrower HD fins the donor's +0.5/-0.6 y offsets push them past the mesh edge
--     (1.208 + 0.5 = 1.708 against a 1.214 half-width) so they hang in open water.
--   * No sign of the pipe — attachment 17 moved 0.475 back and 0.335 down, so the
--     donor's (-3.5, 0.3, 0.5) lands the periscope at (-1.767, 0.3, 1.276): mid-body,
--     buried INSIDE the shark, where the body is only 0.296 half-wide and 2.4 tall.
--     The asset and the DBC row were fine all along (verified present in PATCH-O and in
--     the built SpellVisualEffectName.dbc) — it was hidden in the mesh.
--
-- ROUND 4. Round 3 mounted all four models on **attachment 18** to get them off the
-- animated fin chains. That over-corrected: attachment 18 is bone 12, and bone 12 has
-- `parent = -1` with a single animation block — a static model-space marker that nothing
-- drives at all. The parts held still in world space while the shark swam through them.
--
-- The bone table sorts the ten attachments into three groups:
--
--   bones 0-11    14 translation + 14 rotation blocks   the actual rig
--   bones 12/13/14 (att 18/19/20)  parent -1            static markers - do not track
--   bones 16/17/22/26/27/28/29     children of the rig  track, via their parent
--
-- What we want is a mount that rides the body without riding a flapping fin, and the HD
-- author left exactly one: **attachment 0**, bone 16, pivot (0.518, 0.002, 1.447) — on
-- the back, and a direct child of bone 0, the animated root (14/14 blocks). It inherits
-- the whole-body swim motion but not the spine undulation of the 2->7->10->11 chain or
-- the fin stroke of 6/8, which is right for parts bolted to a hull.
--
-- Rest positions are UNCHANGED from round 3 (confirmed good in game) — only the parent
-- and the offsets that reach the same point from the new pivot:
--
--   rocket L  (-0.300,  0.500, 1.300)      periscope (0.450, 0, 1.920)
--   rocket R  (-0.300, -0.500, 1.300)      smoke     (0.450, 0, 2.280)
--
-- Caveat: attachment 0 exists on the HD mesh only — the stock hammerhead has 15-22 and
-- 34, no 0. That is fine while `patch-hd-everything` ships the model, and it is the same
-- dependency the offsets themselves already carry.
--
-- Measurements behind the rest positions, against the HD mesh:
--
--   back surface, midline      x 0.4 -> z 1.60,  x 0.2 -> z 1.86  (dorsal fin from x -0.4)
--   back surface, |y| 0.3-0.5  z 1.276 flat from x -0.2 to 0.8    (the shoulder)
--   rocket model               1.96 long x 0.86 wide at scale 1.25, origin near its tail
--   pipe model                 0.68 tall at scale 0.1, origin at its centre

-- Rockets: on the shoulders, straddling the dorsal fin, nose forward (+x, yaw 0).
-- Origin (-0.30, ±0.50, 1.30) -> body from x -0.70 to 0.87, bottom edge just sunk into
-- the 1.276 shoulder surface. AUTO-owned rows -> UPDATE, one per id.
UPDATE spellvisualkitmodelattach SET
  `spell_vis_effect_name_id` = 90102,
  `attachment_id` = 0,
  `offset_x` = -0.818,
  `offset_y` = 0.498,
  `offset_z` = -0.147,
  `yaw` = 0,
  `pitch` = 0,
  `roll` = 0
WHERE id = 90008;

UPDATE spellvisualkitmodelattach SET
  `spell_vis_effect_name_id` = 90102,
  `attachment_id` = 0,
  `offset_x` = -0.818,
  `offset_y` = -0.502,
  `offset_z` = -0.147,
  `yaw` = 0,
  `pitch` = 0,
  `roll` = 0
WHERE id = 90009;

-- Smoke flare: was aimed at the periscope's mouth on the stock mesh and has been venting
-- out of the tail on ours. Re-aimed at the new pipe top (0.45, 0, 2.28).
UPDATE spellvisualkitmodelattach SET
  `attachment_id` = 0,
  `offset_x` = -0.068,
  `offset_y` = -0.002,
  `offset_z` = 0.833
WHERE id = 90007;

-- The periscope: behind the head, ahead of the dorsal fin, on the midline. Origin
-- (0.45, 0, 1.92) puts its base on the 1.58 back surface and its top at 2.26. The
-- donor's yaw/roll are kept — the pipe mesh is already a z-aligned cylinder, so yaw only
-- spins the elbow, which is what those values were for.
--
-- Id 91001, NOT the next free 90037: `[AUTO,F-011]_spellvisualkitmodelattach.sql` opens
-- with `DELETE ... WHERE id BETWEEN 90001 AND 90999`, so anything added inside that band
-- is wiped the next time the AUTO file applies.
DELETE FROM spellvisualkitmodelattach WHERE id = 91001;
INSERT INTO spellvisualkitmodelattach SET
  `id` = 91001,
  `parent_spell_vis_kit_id` = 14016,
  `spell_vis_effect_name_id` = 90103,
  `attachment_id` = 0,
  `offset_x` = -0.068,
  `offset_y` = -0.002,
  `offset_z` = 0.473,
  `yaw` = -1.5708,
  `pitch` = 0,
  `roll` = -0.0873;
