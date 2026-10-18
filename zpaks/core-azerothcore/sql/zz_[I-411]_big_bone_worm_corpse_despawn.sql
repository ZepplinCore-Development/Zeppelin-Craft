-- I-411: Quest 10930 "The Big Bone Worm".
-- Fumping (39246) is a 5 s channel aimed at the Decrepit Clefthoof corpse; the
-- worm is summoned when its caster aura expires. Stock SAI despawned the corpse
-- 3 s after the spellhit, which cancelled the channel (target lost) before it
-- could expire, so nothing ever surfaced. Despawn after the channel instead.
UPDATE smart_scripts SET action_param1 = 6000
WHERE entryorguid = 22105 AND source_type = 0 AND id = 3;
