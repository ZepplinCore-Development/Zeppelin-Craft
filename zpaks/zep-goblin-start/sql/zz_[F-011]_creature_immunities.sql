-- [F-011] creature_immunities from mechanic_immune_mask. migrate_immunities_movement.py.

DELETE FROM creature_immunities WHERE ID=91100;
INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES (91100,0,0,613097308,0,0,0,0,'F-011 goblin boss immunities 0x248B1F5C');
UPDATE creature_template SET CreatureImmunitiesId=91100 WHERE entry IN (35222,36403,36682,36735,39039,39615);
DELETE FROM creature_immunities WHERE ID=91101;
INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES (91101,0,0,1073741695,0,0,0,0,'F-011 goblin boss immunities 0x3FFFFF7F');
UPDATE creature_template SET CreatureImmunitiesId=91101 WHERE entry IN (35999,38526);
