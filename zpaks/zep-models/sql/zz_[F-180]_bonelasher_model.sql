-- F-180: Bonelasher (18470) used the stock vanilla CarrionBird model (61) via
-- shared DisplayID 1192. That display is also used by 4 unrelated creatures
-- (Freed Druid of the Talon 2853, Dread Swoop 4692, Tundra Roc 24573,
-- Greater Tundra Roc 24574), so it can't be re-skinned in place without
-- changing all of them.
--
-- Instead, repoint Bonelasher's model row to DisplayID 17646 - the already
-- wired youngbird (model 900002) in blue, matching Bonelasher's original
-- CarrionBirdSkinBlue tint. 17646 was a parked/unassigned youngbird color
-- (see [F-180]_creaturedisplayinfo.sql) and now becomes Bonelasher's display.
--
-- Idempotent: keyed on CreatureID; re-running sets the same DisplayID.

UPDATE creature_template_model SET CreatureDisplayID = 17646 WHERE CreatureID = 18470; -- Bonelasher: CarrionBird 61 -> ThunderIsleYoungBird blue
