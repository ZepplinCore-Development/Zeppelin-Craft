-- F-011 gameobject loot (chest/node GOs; custom items remapped)

DELETE FROM gameobject_loot_template WHERE Entry IN (195515,195516,195518,201603,201798,202865);
INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES
  (195515,84469,0,100,1,1,0,1,1),
  (195516,84470,0,100,1,1,0,1,1),
  (195518,84471,0,100,1,1,0,1,1),
  (201603,84472,0,100,1,1,0,1,1),
  (201798,84474,0,99.954,0,1,0,1,3),
  (202865,84492,0,100,1,1,0,1,1);
