-- Removing a couple of Gnarlpine Furbolgs from the caves, there are 4 in a single room that can't be split pulled.
-- This takes it down to a manageable 2
DELETE FROM `creature` WHERE (`guid` = 48578 OR `guid` = 49173);