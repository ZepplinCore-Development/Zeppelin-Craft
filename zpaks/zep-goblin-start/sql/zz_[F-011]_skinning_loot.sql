-- [F-011] skinning_loot_template from Neltharion (old->new loot schema). migrate_profession_loot.py.
-- Items absent from AC item_template skipped (port-or-skip). Idempotent.

DELETE FROM skinning_loot_template WHERE Entry IN (33420,34699,35904,36681,36719,36740,38187,38845,39354,39376,40064,100008);
INSERT INTO skinning_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES
  (33420,785,0,22.931,0,1,0,1,2),
  (33420,2447,0,23.587,0,1,0,1,2),
  (33420,765,0,25.264,0,1,0,1,3),
  (33420,2449,0,28.217,0,1,0,1,2),
  (38845,783,0,4.506,0,1,0,1,6),
  (36740,2318,0,32.653,0,1,0,1,2),
  (38187,2318,0,39.631,0,1,0,1,5),
  (36740,2934,0,67.347,0,1,0,1,2),
  (36719,2934,0,77.273,0,1,0,1,5),
  (36740,3642,0,2.041,0,1,0,1,1),
  (36681,2318,0,40.052,0,1,0,1,5),
  (36681,2934,0,59.948,0,1,0,1,6),
  (34699,2934,0,71.429,0,1,0,1,1),
  (35904,2318,0,45.946,0,1,0,1,1),
  (35904,2934,0,54.054,0,1,0,1,2),
  (34699,2318,0,28.571,0,1,0,1,1),
  (34699,2589,0,2.381,0,1,0,2,2),
  (100008,2934,0,100,0,1,1,1,1),
  (38845,2318,0,59.595,0,1,0,1,7),
  (38845,2934,0,35.899,0,1,0,1,5),
  (38187,2934,0,60.369,0,1,0,1,6),
  (36740,2589,0,4.082,0,1,0,1,1),
  (36719,2318,0,22.727,0,1,0,1,1),
  (40064,2318,0,39.124,0,1,0,1,6),
  (40064,2934,0,60.876,0,1,0,1,6);

UPDATE creature_template SET skinloot=100008 WHERE entry=7395;
UPDATE creature_template SET skinloot=33420 WHERE entry=33420;
UPDATE creature_template SET skinloot=34699 WHERE entry=34699;
UPDATE creature_template SET skinloot=35904 WHERE entry=35904;
UPDATE creature_template SET skinloot=36681 WHERE entry=36681;
UPDATE creature_template SET skinloot=36719 WHERE entry=36719;
UPDATE creature_template SET skinloot=36740 WHERE entry=36740;
UPDATE creature_template SET skinloot=38187 WHERE entry=38187;
UPDATE creature_template SET skinloot=38845 WHERE entry=38845;
UPDATE creature_template SET skinloot=39354 WHERE entry=39354;
UPDATE creature_template SET skinloot=39376 WHERE entry=39376;
UPDATE creature_template SET skinloot=40064 WHERE entry=40064;
