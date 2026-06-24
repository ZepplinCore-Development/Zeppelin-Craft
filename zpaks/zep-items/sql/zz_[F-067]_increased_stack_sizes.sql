-- F-067 Fatter Stacks: server-wide stack-size increases + a few non-unique conversions.
--
-- APPLY-ONCE-ON-STOCK. The blanket rules below match on the CURRENT `stackable`
-- value, and tier 100 is BOTH an input (100 -> 1000) and an output (10 -> 100).
-- They are therefore ordered BIG -> SMALL so that within a single pass no tier
-- cascades into the next (10 -> 100 must not then be caught by 100 -> 1000).
-- Because of that 100 overlap the blanket section is only correct when applied
-- once against stock data -- i.e. via `zep world sql rebuild` (reset + apply).
-- Re-applying it on an already-migrated DB without a reset would re-cascade the
-- stack-10 tier up to 1000.
--
-- All by-entry overrides (Librams, non-unique, forced-2000) run AFTER the blanket
-- rules so they always win (e.g. the Librams must be set to 20 AFTER 20 -> 200,
-- otherwise that rule bumps them to 200).

-- === Blanket stack-size multipliers (x10), largest tier first ===
    UPDATE `item_template` SET `stackable` = 1000 WHERE (`stackable` = 100);  -- 100 -> 1000
    UPDATE `item_template` SET `stackable` = 200  WHERE (`stackable` = 20);   -- 20 -> 200
    UPDATE `item_template` SET `stackable` = 100  WHERE (`stackable` = 10);   -- 10 -> 100
    UPDATE `item_template` SET `stackable` = 50   WHERE (`stackable` = 5);    -- 5 -> 50

-- === Librams: stack to 20, non-unique (after blanket so 20 -> 200 doesn't catch them) ===
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11732); -- Libram of Rumination
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11733); -- Libram of Constitution
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11734); -- Libram of Tenacity
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11736); -- Libram of Resilience
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 11737); -- Libram of Voracity
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18332); -- Libram of Rapidity
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18333); -- Libram of Focus
    UPDATE `item_template` SET `stackable` = 20, `maxcount` = 0 WHERE (`entry` = 18334); -- Libram of Protection

-- === Non-unique conversions ===
    -- Oshu'gun Crystal Powder Sample non unique (added to Item Vault, mod-item-vault)
    UPDATE `item_template` SET `maxcount` = 0 WHERE (`entry` = 26043);

-- === Forced 2000 stack size (reputation turn-ins) -- override any blanket result ===
    UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 24401); -- Unidentified Plant Parts
    UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 18945); -- Dark Iron Residue
    UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22528); -- Dark Iron Scraps
    UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22525); -- Cryptfiend Parts
    UPDATE `item_template` SET `stackable` = 2000 WHERE (`entry` = 22526); -- Bone Fragments
