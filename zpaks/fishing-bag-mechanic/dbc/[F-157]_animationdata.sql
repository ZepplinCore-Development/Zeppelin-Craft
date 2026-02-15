-- [F-157] fishing-bag-mechanic: animationdata
-- Change FishingCast (133) and FishingLoop (134) wep_flags from 32 to 16
-- wep_flags 32 = draw equipped weapon, 16 = draw tool (works with right_weapon_effect)
-- This matches EmoteWork (mining, 62) which also uses wep_flags 16

-- animationdata: 2 updates
UPDATE `animationdata` SET `wep_flags` = 16 WHERE `id` = 133;
UPDATE `animationdata` SET `wep_flags` = 16 WHERE `id` = 134;
