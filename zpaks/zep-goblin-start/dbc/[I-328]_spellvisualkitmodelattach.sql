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
-- Attachment 0 confirmed tracking in game.
--
-- ROUND 5, from the same test: periscope moved back behind the dorsal fin, rockets moved
-- back and pitched nose-down 20 degrees (they read as pointing skyward). Rest positions:
--
--   rocket L  (-0.800,  0.500, 1.600) pitch 0.349   periscope (-1.350, 0, 1.790)
--   rocket R  (-0.800, -0.500, 1.600) pitch 0.349   smoke     (-1.350, 0, 2.130)
--   eye L     ( 1.630,  1.000, 1.110) pitch 1.5708  eye R     ( 1.630, -1.000, 1.110)
--
-- The dorsal fin occupies x -1.05..-0.20 (midline top z > 2.1, peaking 2.415 at x -1.0);
-- behind it the back drops to 1.546 at x -1.30 and 1.342 at x -1.45, so the periscope
-- base sits at x -1.35 on a 1.45 surface. Pitching a 1.96-long rocket nose-down about an
-- origin near its own tail drops the nose 0.42 and lifts the tail 0.12, so z goes up 0.30
-- to keep the nose out of the mesh: it now runs from (0.35, ±0.5, 1.18) at the tip to
-- (-1.13, ±0.5, 1.72) at the tail, tucked against the shoulder and alongside the fin.
--
-- Pitch sign: positive pitch rotates +Z toward +X (that is what the donor's 1.5708 does to
-- the upright light discs), so on a +X-aligned rocket it rotates the nose toward -Z, down.
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
  `offset_x` = -1.318,
  `offset_y` = 0.498,
  `offset_z` = 0.153,
  `yaw` = 0,
  `pitch` = 0.349,
  `roll` = 0
WHERE id = 90008;

UPDATE spellvisualkitmodelattach SET
  `spell_vis_effect_name_id` = 90102,
  `attachment_id` = 0,
  `offset_x` = -1.318,
  `offset_y` = -0.502,
  `offset_z` = 0.153,
  `yaw` = 0,
  `pitch` = 0.349,
  `roll` = 0
WHERE id = 90009;

-- ROUND 7. Attachment ids are not free-form slots, they are AttachmentType enum values
-- with fixed semantics, and reading them that way explains the last two reports:
--
--   0  Shield/MountMain  ( 0.518,  0.002, 1.447)  bone 16 <- root 0
--   15 ChestBloodFront   ( 1.548, -0.012, 0.547)  bone 22 <- 4
--   16 ChestBloodBack    (-1.743, -0.029, 1.226)  bone 29 <- 10, the REAR SPINE
--   17 Breath (mouth)    ( 1.733,  0.000, 0.776)  bone 26 <- 9, the head chain
--   18 PlayerName        (-0.077,  0.000, 2.849)  parent -1, static  (round 4's mistake)
--   19 Base / 20 Head    also parent -1, static
--   21/22 Shoulders      the pectoral fins
--
-- The periscope was still on attachment 0, whose bone hangs off the ROOT — fine for the
-- rockets at x -0.80, wrong for a part at x -1.35 that should follow the rear body. It
-- sat 1.87 behind its own pivot and lagged the segment it visually belongs to. Moved to
-- attachment 16, whose bone 29 is parented into the 0->2->7->10 spine chain and pivots at
-- x -1.743, only 0.39 from the pipe. Rest position unchanged.
UPDATE spellvisualkitmodelattach SET
  `attachment_id` = 16,
  `offset_x` = 0.393,
  `offset_y` = 0.029,
  `offset_z` = 0.904
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
  `attachment_id` = 16,
  `offset_x` = 0.393,
  `offset_y` = 0.029,
  `offset_z` = 0.564,
  `yaw` = -1.5708,
  `pitch` = 0,
  `roll` = -0.0873;

-- The eye lights, the last two of kit 14016's six attachments (4.3.4 rows 3715/3716).
-- Blocked until now on the mesh: `ul_light_effect_green.mdx` is Cata-only. Retroported
-- 272 -> 264 and shipped in this zpak — recipe, hashes and preconditions in
-- `asset_recipes.json`, converter in `cli/lib/m2_retroport.py`.
--
-- These go on attachment 17, NOT attachment 0: 17 is bone 26 on the animated head chain,
-- and eyes should turn with the head. Only hull-mounted parts want the root.
--
-- The donor's offsets (y ±1.33 / -1.65) are for the stock hammerhead's wider lobes; ours
-- tip out at ±0.930 (head verts x > 1.0, outer face x 1.42..1.83, z 0.98..1.22). Placed
-- at y ±1.00, just proud of the tips so the disc is not buried in the lobe. Donor pitch
-- 1.5708 kept: the mesh is a flat 1.6-wide glow disc lying in XY, and 90 degrees stands
-- it upright facing forward.
DELETE FROM spellvisualkitmodelattach WHERE id IN (91002, 91003);
INSERT INTO spellvisualkitmodelattach
  (`id`, `parent_spell_vis_kit_id`, `spell_vis_effect_name_id`, `attachment_id`,
   `offset_x`, `offset_y`, `offset_z`, `yaw`, `pitch`, `roll`) VALUES
  (91002, 14016, 90104, 17, -0.103,  0.78, 0.334, 0, 1.5708, 0),
  (91003, 14016, 90104, 17, -0.103, -0.78, 0.334, 0, 1.5708, 0);

-- Eye lights sat about a yard outboard of the eyes. Not the centre — the DISC. Display
-- 21763 renders at `creature_model_scale` 2.0, so a model unit is two yards on screen,
-- and the donor's effectname scale 0.5 makes a glow 0.82 model units wide whose outer
-- edge reached y 1.409 against a lobe tip at 0.930: a 0.96-yard overhang, which is the
-- report to the decimal. The donor sized that disc for the stock hammerhead, whose lobes
-- reach 1.650 — our HD head is 56% of that width, so the same disc is proportionally
-- ~80% too big. Centre pulled 1.00 -> 0.78 here, and the effectname scaled by the same
-- head ratio, 0.5 * (0.930/1.650) = 0.28, in [I-328]_spellvisualeffectname.sql. Outer
-- edge now lands 0.16 yards past the eye instead of 0.96.
--
-- Untouched: "Freakin' Laser Beam" (spell 71659, visual 15153) renders through kits
-- 14540/10116/8650, which carry only a `chest_effect` — that is the stock chest
-- attachment, no SpellVisualKitModelAttach row of ours, and a separate knob if the beam
-- origin itself is wrong.
