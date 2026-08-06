-- F-174: Skinning Expanded
-- Add skinning to beasts that should logically be skinnable

-- Hellfire Peninsula beasts
-- Use Helboar skinloot 70160 (Knothide Leather Scraps, Knothide Leather, Fel Hide)
-- to match other Hellfire Peninsula beasts for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70160 WHERE entry IN (
  19640, -- Bleeding Hollow Riding Worg (level 60-61)
  18706, -- Bonechewer Riding Wolf (level 58-59)
  16844, -- Crust Burster (level 59-60)
  16857  -- Marauding Crust Burster (level 59-60)
);

-- Nagrand beasts
-- Use generic Outland 65-67 skinloot 70063 (Knothide Leather)
-- matching other Nagrand wildlife for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70063 WHERE entry IN (
  21381, -- Young Crust Burster (level 66-67)
  21380  -- Greater Crust Burster (level 67)
);

-- Tempest Keep (The Botanica) birds
-- Use Phoenix-Hawk Hatchling skinloot 70065 (Knothide Leather)
-- matching the other Tempest Keep birds for zone-consistent leather drops
UPDATE creature_template SET skinloot = 70065 WHERE entry IN (
  18155, -- Bloodfalcon (level 69)
  21544  -- Bloodfalcon (level 70, duplicate entry)
);

-- Hide-bearing critters (creature type 8)
-- Use F-002 starter skinloot 299 (Ruined Leather Scraps 100%, 1-3).
--
-- Stock precedent: Sheep (1933) is the one critter Blizzard shipped skinnable
-- (skinloot 1933 - wool + light leather + ruined scraps). This extends that
-- precedent to the other hoofed/large mammals, which read as obviously
-- skinnable but were left un-skinnable. Sheep (1933) is deliberately NOT
-- touched - it keeps its stock table.
--
-- Table 299 (weakest tier) rather than a level-matched table: critters award
-- no XP, die to one hit and respawn fast, so this is flavour plus an early
-- skinning skill-up source, not a leather faucet.
--
-- Core support is already present - Spell.cpp SPELL_EFFECT_SKINNING exempts
-- critters from the "corpse must be looted first" gate, and these entries have
-- lootid = 0, so Unit::Kill routes straight to AllLootRemovedFromCorpse() and
-- sets UNIT_FLAG_SKINNABLE at death.
--
-- Excluded by design: vermin/insects/arachnids (rat, roach, beetle, maggot,
-- spider, scorpion), amphibians/reptiles/fish (frog, toad, snake, adder, crab,
-- trout), birds (chicken, turkey, parrot, penguin), small fur critters (rabbit,
-- hare, squirrel, marmot, skunk, prairie dog, mouse, cat), non-corporeal (wisp,
-- Spectral Bovine), named/unique NPCs (Old Blanchy, Bess, Mr. Bigglesworth),
-- diseased quest critters (Sickly/Cured Deer + Gazelle, Infected Deer) and all
-- DND/trigger/polymorph entries.
UPDATE creature_template SET skinloot = 299 WHERE entry IN (
  883,   -- Deer (level 5)
  890,   -- Fawn (level 1)
  2098,  -- Ram (level 5)
  2442,  -- Cow (level 5)
  4166,  -- Gazelle (level 3)
  10685, -- Swine (level 3)
  385    -- Horse (level 5)
);
