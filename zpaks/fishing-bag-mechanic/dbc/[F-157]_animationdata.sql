-- [F-157] fishing-bag-mechanic: animationdata
-- Test A: wep_flags=0 (draw nothing) — let SpellVisualKit right_weapon_effect handle rod visual
-- Original: 32 (draw equipped weapon), tried 16 (draw tool) but caused double rod with right_weapon_effect

-- animationdata: 2 updates
UPDATE `animationdata` SET `wep_flags` = 0 WHERE `id` = 133;
UPDATE `animationdata` SET `wep_flags` = 0 WHERE `id` = 134;
