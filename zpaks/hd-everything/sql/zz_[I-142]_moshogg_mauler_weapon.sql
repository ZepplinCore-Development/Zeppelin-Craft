-- I-142: Mosh'Ogg Mauler invisible weapon model
-- The equipped axe (item 5288, display 5128, Axe_2H_War_B_03.mdx) does not render
-- on the Ogre creature model (displayID 416). Swap to a stone hammer (item 3326,
-- display 3502) which is confirmed visible on the same model.

UPDATE creature_equip_template SET ItemID1 = 3326 WHERE CreatureID = 678 AND ID = 1;
