-- I-206: Reskin the Auchindoun Bone Sifters to the Jormungar white model.
--
-- Bone Sifter (22466) and Mature Bone Sifter (22482) are the burrowing carrion
-- worms spawned by quests in the Bone Wastes. They start invisible (display
-- 11686, InvisibleStalker, the burrowed state) and morph to their visible worm
-- model via a SmartAI "Change Model" action (action_type 3, SetDisplayId) when
-- they emerge into combat. That morph targets the old BoneWorm display 20617 —
-- the same dated model Bone Crawler used.
--
-- Repoint the morph to display 900007 (Jormungar model + JormungarWhite skin),
-- defined in dbc/[I-206]_creaturedisplayinfo.sql and already shipped in PATCH-Z.
-- This is server-only: 900007 and its creature_model_info row already exist, so
-- no DBC change or client rebuild is needed here.
--
-- NOTE: this edits stock smart_scripts rows, which AzerothCore updates can
-- overwrite (resetting action_param2 back to 20617). If the Bone Sifters revert
-- to the old skin after a core sync, re-apply this file (force re-run).
--
-- Scoped tightly to action_type=3 / action_param2=20617 on these two entries so
-- it only touches the emerge-morph and is safe to re-run.

UPDATE `smart_scripts`
  SET `action_param2` = 900007
  WHERE `source_type` = 0
    AND `entryorguid` IN (22466, 22482)
    AND `action_type` = 3
    AND `action_param2` = 20617;
