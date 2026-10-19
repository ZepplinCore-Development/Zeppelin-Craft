-- [F-031] Eternium Lockbox requires Lockpicking 275.
-- Stock item 5760 shares lock 62 (skill 225) with Reinforced Steel, Mithril
-- and Thorium Lockboxes; repointing to dedicated lock 2003 (Lock.dbc, PATCH-Z)
-- raises only Eternium, slotting it between the 225 boxes and Khorium.

UPDATE `item_template` SET `lockid` = 2003 WHERE `entry` = 5760;
