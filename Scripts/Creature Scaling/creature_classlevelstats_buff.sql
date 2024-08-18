-- Update levels 10 to 60 with incremental percentage increases
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * (1 + (level - 10) * 0.004),
    basehp1 = basehp1 * (1 + (level - 10) * 0.008),
    damage_base = damage_base * (1 + (level - 10) * 0.004),
    damage_exp1 = damage_exp1 * (1 + (level - 10) * 0.008),
    attackpower = attackpower * (1 + (level - 10) * 0.008),
    rangedattackpower = rangedattackpower * (1 + (level - 10) * 0.008)
WHERE level BETWEEN 10 AND 60;

-- Update levels 61 and above with a flat 20 - 40% increase
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * 1.20,
    basehp1 = basehp1 * 1.40,
    damage_base = damage_base * 1.20,
    damage_exp1 = damage_exp1 * 1.40,
    attackpower = attackpower * 1.20,
    rangedattackpower = rangedattackpower * 1.20
WHERE level >= 61;
