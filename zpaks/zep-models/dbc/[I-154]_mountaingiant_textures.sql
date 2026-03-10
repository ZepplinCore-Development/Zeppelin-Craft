-- I-154: Maraudon mountain giant display fixes

-- Primordial Behemoth (12309): fix low-quality PartialWhiteCrystal texture, scale down from 1.3 to 1.0
UPDATE creaturedisplayinfo SET texture_variation_1 = 'MountainGiant', creature_model_scale = 1.0 WHERE id = 12309;

-- Unused PartialWhiteCrystal display (18643): fix texture too
UPDATE creaturedisplayinfo SET texture_variation_1 = 'MountainGiant' WHERE id = 18643;

-- Landslide (12293): swap to Howling Northrend mountain giant model, scale down from 1.6 to 1.25
-- Set textures to match other Howling displays (MountainGiant_Howling1 + MountainGiant_Howling2)
UPDATE creaturedisplayinfo SET model_id = 2700, creature_model_scale = 1.25, texture_variation_1 = 'MountainGiant_Howling1', texture_variation_2 = 'MountainGiant_Howling2' WHERE id = 12293;
