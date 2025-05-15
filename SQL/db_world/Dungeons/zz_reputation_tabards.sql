-- This query stores all the tabard edits for adding making faction tabards available earlier and applying a reputation bonus effect.

-- OUTLAND

    -- DUNGEONS
        -- Thrallmar Tabard
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91132, `spelltrigger_1` = 1 WHERE (`entry` = 24004);
        -- Honor Hold
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91133, `spelltrigger_1` = 1 WHERE (`entry` = 23999);
        -- Cenarion Expedition
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91134, `spelltrigger_1` = 1 WHERE (`entry` = 31804);
        -- Lower City
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91135, `spelltrigger_1` = 1 WHERE (`entry` = 31778);
        -- Keepers of Time
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91136, `spelltrigger_1` = 1 WHERE (`entry` = 31777);
        -- The Sha'tar
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91137, `spelltrigger_1` = 1 WHERE (`entry` = 31781);

    -- RAIDS
        -- Ashtongue Deathsworn (NO TABARD IN GAME)
        -- Shattered Sun Offensive
        -- The Scale of the Sands (NO TABARD IN GAME)
        -- The Violet Eye (NO TABARD IN GAME)

    -- Zones
        -- Kurenai
        -- The Mag'har
        -- Netherwing  (NO TABARD IN GAME)
        -- Ogri'la
        -- The Aldor
        -- The Scryers
        -- Sha'tari Skyguard
        -- Sporeggar
        -- The Consortium
        -- Tranquillien  (NO TABARD IN GAME)