-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- [F-011] creature_immunities from Neltharion mechanic_immune_mask (bosses lost CC-immunity).
-- One row per distinct mask; creature_template.CreatureImmunitiesId repointed. migrate_immunities_movement.py.

DELETE FROM creature_immunities WHERE ID=91100;
INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES (91100,0,0,613097308,0,0,0,0,'F-011 goblin boss immunities 0x248B1F5C');
UPDATE creature_template SET CreatureImmunitiesId=91100 WHERE entry IN (35222,36403,36682,36735,39039,39615);
DELETE FROM creature_immunities WHERE ID=91101;
INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES (91101,0,0,1073741695,0,0,0,0,'F-011 goblin boss immunities 0x3FFFFF7F');
UPDATE creature_template SET CreatureImmunitiesId=91101 WHERE entry IN (35999,38526);
DELETE FROM creature_immunities WHERE ID=91102;
INSERT INTO creature_immunities (ID,SchoolMask,DispelTypeMask,MechanicsMask,Effects,Auras,ImmuneAoE,ImmuneChain,Comment) VALUES (91102,0,0,2147483647,0,0,0,0,'F-011 goblin boss immunities 0x7FFFFFFF');
UPDATE creature_template SET CreatureImmunitiesId=91102 WHERE entry IN (1337016);
