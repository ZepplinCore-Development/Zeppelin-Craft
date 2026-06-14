-- F-180: Bonelasher (18470) used the stock vanilla CarrionBird model (61) via
-- shared DisplayID 1192. That display is also used by 4 unrelated creatures
-- (Freed Druid of the Talon 2853, Dread Swoop 4692, Tundra Roc 24573,
-- Greater Tundra Roc 24574), so it can't be re-skinned in place without
-- changing all of them.
--
-- Instead, repoint Bonelasher's model row to DisplayID 16884 - the already
-- wired youngbird (model 900002) in gold. The gold BLP reads pale/whitish,
-- which suits Bonelasher's wastes habitat better than the original blue tint.
-- 16884 is otherwise only referenced by the 0-spawn "Outland Carrion Bird,
-- Yellow" template (see [F-180]_creaturedisplayinfo.sql).
--
-- Idempotent: keyed on CreatureID; re-running sets the same DisplayID.

UPDATE creature_template_model SET CreatureDisplayID = 16884 WHERE CreatureID = 18470; -- Bonelasher: CarrionBird 61 -> ThunderIsleYoungBird gold
