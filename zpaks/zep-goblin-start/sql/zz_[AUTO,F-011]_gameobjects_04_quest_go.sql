-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by `zep goblin gen` (F-011 translation layer).
-- Any manual edit here is overwritten the next time gen runs.
--   * To change this output: edit the gen emitter or a fixture.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 quest-summoned GO templates (not fixed-spawned; makes quest objective refs valid)

DELETE FROM gameobject_template WHERE entry = 202472;
INSERT INTO gameobject_template SET `entry`=202472, `type`=10, `displayId`=8586, `name`='Land Mine', `IconName`='', `castBarCaption`='', `unk1`='', `size`=1.0, `Data0`=0, `Data1`=0, `Data2`=0, `Data3`=0, `Data4`=0, `Data5`=1, `Data6`=0, `Data7`=0, `Data8`=0, `Data9`=0, `Data10`=0, `Data11`=0, `Data12`=0, `Data13`=1, `Data14`=0, `Data15`=0, `Data16`=0, `Data17`=0, `Data18`=0, `Data19`=0, `Data20`=0, `Data21`=0, `Data22`=0, `Data23`=0, `AIName`='', `ScriptName`='', `VerifiedBuild`=0;
