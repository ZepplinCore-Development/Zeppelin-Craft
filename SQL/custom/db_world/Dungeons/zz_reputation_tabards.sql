-- This query stores all the tabard edits for adding making faction tabards available earlier and applying a reputation bonus effect.

-- OUTLAND

    -- DUNGEONS
        -- Thrallmar Tabard
            UPDATE `item_template` SET `RequiredReputationRank` = 4, `spellid_1` = 91132, `spelltrigger_1` = 1 WHERE (`entry` = 24004);
        -- Honor Hold
        -- Cenarion Expedition
        -- Lower City
        -- The Sha'tar
        -- Keepers of Time

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