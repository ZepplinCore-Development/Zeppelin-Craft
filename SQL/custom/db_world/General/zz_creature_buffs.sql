-- Update levels 10 to 50 with incremental percentage increases
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * (1 + (level - 10) * 0.01),
    basehp1 = basehp1 * (1 + (level - 10) * 0.01),
    damage_base = damage_base * (1 + (level - 10) * 0.01),
    damage_exp1 = damage_exp1 * (1 + (level - 10) * 0.01),
    attackpower = attackpower * (1 + (level - 10) * 0.01),
    rangedattackpower = rangedattackpower * (1 + (level - 10) * 0.01)
WHERE level BETWEEN 10 AND 50;

-- Update levels 51 and above with a flat 40% increase
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * 1.40,
    basehp1 = basehp1 * 1.40,
    damage_base = damage_base * 1.40,
    damage_exp1 = damage_exp1 * 1.40,
    attackpower = attackpower * 1.40,
    rangedattackpower = rangedattackpower * 1.40
WHERE level >= 51;

