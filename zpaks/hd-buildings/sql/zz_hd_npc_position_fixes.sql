-- I-138: Fix NPC clipping caused by larger HD tree models
-- Hana'zua in Durotar clips into HD DurotarTree model
UPDATE creature SET position_x = -399.7, position_y = -4111.4, position_z = 50.2 WHERE guid = 6471;
