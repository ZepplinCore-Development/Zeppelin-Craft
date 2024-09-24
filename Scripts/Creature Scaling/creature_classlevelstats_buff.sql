-- Update levels 1 to 60 with a flat 20% health and damage increase and another 3% per level for Outland
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * (1 + level * 0.000 + 0.20),
    basehp1 = basehp1 * (1 + level * 0.003 + 0.20),
    damage_base = damage_base * (1 + level * 0.000 + 0.20),
    damage_exp1 = damage_exp1 * (1 + level * 0.003 + 0.20),
    attackpower = attackpower * (1 + level * 0.003 + 0.20),
    rangedattackpower = rangedattackpower * (1 + level * 0.003 + 0.20)
WHERE level BETWEEN 1 AND 60;

-- Update levels 61 and above with a flat 25 (Azeroth) and 40% increase (Outland)
UPDATE acore_world.creature_classlevelstats
SET 
    basehp0 = basehp0 * 1.25,
    basehp1 = basehp1 * 1.40,
    damage_base = damage_base * 1.25,
    damage_exp1 = damage_exp1 * 1.40,
    attackpower = attackpower * 1.25,
    rangedattackpower = rangedattackpower * 1.25
WHERE level >= 61;
