-- I-211 Mo'arg Model Scale Consistency
-- Normalize open-world Mo'arg NPCs to a consistent 2x rendered size.
-- Size = DisplayScale(server) x creature_model_scale(DBC) x model_scale(DBC).
-- DisplayScale = 2.0 / creature_model_scale(display) -> every spawn renders 2x
-- regardless of which model is rolled. World DB only; no PATCH-Z. Idempotent.

-- Infernal Crafter (16942)
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 16942 AND `CreatureDisplayID` = 17210;  -- display 17210 cms 1.0 -> 2.0x = 2x
-- Cyber-Rage Forgelord (16943)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 16943 AND `CreatureDisplayID` = 19168;  -- display 19168 cms 2.0 -> 1.0x = 2x
-- Mo''arg Doomsmith (16944)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 16944 AND `CreatureDisplayID` = 19035;  -- display 19035 cms 2.0 -> 1.0x = 2x
-- Mo''arg Engineer (16945)
UPDATE `creature_template_model` SET `DisplayScale` = 1.3333 WHERE `CreatureID` = 16945 AND `CreatureDisplayID` = 18646;  -- display 18646 cms 1.5 -> 1.3333x = 2x
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 16945 AND `CreatureDisplayID` = 17207;  -- display 17207 cms 1.0 -> 2.0x = 2x
-- Mo''arg Forgefiend (16946)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 16946 AND `CreatureDisplayID` = 19035;  -- display 19035 cms 2.0 -> 1.0x = 2x
-- Mo''arg Master Planner (18567)
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 18567 AND `CreatureDisplayID` = 18370;  -- display 18370 cms 3.0 -> 0.6667x = 2x
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 18567 AND `CreatureDisplayID` = 17207;  -- display 17207 cms 1.0 -> 2.0x = 2x
-- Z''kral (18974)
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 18974 AND `CreatureDisplayID` = 17210;  -- display 17210 cms 1.0 -> 2.0x = 2x
-- Urga''zz (18976)
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 18976 AND `CreatureDisplayID` = 17210;  -- display 17210 cms 1.0 -> 2.0x = 2x
-- Mo''arg Overseer (19397)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19397 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 19397 AND `CreatureDisplayID` = 18370;  -- display 18370 cms 3.0 -> 0.6667x = 2x
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 19397 AND `CreatureDisplayID` = 18816;  -- display 18816 cms 3.0 -> 0.6667x = 2x
-- Mo''arg Engineer Transform (Drill) (19609)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19609 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
-- Doomclaw (19738)
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 19738 AND `CreatureDisplayID` = 18370;  -- display 18370 cms 3.0 -> 0.6667x = 2x
-- Mo''arg Weaponsmith (19755)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19755 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
-- Deathforge Smith (19756)
UPDATE `creature_template_model` SET `DisplayScale` = 2.0 WHERE `CreatureID` = 19756 AND `CreatureDisplayID` = 17210;  -- display 17210 cms 1.0 -> 2.0x = 2x
-- Doomforge Engineer (19960)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19960 AND `CreatureDisplayID` = 19486;  -- display 19486 cms 2.0 -> 1.0x = 2x
-- Doomforge Constructor (19965)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19965 AND `CreatureDisplayID` = 19168;  -- display 19168 cms 2.0 -> 1.0x = 2x
-- Dreadforge Machinist (19974)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19974 AND `CreatureDisplayID` = 19168;  -- display 19168 cms 2.0 -> 1.0x = 2x
-- Deathforge Over-Smith (19978)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19978 AND `CreatureDisplayID` = 19168;  -- display 19168 cms 2.0 -> 1.0x = 2x
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 19978 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
-- Mo''arg Warp-Master (20326)
UPDATE `creature_template_model` SET `DisplayScale` = 1.3333 WHERE `CreatureID` = 20326 AND `CreatureDisplayID` = 18646;  -- display 18646 cms 1.5 -> 1.3333x = 2x
-- Ara Engineer (20439)
UPDATE `creature_template_model` SET `DisplayScale` = 1.25 WHERE `CreatureID` = 20439 AND `CreatureDisplayID` = 18289;  -- display 18289 cms 1.6 -> 1.25x = 2x
-- Razorsaw (20798)
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 20798 AND `CreatureDisplayID` = 18816;  -- display 18816 cms 3.0 -> 0.6667x = 2x
-- Ironspine Forgelord (20928)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 20928 AND `CreatureDisplayID` = 19486;  -- display 19486 cms 2.0 -> 1.0x = 2x
-- Overseer Ripsaw (21499)
UPDATE `creature_template_model` SET `DisplayScale` = 0.8 WHERE `CreatureID` = 21499 AND `CreatureDisplayID` = 20509;  -- display 20509 cms 2.5 -> 0.8x = 2x
-- Mo''arg Extractor (22304)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 22304 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
-- Mo''arg Tormenter Transform (23214)
UPDATE `creature_template_model` SET `DisplayScale` = 0.6667 WHERE `CreatureID` = 23214 AND `CreatureDisplayID` = 18816;  -- display 18816 cms 3.0 -> 0.6667x = 2x
-- Mo''arg Incinerator (23354)
UPDATE `creature_template_model` SET `DisplayScale` = 0.5 WHERE `CreatureID` = 23354 AND `CreatureDisplayID` = 19899;  -- display 19899 cms 4.0 -> 0.5x = 2x
-- Mo''arg Extractor (1) (30793)
UPDATE `creature_template_model` SET `DisplayScale` = 1.0 WHERE `CreatureID` = 30793 AND `CreatureDisplayID` = 18368;  -- display 18368 cms 2.0 -> 1.0x = 2x
