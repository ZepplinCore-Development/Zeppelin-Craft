-- F-011 quest-target NPC templates (credit proxies / rescue targets, template-only, stock display)

DELETE FROM creature_template WHERE entry = 37179;
INSERT INTO creature_template SET `entry`=37179, `name`='Bilgewater Buccaneer', `subname`=NULL, `minlevel`=5, `maxlevel`=5, `exp`=0, `faction`=7, `npcflag`=16777216, `unit_class`=1, `type`=9, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=4, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37179;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37179,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 37561;
INSERT INTO creature_template SET `entry`=37561, `name`='Overloaded Generator', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37561;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37561,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 37590;
INSERT INTO creature_template SET `entry`=37590, `name`='Stove Leak', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37590;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37590,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 37594;
INSERT INTO creature_template SET `entry`=37594, `name`='Smoldering Bed', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=10, `type_flags`=1024, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37594;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37594,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 37598;
INSERT INTO creature_template SET `entry`=37598, `name`='Gasbot', `subname`=NULL, `minlevel`=5, `maxlevel`=5, `exp`=0, `faction`=35, `npcflag`=2, `unit_class`=1, `type`=9, `type_flags`=0, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=1, `ManaModifier`=1, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 37598;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (37598,0,646,1,1,0);

DELETE FROM creature_template WHERE entry = 44175;
INSERT INTO creature_template SET `entry`=44175, `name`='Spell Practice Credit', `subname`=NULL, `minlevel`=1, `maxlevel`=1, `exp`=0, `faction`=35, `npcflag`=0, `unit_class`=1, `type`=9, `type_flags`=4, `rank`=0, `DamageModifier`=0.75, `BaseVariance`=1, `RangeVariance`=1, `HealthModifier`=0.0238, `ManaModifier`=0, `ArmorModifier`=1, `RegenHealth`=1, `MovementType`=0, `unit_flags`=0, `AIName`='', `flags_extra`=0, `lootid`=0, `VerifiedBuild`=0;
DELETE FROM creature_template_model WHERE CreatureID = 44175;
INSERT INTO creature_template_model (CreatureID,Idx,CreatureDisplayID,DisplayScale,Probability,VerifiedBuild) VALUES (44175,0,11686,1,1,0);

