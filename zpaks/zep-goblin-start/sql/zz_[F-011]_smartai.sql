-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 scoped SmartAI (quest-relevant creatures/GOs + timed action-lists) from Neltharion.
-- 118 script blocks, 512 rows total. 0 Cata-only rows skipped (event/action out of 3.3.5a range).

UPDATE creature_template SET AIName='SmartAI' WHERE entry IN (34668,34673,34689,34692,34693,34695,34696,34697,34748,34830,34835,34865,34872,34874,34876,34877,34878,34890,34892,34954,34957,34958,35053,35054,35120,35175,35200,35222,35650,35758,35769,35786,35837,35875,35893,35917,36092,36112,36127,36145,36161,36176,36425,36470,36471,36600,36682,36740,37106,37114,37561,37590,37594,37598,37602,37872,37895,37896,37897,38120,38122,38124,38318,38381,38387,38409,38432,38441,38448,38517,38644,38647,38696,38738,38746,38808,38809,38810,39039,39042,39065,39066,39193,39341,39354,39363,39426,39456,39582,39592,44175,48304,48305);
UPDATE gameobject_template SET AIName='SmartGameObjectAI' WHERE entry IN (202472);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34668;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34668,0,0,0,19,0,100,0,14138,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Taking Care Of Business'),
  (34668,0,1,0,20,0,100,0,25473,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'KajaCola'),
  (34668,0,2,0,19,0,100,0,14070,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Do It Yourself'),
  (34668,0,3,0,19,0,100,0,14115,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Pirate Party Crashers'),
  (34668,0,4,0,19,0,100,0,14116,0,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Uninvited Guest'),
  (34668,0,5,0,19,0,100,0,14122,0,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Great Bank Heist'),
  (34668,0,6,10,19,0,100,0,14125,0,0,0,1,6,0,0,0,0,0,7,0,0,0,0,0,0,0,0,447),
  (34668,0,7,0,19,0,100,0,14126,0,0,0,1,7,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Life Savings'),
  (34668,0,8,9,62,0,100,0,12493,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (34668,0,9,0,61,0,100,0,0,0,0,0,86,70319,4,7,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (34668,0,10,11,61,0,100,0,0,0,0,0,28,151137,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (34668,0,11,0,61,0,100,0,0,0,0,0,28,151138,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34673;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34673,0,0,0,1,0,100,0,1000,9000,5000,25000,11,73389,0,0,0,0,0,10,247332,48304,0,0,0,0,0,0,'Attack Auto 73389'),
  (34673,0,1,0,19,0,100,0,14007,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'quest add 14007 say0');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34689;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34689,0,0,0,1,0,100,0,2000,2000,6000,6000,11,73543,2,0,0,0,0,10,169762,34696,0,0,0,0,0,0,'Cast Fireball OOC'),
  (34689,0,1,0,19,0,100,0,14008,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'on quest 14008 say0');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34692;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34692,0,0,1,10,0,100,0,1,7,2000,2000,11,74973,2,0,0,0,0,17,0,8,0,0,0,0,0,0,'Cast Power Word: Fortitude on Player Missing Buff'),
  (34692,0,1,0,61,0,50,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (34692,0,2,0,19,0,100,0,14009,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest add 14009 say1');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34693;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34693,0,0,0,1,0,100,0,500,1000,240000,240000,11,1784,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cast Stealth on Spawn'),
  (34693,0,1,0,19,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest accept 14010 say1'),
  (34693,0,2,0,19,0,100,0,14123,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest accept 14123 say 0'),
  (34693,0,3,0,20,0,100,0,14010,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on questcomplete set emote4'),
  (34693,0,4,0,20,0,100,0,14123,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest complete 14123 emote4'),
  (34693,0,5,0,1,0,100,0,5000,30000,10000,50000,28,1784,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Remove aura 1784 after sometime');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34695;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34695,0,0,0,1,0,100,0,5100,71000,1000,610000,11,69626,0,0,0,0,0,9,24656,0,100,0,0,0,0,0,'Cast 69626'),
  (34695,0,1,0,1,0,100,0,500,1000,600000,600000,11,78273,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cast Flametongue Weapon on Spawn'),
  (34695,0,2,0,19,0,100,0,14011,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest add 14011 say0'),
  (34695,0,3,0,1,0,50,0,50000,120000,50000,120000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Parl');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34696;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34696,0,0,0,1,0,100,0,0,0,6000,6000,11,73538,2,0,0,0,0,10,169750,34689,0,0,0,0,0,0,'Cast Shadow bolt OOC'),
  (34696,0,1,0,11,0,100,1,0,0,0,0,11,44163,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Summon Imp Company'),
  (34696,0,2,0,19,0,100,0,14012,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'on quest add 14012 say0');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34697;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34697,0,0,0,19,0,100,0,14013,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest add 14013 say0');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34748;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34748,0,0,0,54,0,100,0,0,0,0,0,80,3474800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34830;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34830,0,0,0,11,0,100,0,0,0,0,0,87,3483001,3483002,3483003,3483004,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - linked - random actionlist/emote state'),
  (34830,0,1,0,8,0,100,1,66306,0,0,0,80,3483000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - on spellhit (66306) - run actionlist (3483000)');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34835;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34835,0,0,0,10,0,100,0,0,15,60000,60000,11,90317,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34835,0,1,0,0,0,100,0,4000,8000,8000,15000,11,75772,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (34835,0,2,3,4,0,100,0,0,0,0,0,28,90317,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34835,0,3,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34835,0,4,0,4,0,100,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34835,0,5,0,2,0,100,1,0,2,60000,60000,80,3483500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34865;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34865,0,0,0,0,0,100,0,3500,7700,13200,16700,11,32738,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Bore');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34872;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34872,0,0,0,20,0,100,0,14138,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest saytext0'),
  (34872,0,1,0,52,0,100,0,0,34872,0,0,11,87226,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'spellhit cadeau'),
  (34872,0,2,0,52,0,100,0,0,34872,0,0,1,1,3000,0,0,0,0,1,0,0,0,0,0,0,0,0,'link say text1'),
  (34872,0,3,0,52,0,100,0,1,0,0,0,1,2,3000,0,0,0,0,1,0,0,0,0,0,0,0,0,'link say text2'),
  (34872,0,4,0,19,0,100,0,25473,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest 25473 say text'),
  (34872,0,5,0,19,0,100,0,14124,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest 14124 say text 4'),
  (34872,0,6,0,1,0,50,0,45000,245000,45000,245000,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'criez say5');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34874;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34874,0,0,1,19,0,100,0,14071,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest 28349 end say text'),
  (34874,0,1,0,61,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest 28349 end say text'),
  (34874,0,2,0,64,0,100,0,0,0,0,0,5,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on gossip playemote'),
  (34874,0,3,0,20,0,100,0,14121,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'On quest-14121 play emote4'),
  (34874,0,4,0,20,0,100,0,14071,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34874,0,5,0,20,0,100,0,28607,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest-28607 play emote4');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34876;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34876,0,0,0,10,0,100,0,0,15,60000,60000,11,90318,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34876,0,1,0,0,0,100,0,2000,4000,6000,11000,11,75775,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (34876,0,2,3,4,0,100,0,0,0,0,0,28,90318,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34876,0,3,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34876,0,4,0,4,0,100,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34876,0,5,0,2,0,100,1,0,1,0,0,80,3487600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34877;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34877,0,0,0,10,0,100,0,0,15,60000,60000,11,90316,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34877,0,1,0,0,0,100,0,2000,8000,8000,15000,11,76137,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (34877,0,2,3,4,0,100,0,0,0,0,0,28,90316,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34877,0,3,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34877,0,4,0,4,0,100,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34877,0,5,0,2,0,100,1,0,1,0,0,80,3487700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34878;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34878,0,0,0,10,0,100,0,0,15,60000,60000,11,66146,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34878,0,1,0,0,0,100,0,2000,8000,8000,15000,11,75761,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (34878,0,2,0,0,0,100,0,6000,12000,12000,25000,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (34878,0,3,4,4,0,100,0,0,0,0,0,28,66146,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34878,0,4,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34878,0,5,0,4,0,100,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (34878,0,6,0,2,0,100,1,0,1,0,0,80,3487800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34890;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34890,0,0,0,8,0,100,0,61178,0,0,0,86,98914,2,7,0,0,0,19,34840,3,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34892;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34892,0,0,0,8,0,100,0,61178,0,0,0,86,98916,2,7,0,0,0,19,34840,3,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34954;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34954,0,0,0,8,0,100,0,61178,0,0,0,86,98915,2,7,0,0,0,19,34840,3,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34957;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34957,0,0,1,54,0,100,1,0,0,0,0,11,63313,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0),
  (34957,0,1,0,61,0,100,1,0,0,0,0,33,34957,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=34958;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (34958,0,0,1,54,0,100,1,0,0,0,0,11,98707,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0),
  (34958,0,1,0,61,0,100,1,0,0,0,0,33,34958,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35053;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35053,0,0,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'Play Emote on Gossip'),
  (35053,0,1,0,19,0,100,0,26712,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say Text on Quest Add'),
  (35053,0,2,3,19,0,100,0,14113,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say Text on Quest Add'),
  (35053,0,3,4,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Say Text on Awesome Party Ensemble'),
  (35053,0,4,5,61,0,100,0,0,0,0,0,28,91551,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35053,0,5,0,61,0,100,0,0,0,0,0,28,91551,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35053,0,6,0,10,0,100,0,1,3,20000,30000,1,3,1,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35054;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35054,0,0,0,19,0,100,0,26711,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say Text on Quest Add'),
  (35054,0,1,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'Play Emote on Gossip'),
  (35054,0,2,0,20,0,100,0,14110,0,0,0,5,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Play Emote on Quest End'),
  (35054,0,3,4,19,0,100,0,14153,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say Text on Quest Add'),
  (35054,0,4,0,61,0,100,0,0,0,0,0,28,91551,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35054,0,5,0,10,0,100,0,1,3,20000,30000,1,2,1,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35120;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35120,0,0,0,10,0,100,0,1,15,30000,60000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (35120,0,1,0,20,0,100,0,26712,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35120,0,2,0,20,0,100,0,26711,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35175;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35175,0,0,1,23,0,100,0,66916,1,15000,15000,33,35175,0,0,0,0,0,18,1,0,0,0,0,0,0,0,'Bubu'),
  (35175,0,1,0,1,0,100,0,15000,15000,15000,15000,28,66916,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35200;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35200,0,0,0,1,0,20,0,10000,80000,10000,320000,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say Out of combat'),
  (35200,0,1,0,4,0,60,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Say on aggro'),
  (35200,0,2,0,0,0,100,0,5000,8900,11000,17800,11,75361,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Cast Swashbuckling Slice');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35222;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35222,0,0,0,10,0,100,0,1,50,20000,30000,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35650;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35650,0,0,0,19,0,100,0,14014,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35650,0,1,0,19,0,100,0,14248,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35650,0,2,0,19,0,100,0,14234,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35758;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35758,0,0,0,19,0,100,0,14019,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (35758,0,1,0,20,0,100,0,14019,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35769;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35769,0,0,0,19,0,100,0,14021,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'On quest 14021 talk'),
  (35769,0,1,0,10,0,100,0,1,20,20000,40000,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Update talk'),
  (35769,0,2,0,19,0,100,0,14021,0,0,0,85,68062,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35769,0,3,4,62,0,100,0,10677,1,0,0,85,68062,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35769,0,4,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35769,0,5,0,11,0,100,0,0,0,0,0,8,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35786;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35786,0,0,0,19,0,100,0,14473,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35786,0,1,0,20,0,100,0,14473,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35837;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35837,0,0,1,19,0,100,0,14233,0,0,0,28,70681,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35837,0,1,2,61,0,100,0,0,0,0,0,28,70680,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35837,0,2,3,61,0,100,0,0,0,0,0,28,70678,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35837,0,3,0,61,0,100,0,0,0,0,0,28,70661,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35875;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35875,0,0,0,19,0,100,0,14235,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'On quest 14235 say'),
  (35875,0,1,0,19,0,100,0,14237,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,14237);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35893;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35893,0,0,0,0,0,100,0,1000,3000,3000,50000,11,15620,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (35893,0,1,0,19,0,100,0,14303,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,14303),
  (35893,0,2,0,19,0,100,0,14236,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,14236),
  (35893,0,3,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'on gossip set emote'),
  (35893,0,4,0,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (35893,0,5,0,11,0,100,0,0,0,0,0,42,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (35893,0,6,0,20,0,100,0,14236,0,0,0,45,1,1,0,0,0,0,19,35918,20,0,0,0,0,0,0,0),
  (35893,0,7,0,20,0,100,0,14236,0,0,0,28,68212,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35893,0,8,0,20,0,100,0,14236,0,0,0,28,68824,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35893,0,9,0,20,0,100,0,14236,0,0,0,85,88467,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=35917;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (35917,0,0,0,19,0,100,0,14238,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,14238),
  (35917,0,1,0,19,0,100,0,14240,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,14240),
  (35917,0,2,3,62,0,100,0,10708,0,0,0,85,68338,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'On gossip select cast orc'),
  (35917,0,3,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,4,0,19,0,100,0,14238,0,0,0,85,68338,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,5,0,19,0,100,0,14240,0,0,0,85,68973,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,6,7,20,0,100,0,14238,0,0,0,28,68376,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,7,8,61,0,100,0,0,0,0,0,28,69303,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,8,9,61,0,100,0,0,0,0,0,28,68338,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (35917,0,9,0,61,0,100,0,0,0,0,0,85,88467,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36092;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36092,0,201,0,1,0,100,1,0,20000,10000,25000,89,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'move');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36112;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36112,0,201,0,19,0,100,0,14241,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,14241);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36127;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36127,0,0,0,19,0,100,0,14242,0,0,0,85,68386,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (36127,0,1,2,62,0,100,0,10716,0,0,0,85,68386,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (36127,0,2,0,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36145;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36145,0,0,0,10,0,100,0,1,3,1000,1000,33,36145,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36161;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36161,0,0,1,19,0,100,0,14243,0,0,0,85,68408,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (36161,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36176;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36176,0,0,0,4,0,100,0,0,0,0,0,28,37744,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36425;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36425,0,0,1,19,0,100,0,14244,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (36425,0,1,0,61,0,100,0,0,0,0,0,85,68815,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36470;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36470,0,0,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'on gossip set emote'),
  (36470,0,1,0,19,0,100,0,14245,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,14245);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36471;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36471,0,0,0,19,0,100,0,27139,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,27139),
  (36471,0,2,0,19,0,100,0,24945,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,24945),
  (36471,0,3,4,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (36471,0,4,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36600;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36600,0,0,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'On gossip Hello - Play Random Emote'),
  (36600,0,1,2,19,0,100,0,14474,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'On Quest 14474 Accept - Say'),
  (36600,0,2,0,61,0,100,0,0,0,0,0,75,67433,1,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (36600,0,3,0,19,0,100,0,14001,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'On Quest 14001 Accept - Say'),
  (36600,0,4,0,8,0,100,0,98914,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (36600,0,5,6,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (36600,0,6,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36682;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36682,0,0,0,11,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (36682,0,1,0,6,0,100,0,0,0,0,0,33,36682,0,0,0,0,0,18,80,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=36740;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (36740,0,201,0,1,0,100,1,0,15000,0,15000,89,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Type a script description here.');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37106;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37106,0,0,0,20,0,100,0,24567,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (37106,0,1,0,19,0,100,0,24502,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37114;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37114,0,0,1,8,0,100,1,69993,0,0,0,33,37114,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (37114,0,1,0,61,0,100,0,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (37114,0,2,0,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37561;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37561,0,0,0,54,0,100,0,0,0,0,0,80,3756100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37590;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37590,0,0,0,54,0,100,0,0,0,0,0,80,3759000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (37590,0,1,0,54,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37594;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37594,0,0,0,54,0,100,0,0,0,0,0,80,3759400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (37594,0,1,0,54,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37598;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37598,0,0,0,54,0,100,0,0,0,0,0,80,3759800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (37598,0,1,0,40,0,100,0,3,37598,0,0,80,3759801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37602;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37602,0,0,0,64,0,100,0,0,0,0,0,10,1,3,5,6,0,0,1,0,0,0,0,0,0,0,0,'on gossip set emote'),
  (37602,0,1,2,20,0,100,0,14125,0,0,0,28,151138,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Remove aura when quest 14125 end'),
  (37602,0,2,3,61,0,100,0,14125,0,0,0,28,151137,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Remove aura when quest 14125 end'),
  (37602,0,3,0,61,0,100,0,14125,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Remove aura when quest 14125 end');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37872;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37872,0,0,0,8,0,100,0,68280,0,0,0,80,3787200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37895;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37895,0,0,0,8,0,100,0,68280,0,0,0,80,3789500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37896;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37896,0,0,0,8,0,100,0,68280,0,0,0,80,3789600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=37897;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (37897,0,0,0,8,0,100,0,68280,0,0,0,80,3789700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38120;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38120,0,0,0,19,0,100,0,24671,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38120,0,1,0,20,0,100,0,24671,0,0,0,45,1,1,0,0,0,0,19,38122,20,0,0,0,0,0,0,0),
  (38120,0,2,0,38,0,100,0,1,1,0,0,1,3,0,0,0,0,0,21,50,0,0,0,0,0,0,0,0),
  (38120,0,3,0,20,0,100,0,24744,0,0,0,80,3812000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38120,0,4,0,19,0,100,0,24856,0,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38120,0,5,6,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38120,0,6,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38120,0,7,0,19,0,100,0,25214,0,0,0,1,8,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38122;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38122,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,21,50,0,0,0,0,0,0,0,0),
  (38122,0,1,0,19,0,100,0,24741,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38122,0,2,0,20,0,100,0,24741,0,0,0,45,1,1,0,0,0,0,19,38120,20,0,0,0,0,0,0,0),
  (38122,0,3,4,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38122,0,4,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38124;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38124,0,0,0,19,0,100,0,24817,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on quest add 24817'),
  (38124,0,1,0,19,0,100,0,24946,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,24946),
  (38124,0,2,0,19,0,100,0,25200,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,25200),
  (38124,0,3,0,19,0,100,0,25204,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,25204),
  (38124,0,4,0,19,0,100,0,25213,0,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,25213),
  (38124,0,5,0,38,0,100,0,1,1,0,0,80,3812400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38124,0,6,7,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38124,0,7,0,61,0,100,0,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38124,0,8,9,20,0,100,0,25110,0,0,0,85,73607,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38124,0,9,0,61,0,100,0,0,0,0,0,85,73648,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38124,0,10,0,19,0,100,0,25213,0,0,0,85,151158,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38318;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38318,0,0,1,8,0,100,0,151145,0,0,0,11,50630,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38318,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38318,0,2,0,2,0,100,1,1,30,15000,15000,1,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0),
  (38318,0,3,0,27,0,100,0,0,0,0,0,33,38318,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0),
  (38318,0,4,0,1,0,100,0,1000,1000,1000,1000,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38318,0,5,0,0,0,100,0,1000,1000,1000,1000,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38318,0,6,0,54,0,100,0,0,0,0,0,11,71663,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38381;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38381,0,0,0,19,0,100,0,24859,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24859 say'),
  (38381,0,1,2,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38381,0,2,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38387;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38387,0,0,0,19,0,100,0,24901,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24901 accept'),
  (38387,0,1,0,19,0,100,0,24924,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24924 accept'),
  (38387,0,2,0,19,0,100,0,24940,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24940 accept'),
  (38387,0,3,0,19,0,100,0,25058,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'25058 accept'),
  (38387,0,4,0,19,0,100,0,25066,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'25066 accept'),
  (38387,0,5,0,19,0,100,0,25098,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'25098 accept'),
  (38387,0,6,0,19,0,100,0,25244,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'25244 accept'),
  (38387,0,7,0,19,0,100,0,25251,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'25251 accept'),
  (38387,0,8,0,19,0,100,0,25265,0,0,0,28,69077,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Remove aura 69077 when quest 25265'),
  (38387,0,9,10,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38387,0,10,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38387,0,11,0,62,0,100,0,12581,0,0,0,85,73430,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38387,0,12,0,19,0,100,0,25243,0,0,0,1,6,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38387,0,13,0,20,0,100,0,25251,0,0,0,85,83594,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38409;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38409,0,0,0,8,0,100,1,73583,0,0,0,80,3840900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38409,0,1,0,11,0,100,0,0,0,0,0,42,80,80,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38409,0,2,0,32,0,100,1,1,120000,60000,60000,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38432;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38432,0,0,0,19,0,100,0,24868,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Quest 24868'),
  (38432,0,1,0,19,0,100,0,24864,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,24864),
  (38432,0,2,0,20,0,100,0,24864,0,0,0,85,151146,0,0,0,0,0,7,0,0,0,0,0,0,0,0,24864),
  (38432,0,3,0,19,0,100,0,24897,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38432,0,4,5,19,0,100,0,24868,0,0,0,85,72058,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'surrender-or-else'),
  (38432,0,5,0,61,0,100,0,0,0,0,0,28,49416,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38432,0,7,8,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38432,0,8,0,61,0,100,0,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38441;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38441,0,0,0,8,0,100,0,73583,0,0,0,11,73602,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38448;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38448,0,0,0,1,0,100,1,0,0,0,0,11,72055,4,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aura Bulle'),
  (38448,0,1,0,0,0,100,0,3000,5000,5000,5000,11,75903,0,0,0,0,0,4,0,0,0,0,0,0,0,0,'Cast spell'),
  (38448,0,2,0,54,0,100,0,0,0,0,0,80,3844800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,3,0,54,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,4,0,1,1,100,0,1000,1000,100,100,11,72076,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,5,6,6,0,100,0,0,0,0,0,11,72035,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,6,0,61,0,100,0,0,0,0,0,86,72085,2,18,30,0,0,18,30,0,0,0,0,0,0,0,0),
  (38448,0,7,8,54,0,100,0,0,0,0,0,11,98240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,8,0,61,0,100,0,0,0,0,0,11,66772,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38448,0,9,0,7,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38517;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38517,0,0,1,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38517,0,1,0,61,0,100,0,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38517,0,2,0,19,0,100,0,25109,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38644;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38644,0,0,0,54,0,100,0,0,0,0,0,80,3864400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38644,0,1,0,6,0,100,0,0,0,0,0,11,72580,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38644,0,2,0,32,0,100,0,1,60000,5000,5000,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38644,0,3,0,7,0,100,0,0,0,0,0,80,3864400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38647;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38647,0,0,0,19,0,100,0,24925,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24925 accept'),
  (38647,0,1,0,19,0,100,0,24937,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'24937 accept'),
  (38647,0,2,0,8,0,100,0,73583,0,0,0,11,73613,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38696;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38696,0,0,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38696,0,1,0,4,0,40,0,0,0,0,0,11,72204,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0),
  (38696,0,2,0,2,0,100,1,10,50,60000,60000,11,75942,4,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38738;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38738,0,1,2,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38738,0,2,0,61,0,100,1,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38738,0,3,0,19,0,100,0,24942,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38738,0,4,0,19,0,100,0,24952,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (38738,0,5,0,19,0,100,0,25201,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38746;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38746,0,0,1,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38746,0,1,0,61,0,100,0,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (38746,0,2,0,8,0,100,0,73583,0,0,0,11,73614,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38808;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38808,0,0,0,0,0,100,0,2000,8000,4000,12000,11,12548,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Horion de givre'),
  (38808,0,1,0,2,0,100,1,10,50,0,0,11,72935,1,0,0,0,0,24,0,0,0,0,0,0,0,0,0),
  (38808,0,2,0,6,0,100,0,0,0,0,0,33,38808,0,0,0,0,0,18,40,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38809;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38809,0,0,0,0,0,100,0,2000,8000,4000,12000,11,57780,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Eclair'),
  (38809,0,1,0,0,0,100,0,1000,10000,2000,16000,11,75945,1,0,0,0,0,24,0,0,0,0,0,0,0,0,'Fureur de l''orage'),
  (38809,0,2,0,2,0,100,1,30,50,0,0,11,72935,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0),
  (38809,0,3,0,6,0,100,0,0,0,0,0,33,38809,0,0,0,0,0,18,40,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=38810;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (38810,0,0,0,0,0,100,0,2000,6000,4000,12000,11,75946,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Feu et flammes'),
  (38810,0,1,0,0,0,100,0,5000,12000,6000,20000,11,39591,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Totem incendiaire'),
  (38810,0,2,0,2,0,100,1,40,50,0,0,11,72935,1,0,0,0,0,24,0,0,0,0,0,0,0,0,0),
  (38810,0,3,0,6,0,100,0,0,0,0,0,33,38810,0,0,0,0,0,18,40,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39039;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39039,0,0,0,8,0,100,0,73477,0,0,0,11,73490,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39039,0,1,0,8,0,100,0,74958,0,0,0,11,73490,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39039,0,2,3,6,0,100,0,0,0,0,0,11,65725,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39039,0,3,0,61,0,100,0,0,0,0,0,11,73493,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39039,0,5,0,6,0,100,0,0,0,0,0,41,0,0,0,0,0,0,19,40785,20,0,0,0,0,0,0,0),
  (39039,0,6,0,0,0,100,0,1000,2000,0,2000,45,1,1,0,0,0,0,19,40785,50,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39042;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39042,0,0,0,54,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (39042,0,1,0,38,0,100,1,1,1,0,0,53,1,3904200,0,0,0,2,1,0,0,0,0,0,0,0,0,0),
  (39042,0,2,0,38,0,100,1,2,2,0,0,53,1,3904201,0,0,0,2,1,0,0,0,0,0,0,0,0,0),
  (39042,0,3,0,6,0,100,0,0,0,0,0,11,98914,0,0,0,0,0,12,1,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39065;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39065,0,0,0,19,0,100,0,25093,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Accept quest 25093'),
  (39065,0,1,0,20,0,100,0,25093,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Quest end 25093');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39066;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39066,0,0,1,4,0,100,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39066,0,1,0,61,0,100,0,0,0,0,0,42,100,100,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39066,0,2,3,19,0,100,0,25100,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (39066,0,3,4,61,0,100,0,0,0,0,0,85,88467,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (39066,0,4,0,61,0,100,0,0,0,0,0,85,151152,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39193;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39193,0,201,0,4,0,50,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on aggro talk self');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39341;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39341,0,0,0,19,0,100,0,25184,0,0,0,80,3934100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39354;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39354,0,0,0,6,0,100,0,0,0,0,0,11,73852,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39363;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39363,0,1,0,0,0,100,0,1000,5000,4000,15000,11,75968,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39363,0,2,0,0,0,100,0,2000,10000,8000,18000,11,75964,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39426;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39426,0,201,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on aggro say text 1'),
  (39426,0,202,0,6,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on death say text 1'),
  (39426,0,203,0,0,0,100,0,0,3000,5000,15000,11,75924,2,0,0,0,0,4,0,0,0,0,0,0,0,0,'On attack cast 75924');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39456;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39456,0,0,0,73,0,100,1,0,0,0,0,80,3945600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39456,0,1,0,1,0,100,1,500,500,10000,10000,11,73926,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39582;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39582,0,0,0,11,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39582,0,1,2,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39582,0,2,0,61,0,100,0,0,0,0,0,42,1,1,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39582,0,3,0,2,0,100,1,0,2,0,0,80,3958200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39582,0,4,0,40,0,100,0,1,39582,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,0.241,0),
  (39582,0,5,0,25,0,100,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (39582,0,6,0,0,0,100,0,5000,8000,11000,18000,88,3958201,3958204,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=39592;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (39592,0,0,0,73,0,100,0,0,0,0,0,80,3959200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=44175;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (44175,0,0,0,8,0,100,0,5143,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Mage Quest - On spell hit Arcane Missile, give quest credit'),
  (44175,0,1,0,8,0,100,0,73899,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Shaman Quest - On spell hit Primal Strike, give quest credit'),
  (44175,0,2,0,8,0,100,0,56641,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Hunter Quest - On spell hit Steady Shot, give quest credit'),
  (44175,0,3,0,8,0,100,0,2098,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Rogue Quest - On spell hit Eviscerate, give quest credit'),
  (44175,0,4,0,8,0,100,0,100,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Warrior Quest - On spell hit Charge, give quest credit'),
  (44175,0,5,0,8,0,100,0,348,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Warlock Quest - On spell hit Immolate, give quest credit'),
  (44175,0,6,0,11,0,100,1,0,0,0,0,88,3803800,3803802,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Apply Random Mask Aura'),
  (44175,0,7,0,6,0,100,0,0,0,0,0,11,71240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- On death, cast Training DummyDeath'),
  (44175,0,8,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- On death, Despawn'),
  (44175,0,9,0,8,0,100,0,9734,0,0,0,99,70,70,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Priest - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,10,0,8,0,100,0,60195,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Rogue - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,11,0,8,0,100,0,6660,0,0,0,99,72,72,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Hunter - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,12,0,8,0,100,0,9739,0,0,0,99,68,68,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Druid - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,13,0,8,0,100,0,20797,0,0,0,99,62,62,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Mage - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,14,0,8,0,100,0,20791,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Warlock - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,15,0,8,0,100,0,25710,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Warrior - On spell hit, adjust hp (To Keep HP consistant)'),
  (44175,0,16,0,8,0,100,0,20802,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Shaman - On spell hit, adjust hp (To Keep HP consistant)');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=48304;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (48304,0,0,0,8,0,100,0,5143,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Mage Quest - On spell hit Arcane Missile, give quest credit'),
  (48304,0,1,0,8,0,100,0,73899,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Shaman Quest - On spell hit Primal Strike, give quest credit'),
  (48304,0,2,0,8,0,100,0,56641,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Hunter Quest - On spell hit Steady Shot, give quest credit'),
  (48304,0,3,0,8,0,100,0,2098,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Rogue Quest - On spell hit Eviscerate, give quest credit'),
  (48304,0,4,0,8,0,100,0,100,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Warrior Quest - On spell hit Charge, give quest credit'),
  (48304,0,5,0,8,0,100,0,348,0,1200,1500,33,44175,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Training Dummy- Warlock Quest - On spell hit Immolate, give quest credit'),
  (48304,0,6,0,11,0,100,1,0,0,0,0,88,3803800,3803802,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Apply Random Mask Aura'),
  (48304,0,7,0,6,0,100,0,0,0,0,0,11,71240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- On death, cast Training DummyDeath'),
  (48304,0,8,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- On death, Despawn'),
  (48304,0,9,0,8,0,100,0,9734,0,0,0,99,70,70,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Priest - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,10,0,8,0,100,0,60195,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Rogue - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,11,0,8,0,100,0,6660,0,0,0,99,72,72,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Hunter - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,12,0,8,0,100,0,9739,0,0,0,99,68,68,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Druid - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,13,0,8,0,100,0,20797,0,0,0,99,62,62,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Mage - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,14,0,8,0,100,0,20791,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Warlock - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,15,0,8,0,100,0,25710,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Warrior - On spell hit, adjust hp (To Keep HP consistant)'),
  (48304,0,16,0,8,0,100,0,20802,0,0,0,99,65,65,0,0,0,0,1,0,0,0,0,0,0,0,0,'Training Dummy- Fight Novice Darkspear Shaman - On spell hit, adjust hp (To Keep HP consistant)');

DELETE FROM smart_scripts WHERE source_type=0 AND entryorguid=48305;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (48305,0,0,2,8,0,100,0,2061,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on spellhit  2061 say0'),
  (48305,0,2,0,61,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'on spell force despawn');

DELETE FROM smart_scripts WHERE source_type=1 AND entryorguid=202472;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (202472,1,0,0,70,0,100,0,2,0,0,0,45,1,1,0,0,0,0,19,75128,5,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3474800;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3474800,9,0,0,0,0,100,0,0,0,0,0,33,34748,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3474800,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3474800,9,2,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3474800,9,3,0,0,0,100,0,3000,3000,0,0,28,37744,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3474800,9,4,0,0,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,568.97,3164.01,-0.956,0,0),
  (3474800,9,5,0,0,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3483000;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3483000,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - remove npc_spellclick_spells flag'),
  (3483000,9,1,0,0,0,100,0,0,0,0,0,28,45111,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - remove Enrage (45111)'),
  (3483000,9,3,0,0,0,100,0,0,0,0,0,17,26,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - set emote state (26)'),
  (3483000,9,4,0,0,0,100,0,0,0,0,0,33,34830,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - give quest credit (34830)'),
  (3483000,9,5,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - say text 0'),
  (3483000,9,6,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - say text 0'),
  (3483000,9,7,0,0,0,100,0,3000,3000,0,0,11,151111,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - set random movement'),
  (3483000,9,8,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defiant Troll - actionlist - despawn');

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3483500;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3483500,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3483500,9,1,0,0,0,100,0,0,0,0,0,11,88467,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3483500,9,2,0,0,0,100,0,2000,2000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3483500,9,3,0,0,0,100,0,0,0,0,0,33,34835,0,0,0,0,0,18,35,0,0,0,0,0,0,0,0),
  (3483500,9,4,0,0,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3487600;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3487600,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487600,9,1,0,0,0,100,0,0,0,0,0,11,88467,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487600,9,2,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487600,9,3,0,0,0,100,0,0,0,0,0,33,34876,0,0,0,0,0,18,35,0,0,0,0,0,0,0,0),
  (3487600,9,4,0,0,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3487700;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3487700,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487700,9,1,0,0,0,100,0,0,0,0,0,11,88467,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487700,9,2,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487700,9,3,0,0,0,100,0,0,0,0,0,33,34877,0,0,0,0,0,18,35,0,0,0,0,0,0,0,0),
  (3487700,9,4,0,0,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3487800;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3487800,9,0,0,0,0,100,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487800,9,1,0,0,0,100,0,0,0,0,0,11,88467,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487800,9,2,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3487800,9,3,0,0,0,100,0,0,0,0,0,33,34878,0,0,0,0,0,18,35,0,0,0,0,0,0,0,0),
  (3487800,9,4,0,0,0,100,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3756100;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3756100,9,0,0,0,0,100,0,0,0,0,0,11,70226,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3756100,9,1,0,0,0,100,0,0,0,0,0,33,37561,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3756100,9,2,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3759000;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3759000,9,0,0,0,0,100,0,0,0,0,0,11,70236,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759000,9,1,0,0,0,100,0,0,0,0,0,33,37590,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3759000,9,2,0,0,0,100,0,1000,1000,0,0,11,151099,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'add aura to check'),
  (3759000,9,3,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3759400;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3759400,9,0,0,0,0,100,0,0,0,0,0,11,70250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759400,9,1,0,0,0,100,0,0,0,0,0,33,37594,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3759400,9,2,0,0,0,100,0,1000,1000,0,0,11,151100,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'add aura to check'),
  (3759400,9,3,0,0,0,100,0,0,0,0,0,41,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3759800;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3759800,9,0,0,0,0,100,0,0,0,0,0,11,25039,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759800,9,2,0,0,0,100,0,1000,1000,0,0,53,0,37598,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3759801;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3759801,9,0,0,0,0,100,0,1000,1000,0,0,11,70262,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759801,9,1,0,0,0,100,0,1000,1000,0,0,11,70259,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759801,9,2,0,0,0,100,0,2000,2000,0,0,11,94955,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759801,9,3,0,0,0,100,0,0,0,0,0,28,151137,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3759801,9,4,0,0,0,100,0,0,0,0,0,85,151138,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3759801,9,5,0,0,0,100,0,0,0,0,0,33,37598,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3759801,9,6,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3759801,9,7,0,0,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3787200;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3787200,9,0,0,0,0,100,0,0,0,0,0,11,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3787200,9,1,0,0,0,100,0,0,0,0,0,85,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3787200,9,2,0,0,0,100,0,500,500,0,0,85,70641,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3787200,9,3,0,0,0,100,0,0,0,0,0,11,68281,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3787200,9,4,0,0,0,100,0,3000,3000,0,0,33,37872,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3787200,9,5,0,0,0,100,0,0,0,0,0,28,70661,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3787200,9,6,0,0,0,100,0,0,0,0,0,28,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3787200,9,7,0,0,0,100,0,0,0,0,0,28,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3789500;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3789500,9,0,0,0,0,100,0,0,0,0,0,11,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789500,9,1,0,0,0,100,0,0,0,0,0,85,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789500,9,2,0,0,0,100,0,500,500,0,0,85,70641,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789500,9,3,0,0,0,100,0,0,0,0,0,11,68281,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789500,9,4,0,0,0,100,0,3000,3000,0,0,33,37895,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789500,9,5,0,0,0,100,0,0,0,0,0,28,70678,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789500,9,6,0,0,0,100,0,0,0,0,0,28,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789500,9,7,0,0,0,100,0,0,0,0,0,28,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3789600;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3789600,9,0,0,0,0,100,0,0,0,0,0,11,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789600,9,1,0,0,0,100,0,0,0,0,0,85,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789600,9,2,0,0,0,100,0,500,500,0,0,85,70641,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789600,9,3,0,0,0,100,0,0,0,0,0,11,68281,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789600,9,4,0,0,0,100,0,3000,3000,0,0,33,37896,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789600,9,5,0,0,0,100,0,0,0,0,0,28,70680,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789600,9,6,0,0,0,100,0,0,0,0,0,28,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789600,9,7,0,0,0,100,0,0,0,0,0,28,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3789700;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3789700,9,0,0,0,0,100,0,0,0,0,0,11,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789700,9,1,0,0,0,100,0,0,0,0,0,85,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789700,9,2,0,0,0,100,0,500,500,0,0,85,70641,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789700,9,3,0,0,0,100,0,0,0,0,0,11,68281,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3789700,9,4,0,0,0,100,0,3000,3000,0,0,33,37897,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789700,9,5,0,0,0,100,0,0,0,0,0,28,70681,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789700,9,6,0,0,0,100,0,0,0,0,0,28,70649,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3789700,9,7,0,0,0,100,0,0,0,0,0,28,151128,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3812000;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3812000,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812000,9,1,0,0,0,100,0,1000,1000,0,0,1,1,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0),
  (3812000,9,2,0,0,0,100,0,4500,4500,0,0,45,1,1,0,0,0,0,19,38124,30,0,0,0,0,0,0,0),
  (3812000,9,3,0,0,0,100,0,5000,5000,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812000,9,4,0,0,0,100,0,13000,13000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812000,9,5,0,0,0,100,0,8000,8000,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812000,9,6,0,0,0,100,0,0,0,0,0,17,26,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3812400;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3812400,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812400,9,1,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812400,9,2,0,0,0,100,0,1000,1000,0,0,50,202104,17,0,0,0,0,8,0,0,0,0,905.573,2340.72,5.5,0.628042,0),
  (3812400,9,3,0,0,0,100,0,4500,4500,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812400,9,4,0,0,0,100,0,6500,6500,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3812400,9,5,0,0,0,100,0,3000,3000,0,0,12,75115,2,8000,0,0,0,8,0,0,0,0,907.714,2338.46,9.608,6.06,0),
  (3812400,9,6,0,0,0,100,0,0,0,0,0,12,75115,2,8000,0,0,0,8,0,0,0,0,907.714,2338.46,9.608,6.06,0),
  (3812400,9,7,0,0,0,100,0,1000,1000,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3840900;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3840900,9,0,0,0,0,100,0,0,0,0,0,17,12,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3840900,9,1,0,0,0,100,0,0,0,0,0,11,73599,2,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3840900,9,2,0,0,0,100,0,0,0,0,0,33,38409,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3840900,9,3,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3840900,9,4,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3840900,9,5,0,0,0,100,0,4000,4000,0,0,11,151111,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3840900,9,6,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3844800;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3844800,9,0,0,0,0,100,0,0,0,0,0,62,648,0,0,0,0,0,8,0,0,0,0,131.559,1938.31,18.62,0,0),
  (3844800,9,1,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,2,0,0,0,100,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,139.28,1933.99,7.181,0.1899,0),
  (3844800,9,3,0,0,0,100,0,5000,5000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,4,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,5,0,0,0,100,0,6500,6500,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,6,0,0,0,100,0,6000,6000,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,7,0,0,0,100,0,0,0,0,0,28,72126,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,8,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3844800,9,9,0,0,0,100,0,0,0,0,0,97,20,15,0,0,0,0,8,0,0,0,0,160.53,1938.88,4.857,0,0),
  (3844800,9,10,0,0,0,100,0,3000,3000,0,0,49,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3864400;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3864400,9,0,0,0,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3864400,9,1,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,38643,10,0,0,0,0,0,0,0),
  (3864400,9,2,0,0,0,100,0,500,500,0,0,11,72518,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3934100;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3934100,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3934100,9,1,0,0,0,100,0,0,0,0,0,85,73746,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3934100,9,2,0,0,0,100,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3934100,9,3,0,0,0,100,0,5000,5000,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3934100,9,4,0,0,0,100,0,0,0,0,0,81,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3945600;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3945600,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3945600,9,1,0,0,0,100,0,0,0,0,0,11,73948,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3945600,9,2,0,0,0,100,0,0,0,0,0,33,39456,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3945600,9,3,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3945600,9,4,0,0,0,100,0,3000,3000,0,0,11,11027,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3945600,9,5,0,0,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3958200;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3958200,9,0,0,0,0,100,0,0,0,0,0,12,39594,2,60000,0,0,0,8,0,0,0,0,2288.38,2424.36,22.44,3.47691,0),
  (3958200,9,1,0,0,0,100,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,2,0,0,0,100,0,0,0,0,0,11,88467,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,3,0,0,0,100,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,4,0,0,0,100,0,0,0,0,0,53,1,39582,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,5,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,11,39598,50,0,0,0,0,0,0,0),
  (3958200,9,6,0,0,0,100,0,3000,3000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,7,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,8,0,0,0,100,0,10000,10000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,9,0,0,0,100,0,28000,28000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3958200,9,10,0,0,0,100,0,0,0,0,0,41,8000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

DELETE FROM smart_scripts WHERE source_type=9 AND entryorguid=3959200;
INSERT INTO smart_scripts (entryorguid,source_type,id,link,event_type,event_phase_mask,event_chance,event_flags,event_param1,event_param2,event_param3,event_param4,action_type,action_param1,action_param2,action_param3,action_param4,action_param5,action_param6,target_type,target_param1,target_param2,target_param3,target_param4,target_x,target_y,target_z,target_o,comment) VALUES
  (3959200,9,0,0,0,0,100,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0),
  (3959200,9,1,0,0,0,100,0,0,0,0,0,85,73991,2,0,0,0,0,7,0,0,0,0,0,0,0,0,0),
  (3959200,9,2,0,0,0,100,0,2000,2000,0,0,81,16777216,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0);

