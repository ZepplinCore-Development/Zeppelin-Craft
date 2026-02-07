   -- Fix Z-coordinates for creatures affected by OA terrain changes in Stormwind Trade District
   -- Adjusts any creature within 5 yards of observed sunken locations

   -- Location 1: (-8809.47, 638.0332) - Set Z to 94.55633
   UPDATE creature
   SET position_z = 94.55633
   WHERE map = 0
     AND SQRT(POW(position_x - (-8809.47), 2) + POW(position_y - 638.0332, 2)) <= 5
     AND position_z < 97  -- Exclude elevated platforms/trainers
     AND position_z < 94.55633;  -- Only adjust if currently below target

   -- Location 2: (-8823.709, 628.66284) - Set Z to 94.31634
   UPDATE creature
   SET position_z = 94.31634
   WHERE map = 0
     AND SQRT(POW(position_x - (-8823.709), 2) + POW(position_y - 628.66284, 2)) <= 5
     AND position_z < 97  -- Exclude elevated platforms/trainers
     AND position_z < 94.31634;  -- Only adjust if currently below target

   -- Location 3: (-8825.676, 615.59985) - Set Z to 94.71275
   UPDATE creature
   SET position_z = 94.71275
   WHERE map = 0
     AND SQRT(POW(position_x - (-8825.676), 2) + POW(position_y - 615.59985, 2)) <= 5
     AND position_z < 97  -- Exclude elevated platforms/trainers
     AND position_z < 94.71275;  -- Only adjust if currently below target