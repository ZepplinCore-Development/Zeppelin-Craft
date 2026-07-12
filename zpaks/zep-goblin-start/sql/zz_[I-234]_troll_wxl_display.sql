-- [I-234] Repoint Defiant Troll (34830) + Troll Slave (35239) to the modern forest-troll
-- display (900103 -> model 900006 -> Character\ForestTroll\Male\ForestTrollMale.m2), shipped via
-- the F-197 WXL modern-M2 pipeline. The modern model has the emote animations (dance/sleep/work/
-- mining) the stock WotLK troll model lacks, so the SmartAI SET_EMOTE_STATE calls finally render.
UPDATE creature_template_model SET CreatureDisplayID = 900103 WHERE CreatureID IN (34830,35239) AND Idx = 0;
