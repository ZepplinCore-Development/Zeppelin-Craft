-- I-138: HD Tree Interference
--
-- SAI structure for Lazy Peon (entry 10556):
--   Each peon has two scripts: <guid*100> (sleep loop) and <guid*100+1>
--   (awakened loop). The flow does TWO chop iterations per loop:
--
--     1. Move To "LumberPile stop"   (sleep id 2 / awakened id 5)
--     2. Set Orientation toward LumberPile
--     3. Add Kneel aura  (brief kneel at LumberPile — pick up / deposit)
--     4. Remove Kneel
--     5. Move To "Tree stop"         (sleep id 7 / awakened id 11)
--     6. Play Sound 6197
--     7. Set Emote State 173         (chop swing emote)
--     8. Set Emote State 0
--     9. Move To "LumberPile stop"   (sleep id 11 / awakened id 15)
--    10-15. (Same as 2-8 — second iteration)
--    16. Move To "LumberPile stop"   (sleep id 16 / awakened id 20)
--    17. Move To sleep position     (sleep id 20 / awakened id 24)
--
-- The Tree stop is where the chop animation plays — it must sit JUST OUTSIDE
-- the tree's safe radius. Original SAI authored these too close to the trunk
-- (often inside the HD tree's collision); user supplies a safe-edge coord
-- and that coord becomes the Tree stop. The LumberPile stop stays at its
-- original position (already near the LP gameobject).

-- ============================================================================
-- Hana'zua (creature guid 6471): stock spawn clips DurotarTree05 uid=122452.
-- ============================================================================
UPDATE creature SET position_x = -399.7, position_y = -4111.4, position_z = 50.2
  WHERE guid = 6471;

-- ============================================================================
-- LumberPile stops: restore to ORIGINAL values from the stock SAI
-- (sleep loop id 2 + id 11; awakened loop id 5 + id 15)
-- ============================================================================

-- guid 3345
UPDATE smart_scripts SET target_x = -228.318, target_y = -4277.61, target_z = 65.3247, target_o = 1.02993
  WHERE entryorguid = 334500 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -228.318, target_y = -4277.61, target_z = 65.3247, target_o = 1.02993
  WHERE entryorguid = 334501 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 3346
UPDATE smart_scripts SET target_x = -331.7, target_y = -4428.64, target_z = 53.782, target_o = 2.2342
  WHERE entryorguid = 334600 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -331.7, target_y = -4428.64, target_z = 53.782, target_o = 2.2342
  WHERE entryorguid = 334601 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 3347
UPDATE smart_scripts SET target_x = -234.1, target_y = -4450.19, target_z = 63.2157, target_o = 2.95221
  WHERE entryorguid = 334700 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -234.1, target_y = -4450.19, target_z = 63.2157, target_o = 2.95221
  WHERE entryorguid = 334701 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 3348
UPDATE smart_scripts SET target_x = -516.797, target_y = -4375.86, target_z = 46.1781, target_o = 3.60939
  WHERE entryorguid = 334800 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -516.797, target_y = -4375.86, target_z = 46.1781, target_o = 3.60939
  WHERE entryorguid = 334801 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 6523
UPDATE smart_scripts SET target_x = -318.613, target_y = -4133.32, target_z = 52.7755, target_o = 0.337633
  WHERE entryorguid = 652300 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -318.613, target_y = -4133.32, target_z = 52.7755, target_o = 0.337633
  WHERE entryorguid = 652301 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 6524
UPDATE smart_scripts SET target_x = -629.117, target_y = -4468.45, target_z = 46.6277, target_o = 1.30535
  WHERE entryorguid = 652400 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -629.117, target_y = -4468.45, target_z = 46.6277, target_o = 1.30535
  WHERE entryorguid = 652401 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 6525
UPDATE smart_scripts SET target_x = -755.114, target_y = -4323.08, target_z = 43.8142, target_o = 0.698278
  WHERE entryorguid = 652500 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -755.114, target_y = -4323.08, target_z = 43.8142, target_o = 0.698278
  WHERE entryorguid = 652501 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 6526
UPDATE smart_scripts SET target_x = -369.242, target_y = -4017.57, target_z = 50.6491, target_o = 5.22157
  WHERE entryorguid = 652600 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -369.242, target_y = -4017.57, target_z = 50.6491, target_o = 5.22157
  WHERE entryorguid = 652601 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 6527
UPDATE smart_scripts SET target_x = -755.82, target_y = -4147.39, target_z = 37.6741, target_o = 2.23197
  WHERE entryorguid = 652700 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -755.82, target_y = -4147.39, target_z = 37.6741, target_o = 2.23197
  WHERE entryorguid = 652701 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 7372
UPDATE smart_scripts SET target_x = -210.64, target_y = -4231.78, target_z = 63.4257, target_o = 3.37757
  WHERE entryorguid = 737200 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -210.64, target_y = -4231.78, target_z = 63.4257, target_o = 3.37757
  WHERE entryorguid = 737201 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 7373
UPDATE smart_scripts SET target_x = -769.523, target_y = -4203.34, target_z = 43.9795, target_o = 3.57738
  WHERE entryorguid = 737300 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -769.523, target_y = -4203.34, target_z = 43.9795, target_o = 3.57738
  WHERE entryorguid = 737301 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 7374
UPDATE smart_scripts SET target_x = -621.197, target_y = -4336.11, target_z = 41.1525, target_o = 0.0108
  WHERE entryorguid = 737400 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -621.197, target_y = -4336.11, target_z = 41.1525, target_o = 0.0108
  WHERE entryorguid = 737401 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 7375
UPDATE smart_scripts SET target_x = -269.136, target_y = -4137.83, target_z = 56.1272, target_o = 1.37121
  WHERE entryorguid = 737500 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -269.136, target_y = -4137.83, target_z = 56.1272, target_o = 1.37121
  WHERE entryorguid = 737501 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- guid 7376
UPDATE smart_scripts SET target_x = -494.018, target_y = -4459.84, target_z = 51.5334, target_o = 4.78675
  WHERE entryorguid = 737600 AND source_type = 9 AND id IN (2, 11) AND action_type = 69;
UPDATE smart_scripts SET target_x = -494.018, target_y = -4459.84, target_z = 51.5334, target_o = 4.78675
  WHERE entryorguid = 737601 AND source_type = 9 AND id IN (5, 15) AND action_type = 69;

-- ============================================================================
-- Tree stops: replace with the user's safe-edge / chop-position picks
-- (sleep loop id 7 + id 16; awakened loop id 11 + id 20)
-- ============================================================================

-- guid 3345 — tree uid=122173 r=9.29
UPDATE smart_scripts SET target_x = -226.69072, target_y = -4285.9907, target_z = 64.96744, target_o = 4.9202967
  WHERE entryorguid = 334500 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -226.69072, target_y = -4285.9907, target_z = 64.96744, target_o = 4.9202967
  WHERE entryorguid = 334501 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 3346 — tree uid=122157 r=7.56
UPDATE smart_scripts SET target_x = -333.99286, target_y = -4439.9834, target_z = 54.79607, target_o = 4.489482
  WHERE entryorguid = 334600 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -333.99286, target_y = -4439.9834, target_z = 54.79607, target_o = 4.489482
  WHERE entryorguid = 334601 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 3347 — tree uid=122165 r=12.47 (refined)
UPDATE smart_scripts SET target_x = -229.89293, target_y = -4446.6743, target_z = 63.455475, target_o = 6.1832
  WHERE entryorguid = 334700 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -229.89293, target_y = -4446.6743, target_z = 63.455475, target_o = 6.1832
  WHERE entryorguid = 334701 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 3348 — user direct chop pick
UPDATE smart_scripts SET target_x = -509.44684, target_y = -4371.349, target_z = 45.75032, target_o = 0.35452724
  WHERE entryorguid = 334800 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -509.44684, target_y = -4371.349, target_z = 45.75032, target_o = 0.35452724
  WHERE entryorguid = 334801 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 6523 — tree uid=122453 r=4.27
UPDATE smart_scripts SET target_x = -316.21558, target_y = -4123.007, target_z = 51.873123, target_o = 1.4511828
  WHERE entryorguid = 652300 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -316.21558, target_y = -4123.007, target_z = 51.873123, target_o = 1.4511828
  WHERE entryorguid = 652301 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 6524 — user direct chop pick
UPDATE smart_scripts SET target_x = -631.95557, target_y = -4480.3643, target_z = 45.49346, target_o = 4.5406976
  WHERE entryorguid = 652400 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -631.95557, target_y = -4480.3643, target_z = 45.49346, target_o = 4.5406976
  WHERE entryorguid = 652401 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 6525 — tree uid=115243 r=11.60
UPDATE smart_scripts SET target_x = -756.21686, target_y = -4324.821, target_z = 44.633312, target_o = 4.1411753
  WHERE entryorguid = 652500 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -756.21686, target_y = -4324.821, target_z = 44.633312, target_o = 4.1411753
  WHERE entryorguid = 652501 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 6526 — user direct chop pick (refined, closer to tree)
UPDATE smart_scripts SET target_x = -376.53577, target_y = -4027.2095, target_z = 49.159042, target_o = 1.9560566
  WHERE entryorguid = 652600 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -376.53577, target_y = -4027.2095, target_z = 49.159042, target_o = 1.9560566
  WHERE entryorguid = 652601 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 6527 — user direct chop pick
UPDATE smart_scripts SET target_x = -753.90497, target_y = -4140.015, target_z = 39.62933, target_o = 1.0810173
  WHERE entryorguid = 652700 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -753.90497, target_y = -4140.015, target_z = 39.62933, target_o = 1.0810173
  WHERE entryorguid = 652701 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 7372 — user direct chop pick
UPDATE smart_scripts SET target_x = -213.63907, target_y = -4221.8027, target_z = 62.63104, target_o = 1.8781967
  WHERE entryorguid = 737200 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -213.63907, target_y = -4221.8027, target_z = 62.63104, target_o = 1.8781967
  WHERE entryorguid = 737201 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 7373 — tree uid=115790 r=9.60
UPDATE smart_scripts SET target_x = -774.1518, target_y = -4195.3423, target_z = 43.210667, target_o = 2.1266286
  WHERE entryorguid = 737300 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -774.1518, target_y = -4195.3423, target_z = 43.210667, target_o = 2.1266286
  WHERE entryorguid = 737301 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 7374 — tree uid=115227 r=14.94
UPDATE smart_scripts SET target_x = -620.505, target_y = -4347.0713, target_z = 41.010418, target_o = 4.681109
  WHERE entryorguid = 737400 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -620.505, target_y = -4347.0713, target_z = 41.010418, target_o = 4.681109
  WHERE entryorguid = 737401 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 7375 — tree uid=122437 r=11.91
UPDATE smart_scripts SET target_x = -263.491, target_y = -4139.225, target_z = 57.125263, target_o = 5.45515
  WHERE entryorguid = 737500 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -263.491, target_y = -4139.225, target_z = 57.125263, target_o = 5.45515
  WHERE entryorguid = 737501 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- guid 7376 — tree uid=122161 r=7.31
UPDATE smart_scripts SET target_x = -498.02664, target_y = -4460.841, target_z = 51.61872, target_o = 2.471012
  WHERE entryorguid = 737600 AND source_type = 9 AND id IN (7, 16) AND action_type = 69;
UPDATE smart_scripts SET target_x = -498.02664, target_y = -4460.841, target_z = 51.61872, target_o = 2.471012
  WHERE entryorguid = 737601 AND source_type = 9 AND id IN (11, 20) AND action_type = 69;

-- ============================================================================
-- Sleep position moves: spawn was forcing the sleep→LumberPile walk to clip
-- a tree. Update both creature.position_* AND the SAI "Move To sleep" target
-- (sleep loop id 20, awakened loop id 24) so the peon sleeps and returns to
-- this new spot.
-- ============================================================================

-- guid 6525
UPDATE creature SET position_x = -755.114, position_y = -4323.08, position_z = 43.81373, orientation = 0.6331539
  WHERE guid = 6525;
UPDATE smart_scripts SET target_x = -755.114, target_y = -4323.08, target_z = 43.81373, target_o = 0.6331539
  WHERE entryorguid = 652500 AND source_type = 9 AND id = 20 AND action_type = 69;
UPDATE smart_scripts SET target_x = -755.114, target_y = -4323.08, target_z = 43.81373, target_o = 0.6331539
  WHERE entryorguid = 652501 AND source_type = 9 AND id = 24 AND action_type = 69;

-- guid 6526 (creature position already matches; just align SAI sleep target)
UPDATE smart_scripts SET target_x = -370.284, target_y = -4015.48, target_z = 50.7604, target_o = 2.49231
  WHERE entryorguid = 652600 AND source_type = 9 AND id = 20 AND action_type = 69;
UPDATE smart_scripts SET target_x = -370.284, target_y = -4015.48, target_z = 50.7604, target_o = 2.49231
  WHERE entryorguid = 652601 AND source_type = 9 AND id = 24 AND action_type = 69;

-- guid 7375
UPDATE creature SET position_x = -276.1027, position_y = -4139.029, position_z = 55.05303, orientation = 0.3891876
  WHERE guid = 7375;
UPDATE smart_scripts SET target_x = -276.1027, target_y = -4139.029, target_z = 55.05303, target_o = 0.3891876
  WHERE entryorguid = 737500 AND source_type = 9 AND id = 20 AND action_type = 69;
UPDATE smart_scripts SET target_x = -276.1027, target_y = -4139.029, target_z = 55.05303, target_o = 0.3891876
  WHERE entryorguid = 737501 AND source_type = 9 AND id = 24 AND action_type = 69;
