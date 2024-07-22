-- Two-Handed Maces

    -- Paladin - Two-Handed Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 5 WHERE (classMask = 2 AND skill = 160);
    -- Warrior - Two-Handed Maces
    UPDATE `playercreateinfo_skills` SET raceMask = 288 WHERE (classMask = 1 AND skill = 160);

-- Daggers

    -- Warlock - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2898 WHERE (classMask = 256 AND skill = 173);
    -- Druid - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2088 WHERE (classMask = 1024 AND skill = 173);
    -- Warrior - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 200 WHERE (classMask = 1 AND skill = 173);
    -- Hunter - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 2824 WHERE (classMask = 4 AND skill = 173);
    -- Rogue - Daggers
    UPDATE `playercreateinfo_skills` SET raceMask = 3039 WHERE (classMask = 8 AND skill = 173);

-- Guns

