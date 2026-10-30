-- F-234: Cata water. The WoW-HD pack's patch-w.mpq LiquidType.dbc (2026-10-28) over stock: water, ocean and slime
-- use the procedural water material (LiquidMaterial 3) and its XTextures\\procWater / river / ocean textures, which
-- the x64 client's Cata water (hdCataWater, Vulkan) hooks; the textures ship in PATCH-V (zep-vulkan-shaders).
-- One UPDATE per stock row, the changed columns only; generated from the two DBC files.

UPDATE liquidtype SET
  type = 1,
  sound_id = 1114,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_1 = 1,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 1;

UPDATE liquidtype SET
  dir_darkenintensity = 0.0,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralOceanDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 2;

UPDATE liquidtype SET
  texture_1 = 'XTextures\\lava\\magma0.blp'
WHERE id = 3;

UPDATE liquidtype SET
  type = 1,
  sound_id = 1114,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_1 = 1,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 5;

UPDATE liquidtype SET
  dir_darkenintensity = 0.0,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralOceanDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 6;

UPDATE liquidtype SET
  texture_1 = 'XTextures\\lava\\magma0.blp'
WHERE id = 7;

UPDATE liquidtype SET
  type = 1,
  sound_id = 1114,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_1 = 1,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 9;

UPDATE liquidtype SET
  dir_darkenintensity = 0.0,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralOceanDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 10;

UPDATE liquidtype SET
  texture_1 = 'XTextures\\lava\\magma0.blp'
WHERE id = 11;

UPDATE liquidtype SET
  type = 1,
  sound_id = 1114,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 13;

UPDATE liquidtype SET
  dir_darkenintensity = 0.0,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralOceanDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 14;

UPDATE liquidtype SET
  texture_1 = 'XTextures\\GreenLava\\LAVAGREEN1.BLP'
WHERE id = 15;

UPDATE liquidtype SET
  type = 1,
  sound_id = 1114,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 17;

UPDATE liquidtype SET
  texture_1 = 'XTextures\\lava\\magma0.blp'
WHERE id = 19;

UPDATE liquidtype SET
  texture_5 = 'proceduralRiverDepthTex'
WHERE id = 41;

UPDATE liquidtype SET
  texture_5 = 'proceduralRiverDepthTex'
WHERE id = 61;

UPDATE liquidtype SET
  type = 1,
  max_darken_depth = 30.0,
  fog_darkenintensity = 0.5,
  amb_darkenintensity = 0.5,
  material_id = 3,
  texture_1 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_2 = 'XTextures\\procWater\\basicReflectionMap.blp',
  texture_3 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_4 = 'XTextures\\procWater\\basicWaterHeightTex_%d.blp',
  texture_5 = 'proceduralRiverDepthTex',
  texture_6 = 'XTextures\\ocean\\ocean_h.%d.blp',
  float_1 = 0.10000000149011612,
  float_2 = 0.5,
  float_3 = 1.5,
  float_4 = 2.0,
  float_9 = 1.0,
  float_10 = 1.0,
  float_12 = 300.0,
  float_13 = 0.3330000042915344,
  float_14 = 0.20000000298023224,
  float_15 = 0.10000000149011612,
  float_16 = 0.20000000298023224,
  float_17 = 0.800000011920929,
  float_18 = 0.20000000298023224,
  int_1 = 1,
  int_3 = 1250,
  int_4 = 1250
WHERE id = 81;
