-- F-180: ThunderIsleYoungBird model reads visually smaller than the stock
-- CarrionBirdOutland it replaced even after model_scale 0.8 in DBC. Boost
-- creature_model_info.CombatReach on the live-spawn displays so melee feel
-- stays intact - the engine uses this value (not the model's geo box) for
-- hit-detection range. BoundingRadius is also nudged proportionally for
-- targeting / spell reticle reach.
--
-- Placeholder / unassigned displays (16881-16884, 17455, 18089, 20300,
-- 20347) are left at their stock 0 values - they have no spawns and raising
-- them would imply a combat profile that doesn't exist. (17646 is no longer
-- in that set: it is now Bonelasher's live display, see below.)

UPDATE creature_model_info SET BoundingRadius = 0.65,  CombatReach = 1.25 WHERE DisplayID = 16880; -- Bonestripper Buzzard
UPDATE creature_model_info SET BoundingRadius = 0.725, CombatReach = 1.45 WHERE DisplayID = 17089; -- Bonestripper Vulture
UPDATE creature_model_info SET BoundingRadius = 1.85,  CombatReach = 3.75 WHERE DisplayID = 18094; -- Torgos (rare elite)
UPDATE creature_model_info SET BoundingRadius = 1.55,  CombatReach = 3.10 WHERE DisplayID = 20348; -- Trachela (rare elite)
UPDATE creature_model_info SET BoundingRadius = 0.65,  CombatReach = 1.30 WHERE DisplayID = 17646; -- Bonelasher (normal lvl 64-65, buzzard-class profile)
