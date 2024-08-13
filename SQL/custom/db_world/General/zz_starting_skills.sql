-- Axes - 44
    -- Warrior - Axes
    UPDATE `playercreateinfo_skills` SET raceMask = 3511, comment = 'Warrior - Axes' WHERE (classMask = 1 AND skill = 44);
    -- Hunter - Axes
    UPDATE `playercreateinfo_skills` SET raceMask = 422, comment = 'Hunter - Axes' WHERE (classMask = 4 AND skill = 44);
    -- Death Knight - Axes
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Death Knight - Axes' WHERE (classMask = 32 AND skill = 44);

-- Bows - 45
    -- Hunter - Bows
    UPDATE `playercreateinfo_skills` SET raceMask = 650, comment = 'Hunter - Bows' WHERE (classMask = 4 AND skill = 45);

-- Crossbows - 226
    -- Hunter - Crossbows
    UPDATE `playercreateinfo_skills` SET raceMask = 1024, comment = 'Hunter - Crossbows' WHERE (classMask = 4 AND skill = 226);

-- Daggers - 173
    -- Warrior - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 200, comment = 'Warrior - Daggers' WHERE (classMask = 1 AND skill = 173);
    -- Hunter - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2568, comment = 'Hunter - Daggers' WHERE (classMask = 4 AND skill = 173);
    -- Rogue - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 3039, comment = 'Rogue - Daggers' WHERE (classMask = 8 AND skill = 173);
    -- Warlock - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2899, comment = 'Warlock - Daggers' WHERE (classMask = 256 AND skill = 173);
    -- Druid - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2056, comment = 'Druid - Daggers' WHERE (classMask = 1024 AND skill = 173);

-- Guns - 46
    -- Hunter - Guns
    UPDATE `playercreateinfo_skills` SET raceMask = 2340, comment = 'Hunter - Guns' WHERE (classMask = 4 AND skill = 46);

-- Maces - 54
    -- Warrior - Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 3181, comment = 'Warrior - Maces' WHERE (classMask = 1 AND skill = 54);
    -- Paladin - Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 1541, comment = 'Paladin - Maces' WHERE (classMask = 2 AND skill = 54);
    -- Priest - Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 3997, comment = 'Priest - Maces' WHERE (classMask = 16 AND skill = 54);
    -- Shaman - Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 1442, comment = 'Shaman - Maces' WHERE (classMask = 64 AND skill = 54);
    -- Druid - Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 32, comment = 'Druid - Maces' WHERE (classMask = 1024 AND skill = 54);

-- Polearms - 229
    -- Deathknight - Polearms
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Deathknight - Polearms' WHERE (classMask = 32 AND skill = 229);

-- Shields - 433
    -- Warrior + Paladin + Shaman - Shields
    UPDATE `playercreateinfo_skills` SET raceMask = 3583, comment = 'Warrior + Paladin + Shaman - Shields' WHERE (classMask = 67 AND skill = 433);

-- Staves - 136
    -- Shaman + Mage + Druid - Staves
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Shaman + Mage + Druid - Staves' WHERE (classMask = 1216 AND skill = 136);

-- Swords - 43
    -- Warrior - Swords
    REPLACE INTO `playercreateinfo_skills` SET raceMask = 3419, comment = 'Warrior - Swords' WHERE (classMask = 1 AND skill = 43);
    -- Hunter - Swords
    UPDATE `playercreateinfo_skills` SET raceMask = 1024, comment = 'Hunter - Swords' WHERE (classMask = 4 AND skill = 43);
    -- Death Knight - Swords
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Death Knight - Swords' WHERE (classMask = 32 AND skill = 43);

-- Thrown - 176
    -- Warrior - Thrown
    REPLACE INTO `playercreateinfo_skills` SET raceMask = 3419, comment = 'Warrior - Thrown' WHERE (classMask = 1 AND skill = 176);
    -- Rogue - Thrown
    UPDATE `playercreateinfo_skills` SET raceMask = 3039, comment = 'Rogue - Thrown' WHERE (classMask = 8 AND skill = 176);

-- Two Handed Axes - 172
    -- Warrior - Two Handed Axes
    REPLACE INTO `playercreateinfo_skills` SET raceMask = 6, comment = 'Warrior - Two Handed Axes' WHERE (classMask = 1 AND skill = 172);
    -- Death Knight - Two Handed Axes
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Death Knight - Two Handed Axes' WHERE (classMask = 32 AND skill = 172);

-- Two Handed Maces - 160
    -- Warrior - Two Handed Maces
    REPLACE INTO `playercreateinfo_skills` SET raceMask = 288, comment = 'Warrior - Two Handed Maces' WHERE (classMask = 1 AND skill = 160);
    -- Paladin - Two Handed Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 1029, comment = 'Paladin - Two Handed Maces' WHERE (classMask = 2 AND skill = 160);

-- Two Handed Swords - 55
    -- Warrior - Two Handed Swords
    REPLACE INTO `playercreateinfo_skills` SET raceMask = 3088, comment = 'Warrior - Two Handed Swords' WHERE (classMask = 1 AND skill = 55);
    -- Paladin - Two Handed Swords
    UPDATE `playercreateinfo_skills` SET raceMask = 512, comment = 'Paladin - Two Handed Swords' WHERE (classMask = 2 AND skill = 55);
    -- Death Knight - Two Handed Swords
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Death Knight - Two Handed Swords' WHERE (classMask = 32 AND skill = 55);

-- Unarmed - 162
    -- All - Unarmed
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'All - Unarmed' WHERE (classMask = 0 AND skill = 162);

-- Wands - 228
    -- Warrior + Paladin + Shaman - Wands
    UPDATE `playercreateinfo_skills` SET raceMask = 4095, comment = 'Priest + Mage + Warlock - Wands' WHERE (classMask = 400 AND skill = 228);