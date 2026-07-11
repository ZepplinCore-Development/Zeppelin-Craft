-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 quest-target NPC templates (credit proxies / rescue targets, template-only, stock display)

DELETE FROM creature_template WHERE entry = 34748;
INSERT INTO creature_template SET `entry`=34748, `name`='Goblin Survivor', `subname`=NULL, `minlevel`=3, `maxlevel`=5, `exp`=0, `faction`=7, `npcflag`=0, `unit_class`=1, `type`=7, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=33536, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 34748;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (34748,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 35760;
INSERT INTO creature_template SET `entry`=35760, `name`='Monkey Business Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 35760;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (35760,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 35816;
INSERT INTO creature_template SET `entry`=35816, `name`='Miner Troubles Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 35816;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (35816,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 37872;
INSERT INTO creature_template SET `entry`=37872, `name`='Capturing The Unknown - Bunny 1', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1048576, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=33555200, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37872;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37872,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 37895;
INSERT INTO creature_template SET `entry`=37895, `name`='Capturing The Unknown - Bunny 2', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1048576, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=33555200, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37895;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37895,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 37896;
INSERT INTO creature_template SET `entry`=37896, `name`='Capturing The Unknown - Bunny 3', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1048576, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=33555200, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37896;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37896,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 37897;
INSERT INTO creature_template SET `entry`=37897, `name`='Capturing The Unknown - Bunny 4', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1048576, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=33555200, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37897;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37897,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38024;
INSERT INTO creature_template SET `entry`=38024, `name`='It''s A Town-In-A-Box Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38024;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38024,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38117;
INSERT INTO creature_template SET `entry`=38117, `name`='Cluster Cluck Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38117;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38117,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38318;
INSERT INTO creature_template SET `entry`=38318, `name`='Mechashark X-Steam', `subname`=NULL, `minlevel`=1, `maxlevel`=7, `exp`=0, `faction`=2204, `npcflag`=16777216, `unit_class`=1, `type`=0, `type_flags`=1048576, `rank`=1, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=6, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38318;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38318,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 38413;
INSERT INTO creature_template SET `entry`=38413, `name`='Naga Hatchling Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38413;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38413,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38448;
INSERT INTO creature_template SET `entry`=38448, `name`='Faceless of the Deep', `subname`=NULL, `minlevel`=8, `maxlevel`=8, `exp`=0, `faction`=14, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1.75, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38448;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38448,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 38536;
INSERT INTO creature_template SET `entry`=38536, `name`='Town-In-A-Box: Under Attack Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38536;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38536,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38644;
INSERT INTO creature_template SET `entry`=38644, `name`='Oomlot Shaman', `subname`=NULL, `minlevel`=7, `maxlevel`=8, `exp`=0, `faction`=14, `npcflag`=0, `unit_class`=8, `type`=7, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=32768, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38644;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38644,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 38713;
INSERT INTO creature_template SET `entry`=38713, `name`='Yngwie''s Soul', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=6, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38713;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38713,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 38807;
INSERT INTO creature_template SET `entry`=38807, `name`='Zombies vs. Super Booster Rocket Boots Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38807;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38807,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38842;
INSERT INTO creature_template SET `entry`=38842, `name`='Rocket Boot Boost Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38842;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38842,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 38868;
INSERT INTO creature_template SET `entry`=38868, `name`='Volcanoth! Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 38868;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (38868,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 39276;
INSERT INTO creature_template SET `entry`=39276, `name`='Throw It On The Ground! Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 39276;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (39276,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 39335;
INSERT INTO creature_template SET `entry`=39335, `name`='Wild Mine Cart Ride Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 39335;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (39335,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 39393;
INSERT INTO creature_template SET `entry`=39393, `name`='Good-bye, Sweet Oil Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 39393;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (39393,0,11686,1,1,0);

DELETE FROM creature_template WHERE entry = 50046;
INSERT INTO creature_template SET `entry`=50046, `name`='"Up, Up & Away" Kill Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 50046;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (50046,0,11686,1,1,0);

