-- ============================================================
-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.
-- Produced by the F-011 Goblin Zone extraction pipeline
-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit
-- here is overwritten the next time the pipeline runs.
--   * To change this output: edit the migration/translation script.
--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file
--     (it loads after these rows and overrides the ones it needs).
-- ============================================================

-- F-011 gameobject loot (chest/node GOs; custom items remapped)

DELETE FROM gameobject_loot_template WHERE Entry IN (195515,195516,195518,201603,201798,202865);
INSERT INTO gameobject_loot_template (Entry,Item,Reference,Chance,QuestRequired,LootMode,GroupId,MinCount,MaxCount) VALUES
  (195515,84469,0,100,1,1,0,1,1),
  (195516,84470,0,100,1,1,0,1,1),
  (195518,84471,0,100,1,1,0,1,1),
  (201603,84472,0,100,1,1,0,1,1),
  (201798,84474,0,99.954,0,1,0,1,3),
  (202865,84492,0,100,1,1,0,1,1);
