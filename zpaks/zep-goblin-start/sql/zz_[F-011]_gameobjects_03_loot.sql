-- F-011 gameobject loot (chest/node GOs; custom items remapped)

DELETE FROM gameobject_loot_template WHERE Entry IN (195201,202351,202552,202553,202554,202607,202608);
INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES
  (195201,84300,0,100,1,1,0,1,1),
  (202351,84321,0,99.999,1,1,0,1,1),
  (202552,84331,0,7.3,1,1,0,1,1),
  (202552,84332,0,100,1,1,0,1,1),
  (202553,84331,0,100,1,1,0,1,1),
  (202554,84331,0,100,1,1,0,1,1),
  (202607,84333,0,100,1,1,0,1,1),
  (202608,84333,0,100,1,1,0,1,1);
