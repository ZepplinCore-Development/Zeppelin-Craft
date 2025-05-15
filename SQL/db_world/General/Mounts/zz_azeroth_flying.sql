UPDATE `dbc`.`spell`
SET `AttributesEx4` = `AttributesEx4` & ~67108864
WHERE (`EffectApplyAuraName1` = 78
   OR `EffectApplyAuraName2` = 78
   OR `EffectApplyAuraName3` = 78)
  AND (`AttributesEx4` & 67108864) = 67108864;
