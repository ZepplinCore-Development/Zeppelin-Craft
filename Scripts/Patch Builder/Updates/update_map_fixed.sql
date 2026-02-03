UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */,
    `desc_1_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */
WHERE `id` = 30;

UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */,
    `desc_1_enus` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */
WHERE `id` = 489;

UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' */,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.Meanwhile, the Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' */
WHERE `id` = 529;

UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.This battlefield is coveted by the blood elves for its rich energy deposits.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.' */,
    `desc_1_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.This battlefield is coveted by the blood elves for its rich energy deposits.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.' */
WHERE `id` = 566;

UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */,
    `desc_1_enus` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */
WHERE `id` = 607;

DELETE FROM `dbc`.`map` WHERE `id` = 627;
INSERT INTO `dbc`.`map` SET 
    `id` = 627,
    `directory` = 'unused',
    `instance_type` = 5,
    `flags` = 29,
    `pvp` = 1,
    `name_enus` = 'Unused (DELETE ME)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 25,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

UPDATE `dbc`.`map` SET 
    `desc_0_enus` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */,
    `desc_1_enus` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */
WHERE `id` = 628;

DELETE FROM `dbc`.`map` WHERE `id` = 637;
INSERT INTO `dbc`.`map` SET 
    `id` = 637,
    `directory` = 'AbyssalMaw',
    `instance_type` = 1,
    `flags` = 1,
    `name_enus` = 'Abyssal Maw Exterior',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 23,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 638;
INSERT INTO `dbc`.`map` SET 
    `id` = 638,
    `directory` = 'Gilneas',
    `flags` = 1,
    `name_enus` = 'Gilneas',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 643;
INSERT INTO `dbc`.`map` SET 
    `id` = 643,
    `directory` = 'AbyssalMaw_Interior',
    `instance_type` = 1,
    `flags` = 29,
    `name_enus` = 'Throne of the Tides',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -5585.87,
    `corpse_y` = 5401.65,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 644;
INSERT INTO `dbc`.`map` SET 
    `id` = 644,
    `directory` = 'Uldum',
    `instance_type` = 1,
    `flags` = 29,
    `name_enus` = 'Halls of Origination',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 256,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -10226.0,
    `corpse_y` = -1837.48,
    `time_override` = 1080,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 645;
INSERT INTO `dbc`.`map` SET 
    `id` = 645,
    `directory` = 'BlackRockSpire_4_0',
    `instance_type` = 1,
    `flags` = 1,
    `name_enus` = 'Blackrock Caverns',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 267,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7570.25,
    `corpse_y` = -1330.68,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 646;
INSERT INTO `dbc`.`map` SET 
    `id` = 646,
    `directory` = 'Deephome',
    `flags` = 1,
    `name_enus` = 'Deepholm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 268,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 648;
INSERT INTO `dbc`.`map` SET 
    `id` = 648,
    `directory` = 'LostIsles',
    `flags` = 1,
    `name_enus` = 'LostIsles',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 651;
INSERT INTO `dbc`.`map` SET 
    `id` = 651,
    `directory` = 'ElevatorSpawnTest',
    `flags` = 285,
    `name_enus` = 'ElevatorSpawnTest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 654;
INSERT INTO `dbc`.`map` SET 
    `id` = 654,
    `directory` = 'Gilneas2',
    `name_enus` = 'Gilneas2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 655;
INSERT INTO `dbc`.`map` SET 
    `id` = 655,
    `directory` = 'GilneasPhase1',
    `name_enus` = 'GilneasPhase1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 656;
INSERT INTO `dbc`.`map` SET 
    `id` = 656,
    `directory` = 'GilneasPhase2',
    `name_enus` = 'GilneasPhase2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 657;
INSERT INTO `dbc`.`map` SET 
    `id` = 657,
    `directory` = 'SkywallDungeon',
    `instance_type` = 1,
    `name_enus` = 'The Vortex Pinnacle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -11522.5,
    `corpse_y` = -2317.93,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 659;
INSERT INTO `dbc`.`map` SET 
    `id` = 659,
    `directory` = 'LostIslesPhase1',
    `name_enus` = 'Lost Isles Volcano Eruption',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 660;
INSERT INTO `dbc`.`map` SET 
    `id` = 660,
    `directory` = 'Deephomeceiling',
    `name_enus` = 'Deephome Ceiling',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 661;
INSERT INTO `dbc`.`map` SET 
    `id` = 661,
    `directory` = 'LostIslesPhase2',
    `name_enus` = 'Lost Isles Town in a Box',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 662;
INSERT INTO `dbc`.`map` SET 
    `id` = 662,
    `directory` = 'Transport197195',
    `name_enus` = 'Transport: Alliance Vashj''ir Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 669;
INSERT INTO `dbc`.`map` SET 
    `id` = 669,
    `directory` = 'BlackwingDescent',
    `instance_type` = 2,
    `name_enus` = 'Blackwing Descent',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 260,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7541.77,
    `corpse_y` = -1188.83,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 670;
INSERT INTO `dbc`.`map` SET 
    `id` = 670,
    `directory` = 'GrimBatolDungeon',
    `instance_type` = 1,
    `name_enus` = 'Grim Batol',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 257,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -4047.74,
    `corpse_y` = -3446.35,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 671;
INSERT INTO `dbc`.`map` SET 
    `id` = 671,
    `directory` = 'GrimBatolRaid',
    `instance_type` = 2,
    `name_enus` = 'The Bastion of Twilight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 266,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -4903.01,
    `corpse_y` = -4221.21,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 674;
INSERT INTO `dbc`.`map` SET 
    `id` = 674,
    `directory` = 'Transport197349-2',
    `name_enus` = 'Transport: Ship to Vashj''ir',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 719;
INSERT INTO `dbc`.`map` SET 
    `id` = 719,
    `directory` = 'MountHyjalPhase1',
    `name_enus` = 'Mount Hyjal Phase 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 720;
INSERT INTO `dbc`.`map` SET 
    `id` = 720,
    `directory` = 'Firelands1',
    `instance_type` = 2,
    `name_enus` = 'Firelands',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 275,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = 3987.2,
    `corpse_y` = -2943.32,
    `time_override` = 720,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 721;
INSERT INTO `dbc`.`map` SET 
    `id` = 721,
    `directory` = 'Firelands2',
    `instance_type` = 1,
    `name_enus` = 'Firelands Terrain 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 725;
INSERT INTO `dbc`.`map` SET 
    `id` = 725,
    `directory` = 'DeepholmeDungeon',
    `instance_type` = 1,
    `name_enus` = 'The Stonecore',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 258,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 646,
    `corpse_x` = 1031.91,
    `corpse_y` = 610.297,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 726;
INSERT INTO `dbc`.`map` SET 
    `id` = 726,
    `directory` = 'CataclysmCTF',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Twin Peaks',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 262,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 727;
INSERT INTO `dbc`.`map` SET 
    `id` = 727,
    `directory` = 'STV_Mine_BG',
    `instance_type` = 3,
    `name_enus` = 'Silvershard Mines',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 317,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 728;
INSERT INTO `dbc`.`map` SET 
    `id` = 728,
    `directory` = 'TheBattleforGilneas',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'The Battle for Gilneas (Old City Map)',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Located in the heart of Gilnean peninsula, the capital city is of vital strategic importance to the Horde''s operations the Eastern Kingdoms.

Long seen by the Forsaken as a natural expansion to their dominion, Sylvanas Windrunner''s armies are ready to defend their most recent conquest at all costs.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Driven from their homelands by the Forsaken, Gilneans continue to view this city as their nation''s rightful capital.

After regrouping in Alliance territories, the people of Gilneas have rallied around King Greymane''s call to arms and are ready to retake Gilneas City with the support of their new allies.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 261,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 730;
INSERT INTO `dbc`.`map` SET 
    `id` = 730,
    `directory` = 'MaelstromZone',
    `name_enus` = 'Maelstrom Zone',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 731;
INSERT INTO `dbc`.`map` SET 
    `id` = 731,
    `directory` = 'DesolaceBomb',
    `name_enus` = 'Stonetalon Bomb',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 732;
INSERT INTO `dbc`.`map` SET 
    `id` = 732,
    `directory` = 'TolBarad',
    `name_enus` = 'Tol Barad',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 265,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 734;
INSERT INTO `dbc`.`map` SET 
    `id` = 734,
    `directory` = 'AhnQirajTerrace',
    `instance_type` = 1,
    `name_enus` = 'Ahn''Qiraj Terrace',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 184,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 736;
INSERT INTO `dbc`.`map` SET 
    `id` = 736,
    `directory` = 'TwilightHighlandsDragonmawPhase',
    `name_enus` = 'Twilight Highlands Dragonmaw Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 738;
INSERT INTO `dbc`.`map` SET 
    `id` = 738,
    `directory` = 'Transport200100',
    `name_enus` = 'Ship to Vashj''ir (Orgrimmar -> Vashj''ir)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 739;
INSERT INTO `dbc`.`map` SET 
    `id` = 739,
    `directory` = 'Transport200101',
    `name_enus` = 'Vashj''ir Sub - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 740;
INSERT INTO `dbc`.`map` SET 
    `id` = 740,
    `directory` = 'Transport200102',
    `name_enus` = 'Vashj''ir Sub - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 741;
INSERT INTO `dbc`.`map` SET 
    `id` = 741,
    `directory` = 'Transport200103',
    `name_enus` = 'Twilight Highlands Horde Transport',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 742;
INSERT INTO `dbc`.`map` SET 
    `id` = 742,
    `directory` = 'Transport203729',
    `name_enus` = 'Vashj''ir Sub - Horde - Circling Abyssal Maw',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 743;
INSERT INTO `dbc`.`map` SET 
    `id` = 743,
    `directory` = 'Transport203730',
    `name_enus` = 'Vashj''ir Sub - Alliance circling Abyssal Maw',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 746;
INSERT INTO `dbc`.`map` SET 
    `id` = 746,
    `directory` = 'UldumPhaseOasis',
    `name_enus` = 'Uldum Phase Oasis',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 747;
INSERT INTO `dbc`.`map` SET 
    `id` = 747,
    `directory` = 'Transport 203732',
    `name_enus` = 'Transport: Deepholm Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 748;
INSERT INTO `dbc`.`map` SET 
    `id` = 748,
    `directory` = 'Transport203858',
    `name_enus` = 'Transport: Onyxia/Nefarian Elevator',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 749;
INSERT INTO `dbc`.`map` SET 
    `id` = 749,
    `directory` = 'Transport203859',
    `name_enus` = 'Transport: Gilneas Moving Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 750;
INSERT INTO `dbc`.`map` SET 
    `id` = 750,
    `directory` = 'Transport203860',
    `name_enus` = 'Transport: Gilneas Static Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 751;
INSERT INTO `dbc`.`map` SET 
    `id` = 751,
    `directory` = 'RedgridgeOrcBomb',
    `name_enus` = 'Redridge - Orc Bomb',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 752;
INSERT INTO `dbc`.`map` SET 
    `id` = 752,
    `directory` = 'RedridgeBridgePhaseOne',
    `name_enus` = 'Redridge - Bridge Phase One',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 753;
INSERT INTO `dbc`.`map` SET 
    `id` = 753,
    `directory` = 'RedridgeBridgePhaseTwo',
    `name_enus` = 'Redridge - Bridge Phase Two',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 754;
INSERT INTO `dbc`.`map` SET 
    `id` = 754,
    `directory` = 'SkywallRaid',
    `instance_type` = 2,
    `name_enus` = 'Throne of the Four Winds',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 271,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -11360.6,
    `corpse_y` = 72.0833,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 755;
INSERT INTO `dbc`.`map` SET 
    `id` = 755,
    `directory` = 'UldumDungeon',
    `instance_type` = 1,
    `name_enus` = 'Lost City of the Tol''vir',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 264,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -10686.2,
    `corpse_y` = -1308.62,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 757;
INSERT INTO `dbc`.`map` SET 
    `id` = 757,
    `directory` = 'BaradinHold',
    `instance_type` = 2,
    `name_enus` = 'Baradin Hold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 269,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 759;
INSERT INTO `dbc`.`map` SET 
    `id` = 759,
    `directory` = 'UldumPhasedEntrance',
    `name_enus` = 'Uldum Phased Entrance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 760;
INSERT INTO `dbc`.`map` SET 
    `id` = 760,
    `directory` = 'TwilightHighlandsPhasedEntrance',
    `name_enus` = 'Twilight Highlands Phased Entrance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 761;
INSERT INTO `dbc`.`map` SET 
    `id` = 761,
    `directory` = 'Gilneas_BG_2',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'The Battle for Gilneas',
    `name_flags` = 16712190,
    `desc_0_enus` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 270,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1110;

DELETE FROM `dbc`.`map` WHERE `id` = 762;
INSERT INTO `dbc`.`map` SET 
    `id` = 762,
    `directory` = 'Transport 203861',
    `name_enus` = 'Twilight Highlands Zeppelin 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 763;
INSERT INTO `dbc`.`map` SET 
    `id` = 763,
    `directory` = 'Transport 203862',
    `name_enus` = 'Twilight Highlands Zeppelin 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 764;
INSERT INTO `dbc`.`map` SET 
    `id` = 764,
    `directory` = 'UldumPhaseWreckedCamp',
    `name_enus` = 'Uldum - Phase Wrecked Camp',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 765;
INSERT INTO `dbc`.`map` SET 
    `id` = 765,
    `directory` = 'Transport203863',
    `name_enus` = 'Krazzworks Attack Zeppelin',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 766;
INSERT INTO `dbc`.`map` SET 
    `id` = 766,
    `directory` = 'Transport 2033864',
    `name_enus` = 'Transport: Gilneas Moving Gunship 02',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 767;
INSERT INTO `dbc`.`map` SET 
    `id` = 767,
    `directory` = 'Transport 2033865',
    `name_enus` = 'Transport: Gilneas Moving Gunship 03',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 859;
INSERT INTO `dbc`.`map` SET 
    `id` = 859,
    `directory` = 'Zul_Gurub5Man',
    `instance_type` = 1,
    `name_enus` = 'Zul''Gurub',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 161,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -11916.2,
    `corpse_y` = -1219.84,
    `time_override` = 720,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 860;
INSERT INTO `dbc`.`map` SET 
    `id` = 860,
    `directory` = 'NewRaceStartZone',
    `name_enus` = 'The Wandering Isle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 861;
INSERT INTO `dbc`.`map` SET 
    `id` = 861,
    `directory` = 'FirelandsDailies',
    `name_enus` = 'Molten Front',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 870;
INSERT INTO `dbc`.`map` SET 
    `id` = 870,
    `directory` = 'HawaiiMainLand',
    `name_enus` = 'Pandaria',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 930;
INSERT INTO `dbc`.`map` SET 
    `id` = 930,
    `directory` = 'ScenarioAlcazIsland',
    `instance_type` = 5,
    `name_enus` = 'A Dark Place',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 25,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 938;
INSERT INTO `dbc`.`map` SET 
    `id` = 938,
    `directory` = 'COTDragonblight',
    `instance_type` = 1,
    `name_enus` = 'End Time',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 286,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -8288.6,
    `corpse_y` = -4454.09,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 939;
INSERT INTO `dbc`.`map` SET 
    `id` = 939,
    `directory` = 'COTWarOfTheAncients',
    `instance_type` = 1,
    `name_enus` = 'Well of Eternity',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 287,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -8595.84,
    `corpse_y` = -3994.94,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 940;
INSERT INTO `dbc`.`map` SET 
    `id` = 940,
    `directory` = 'TheHourOfTwilight',
    `instance_type` = 1,
    `name_enus` = 'Hour of Twilight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 288,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -8291.13,
    `corpse_y` = -4590.44,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 951;
INSERT INTO `dbc`.`map` SET 
    `id` = 951,
    `directory` = 'NexusLegendary',
    `instance_type` = 1,
    `name_enus` = 'Nexus Legendary',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `corpse_x` = 3899.93,
    `corpse_y` = 6985.44,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 959;
INSERT INTO `dbc`.`map` SET 
    `id` = 959,
    `directory` = 'ShadowpanHideout',
    `instance_type` = 1,
    `name_enus` = 'Shado-Pan Monastery',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 315,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 960;
INSERT INTO `dbc`.`map` SET 
    `id` = 960,
    `directory` = 'EastTemple',
    `instance_type` = 1,
    `name_enus` = 'Temple of the Jade Serpent',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `corpse_x` = 957.706,
    `corpse_y` = -2473.41,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 961;
INSERT INTO `dbc`.`map` SET 
    `id` = 961,
    `directory` = 'StormstoutBrewery',
    `instance_type` = 1,
    `name_enus` = 'Stormstout Brewery',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 318,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `corpse_x` = -688.705,
    `corpse_y` = 1267.45,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 962;
INSERT INTO `dbc`.`map` SET 
    `id` = 962,
    `directory` = 'TheGreatWall',
    `instance_type` = 1,
    `name_enus` = 'Gate of the Setting Sun',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 309,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `corpse_x` = 970.811,
    `corpse_y` = 2253.66,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 967;
INSERT INTO `dbc`.`map` SET 
    `id` = 967,
    `directory` = 'DeathwingBack',
    `instance_type` = 2,
    `name_enus` = 'Dragon Soul',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 279,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -8263.28,
    `corpse_y` = -4512.69,
    `time_override` = 1080,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 968;
INSERT INTO `dbc`.`map` SET 
    `id` = 968,
    `directory` = 'EyeoftheStorm2.0',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Rated Eye of the Storm',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 210,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 971;
INSERT INTO `dbc`.`map` SET 
    `id` = 971,
    `directory` = 'JadeForestAllianceHubPhase',
    `name_enus` = 'Jade Forest Alliance Hub Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 972;
INSERT INTO `dbc`.`map` SET 
    `id` = 972,
    `directory` = 'JadeForestBattlefieldPhase',
    `name_enus` = 'Jade Forest Battlefield Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 974;
INSERT INTO `dbc`.`map` SET 
    `id` = 974,
    `directory` = 'DarkmoonFaire',
    `name_enus` = 'Darkmoon Faire',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 278,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 975;
INSERT INTO `dbc`.`map` SET 
    `id` = 975,
    `directory` = 'TurtleShipPhase01',
    `name_enus` = 'Turtle Ship Phase 01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 976;
INSERT INTO `dbc`.`map` SET 
    `id` = 976,
    `directory` = 'TurtleShipPhase02',
    `name_enus` = 'Turtle Ship Phase 02',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 977;
INSERT INTO `dbc`.`map` SET 
    `id` = 977,
    `directory` = 'MaelstromDeathwingFight',
    `instance_type` = 1,
    `name_enus` = 'Maelstrom Deathwing Fight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 980;
INSERT INTO `dbc`.`map` SET 
    `id` = 980,
    `directory` = 'TolVirArena',
    `instance_type` = 4,
    `name_enus` = 'Tol''Viron Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 319,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 994;
INSERT INTO `dbc`.`map` SET 
    `id` = 994,
    `directory` = 'MoguDungeon',
    `instance_type` = 1,
    `name_enus` = 'Mogu''shan Palace',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 312,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 995;
INSERT INTO `dbc`.`map` SET 
    `id` = 995,
    `directory` = 'MoguInteriorRaid',
    `instance_type` = 1,
    `name_enus` = 'The Depths [UNUSED]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 996;
INSERT INTO `dbc`.`map` SET 
    `id` = 996,
    `directory` = 'MoguExteriorRaid',
    `instance_type` = 2,
    `name_enus` = 'Terrace of Endless Spring',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 321,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 998;
INSERT INTO `dbc`.`map` SET 
    `id` = 998,
    `directory` = 'ValleyOfPower',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Temple of Kotmogu',
    `name_flags` = 16712190,
    `desc_0_enus` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 320,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 999;
INSERT INTO `dbc`.`map` SET 
    `id` = 999,
    `directory` = 'BFTAllianceScenario',
    `instance_type` = 5,
    `name_enus` = 'Theramore''s Fall (H)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 336,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1350,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1000;
INSERT INTO `dbc`.`map` SET 
    `id` = 1000,
    `directory` = 'BFTHordeScenario',
    `instance_type` = 5,
    `name_enus` = 'Theramore''s Fall (A)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 335,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 360,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1001;
INSERT INTO `dbc`.`map` SET 
    `id` = 1001,
    `directory` = 'ScarletSanctuaryArmoryAndLibrary',
    `instance_type` = 1,
    `name_enus` = 'Scarlet Halls',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 332,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = 2869.0,
    `corpse_y` = -820.0,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1004;
INSERT INTO `dbc`.`map` SET 
    `id` = 1004,
    `directory` = 'ScarletMonasteryCathedralGY',
    `instance_type` = 1,
    `name_enus` = 'Scarlet Monastery',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 333,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1005;
INSERT INTO `dbc`.`map` SET 
    `id` = 1005,
    `directory` = 'BrewmasterScenario01',
    `instance_type` = 5,
    `name_enus` = 'A Brewing Storm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 322,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1007;
INSERT INTO `dbc`.`map` SET 
    `id` = 1007,
    `directory` = 'NewScholomance',
    `instance_type` = 1,
    `name_enus` = 'Scholomance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 314,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = 1274.78,
    `corpse_y` = -2552.56,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1008;
INSERT INTO `dbc`.`map` SET 
    `id` = 1008,
    `directory` = 'MogushanPalace',
    `instance_type` = 2,
    `name_enus` = 'Mogu''shan Vaults',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 313,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `corpse_x` = 3983.0,
    `corpse_y` = 1121.29,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1009;
INSERT INTO `dbc`.`map` SET 
    `id` = 1009,
    `directory` = 'MantidRaid',
    `instance_type` = 2,
    `name_enus` = 'Heart of Fear',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 310,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1010;
INSERT INTO `dbc`.`map` SET 
    `id` = 1010,
    `directory` = 'MistsCTF3',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'CTF3',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This new map has yet to be created. Horde guys, go beat up those Alliance jerks.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This new map has yet to be created. Alliance guys, go beat up those Horde jerks.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 262,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1011;
INSERT INTO `dbc`.`map` SET 
    `id` = 1011,
    `directory` = 'MantidDungeon',
    `instance_type` = 1,
    `name_enus` = 'Siege of Niuzao Temple',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 316,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1014;
INSERT INTO `dbc`.`map` SET 
    `id` = 1014,
    `directory` = 'MonkAreaScenario',
    `instance_type` = 5,
    `name_enus` = 'Peak of Serenity',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1019;
INSERT INTO `dbc`.`map` SET 
    `id` = 1019,
    `directory` = 'RuinsOfTheramore',
    `name_enus` = 'Ruins of Theramore',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1024;
INSERT INTO `dbc`.`map` SET 
    `id` = 1024,
    `directory` = 'PandaFishingVillageScenario',
    `instance_type` = 5,
    `name_enus` = 'Greenstone Village',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 331,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1028;
INSERT INTO `dbc`.`map` SET 
    `id` = 1028,
    `directory` = 'MoguRuinsScenario',
    `instance_type` = 5,
    `name_enus` = '(UNUSED) Scenario: Mogu Ruins',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1029;
INSERT INTO `dbc`.`map` SET 
    `id` = 1029,
    `directory` = 'AncientMoguCryptScenario',
    `instance_type` = 5,
    `name_enus` = '(UNUSED) Scenario: Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1030;
INSERT INTO `dbc`.`map` SET 
    `id` = 1030,
    `directory` = 'AncientMoguCyptDestroyedScenario',
    `instance_type` = 5,
    `name_enus` = 'Crypt of Forgotten Kings',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 330,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1031;
INSERT INTO `dbc`.`map` SET 
    `id` = 1031,
    `directory` = 'ProvingGroundsScenario',
    `instance_type` = 5,
    `name_enus` = 'Arena of Annihilation',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 348,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1032;
INSERT INTO `dbc`.`map` SET 
    `id` = 1032,
    `directory` = 'PetBattleJadeForest',
    `instance_type` = 1,
    `name_enus` = 'Pet Battle - Jade Forest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1035;
INSERT INTO `dbc`.`map` SET 
    `id` = 1035,
    `directory` = 'ValleyOfPowerScenario',
    `instance_type` = 5,
    `name_enus` = 'Temple of Kotmogu',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 334,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1043;
INSERT INTO `dbc`.`map` SET 
    `id` = 1043,
    `directory` = 'RingOfValorScenario',
    `name_enus` = 'Brawl''gar Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 343,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 1048;
INSERT INTO `dbc`.`map` SET 
    `id` = 1048,
    `directory` = 'BrewmasterScenario03',
    `instance_type` = 5,
    `name_enus` = 'Unga Ingoo',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 323,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1049;
INSERT INTO `dbc`.`map` SET 
    `id` = 1049,
    `directory` = 'BlackOxTempleScenario',
    `instance_type` = 5,
    `name_enus` = '(UNUSED) Scenario: Black Ox Temple',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 21,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1050;
INSERT INTO `dbc`.`map` SET 
    `id` = 1050,
    `directory` = 'ScenarioKlaxxiIsland',
    `instance_type` = 5,
    `name_enus` = 'Assault on Zan''vess',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 344,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1051;
INSERT INTO `dbc`.`map` SET 
    `id` = 1051,
    `directory` = 'ScenarioBrewmaster04',
    `instance_type` = 5,
    `name_enus` = 'Brewmoon Festival',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 329,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1060;
INSERT INTO `dbc`.`map` SET 
    `id` = 1060,
    `directory` = 'LevelDesignLand-DevOnly',
    `name_enus` = 'Level Design Land - Dev Only',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1061;
INSERT INTO `dbc`.`map` SET 
    `id` = 1061,
    `directory` = 'HordeBeachDailyArea',
    `name_enus` = 'Horde Beach Daily Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1062;
INSERT INTO `dbc`.`map` SET 
    `id` = 1062,
    `directory` = 'AllianceBeachDailyArea',
    `name_enus` = 'Alliance Beach Daily Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1064;
INSERT INTO `dbc`.`map` SET 
    `id` = 1064,
    `directory` = 'MoguIslandDailyArea',
    `name_enus` = 'Mogu Island Daily Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 346,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1066;
INSERT INTO `dbc`.`map` SET 
    `id` = 1066,
    `directory` = 'StormwindGunshipPandariaStartArea',
    `name_enus` = 'Stormwind Gunship Pandaria Start Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1074;
INSERT INTO `dbc`.`map` SET 
    `id` = 1074,
    `directory` = 'OrgrimmarGunshipPandariaStart',
    `name_enus` = 'Orgrimmar Gunship Pandaria Start',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1075;
INSERT INTO `dbc`.`map` SET 
    `id` = 1075,
    `directory` = 'TheramoreScenarioPhase',
    `name_enus` = 'Theramore''s Fall Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1076;
INSERT INTO `dbc`.`map` SET 
    `id` = 1076,
    `directory` = 'JadeForestHordeStartingArea',
    `name_enus` = 'Jade Forest Horde Starting Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1095;
INSERT INTO `dbc`.`map` SET 
    `id` = 1095,
    `directory` = 'HordeAmbushScenario',
    `instance_type` = 5,
    `name_enus` = 'Dagger in the Dark',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 342,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1098;
INSERT INTO `dbc`.`map` SET 
    `id` = 1098,
    `directory` = 'ThunderIslandRaid',
    `instance_type` = 2,
    `name_enus` = 'Throne of Thunder',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 347,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1099;
INSERT INTO `dbc`.`map` SET 
    `id` = 1099,
    `directory` = 'NavalBattleScenario',
    `instance_type` = 5,
    `name_enus` = 'Naval Battle Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 349,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1101;
INSERT INTO `dbc`.`map` SET 
    `id` = 1101,
    `directory` = 'DefenseOfTheAleHouseBG',
    `name_enus` = 'Defense Of The Ale House BG',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1102;
INSERT INTO `dbc`.`map` SET 
    `id` = 1102,
    `directory` = 'HordeBaseBeachScenario',
    `instance_type` = 5,
    `name_enus` = 'Domination Point',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 341,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1103;
INSERT INTO `dbc`.`map` SET 
    `id` = 1103,
    `directory` = 'AllianceBaseBeachScenario',
    `instance_type` = 5,
    `name_enus` = 'Lion''s Landing',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 340,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1104;
INSERT INTO `dbc`.`map` SET 
    `id` = 1104,
    `directory` = 'ALittlePatienceScenario',
    `instance_type` = 5,
    `name_enus` = 'A Little Patience',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 345,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1105;
INSERT INTO `dbc`.`map` SET 
    `id` = 1105,
    `directory` = 'GoldRushBG',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Deepwind Gorge (Legacy)',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1106;
INSERT INTO `dbc`.`map` SET 
    `id` = 1106,
    `directory` = 'JainaDalaranScenario',
    `name_enus` = 'Jaina Dalaran Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 235,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1107;
INSERT INTO `dbc`.`map` SET 
    `id` = 1107,
    `directory` = 'WarlockArea',
    `name_enus` = 'Dreadscar Rift',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1112;
INSERT INTO `dbc`.`map` SET 
    `id` = 1112,
    `directory` = 'BlackTempleScenario',
    `instance_type` = 5,
    `name_enus` = 'Pursuing the Black Harvest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1113;
INSERT INTO `dbc`.`map` SET 
    `id` = 1113,
    `directory` = 'DarkmoonCarousel',
    `name_enus` = 'Transport: DarkmoonCarousel',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1116;
INSERT INTO `dbc`.`map` SET 
    `id` = 1116,
    `directory` = 'Draenor',
    `name_enus` = 'Draenor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1120;
INSERT INTO `dbc`.`map` SET 
    `id` = 1120,
    `directory` = 'ThunderKingHordeHub',
    `name_enus` = 'Thunder King Horde Hub',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1121;
INSERT INTO `dbc`.`map` SET 
    `id` = 1121,
    `directory` = 'ThunderIslandAllianceHub',
    `name_enus` = 'Thunder Island Alliance Hub',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1122;
INSERT INTO `dbc`.`map` SET 
    `id` = 1122,
    `directory` = 'CitySiegeMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'City Siege - Mogu Island Progression Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1123;
INSERT INTO `dbc`.`map` SET 
    `id` = 1123,
    `directory` = 'LightningForgeMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'Lightning Forge - Mogu Island Progression Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1124;
INSERT INTO `dbc`.`map` SET 
    `id` = 1124,
    `directory` = 'ShipyardMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'Shipyard - Mogu Island Progression Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1125;
INSERT INTO `dbc`.`map` SET 
    `id` = 1125,
    `directory` = 'AllianceHubMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'Alliance Hub - Mogu Island Progression Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1126;
INSERT INTO `dbc`.`map` SET 
    `id` = 1126,
    `directory` = 'HordeHubMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'Mogu Island Progression Events',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 346,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1127;
INSERT INTO `dbc`.`map` SET 
    `id` = 1127,
    `directory` = 'FinalGateMoguIslandProgressionScenario',
    `instance_type` = 5,
    `name_enus` = 'Final Gate - Mogu Island Progression Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1128;
INSERT INTO `dbc`.`map` SET 
    `id` = 1128,
    `directory` = 'MoguIslandEventsHordeBase',
    `name_enus` = 'Mogu Island Events - Horde Base',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1129;
INSERT INTO `dbc`.`map` SET 
    `id` = 1129,
    `directory` = 'MoguIslandEventsAllianceBase',
    `name_enus` = 'Mogu Island Events - Alliance Base',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1130;
INSERT INTO `dbc`.`map` SET 
    `id` = 1130,
    `directory` = 'ShimmerRidgeScenario',
    `instance_type` = 5,
    `name_enus` = 'Blood in the Snow',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 352,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1131;
INSERT INTO `dbc`.`map` SET 
    `id` = 1131,
    `directory` = 'DarkHordeScenario',
    `instance_type` = 5,
    `name_enus` = 'The Secrets of Ragefire',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 350,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1132;
INSERT INTO `dbc`.`map` SET 
    `id` = 1132,
    `directory` = 'Transport218599',
    `name_enus` = 'Transport: The Skybag (Brawl''gar Arena)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1133;
INSERT INTO `dbc`.`map` SET 
    `id` = 1133,
    `directory` = 'Transport218600',
    `name_enus` = 'Transport: Zandalari Ship (Mogu Island)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1134;
INSERT INTO `dbc`.`map` SET 
    `id` = 1134,
    `directory` = 'ShadoPanArena',
    `instance_type` = 4,
    `name_enus` = 'The Tiger''s Peak',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 353,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1135;
INSERT INTO `dbc`.`map` SET 
    `id` = 1135,
    `directory` = 'MoguIslandLootRoom',
    `instance_type` = 5,
    `name_enus` = 'Mogu Island Loot Room',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 347,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1136;
INSERT INTO `dbc`.`map` SET 
    `id` = 1136,
    `directory` = 'OrgrimmarRaid',
    `instance_type` = 2,
    `name_enus` = 'Siege of Orgrimmar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 359,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1144;
INSERT INTO `dbc`.`map` SET 
    `id` = 1144,
    `directory` = 'HeartOfTheOldGodScenario',
    `instance_type` = 5,
    `name_enus` = 'Heart of the Old God Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 351,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1148;
INSERT INTO `dbc`.`map` SET 
    `id` = 1148,
    `directory` = 'ProvingGrounds',
    `instance_type` = 5,
    `name_enus` = 'Proving Grounds',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 348,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1152;
INSERT INTO `dbc`.`map` SET 
    `id` = 1152,
    `directory` = 'FWHordeGarrisonLevel1',
    `instance_type` = 1,
    `name_enus` = 'FW Horde Garrison Level 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1153;
INSERT INTO `dbc`.`map` SET 
    `id` = 1153,
    `directory` = 'FWHordeGarrisonLevel2',
    `instance_type` = 1,
    `name_enus` = 'FW Horde Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1154;
INSERT INTO `dbc`.`map` SET 
    `id` = 1154,
    `directory` = 'FWHordeGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'FW Horde Garrison Level 4',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1155;
INSERT INTO `dbc`.`map` SET 
    `id` = 1155,
    `directory` = 'Stormgarde Keep',
    `instance_type` = 5,
    `name_enus` = 'Stromgarde Keep',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1157;
INSERT INTO `dbc`.`map` SET 
    `id` = 1157,
    `directory` = 'HalfhillScenario',
    `instance_type` = 5,
    `name_enus` = 'Halfhill Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1158;
INSERT INTO `dbc`.`map` SET 
    `id` = 1158,
    `directory` = 'SMVAllianceGarrisonLevel1',
    `instance_type` = 1,
    `name_enus` = 'SMV Alliance Garrison Level 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1159;
INSERT INTO `dbc`.`map` SET 
    `id` = 1159,
    `directory` = 'SMVAllianceGarrisonLevel2',
    `instance_type` = 1,
    `name_enus` = 'SMV Alliance Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1160;
INSERT INTO `dbc`.`map` SET 
    `id` = 1160,
    `directory` = 'SMVAllianceGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'SMV Alliance Garrison Level 4',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1161;
INSERT INTO `dbc`.`map` SET 
    `id` = 1161,
    `directory` = 'CelestialChallenge',
    `instance_type` = 5,
    `name_enus` = 'Celestial Tournament',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1200,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1166;
INSERT INTO `dbc`.`map` SET 
    `id` = 1166,
    `directory` = 'SmallBattlegroundA',
    `name_enus` = 'Small Battleground A',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1168;
INSERT INTO `dbc`.`map` SET 
    `id` = 1168,
    `directory` = 'ThePurgeOfGrommarScenario',
    `instance_type` = 5,
    `name_enus` = 'The Purge Of Grommar - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1169;
INSERT INTO `dbc`.`map` SET 
    `id` = 1169,
    `directory` = 'SmallBattlegroundB',
    `name_enus` = 'Small Battleground B',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1170;
INSERT INTO `dbc`.`map` SET 
    `id` = 1170,
    `directory` = 'SmallBattlegroundC',
    `instance_type` = 4,
    `name_enus` = 'Shado-Pan Showdown',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 353,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1171;
INSERT INTO `dbc`.`map` SET 
    `id` = 1171,
    `directory` = 'SmallBattlegroundD',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Small Battleground D',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Prototype Map',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Prototype Map',
    `desc_1_flags` = 16712190,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1172;
INSERT INTO `dbc`.`map` SET 
    `id` = 1172,
    `directory` = 'Transport_Siege_of_Orgrimmar_Alliance',
    `name_enus` = 'Transport: Siege of Orgrimmar (Alliance)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1173;
INSERT INTO `dbc`.`map` SET 
    `id` = 1173,
    `directory` = 'Transport_Siege_of_Orgrimmar_Horde',
    `name_enus` = 'Transport: Siege of Orgrimmar (Horde)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1175;
INSERT INTO `dbc`.`map` SET 
    `id` = 1175,
    `directory` = 'OgreCompound',
    `instance_type` = 1,
    `name_enus` = 'Bloodmaul Slag Mines',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 369,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1176;
INSERT INTO `dbc`.`map` SET 
    `id` = 1176,
    `directory` = 'MoonCultistHideout',
    `instance_type` = 1,
    `name_enus` = 'Shadowmoon Burial Grounds',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 364,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1179;
INSERT INTO `dbc`.`map` SET 
    `id` = 1179,
    `directory` = 'WarcraftHeroes',
    `name_enus` = 'Warcraft Heroes',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1181;
INSERT INTO `dbc`.`map` SET 
    `id` = 1181,
    `directory` = 'PattyMackTestGarrisonBldgMap',
    `name_enus` = 'PattyMack Test Garrison Bldg Map',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1182;
INSERT INTO `dbc`.`map` SET 
    `id` = 1182,
    `directory` = 'DraenorAuchindoun',
    `instance_type` = 1,
    `name_enus` = 'Auchindoun',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 365,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1187;
INSERT INTO `dbc`.`map` SET 
    `id` = 1187,
    `directory` = 'GORAllianceGarrisonLevel1',
    `instance_type` = 1,
    `name_enus` = 'GOR Alliance Garrison Level 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1188;
INSERT INTO `dbc`.`map` SET 
    `id` = 1188,
    `directory` = 'GORAllianceGarrisonLevel2',
    `instance_type` = 1,
    `name_enus` = 'GOR Alliance Garrison Level 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1189;
INSERT INTO `dbc`.`map` SET 
    `id` = 1189,
    `directory` = 'GORAllianceGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'GOR Alliance Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1190;
INSERT INTO `dbc`.`map` SET 
    `id` = 1190,
    `directory` = 'BlastedLands',
    `name_enus` = 'Blasted Lands Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1191;
INSERT INTO `dbc`.`map` SET 
    `id` = 1191,
    `directory` = 'Ashran',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Ashran',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1192;
INSERT INTO `dbc`.`map` SET 
    `id` = 1192,
    `directory` = 'Transport_Iron_Horde_Gorgrond_Train',
    `name_enus` = 'Transport: Gorgrond Train',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1195;
INSERT INTO `dbc`.`map` SET 
    `id` = 1195,
    `directory` = 'WarWharfSmackdown',
    `instance_type` = 1,
    `name_enus` = 'Iron Docks',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 371,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1200;
INSERT INTO `dbc`.`map` SET 
    `id` = 1200,
    `directory` = 'BonetownScenario',
    `instance_type` = 5,
    `name_enus` = 'Bonetown Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1203;
INSERT INTO `dbc`.`map` SET 
    `id` = 1203,
    `directory` = 'FrostfireFinaleScenario',
    `instance_type` = 5,
    `name_enus` = 'Frostfire Finale Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1205;
INSERT INTO `dbc`.`map` SET 
    `id` = 1205,
    `directory` = 'BlackrockFoundryRaid',
    `instance_type` = 2,
    `name_enus` = 'Blackrock Foundry',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 363,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1207;
INSERT INTO `dbc`.`map` SET 
    `id` = 1207,
    `directory` = 'TaladorIronHordeFinaleScenario',
    `instance_type` = 5,
    `name_enus` = 'The Battle for Shattrath',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1208;
INSERT INTO `dbc`.`map` SET 
    `id` = 1208,
    `directory` = 'BlackrockFoundryTrainDepot',
    `instance_type` = 1,
    `name_enus` = 'Grimrail Depot',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 368,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1209;
INSERT INTO `dbc`.`map` SET 
    `id` = 1209,
    `directory` = 'ArakkoaDungeon',
    `instance_type` = 1,
    `name_enus` = 'Skyreach',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 367,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1212;
INSERT INTO `dbc`.`map` SET 
    `id` = 1212,
    `directory` = '6HU_GARRISON_Blacksmithing_hub',
    `name_enus` = 'Garrison - Alliance - Blacksmith 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1213;
INSERT INTO `dbc`.`map` SET 
    `id` = 1213,
    `directory` = 'alliance_garrison_alchemy',
    `name_enus` = 'Garrison - Alliance - Alchemy 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1214;
INSERT INTO `dbc`.`map` SET 
    `id` = 1214,
    `directory` = 'alliance_garrison_enchanting',
    `name_enus` = 'Garrison - Alliance - Enchanting 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1215;
INSERT INTO `dbc`.`map` SET 
    `id` = 1215,
    `directory` = 'garrison_alliance_engineering',
    `name_enus` = 'Garrison - Alliance - Engineering 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1216;
INSERT INTO `dbc`.`map` SET 
    `id` = 1216,
    `directory` = 'garrison_alliance_farmhouse',
    `name_enus` = 'Garrison - Alliance - Farm1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1217;
INSERT INTO `dbc`.`map` SET 
    `id` = 1217,
    `directory` = 'garrison_alliance_inscription',
    `name_enus` = 'Garrison - Alliance - Inscription 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1218;
INSERT INTO `dbc`.`map` SET 
    `id` = 1218,
    `directory` = 'garrison_alliance_jewelcrafting',
    `name_enus` = 'Garrison - Alliance - Jewelcrafting 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1219;
INSERT INTO `dbc`.`map` SET 
    `id` = 1219,
    `directory` = 'garrison_alliance_leatherworking',
    `name_enus` = 'Garrison - Alliance - Leatherworking 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1220;
INSERT INTO `dbc`.`map` SET 
    `id` = 1220,
    `directory` = 'Troll Raid',
    `name_enus` = 'Broken Isles',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1221;
INSERT INTO `dbc`.`map` SET 
    `id` = 1221,
    `directory` = 'garrison_alliance_mine_1',
    `name_enus` = 'Garrison - Alliance Mine 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1222;
INSERT INTO `dbc`.`map` SET 
    `id` = 1222,
    `directory` = 'garrison_alliance_mine_2',
    `name_enus` = 'Garrison - Alliance Mine 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1223;
INSERT INTO `dbc`.`map` SET 
    `id` = 1223,
    `directory` = 'garrison_alliance_mine_3',
    `name_enus` = 'Garrison - Alliance Mine 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1224;
INSERT INTO `dbc`.`map` SET 
    `id` = 1224,
    `directory` = 'garrison_alliance_stable_1',
    `name_enus` = 'Garrison - Alliance Stable 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1225;
INSERT INTO `dbc`.`map` SET 
    `id` = 1225,
    `directory` = 'garrison_alliance_stable_2',
    `name_enus` = 'Garrison - Alliance Stable 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1226;
INSERT INTO `dbc`.`map` SET 
    `id` = 1226,
    `directory` = 'garrison_alliance_stable_3',
    `name_enus` = 'Garrison - Alliance Stable 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1227;
INSERT INTO `dbc`.`map` SET 
    `id` = 1227,
    `directory` = 'garrison_alliance_tailoring',
    `name_enus` = 'Garrison - Alliance - Tailoring 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1228;
INSERT INTO `dbc`.`map` SET 
    `id` = 1228,
    `directory` = 'HighmaulOgreRaid',
    `instance_type` = 2,
    `name_enus` = 'Highmaul',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 362,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1110,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1229;
INSERT INTO `dbc`.`map` SET 
    `id` = 1229,
    `directory` = 'garrison_alliance_inn_1',
    `name_enus` = 'Garrison - Alliance - Inn 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1230;
INSERT INTO `dbc`.`map` SET 
    `id` = 1230,
    `directory` = 'garrison_alliance_barn',
    `name_enus` = 'Garrison - Alliance - Barn 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1231;
INSERT INTO `dbc`.`map` SET 
    `id` = 1231,
    `directory` = 'Transport227523',
    `name_enus` = 'Transport: Wavemurder Barge',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1232;
INSERT INTO `dbc`.`map` SET 
    `id` = 1232,
    `directory` = 'GorHordeGarrisonLevel0',
    `instance_type` = 1,
    `name_enus` = 'GOR Horde Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1233;
INSERT INTO `dbc`.`map` SET 
    `id` = 1233,
    `directory` = 'GORHordeGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'GOR Horde Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1234;
INSERT INTO `dbc`.`map` SET 
    `id` = 1234,
    `directory` = 'TALAllianceGarrisonLevel0',
    `instance_type` = 1,
    `name_enus` = 'TAL Alliance Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1235;
INSERT INTO `dbc`.`map` SET 
    `id` = 1235,
    `directory` = 'TALAllianceGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'TAL Alliance Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1236;
INSERT INTO `dbc`.`map` SET 
    `id` = 1236,
    `directory` = 'TALHordeGarrisonLevel0',
    `instance_type` = 1,
    `name_enus` = 'TAL Horde Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1237;
INSERT INTO `dbc`.`map` SET 
    `id` = 1237,
    `directory` = 'TALHordeGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'TAL Horde Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1238;
INSERT INTO `dbc`.`map` SET 
    `id` = 1238,
    `directory` = 'SOAAllianceGarrison0',
    `instance_type` = 1,
    `name_enus` = 'SOA Alliance Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1239;
INSERT INTO `dbc`.`map` SET 
    `id` = 1239,
    `directory` = 'SOAAllianceGarrison3',
    `instance_type` = 1,
    `name_enus` = 'SOA Alliance Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1240;
INSERT INTO `dbc`.`map` SET 
    `id` = 1240,
    `directory` = 'SOAHordeGarrison0',
    `instance_type` = 1,
    `name_enus` = 'SOA Horde Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1241;
INSERT INTO `dbc`.`map` SET 
    `id` = 1241,
    `directory` = 'SOAHordeGarrison3',
    `instance_type` = 1,
    `name_enus` = 'SOA Horde Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1242;
INSERT INTO `dbc`.`map` SET 
    `id` = 1242,
    `directory` = 'NAGAllianceGarrisonLevel0',
    `instance_type` = 1,
    `name_enus` = 'NAG Alliance Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1243;
INSERT INTO `dbc`.`map` SET 
    `id` = 1243,
    `directory` = 'NAGAllianceGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'NAG Alliance Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1244;
INSERT INTO `dbc`.`map` SET 
    `id` = 1244,
    `directory` = 'NAGHordeGarrisonLevel0',
    `instance_type` = 1,
    `name_enus` = 'NAG Horde Garrison Level 0',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1245;
INSERT INTO `dbc`.`map` SET 
    `id` = 1245,
    `directory` = 'NAGHordeGarrisonLevel3',
    `instance_type` = 1,
    `name_enus` = 'NAG Horde Garrison Level 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1247;
INSERT INTO `dbc`.`map` SET 
    `id` = 1247,
    `directory` = 'garrison_alliance_armory1',
    `name_enus` = 'Garrison - Alliance - Armory 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1248;
INSERT INTO `dbc`.`map` SET 
    `id` = 1248,
    `directory` = 'garrison_alliance_barracks1',
    `name_enus` = 'Garrison - Alliance - Barracks 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1249;
INSERT INTO `dbc`.`map` SET 
    `id` = 1249,
    `directory` = 'garrison_alliance_engineering1',
    `name_enus` = 'Garrison - Alliance - Engineering 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1250;
INSERT INTO `dbc`.`map` SET 
    `id` = 1250,
    `directory` = 'alliance_garrison_herb_garden1',
    `name_enus` = 'Alliance - Garrison - Herb Garden 1 (UNUSED)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1251;
INSERT INTO `dbc`.`map` SET 
    `id` = 1251,
    `directory` = 'alliance_garrison_inn1',
    `name_enus` = 'Alliance - Garrison - Inn 1 DONT USE',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1252;
INSERT INTO `dbc`.`map` SET 
    `id` = 1252,
    `directory` = 'garrison_alliance_lumbermill1',
    `name_enus` = 'Garrison - Alliance - Lumbermill 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1253;
INSERT INTO `dbc`.`map` SET 
    `id` = 1253,
    `directory` = 'alliance_garrison_magetower1',
    `name_enus` = 'Garrison - Alliance - Mage Tower 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1254;
INSERT INTO `dbc`.`map` SET 
    `id` = 1254,
    `directory` = 'garrison_alliance_pet_stable1',
    `name_enus` = 'Garrison - Alliance - Sparring Arena 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1255;
INSERT INTO `dbc`.`map` SET 
    `id` = 1255,
    `directory` = 'garrison_alliance_salvageyard1',
    `name_enus` = 'Garrison - Alliance - Salvage Yard 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1256;
INSERT INTO `dbc`.`map` SET 
    `id` = 1256,
    `directory` = 'garrison_alliance_storehouse1',
    `name_enus` = 'Garrison - Alliance - StoreHouse 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1257;
INSERT INTO `dbc`.`map` SET 
    `id` = 1257,
    `directory` = 'garrison_alliance_trading_post1',
    `name_enus` = 'Garrison - Alliance - Trading Post 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1258;
INSERT INTO `dbc`.`map` SET 
    `id` = 1258,
    `directory` = 'garrison_alliance_tailoring1',
    `name_enus` = 'Garrison - Alliance - Tailoring 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1259;
INSERT INTO `dbc`.`map` SET 
    `id` = 1259,
    `directory` = 'garrison_alliance_enchanting',
    `name_enus` = 'Garrison - Alliance - Enchanting 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1260;
INSERT INTO `dbc`.`map` SET 
    `id` = 1260,
    `directory` = 'garrison_alliance_blacksmith1',
    `name_enus` = 'Garrison - Alliance - Blacksmith 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1261;
INSERT INTO `dbc`.`map` SET 
    `id` = 1261,
    `directory` = 'garrison_alliance_plot_small',
    `name_enus` = 'Garrison - Alliance - Plot Small',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1262;
INSERT INTO `dbc`.`map` SET 
    `id` = 1262,
    `directory` = 'garrison_alliance_plot_medium',
    `name_enus` = 'Garrison - Allilance - Plot Medium',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1263;
INSERT INTO `dbc`.`map` SET 
    `id` = 1263,
    `directory` = 'garrison_alliance_plot_large',
    `name_enus` = 'Garrison - Alliance - Plot Large',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1264;
INSERT INTO `dbc`.`map` SET 
    `id` = 1264,
    `directory` = 'Propland-DevOnly',
    `name_enus` = 'Propland - Dev Only',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 21,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1265;
INSERT INTO `dbc`.`map` SET 
    `id` = 1265,
    `directory` = 'TanaanJungleIntro',
    `name_enus` = 'Tanaan Jungle Intro',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1266;
INSERT INTO `dbc`.`map` SET 
    `id` = 1266,
    `directory` = 'CircleofBloodScenario',
    `instance_type` = 5,
    `name_enus` = 'Circle of Blood Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1268;
INSERT INTO `dbc`.`map` SET 
    `id` = 1268,
    `directory` = 'TerongorsConfrontation',
    `instance_type` = 1,
    `name_enus` = 'Teron''gor''s Confrontation',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1270;
INSERT INTO `dbc`.`map` SET 
    `id` = 1270,
    `directory` = 'devland3',
    `name_enus` = 'Development Land 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1273;
INSERT INTO `dbc`.`map` SET 
    `id` = 1273,
    `directory` = 'nagrand_garrison_camp_stable_2',
    `name_enus` = 'Nagrand - Garrison Camp - Stable2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1277;
INSERT INTO `dbc`.`map` SET 
    `id` = 1277,
    `directory` = 'DefenseOfKaraborScenario',
    `instance_type` = 5,
    `name_enus` = 'Defense of Karabor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1278;
INSERT INTO `dbc`.`map` SET 
    `id` = 1278,
    `directory` = 'garrison_horde_barracks1',
    `name_enus` = 'Garrison - Horde - Barracks 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1279;
INSERT INTO `dbc`.`map` SET 
    `id` = 1279,
    `directory` = 'ShaperDungeon',
    `instance_type` = 1,
    `name_enus` = 'The Everbloom',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 370,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1280;
INSERT INTO `dbc`.`map` SET 
    `id` = 1280,
    `directory` = 'TrollRaid2',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Southshore vs. Tarren Mill',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1281;
INSERT INTO `dbc`.`map` SET 
    `id` = 1281,
    `directory` = 'garrison_horde_alchemy1',
    `name_enus` = 'Garrison - Horde - Alchemy 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1282;
INSERT INTO `dbc`.`map` SET 
    `id` = 1282,
    `directory` = 'garrison_horde_armory1',
    `name_enus` = 'Garrison - Horde - Armory 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1283;
INSERT INTO `dbc`.`map` SET 
    `id` = 1283,
    `directory` = 'garrison_horde_barn1',
    `name_enus` = 'Garrison - Horde - Barn 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1284;
INSERT INTO `dbc`.`map` SET 
    `id` = 1284,
    `directory` = 'garrison_horde_blacksmith1',
    `name_enus` = 'Garrison - Horde - Blacksmith 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1285;
INSERT INTO `dbc`.`map` SET 
    `id` = 1285,
    `directory` = 'garrison_horde_enchanting1',
    `name_enus` = 'Garrison - Horde - Enchanting 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1286;
INSERT INTO `dbc`.`map` SET 
    `id` = 1286,
    `directory` = 'garrison_horde_engineering1',
    `name_enus` = 'Garrison - Horde - Engineering 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1287;
INSERT INTO `dbc`.`map` SET 
    `id` = 1287,
    `directory` = 'garrison_horde_inn1',
    `name_enus` = 'Garrison - Horde - Inn 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1288;
INSERT INTO `dbc`.`map` SET 
    `id` = 1288,
    `directory` = 'garrison_horde_inscription1',
    `name_enus` = 'Garrison - Horde - Inscription 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1289;
INSERT INTO `dbc`.`map` SET 
    `id` = 1289,
    `directory` = 'garrison_horde_jewelcrafting1',
    `name_enus` = 'Garrison - Horde - Jewelcrafting 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1290;
INSERT INTO `dbc`.`map` SET 
    `id` = 1290,
    `directory` = 'garrison_horde_leatherworking1',
    `name_enus` = 'Garrison - Horde - Leatherworking 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1291;
INSERT INTO `dbc`.`map` SET 
    `id` = 1291,
    `directory` = 'garrison_horde_lumbermill1',
    `name_enus` = 'Garrison - Horde - Lumbermill 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1292;
INSERT INTO `dbc`.`map` SET 
    `id` = 1292,
    `directory` = 'garrison_horde_magetower1',
    `name_enus` = 'Garrison - Horde - Mage Tower 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1293;
INSERT INTO `dbc`.`map` SET 
    `id` = 1293,
    `directory` = 'garrison_horde_mine1',
    `name_enus` = 'Garrison - Horde - Mine 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1294;
INSERT INTO `dbc`.`map` SET 
    `id` = 1294,
    `directory` = 'garrison_alliance_petstabe',
    `name_enus` = 'Garrison - Horde - Pet Stable 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1295;
INSERT INTO `dbc`.`map` SET 
    `id` = 1295,
    `directory` = 'garrison_horde_salvageyard1',
    `name_enus` = 'Garrison - Horde - Salvage Yard 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1296;
INSERT INTO `dbc`.`map` SET 
    `id` = 1296,
    `directory` = 'garrison_horde_sparringarena1',
    `name_enus` = 'Garrison - Horde - Sparring Arena 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1297;
INSERT INTO `dbc`.`map` SET 
    `id` = 1297,
    `directory` = 'garrison_horde_stable1',
    `name_enus` = 'Garrison - Horde - Stable 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1298;
INSERT INTO `dbc`.`map` SET 
    `id` = 1298,
    `directory` = 'garrison_horde_storehouse1',
    `name_enus` = 'Garrison - Horde Storehouse 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1299;
INSERT INTO `dbc`.`map` SET 
    `id` = 1299,
    `directory` = 'garrison_horde_tailoring1',
    `name_enus` = 'Garrison - Horde - Tailoring 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1300;
INSERT INTO `dbc`.`map` SET 
    `id` = 1300,
    `directory` = 'garrison_horde_tradingpost1',
    `name_enus` = 'Garrison - Horde - Trading Post 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1301;
INSERT INTO `dbc`.`map` SET 
    `id` = 1301,
    `directory` = 'garrison_horde_workshop1',
    `name_enus` = 'Garrison - Horde - Workshop 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1302;
INSERT INTO `dbc`.`map` SET 
    `id` = 1302,
    `directory` = 'garrison_alliance_workshop1',
    `name_enus` = 'Garrison - Alliance - Workshop 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1303;
INSERT INTO `dbc`.`map` SET 
    `id` = 1303,
    `directory` = 'garrison_horde_farm1',
    `name_enus` = 'Garrison - Horde - Farm1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1304;
INSERT INTO `dbc`.`map` SET 
    `id` = 1304,
    `directory` = 'garrison_horde_plot_large',
    `name_enus` = 'Garrison - Horde - Plot Large',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1305;
INSERT INTO `dbc`.`map` SET 
    `id` = 1305,
    `directory` = 'garrison_horde_plot_medium',
    `name_enus` = 'Garrison - Horde - Plot Medium',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1306;
INSERT INTO `dbc`.`map` SET 
    `id` = 1306,
    `directory` = 'garrison_horde_plot_small',
    `name_enus` = 'Garrison - Horde - Plot Small',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1307;
INSERT INTO `dbc`.`map` SET 
    `id` = 1307,
    `directory` = 'TanaanJungleIntroForgePhase',
    `name_enus` = 'Tanaan Jungle Intro - Forge Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1308;
INSERT INTO `dbc`.`map` SET 
    `id` = 1308,
    `directory` = 'garrison_horde_fishing1',
    `name_enus` = 'Garrison - Horde - Fishing 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1309;
INSERT INTO `dbc`.`map` SET 
    `id` = 1309,
    `directory` = 'garrison_alliance_fishing1',
    `name_enus` = 'Garrison - Alliance - Fishing 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1310;
INSERT INTO `dbc`.`map` SET 
    `id` = 1310,
    `directory` = 'Expansion5QAModelMap',
    `name_enus` = 'Expansion 5 QA Model Map',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1311;
INSERT INTO `dbc`.`map` SET 
    `id` = 1311,
    `directory` = 'outdoorGarrisonArenaHorde',
    `name_enus` = 'Outdoor Garrison - Arena - Horde (NEEDS WMO)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1312;
INSERT INTO `dbc`.`map` SET 
    `id` = 1312,
    `directory` = 'outdoorGarrisonArenaAlliance',
    `name_enus` = 'Outdoor Garrison - Arena - Alliance (NEEDS WMO)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1313;
INSERT INTO `dbc`.`map` SET 
    `id` = 1313,
    `directory` = 'outdoorGarrisonLumberMillAlliance',
    `name_enus` = 'Outdoor Garrison - Lumber Mill - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1314;
INSERT INTO `dbc`.`map` SET 
    `id` = 1314,
    `directory` = 'outdoorGarrisonLumberMillHorde',
    `name_enus` = 'Outdoor Garrison - Lumber Mill - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1315;
INSERT INTO `dbc`.`map` SET 
    `id` = 1315,
    `directory` = 'outdoorGarrisonArmoryHorde',
    `name_enus` = 'Outdoor Garrison - Armory - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1316;
INSERT INTO `dbc`.`map` SET 
    `id` = 1316,
    `directory` = 'outdoorGarrisonArmoryAlliance',
    `name_enus` = 'Outdoor Garrison - Armory - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1317;
INSERT INTO `dbc`.`map` SET 
    `id` = 1317,
    `directory` = 'outdoorGarrisonMageTowerHorde',
    `name_enus` = 'Outdoor Garrison - Mage Tower - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1318;
INSERT INTO `dbc`.`map` SET 
    `id` = 1318,
    `directory` = 'outdoorGarrisonMageTowerAlliance',
    `name_enus` = 'Outdoor Garrison - Mage Tower - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1319;
INSERT INTO `dbc`.`map` SET 
    `id` = 1319,
    `directory` = 'outdoorGarrisonStablesHorde',
    `name_enus` = 'Outdoor Garrison - Stables - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1320;
INSERT INTO `dbc`.`map` SET 
    `id` = 1320,
    `directory` = 'outdoorGarrisonStablesAlliance',
    `name_enus` = 'Outdoor Garrison - Stables - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1321;
INSERT INTO `dbc`.`map` SET 
    `id` = 1321,
    `directory` = 'outdoorGarrisonWorkshopHorde',
    `name_enus` = 'Outdoor Garrison - Workshop - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1322;
INSERT INTO `dbc`.`map` SET 
    `id` = 1322,
    `directory` = 'outdoorGarrisonWorkshopAlliance',
    `name_enus` = 'Outdoor Garrison - Workshop - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1323;
INSERT INTO `dbc`.`map` SET 
    `id` = 1323,
    `directory` = 'outdoorGarrisonInnHorde',
    `name_enus` = 'Outdoor Garrison - Inn - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1324;
INSERT INTO `dbc`.`map` SET 
    `id` = 1324,
    `directory` = 'outdoorGarrisonInnAlliance',
    `name_enus` = 'Outdoor Garrison - Inn - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1325;
INSERT INTO `dbc`.`map` SET 
    `id` = 1325,
    `directory` = 'outdoorGarrisonTradingPostHorde',
    `name_enus` = 'Outdoor Garrison - Tradiing Post 1 - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1326;
INSERT INTO `dbc`.`map` SET 
    `id` = 1326,
    `directory` = 'outdoorGarrisonTradingPostAlliance',
    `name_enus` = 'Outdoor Garrison - Tradiing Post - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1327;
INSERT INTO `dbc`.`map` SET 
    `id` = 1327,
    `directory` = 'outdoorGarrisonConstructionPlotHorde',
    `name_enus` = 'Outdoor Garrison - Construction Plot, Medium - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1328;
INSERT INTO `dbc`.`map` SET 
    `id` = 1328,
    `directory` = 'outdoorGarrisonConstructionPlotAlliance',
    `name_enus` = 'Outdoor Garrison - Construction Plot, Medium - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1329;
INSERT INTO `dbc`.`map` SET 
    `id` = 1329,
    `directory` = 'GrommasharScenario',
    `instance_type` = 5,
    `name_enus` = 'Grommashar Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1330;
INSERT INTO `dbc`.`map` SET 
    `id` = 1330,
    `directory` = 'FWHordeGarrisonLeve2new',
    `instance_type` = 1,
    `name_enus` = 'FW Horde Garrison Level 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1331;
INSERT INTO `dbc`.`map` SET 
    `id` = 1331,
    `directory` = 'SMVAllianceGarrisonLevel2new',
    `instance_type` = 1,
    `name_enus` = 'SMV Alliance Garrison Level 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1332;
INSERT INTO `dbc`.`map` SET 
    `id` = 1332,
    `directory` = 'garrison_horde_barracks2',
    `name_enus` = 'Garrison - Horde - Barracks 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1333;
INSERT INTO `dbc`.`map` SET 
    `id` = 1333,
    `directory` = 'garrison_horde_armory2',
    `name_enus` = 'Garrison - Horde - Armory 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1334;
INSERT INTO `dbc`.`map` SET 
    `id` = 1334,
    `directory` = 'garrison_horde_barn2',
    `name_enus` = 'Garrison - Horde - Barn 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1335;
INSERT INTO `dbc`.`map` SET 
    `id` = 1335,
    `directory` = 'garrison_horde_inn2',
    `name_enus` = 'Garrison - Horde - Inn 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1336;
INSERT INTO `dbc`.`map` SET 
    `id` = 1336,
    `directory` = 'garrison_horde_lumbermill2',
    `name_enus` = 'Garrison - Horde - Lumbermill 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1337;
INSERT INTO `dbc`.`map` SET 
    `id` = 1337,
    `directory` = 'garrison_horde_magetower2',
    `name_enus` = 'Garrison - Horde - Mage Tower 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1338;
INSERT INTO `dbc`.`map` SET 
    `id` = 1338,
    `directory` = 'garrison_horde_petstable2',
    `name_enus` = 'Garrison - Horde - Pet Stable 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1339;
INSERT INTO `dbc`.`map` SET 
    `id` = 1339,
    `directory` = 'garrison_horde_stable2',
    `name_enus` = 'Garrison - Horde - Stable 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1340;
INSERT INTO `dbc`.`map` SET 
    `id` = 1340,
    `directory` = 'garrison_horde_tradingpost2',
    `name_enus` = 'Garrison - Horde - Trading Post 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1341;
INSERT INTO `dbc`.`map` SET 
    `id` = 1341,
    `directory` = 'garrison_horde_workshop2',
    `name_enus` = 'Garrison - Horde - Workshop 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1342;
INSERT INTO `dbc`.`map` SET 
    `id` = 1342,
    `directory` = 'garrison_horde_barracks3',
    `name_enus` = 'Garrison - Horde - Barracks 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1343;
INSERT INTO `dbc`.`map` SET 
    `id` = 1343,
    `directory` = 'garrison_horde_armory3',
    `name_enus` = 'Garrison - Horde - Armory 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1344;
INSERT INTO `dbc`.`map` SET 
    `id` = 1344,
    `directory` = 'garrison_horde_barn3',
    `name_enus` = 'Garrison - Horde - Barn 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1345;
INSERT INTO `dbc`.`map` SET 
    `id` = 1345,
    `directory` = 'garrison_horde_inn3',
    `name_enus` = 'Garrison - Horde - Inn 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1346;
INSERT INTO `dbc`.`map` SET 
    `id` = 1346,
    `directory` = 'garrison_horde_magetower3',
    `name_enus` = 'Garrison - Horde - Mage Tower 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1347;
INSERT INTO `dbc`.`map` SET 
    `id` = 1347,
    `directory` = 'garrison_horde_petstable3',
    `name_enus` = 'Garrison - Horde - Pet Stable 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1348;
INSERT INTO `dbc`.`map` SET 
    `id` = 1348,
    `directory` = 'garrison_horde_stable3',
    `name_enus` = 'Garrison - Horde - Stable 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1349;
INSERT INTO `dbc`.`map` SET 
    `id` = 1349,
    `directory` = 'garrison_horde_tradingpost3',
    `name_enus` = 'Garrison - Horde - Trading Post 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1350;
INSERT INTO `dbc`.`map` SET 
    `id` = 1350,
    `directory` = 'garrison_horde_workshop3',
    `name_enus` = 'Garrison - Horde - Workshop 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1351;
INSERT INTO `dbc`.`map` SET 
    `id` = 1351,
    `directory` = 'Garrison_Alliance_Large_Construction',
    `name_enus` = 'Garrison - Alliance - Large - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1352;
INSERT INTO `dbc`.`map` SET 
    `id` = 1352,
    `directory` = 'Garrison_Alliance_Medium_Construction',
    `name_enus` = 'Garrison - Alliance - Medium - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1353;
INSERT INTO `dbc`.`map` SET 
    `id` = 1353,
    `directory` = 'Garrison_Horde_Large_Construction',
    `name_enus` = 'Garrison - Horde - Large - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1354;
INSERT INTO `dbc`.`map` SET 
    `id` = 1354,
    `directory` = 'Garrison_Horde_Medium_Construction',
    `name_enus` = 'Garrison - Horde - Medium - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1358;
INSERT INTO `dbc`.`map` SET 
    `id` = 1358,
    `directory` = 'UpperBlackRockSpire',
    `instance_type` = 1,
    `name_enus` = 'Upper Blackrock Spire',
    `name_flags` = 16712190,
    `area_table_id` = 7307,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 366,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7522.53,
    `corpse_y` = -1233.04,
    `time_override` = -1,
    `expansion` = 5,
    `max_players` = 10;

DELETE FROM `dbc`.`map` WHERE `id` = 1361;
INSERT INTO `dbc`.`map` SET 
    `id` = 1361,
    `directory` = 'garrisonAllianceMageTower2',
    `name_enus` = 'Garrison - Alliance - Mage Tower 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1362;
INSERT INTO `dbc`.`map` SET 
    `id` = 1362,
    `directory` = 'garrisonAllianceMageTower3',
    `name_enus` = 'Garrison - Alliance - Mage Tower 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1363;
INSERT INTO `dbc`.`map` SET 
    `id` = 1363,
    `directory` = 'garrison_horde_mine2',
    `name_enus` = 'Garrison - Horde - Mine 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1364;
INSERT INTO `dbc`.`map` SET 
    `id` = 1364,
    `directory` = 'garrison_horde_mine3',
    `name_enus` = 'Garrison - Horde - Mine 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1367;
INSERT INTO `dbc`.`map` SET 
    `id` = 1367,
    `directory` = 'garrison_alliance_workshop2',
    `name_enus` = 'Garrison - Alliance - Workshop 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1368;
INSERT INTO `dbc`.`map` SET 
    `id` = 1368,
    `directory` = 'garrison_alliance_workshop3',
    `name_enus` = 'Garrison - Alliance - Workshop 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1369;
INSERT INTO `dbc`.`map` SET 
    `id` = 1369,
    `directory` = 'garrison_alliance_lumbermill2',
    `name_enus` = 'Garrison - Alliance - Lumbermill 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1370;
INSERT INTO `dbc`.`map` SET 
    `id` = 1370,
    `directory` = 'garrison_alliance_lumbermill3',
    `name_enus` = 'Garrison - Alliance - Lumbermill 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1371;
INSERT INTO `dbc`.`map` SET 
    `id` = 1371,
    `directory` = 'Garrison_Horde_Small_Construction',
    `name_enus` = 'Garrison - Horde - Small - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1372;
INSERT INTO `dbc`.`map` SET 
    `id` = 1372,
    `directory` = 'Garrison_Alliance_Small_Construction',
    `name_enus` = 'Garrison - Alliance - Small - Construction',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1374;
INSERT INTO `dbc`.`map` SET 
    `id` = 1374,
    `directory` = 'AuchindounQuest',
    `instance_type` = 5,
    `name_enus` = 'Auchindoun Quest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1375;
INSERT INTO `dbc`.`map` SET 
    `id` = 1375,
    `directory` = 'alliance_garrison_alchemy_rank2',
    `name_enus` = 'Garrison - Alliance - Alchemy 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1376;
INSERT INTO `dbc`.`map` SET 
    `id` = 1376,
    `directory` = 'alliance_garrison_alchemy_rank3',
    `name_enus` = 'Garrison - Alliance - Alchemy 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1377;
INSERT INTO `dbc`.`map` SET 
    `id` = 1377,
    `directory` = 'garrison_alliance_blacksmith2',
    `name_enus` = 'Garrison - Alliance - Blacksmith 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1378;
INSERT INTO `dbc`.`map` SET 
    `id` = 1378,
    `directory` = 'garrison_alliance_enchanting2',
    `name_enus` = 'Garrison - Alliance - Enchanting 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1379;
INSERT INTO `dbc`.`map` SET 
    `id` = 1379,
    `directory` = 'garrison_alliance_engineering2',
    `name_enus` = 'Garrison - Alliance - Engineering 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1380;
INSERT INTO `dbc`.`map` SET 
    `id` = 1380,
    `directory` = 'garrison_alliance_inscription2',
    `name_enus` = 'Garrison - Alliance - Inscription 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1381;
INSERT INTO `dbc`.`map` SET 
    `id` = 1381,
    `directory` = 'garrison_alliance_inscription3',
    `name_enus` = 'Garrison - Alliance - Inscription 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1382;
INSERT INTO `dbc`.`map` SET 
    `id` = 1382,
    `directory` = 'garrison_alliance_jewelcrafting2',
    `name_enus` = 'Garrison - Alliance - Jewelcrafting 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1383;
INSERT INTO `dbc`.`map` SET 
    `id` = 1383,
    `directory` = 'garrison_alliance_jewelcrafting3',
    `name_enus` = 'Garrison - Alliance - Jewelcrafting 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1384;
INSERT INTO `dbc`.`map` SET 
    `id` = 1384,
    `directory` = 'garrison_alliance_leatherworking2',
    `name_enus` = 'Garrison - Alliance - Leatherworking 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1385;
INSERT INTO `dbc`.`map` SET 
    `id` = 1385,
    `directory` = 'garrison_alliance_leatherworking3',
    `name_enus` = 'Garrison - Alliance - Leatherworking 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1386;
INSERT INTO `dbc`.`map` SET 
    `id` = 1386,
    `directory` = 'garrison_alliance_tailoring2',
    `name_enus` = 'Garrison - Alliance - Tailoring 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1387;
INSERT INTO `dbc`.`map` SET 
    `id` = 1387,
    `directory` = 'garrison_alliance_storehouse2',
    `name_enus` = 'Garrison - Alliance - StoreHouse 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1388;
INSERT INTO `dbc`.`map` SET 
    `id` = 1388,
    `directory` = 'garrison_alliance_storehouse3',
    `name_enus` = 'Garrison - Alliance - StoreHouse 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1389;
INSERT INTO `dbc`.`map` SET 
    `id` = 1389,
    `directory` = 'garrison_horde_storehouse2',
    `name_enus` = 'Garrison - Horde Storehouse 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1390;
INSERT INTO `dbc`.`map` SET 
    `id` = 1390,
    `directory` = 'garrison_horde_storehouse3',
    `name_enus` = 'Garrison - Horde Storehouse 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1391;
INSERT INTO `dbc`.`map` SET 
    `id` = 1391,
    `directory` = 'garrison_alliance_salvageyard2',
    `name_enus` = 'Garrison - Alliance - Salvage Yard 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1392;
INSERT INTO `dbc`.`map` SET 
    `id` = 1392,
    `directory` = 'garrison_alliance_salvageyard3',
    `name_enus` = 'Garrison - Alliance - Salvage Yard 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1393;
INSERT INTO `dbc`.`map` SET 
    `id` = 1393,
    `directory` = 'garrison_horde_lumbermill3',
    `name_enus` = 'Garrison - Horde - Lumbermill 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1394;
INSERT INTO `dbc`.`map` SET 
    `id` = 1394,
    `directory` = 'garrison_alliance_pet_stable2',
    `name_enus` = 'Garrison - Alliance - Sparring Arena 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1395;
INSERT INTO `dbc`.`map` SET 
    `id` = 1395,
    `directory` = 'garrison_alliance_pet_stable3',
    `name_enus` = 'Garrison - Alliance - Sparring Arena 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1396;
INSERT INTO `dbc`.`map` SET 
    `id` = 1396,
    `directory` = 'garrison_alliance_trading_post2',
    `name_enus` = 'Garrison - Alliance - Trading Post 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1397;
INSERT INTO `dbc`.`map` SET 
    `id` = 1397,
    `directory` = 'garrison_alliance_trading_post3',
    `name_enus` = 'Garrison - Alliance - Trading Post 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1398;
INSERT INTO `dbc`.`map` SET 
    `id` = 1398,
    `directory` = 'garrison_alliance_barn2',
    `name_enus` = 'Garrison - Alliance - Barn 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1399;
INSERT INTO `dbc`.`map` SET 
    `id` = 1399,
    `directory` = 'garrison_alliance_barn3',
    `name_enus` = 'Garrison - Alliance - Barn 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1400;
INSERT INTO `dbc`.`map` SET 
    `id` = 1400,
    `directory` = 'garrison_alliance_inn_2',
    `name_enus` = 'Garrison - Alliance - Inn 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1401;
INSERT INTO `dbc`.`map` SET 
    `id` = 1401,
    `directory` = 'garrison_alliance_inn_3',
    `name_enus` = 'Garrison - Alliance - Inn 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1402;
INSERT INTO `dbc`.`map` SET 
    `id` = 1402,
    `directory` = 'GorgrondFinaleScenario',
    `instance_type` = 5,
    `name_enus` = 'Gorgrond Finale',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1403;
INSERT INTO `dbc`.`map` SET 
    `id` = 1403,
    `directory` = 'garrison_alliance_barracks2',
    `name_enus` = 'Garrison - Alliance - Barracks 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1404;
INSERT INTO `dbc`.`map` SET 
    `id` = 1404,
    `directory` = 'garrison_alliance_barracks3',
    `name_enus` = 'Garrison - Alliance - Barracks 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1405;
INSERT INTO `dbc`.`map` SET 
    `id` = 1405,
    `directory` = 'garrison_alliance_armory2',
    `name_enus` = 'Garrison - Alliance - Armory 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1406;
INSERT INTO `dbc`.`map` SET 
    `id` = 1406,
    `directory` = 'garrison_alliance_armory3',
    `name_enus` = 'Garrison - Alliance - Armory 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1407;
INSERT INTO `dbc`.`map` SET 
    `id` = 1407,
    `directory` = 'GorgrondFinaleScenarioMap',
    `instance_type` = 5,
    `name_enus` = 'zzzOld',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1409;
INSERT INTO `dbc`.`map` SET 
    `id` = 1409,
    `directory` = 'garrison_horde_sparringarena2',
    `name_enus` = 'Garrison - Horde - Sparring Arena 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1410;
INSERT INTO `dbc`.`map` SET 
    `id` = 1410,
    `directory` = 'garrison_horde_sparringarena3',
    `name_enus` = 'Garrison - Horde - Sparring Arena 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1411;
INSERT INTO `dbc`.`map` SET 
    `id` = 1411,
    `directory` = 'garrison_horde_alchemy2',
    `name_enus` = 'Garrison - Horde - Alchemy 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1412;
INSERT INTO `dbc`.`map` SET 
    `id` = 1412,
    `directory` = 'garrison_horde_alchemy3',
    `name_enus` = 'Garrison - Horde - Alchemy 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1413;
INSERT INTO `dbc`.`map` SET 
    `id` = 1413,
    `directory` = 'garrison_horde_blacksmith2',
    `name_enus` = 'Garrison - Horde - Blacksmith 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1414;
INSERT INTO `dbc`.`map` SET 
    `id` = 1414,
    `directory` = 'garrison_horde_blacksmith3',
    `name_enus` = 'Garrison - Horde - Blacksmith 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1415;
INSERT INTO `dbc`.`map` SET 
    `id` = 1415,
    `directory` = 'garrison_horde_enchanting2',
    `name_enus` = 'Garrison - Horde - Enchanting 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1416;
INSERT INTO `dbc`.`map` SET 
    `id` = 1416,
    `directory` = 'garrison_horde_enchanting3',
    `name_enus` = 'Garrison - Horde - Enchanting 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1417;
INSERT INTO `dbc`.`map` SET 
    `id` = 1417,
    `directory` = 'garrison_horde_inscription2',
    `name_enus` = 'Garrison - Horde - Inscription 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1418;
INSERT INTO `dbc`.`map` SET 
    `id` = 1418,
    `directory` = 'garrison_horde_inscription3',
    `name_enus` = 'Garrison - Horde - Inscription 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1419;
INSERT INTO `dbc`.`map` SET 
    `id` = 1419,
    `directory` = 'garrison_horde_leatherworking2',
    `name_enus` = 'Garrison - Horde - Leatherworking 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1420;
INSERT INTO `dbc`.`map` SET 
    `id` = 1420,
    `directory` = 'garrison_horde_leatherworking3',
    `name_enus` = 'Garrison - Horde - Leatherworking 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1421;
INSERT INTO `dbc`.`map` SET 
    `id` = 1421,
    `directory` = 'garrison_horde_jewelcrafting2',
    `name_enus` = 'Garrison - Horde - Jewelcrafting 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1422;
INSERT INTO `dbc`.`map` SET 
    `id` = 1422,
    `directory` = 'garrison_horde_jewelcrafting3',
    `name_enus` = 'Garrison - Horde - Jewelcrafting 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1423;
INSERT INTO `dbc`.`map` SET 
    `id` = 1423,
    `directory` = 'garrison_horde_tailoring2',
    `name_enus` = 'Garrison - Horde - Tailoring 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1424;
INSERT INTO `dbc`.`map` SET 
    `id` = 1424,
    `directory` = 'garrison_horde_tailoring3',
    `name_enus` = 'Garrison - Horde - Tailoring 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1425;
INSERT INTO `dbc`.`map` SET 
    `id` = 1425,
    `directory` = 'garrison_horde_salvageyard2',
    `name_enus` = 'Garrison - Horde - Salvage Yard 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1426;
INSERT INTO `dbc`.`map` SET 
    `id` = 1426,
    `directory` = 'garrison_horde_salvageyard3',
    `name_enus` = 'Garrison - Horde - Salvage Yard 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1427;
INSERT INTO `dbc`.`map` SET 
    `id` = 1427,
    `directory` = 'PattyMackTestGarrisonBldgMap2',
    `name_enus` = 'PattyMack Test Garrison Bld Map2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1429;
INSERT INTO `dbc`.`map` SET 
    `id` = 1429,
    `directory` = 'garrison_horde_engineering2',
    `name_enus` = 'Garrison - Horde - Engineering 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1430;
INSERT INTO `dbc`.`map` SET 
    `id` = 1430,
    `directory` = 'garrison_horde_engineering3',
    `name_enus` = 'Garrison - Horde - Engineering 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1431;
INSERT INTO `dbc`.`map` SET 
    `id` = 1431,
    `directory` = 'SparringArenaLevel3Stadium',
    `instance_type` = 5,
    `name_enus` = 'The Coliseum',
    `name_flags` = 16712190,
    `desc_0_enus` = 'KILL EVERYONE',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'KILL EVERYONE',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1432;
INSERT INTO `dbc`.`map` SET 
    `id` = 1432,
    `directory` = 'garrison_horde_fishing2',
    `name_enus` = 'Garrison - Horde - Fishing 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1433;
INSERT INTO `dbc`.`map` SET 
    `id` = 1433,
    `directory` = 'garrison_horde_fishing3',
    `name_enus` = 'Garrison - Horde - Fishing 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1434;
INSERT INTO `dbc`.`map` SET 
    `id` = 1434,
    `directory` = 'garrison_alliance_fishing2',
    `name_enus` = 'Garrison - Alliance - Fishing 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1435;
INSERT INTO `dbc`.`map` SET 
    `id` = 1435,
    `directory` = 'garrison_alliance_fishing3',
    `name_enus` = 'Garrison - Alliance - Fishing 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1437;
INSERT INTO `dbc`.`map` SET 
    `id` = 1437,
    `directory` = 'garrison_alliance_petstable1',
    `name_enus` = 'Garrison - Alliance - Pet Stable 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1438;
INSERT INTO `dbc`.`map` SET 
    `id` = 1438,
    `directory` = 'garrison_alliance_petstable2',
    `name_enus` = 'Garrison - Alliance - Pet Stable 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1439;
INSERT INTO `dbc`.`map` SET 
    `id` = 1439,
    `directory` = 'garrison_alliance_petstable3',
    `name_enus` = 'Garrison - Alliance - Pet Stable 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1440;
INSERT INTO `dbc`.`map` SET 
    `id` = 1440,
    `directory` = 'garrison_alliance_infirmary1',
    `name_enus` = 'Garrison - Alliance - Infirmary 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1441;
INSERT INTO `dbc`.`map` SET 
    `id` = 1441,
    `directory` = 'garrison_alliance_infirmary2',
    `name_enus` = 'Garrison - Alliance - Infirmary 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1442;
INSERT INTO `dbc`.`map` SET 
    `id` = 1442,
    `directory` = 'garrison_alliance_infirmary3',
    `name_enus` = 'Garrison - Alliance - Infirmary 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1446;
INSERT INTO `dbc`.`map` SET 
    `id` = 1446,
    `directory` = 'outdoorGarrisonConstructionPlotAllianceLarge',
    `name_enus` = 'Outdoor Garrison - Construction Plot, Large - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1447;
INSERT INTO `dbc`.`map` SET 
    `id` = 1447,
    `directory` = 'outdoorGarrisonConstructionPlotHordeLarge',
    `name_enus` = 'Outdoor Garrison - Construction Plot, Large - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1448;
INSERT INTO `dbc`.`map` SET 
    `id` = 1448,
    `directory` = 'HellfireRaid62',
    `instance_type` = 2,
    `name_enus` = 'Hellfire Citadel',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 375,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 360,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1451;
INSERT INTO `dbc`.`map` SET 
    `id` = 1451,
    `directory` = 'TanaanLegionTest',
    `instance_type` = 5,
    `name_enus` = 'Tanaan Legion Test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1453;
INSERT INTO `dbc`.`map` SET 
    `id` = 1453,
    `directory` = 'ScourgeofNorthshire',
    `instance_type` = 5,
    `name_enus` = 'Scourge of Northshire',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1454;
INSERT INTO `dbc`.`map` SET 
    `id` = 1454,
    `directory` = 'ArtifactAshbringerOrigin',
    `instance_type` = 5,
    `name_enus` = 'The Broken Shore (old - delete)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1455;
INSERT INTO `dbc`.`map` SET 
    `id` = 1455,
    `directory` = 'EdgeofRealityMount',
    `instance_type` = 5,
    `name_enus` = 'Edge of Reality',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 364,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1456;
INSERT INTO `dbc`.`map` SET 
    `id` = 1456,
    `directory` = 'NagaDungeon',
    `instance_type` = 1,
    `name_enus` = 'Eye of Azshara',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 416,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1457;
INSERT INTO `dbc`.`map` SET 
    `id` = 1457,
    `directory` = 'FXlDesignLand-DevOnly',
    `instance_type` = 2,
    `name_enus` = 'Test Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1458;
INSERT INTO `dbc`.`map` SET 
    `id` = 1458,
    `directory` = '7_DungeonExteriorNeltharionsLair',
    `instance_type` = 1,
    `name_enus` = 'Neltharion''s Lair',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1459;
INSERT INTO `dbc`.`map` SET 
    `id` = 1459,
    `directory` = 'Transport_The_Iron_Mountain',
    `name_enus` = 'Transport: The Iron Mountain',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1460;
INSERT INTO `dbc`.`map` SET 
    `id` = 1460,
    `directory` = 'BrokenShoreScenario',
    `instance_type` = 5,
    `name_enus` = 'Broken Shore Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1461;
INSERT INTO `dbc`.`map` SET 
    `id` = 1461,
    `directory` = 'AzsunaScenario',
    `instance_type` = 5,
    `name_enus` = 'Azsuna Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1462;
INSERT INTO `dbc`.`map` SET 
    `id` = 1462,
    `directory` = 'IllidansRock',
    `name_enus` = 'Illidans Rock',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1463;
INSERT INTO `dbc`.`map` SET 
    `id` = 1463,
    `directory` = 'HelhiemExteriorArea',
    `name_enus` = 'Helhiem Exterior Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1464;
INSERT INTO `dbc`.`map` SET 
    `id` = 1464,
    `directory` = 'TanaanJungle',
    `name_enus` = 'Tanaan Jungle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1465;
INSERT INTO `dbc`.`map` SET 
    `id` = 1465,
    `directory` = 'TanaanJungleNoHubsPhase',
    `name_enus` = 'Tanaan Jungle - No Hubs Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1466;
INSERT INTO `dbc`.`map` SET 
    `id` = 1466,
    `directory` = 'Emerald_Nightmare_ValSharah_exterior',
    `instance_type` = 1,
    `name_enus` = 'Darkheart Thicket',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 397,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1468;
INSERT INTO `dbc`.`map` SET 
    `id` = 1468,
    `directory` = 'WardenPrison',
    `name_enus` = 'Warden Prison DH Quests',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 398,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1469;
INSERT INTO `dbc`.`map` SET 
    `id` = 1469,
    `directory` = 'MaelstromShaman',
    `name_enus` = 'The Heart of Azeroth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 405,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1470;
INSERT INTO `dbc`.`map` SET 
    `id` = 1470,
    `directory` = 'Legion Dungeon',
    `instance_type` = 1,
    `name_enus` = 'Legion Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1471;
INSERT INTO `dbc`.`map` SET 
    `id` = 1471,
    `directory` = '1466',
    `name_enus` = 'Dungeon Test Map 1466',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1473;
INSERT INTO `dbc`.`map` SET 
    `id` = 1473,
    `directory` = 'GarrisonAllianceShipyard',
    `name_enus` = 'Garrison - Alliance - Shipyard',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1474;
INSERT INTO `dbc`.`map` SET 
    `id` = 1474,
    `directory` = 'GarrisonHordeShipyard',
    `name_enus` = 'Garrison - Horde - Shipyard',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1475;
INSERT INTO `dbc`.`map` SET 
    `id` = 1475,
    `directory` = 'TheMawofNashal',
    `instance_type` = 5,
    `name_enus` = 'The Maw of Nashal',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1476;
INSERT INTO `dbc`.`map` SET 
    `id` = 1476,
    `directory` = 'Transport_The_Maw_of_Nashal',
    `name_enus` = 'Transport: The Maw of Nashal',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1477;
INSERT INTO `dbc`.`map` SET 
    `id` = 1477,
    `directory` = 'Valhallas',
    `instance_type` = 1,
    `name_enus` = 'Halls of Valor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1478;
INSERT INTO `dbc`.`map` SET 
    `id` = 1478,
    `directory` = 'ValSharahTempleofEluneScenario',
    `instance_type` = 5,
    `name_enus` = 'The Temple of Elune',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 182,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1479;
INSERT INTO `dbc`.`map` SET 
    `id` = 1479,
    `directory` = 'WarriorArtifactArea',
    `name_enus` = 'Skyhold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1480;
INSERT INTO `dbc`.`map` SET 
    `id` = 1480,
    `directory` = 'DeathKnightArtifactArea',
    `instance_type` = 5,
    `name_enus` = 'Icecrown Citadel',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1481;
INSERT INTO `dbc`.`map` SET 
    `id` = 1481,
    `directory` = 'legionnexus',
    `name_enus` = 'Mardum',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 378,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1482;
INSERT INTO `dbc`.`map` SET 
    `id` = 1482,
    `directory` = 'GarrisonShipyardAllianceSubmarine',
    `name_enus` = 'Garrison Shipyard - Submarine - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1483;
INSERT INTO `dbc`.`map` SET 
    `id` = 1483,
    `directory` = 'GarrisonShipyardAllianceDestroyer',
    `name_enus` = 'Garrison Shipyard - Destroyer - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1484;
INSERT INTO `dbc`.`map` SET 
    `id` = 1484,
    `directory` = 'GarrisonShipyardTransport',
    `name_enus` = 'Garrison Shipyard - Transport',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1485;
INSERT INTO `dbc`.`map` SET 
    `id` = 1485,
    `directory` = 'GarrisonShipyardDreadnaught',
    `name_enus` = 'Garrison Shipyard - Battleship - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1486;
INSERT INTO `dbc`.`map` SET 
    `id` = 1486,
    `directory` = 'GarrisonShipyardCarrier',
    `name_enus` = 'Garrison Shipyard - Carrier - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1487;
INSERT INTO `dbc`.`map` SET 
    `id` = 1487,
    `directory` = 'GarrisonShipyardHordeSubmarine',
    `name_enus` = 'Garrison Shipyard - Submarine - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1488;
INSERT INTO `dbc`.`map` SET 
    `id` = 1488,
    `directory` = 'GarrisonShipyardHordeDestroyer',
    `name_enus` = 'Garrison Shipyard - Destroyer - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1489;
INSERT INTO `dbc`.`map` SET 
    `id` = 1489,
    `directory` = 'Artifact-PortalWorldAcqusition',
    `instance_type` = 5,
    `name_enus` = 'Niskara',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 408,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1492;
INSERT INTO `dbc`.`map` SET 
    `id` = 1492,
    `directory` = 'Helheim',
    `instance_type` = 1,
    `name_enus` = 'Maw of Souls',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 399,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1493;
INSERT INTO `dbc`.`map` SET 
    `id` = 1493,
    `directory` = 'WardenPrisonDungeon',
    `instance_type` = 1,
    `name_enus` = 'Vault of the Wardens',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 398,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1494;
INSERT INTO `dbc`.`map` SET 
    `id` = 1494,
    `directory` = 'AcquisitionVioletHold',
    `instance_type` = 5,
    `name_enus` = 'The Violet Hold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 420,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1495;
INSERT INTO `dbc`.`map` SET 
    `id` = 1495,
    `directory` = 'AcquisitionWarriorProt',
    `instance_type` = 5,
    `name_enus` = 'Shield''s Rest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1496;
INSERT INTO `dbc`.`map` SET 
    `id` = 1496,
    `directory` = 'GarrisonShipyardCarrierAlliance',
    `name_enus` = 'Garrison Shipyard - Carrier - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1497;
INSERT INTO `dbc`.`map` SET 
    `id` = 1497,
    `directory` = 'GarrisonShipyardGalleonHorde',
    `name_enus` = 'Garrison Shipyard - Battleship - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1498;
INSERT INTO `dbc`.`map` SET 
    `id` = 1498,
    `directory` = 'AcquisitionHavoc',
    `instance_type` = 5,
    `name_enus` = 'Felsoul Hold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1499;
INSERT INTO `dbc`.`map` SET 
    `id` = 1499,
    `directory` = 'Artifact-Warrior Fury Acquisition',
    `instance_type` = 1,
    `name_enus` = 'oldArtifact - Warrior Fury Acquisition',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1500;
INSERT INTO `dbc`.`map` SET 
    `id` = 1500,
    `directory` = 'ArtifactPaladinRetAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Broken Shore',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1501;
INSERT INTO `dbc`.`map` SET 
    `id` = 1501,
    `directory` = 'BlackRookHoldDungeon',
    `instance_type` = 1,
    `name_enus` = 'Black Rook Hold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1502;
INSERT INTO `dbc`.`map` SET 
    `id` = 1502,
    `directory` = 'DalaranUnderbelly',
    `name_enus` = 'Dalaran Underbelly',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1503;
INSERT INTO `dbc`.`map` SET 
    `id` = 1503,
    `directory` = 'ArtifactShamanElementalAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Deepholm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 268,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1504;
INSERT INTO `dbc`.`map` SET 
    `id` = 1504,
    `directory` = 'BlackrookHoldArena',
    `instance_type` = 4,
    `name_enus` = 'Black Rook Hold Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 413,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1505;
INSERT INTO `dbc`.`map` SET 
    `id` = 1505,
    `directory` = 'NagrandArena2',
    `instance_type` = 4,
    `name_enus` = 'Nagrand Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 421,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1509;
INSERT INTO `dbc`.`map` SET 
    `id` = 1509,
    `directory` = 'BloodtotemCavernFelPhase',
    `name_enus` = 'Bloodtotem Cavern - Fel Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1510;
INSERT INTO `dbc`.`map` SET 
    `id` = 1510,
    `directory` = 'BloodtotemCavernTaurenPhase',
    `name_enus` = 'Bloodtotem Cavern - Tauren Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1511;
INSERT INTO `dbc`.`map` SET 
    `id` = 1511,
    `directory` = 'Artifact-WarriorFuryAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Tideskorn Harbor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1512;
INSERT INTO `dbc`.`map` SET 
    `id` = 1512,
    `directory` = 'Artifact-PriestHunterOrderHall',
    `name_enus` = 'Netherlight Temple',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 406,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1513;
INSERT INTO `dbc`.`map` SET 
    `id` = 1513,
    `directory` = 'Artifact-MageOrderHall',
    `name_enus` = 'Hall of the Guardian',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 410,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1514;
INSERT INTO `dbc`.`map` SET 
    `id` = 1514,
    `directory` = 'Artifact-MonkOrderHall',
    `name_enus` = 'The Wandering Isle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 393,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1515;
INSERT INTO `dbc`.`map` SET 
    `id` = 1515,
    `directory` = 'HulnHighmountain',
    `name_enus` = 'Huln''s War',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1516;
INSERT INTO `dbc`.`map` SET 
    `id` = 1516,
    `directory` = 'SuramarCatacombsDungeon',
    `instance_type` = 1,
    `name_enus` = 'The Arcway',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 402,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1517;
INSERT INTO `dbc`.`map` SET 
    `id` = 1517,
    `directory` = 'StormheimPrescenarioWindrunner',
    `name_enus` = 'Stormheim Prescenario Windrunner',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1518;
INSERT INTO `dbc`.`map` SET 
    `id` = 1518,
    `directory` = 'StormheimPrescenarioSkyfire',
    `name_enus` = 'Stormheim Prescenario Skyfire',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1519;
INSERT INTO `dbc`.`map` SET 
    `id` = 1519,
    `directory` = 'ArtifactsDemonHunterOrderHall',
    `name_enus` = 'The Fel Hammer',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1520;
INSERT INTO `dbc`.`map` SET 
    `id` = 1520,
    `directory` = 'NightmareRaid',
    `instance_type` = 2,
    `name_enus` = 'The Emerald Nightmare',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 400,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1522;
INSERT INTO `dbc`.`map` SET 
    `id` = 1522,
    `directory` = 'ArtifactWarlockOrderHallScenario',
    `instance_type` = 5,
    `name_enus` = 'Dreadscar Rift',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1523;
INSERT INTO `dbc`.`map` SET 
    `id` = 1523,
    `directory` = 'MardumScenario',
    `instance_type` = 5,
    `name_enus` = 'Defense of the Fel Hammer Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1526;
INSERT INTO `dbc`.`map` SET 
    `id` = 1526,
    `directory` = 'Artifact-WhiteTigerTempleAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Temple of the White Tiger',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 334,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1527;
INSERT INTO `dbc`.`map` SET 
    `id` = 1527,
    `directory` = 'HighMountain',
    `name_enus` = 'High Mountain Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1528;
INSERT INTO `dbc`.`map` SET 
    `id` = 1528,
    `directory` = 'Artifact-SkywallAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Skywall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -11522.5,
    `corpse_y` = -2317.93,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1529;
INSERT INTO `dbc`.`map` SET 
    `id` = 1529,
    `directory` = 'KarazhanScenario',
    `instance_type` = 5,
    `name_enus` = 'Karazhan',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1530;
INSERT INTO `dbc`.`map` SET 
    `id` = 1530,
    `directory` = 'SuramarRaid',
    `instance_type` = 2,
    `name_enus` = 'The Nighthold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 412,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1532;
INSERT INTO `dbc`.`map` SET 
    `id` = 1532,
    `directory` = 'HighMountainMesa',
    `name_enus` = 'High Mountain Mesa Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1533;
INSERT INTO `dbc`.`map` SET 
    `id` = 1533,
    `directory` = 'Artifact-KarazhanAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Karazhan Catacombs',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1534;
INSERT INTO `dbc`.`map` SET 
    `id` = 1534,
    `directory` = 'Artifact-DefenseofMoongladeScenario',
    `instance_type` = 5,
    `name_enus` = 'Moonglade',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1535;
INSERT INTO `dbc`.`map` SET 
    `id` = 1535,
    `directory` = 'DefenseofMoongladeScenario',
    `instance_type` = 1,
    `name_enus` = 'Moonglade',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1536;
INSERT INTO `dbc`.`map` SET 
    `id` = 1536,
    `directory` = 'UrsocsLairScenario',
    `instance_type` = 5,
    `name_enus` = 'Ursocs Lair',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 397,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1537;
INSERT INTO `dbc`.`map` SET 
    `id` = 1537,
    `directory` = 'BoostExperience',
    `instance_type` = 5,
    `name_enus` = 'zzOLD - Boost Experience',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1538;
INSERT INTO `dbc`.`map` SET 
    `id` = 1538,
    `directory` = 'Karazhan Scenario',
    `name_enus` = 'test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1539;
INSERT INTO `dbc`.`map` SET 
    `id` = 1539,
    `directory` = 'Artifact-AcquisitionArmsHolyShadow',
    `instance_type` = 5,
    `name_enus` = 'Tirisfal Glades',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1540;
INSERT INTO `dbc`.`map` SET 
    `id` = 1540,
    `directory` = 'Artifact-Dreamway',
    `name_enus` = 'Emerald Dreamway',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 418,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1541;
INSERT INTO `dbc`.`map` SET 
    `id` = 1541,
    `directory` = 'Artifact-TerraceofEndlessSpringAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Terrace of Endless Spring',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 321,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1544;
INSERT INTO `dbc`.`map` SET 
    `id` = 1544,
    `directory` = 'LegionVioletHoldDungeon',
    `instance_type` = 1,
    `name_enus` = 'Assault on Violet Hold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 420,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1545;
INSERT INTO `dbc`.`map` SET 
    `id` = 1545,
    `directory` = 'Artifact-Acquisition-CombatResto',
    `instance_type` = 5,
    `name_enus` = 'Azsuna',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1547;
INSERT INTO `dbc`.`map` SET 
    `id` = 1547,
    `directory` = 'Artifacts-CombatAcquisitionShip',
    `name_enus` = 'Artifact - Combat - Acquisition Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1549;
INSERT INTO `dbc`.`map` SET 
    `id` = 1549,
    `directory` = 'TechTestSeamlessWorldTransitionA',
    `name_enus` = 'Tech Test - Seamless World Transition A',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1550;
INSERT INTO `dbc`.`map` SET 
    `id` = 1550,
    `directory` = 'TechTestSeamlessWorldTransitionB',
    `name_enus` = 'Tech Test - Seamless World Transition B',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1552;
INSERT INTO `dbc`.`map` SET 
    `id` = 1552,
    `directory` = 'ValsharahArena',
    `instance_type` = 4,
    `name_enus` = 'Ashamane''s Fall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 417,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1553;
INSERT INTO `dbc`.`map` SET 
    `id` = 1553,
    `directory` = 'Artifact-Acquisition-Underlight',
    `instance_type` = 5,
    `name_enus` = 'Gloaming Reef',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1554;
INSERT INTO `dbc`.`map` SET 
    `id` = 1554,
    `directory` = 'BoostExperience2',
    `instance_type` = 1,
    `name_enus` = '7.0 Boost Experience - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1555;
INSERT INTO `dbc`.`map` SET 
    `id` = 1555,
    `directory` = 'TransportBoostExperienceAllianceGunship',
    `name_enus` = 'zzOLD - Transport: Boost Experience - Alliance Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1556;
INSERT INTO `dbc`.`map` SET 
    `id` = 1556,
    `directory` = 'TransportBoostExperienceHordeGunship',
    `name_enus` = 'zzOLD - Transport: Boost Experience - Horde Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1557;
INSERT INTO `dbc`.`map` SET 
    `id` = 1557,
    `directory` = 'BoostExperience2Horde',
    `instance_type` = 1,
    `name_enus` = '7.0 Boost Experience - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1559;
INSERT INTO `dbc`.`map` SET 
    `id` = 1559,
    `directory` = 'TransportBoostExperienceHordeGunship2',
    `name_enus` = '7.0 Transport: Boost Experience - Horde Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1560;
INSERT INTO `dbc`.`map` SET 
    `id` = 1560,
    `directory` = 'TransportBoostExperienceAllianceGunship2',
    `name_enus` = '7.0 Transport: Boost Experience - Alliance Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1561;
INSERT INTO `dbc`.`map` SET 
    `id` = 1561,
    `directory` = 'TechTestCosmeticParentPerformance',
    `name_enus` = 'Tech Test - Cosmetic Parent Performance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1571;
INSERT INTO `dbc`.`map` SET 
    `id` = 1571,
    `directory` = 'SuramarCityDungeon',
    `instance_type` = 1,
    `name_enus` = 'Court of Stars',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 419,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1572;
INSERT INTO `dbc`.`map` SET 
    `id` = 1572,
    `directory` = 'MaelstromShamanHubIntroScenario',
    `instance_type` = 5,
    `name_enus` = 'The Maelstrom',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1579;
INSERT INTO `dbc`.`map` SET 
    `id` = 1579,
    `directory` = 'UdluarScenario',
    `instance_type` = 5,
    `name_enus` = 'Ulduar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1580;
INSERT INTO `dbc`.`map` SET 
    `id` = 1580,
    `directory` = 'MaelstromTitanScenario',
    `instance_type` = 5,
    `name_enus` = 'The Maelstrom',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1582;
INSERT INTO `dbc`.`map` SET 
    `id` = 1582,
    `directory` = 'Artifact�DalaranVaultAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Delete',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1583;
INSERT INTO `dbc`.`map` SET 
    `id` = 1583,
    `directory` = 'Artifact-DalaranVaultAcquisition',
    `instance_type` = 5,
    `name_enus` = 'Nexus Vault',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1584;
INSERT INTO `dbc`.`map` SET 
    `id` = 1584,
    `directory` = 'JulienTestLand-DevOnly',
    `name_enus` = 'Julien Test Land',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1586;
INSERT INTO `dbc`.`map` SET 
    `id` = 1586,
    `directory` = 'AssualtOnStormwind',
    `name_enus` = 'Assault on Stormwind',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1020,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1588;
INSERT INTO `dbc`.`map` SET 
    `id` = 1588,
    `directory` = 'DevMapA',
    `name_enus` = 'Dev Map - A - Jared Coulston',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1589;
INSERT INTO `dbc`.`map` SET 
    `id` = 1589,
    `directory` = 'DevMapB',
    `name_enus` = 'Dev Map - B - Nathaniel Chapman',
    `name_flags` = 16712190,
    `desc_0_enus` = '- NO DESCRIPTION -',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = '- NO DESCRIPTION -',
    `desc_1_flags` = 16712190,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1590;
INSERT INTO `dbc`.`map` SET 
    `id` = 1590,
    `directory` = 'DevMapC',
    `name_enus` = 'Dev Map - C - Julien Tremblay',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1591;
INSERT INTO `dbc`.`map` SET 
    `id` = 1591,
    `directory` = 'DevMapD',
    `name_enus` = 'Dev Map - D - PotT',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1592;
INSERT INTO `dbc`.`map` SET 
    `id` = 1592,
    `directory` = 'DevMapE',
    `name_enus` = 'Dev Map - E',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1593;
INSERT INTO `dbc`.`map` SET 
    `id` = 1593,
    `directory` = 'DevMapF',
    `name_enus` = 'Dev Map - F',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1594;
INSERT INTO `dbc`.`map` SET 
    `id` = 1594,
    `directory` = 'DevMapG',
    `instance_type` = 1,
    `name_enus` = 'The MOTHERLODE!!',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 120,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1599;
INSERT INTO `dbc`.`map` SET 
    `id` = 1599,
    `directory` = 'ArtifactRestoAcqusition',
    `instance_type` = 5,
    `name_enus` = 'Nordrassil',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1600;
INSERT INTO `dbc`.`map` SET 
    `id` = 1600,
    `directory` = 'ArtifactThroneoftheTides',
    `instance_type` = 5,
    `name_enus` = 'Throne of the Tides',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1602;
INSERT INTO `dbc`.`map` SET 
    `id` = 1602,
    `directory` = 'SkywallDungeon_OrderHall',
    `name_enus` = 'Artifact - The Vortex Pinnacle - Shaman Order Hall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -11522.5,
    `corpse_y` = -2317.93,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1603;
INSERT INTO `dbc`.`map` SET 
    `id` = 1603,
    `directory` = 'AbyssalMaw_Interior_Scenario',
    `instance_type` = 5,
    `name_enus` = 'Throne of the Tides Scenario(DELETE)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -5585.87,
    `corpse_y` = 5401.65,
    `time_override` = -1,
    `expansion` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1604;
INSERT INTO `dbc`.`map` SET 
    `id` = 1604,
    `directory` = 'Artifact-PortalWorldNaskora',
    `name_enus` = 'Artifact - Order Campaign - Portal World Niskara',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 408,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1605;
INSERT INTO `dbc`.`map` SET 
    `id` = 1605,
    `directory` = 'FirelandsArtifact',
    `name_enus` = 'Firelands_Artifact',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1607;
INSERT INTO `dbc`.`map` SET 
    `id` = 1607,
    `directory` = 'ArtifactAcquisitionSubtlety',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Acquisition - Subtlety',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 378,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1608;
INSERT INTO `dbc`.`map` SET 
    `id` = 1608,
    `directory` = 'Hyjal Instance',
    `name_enus` = 'Hyjal War of the Ancients Quest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1609;
INSERT INTO `dbc`.`map` SET 
    `id` = 1609,
    `directory` = 'AcquisitionTempleofstorms',
    `instance_type` = 5,
    `name_enus` = 'Temple of Storms',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1610;
INSERT INTO `dbc`.`map` SET 
    `id` = 1610,
    `directory` = 'Artifact-SerenityLegionScenario',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Serenity Legion Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1611;
INSERT INTO `dbc`.`map` SET 
    `id` = 1611,
    `directory` = 'DeathKnightCampaign-LightsHopeChapel',
    `instance_type` = 5,
    `name_enus` = 'Death Knight Campaign - Light''s Hope Chapel',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1612;
INSERT INTO `dbc`.`map` SET 
    `id` = 1612,
    `directory` = 'TheRuinsofFalanaar',
    `instance_type` = 5,
    `name_enus` = 'The Ruins of Falanaar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 417,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1616;
INSERT INTO `dbc`.`map` SET 
    `id` = 1616,
    `directory` = 'Faronaar',
    `instance_type` = 5,
    `name_enus` = 'Faronaar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1617;
INSERT INTO `dbc`.`map` SET 
    `id` = 1617,
    `directory` = 'DeathKnightCampaign-Undercity',
    `instance_type` = 5,
    `name_enus` = 'Death Knight Campaign - Undercity',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1618;
INSERT INTO `dbc`.`map` SET 
    `id` = 1618,
    `directory` = 'DeathKnightCampaign-ScarletMonastery',
    `name_enus` = 'Death Knight Campaign - Scarlet Monastery',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1620;
INSERT INTO `dbc`.`map` SET 
    `id` = 1620,
    `directory` = 'ArtifactStormwind',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Stormwind',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1621;
INSERT INTO `dbc`.`map` SET 
    `id` = 1621,
    `directory` = 'BlackTemple-Legion',
    `instance_type` = 5,
    `name_enus` = 'Black Temple - Legion',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1622;
INSERT INTO `dbc`.`map` SET 
    `id` = 1622,
    `directory` = 'IllidanTemp',
    `instance_type` = 5,
    `name_enus` = 'Telogrus Rift Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1623;
INSERT INTO `dbc`.`map` SET 
    `id` = 1623,
    `directory` = 'MageCampaign-TheOculus',
    `instance_type` = 5,
    `name_enus` = 'Mage Campaign - The Oculus',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1624;
INSERT INTO `dbc`.`map` SET 
    `id` = 1624,
    `directory` = 'BattleofExodar',
    `instance_type` = 5,
    `name_enus` = 'Battle of Exodar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1625;
INSERT INTO `dbc`.`map` SET 
    `id` = 1625,
    `directory` = 'TrialoftheSerpent',
    `instance_type` = 5,
    `name_enus` = 'Trial of the Serpent',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1626;
INSERT INTO `dbc`.`map` SET 
    `id` = 1626,
    `directory` = 'TheCollapseSuramarScenario',
    `instance_type` = 5,
    `name_enus` = 'The Collapse - Suramar Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1627;
INSERT INTO `dbc`.`map` SET 
    `id` = 1627,
    `directory` = 'FelHammerDHScenario',
    `name_enus` = 'Fel Hammer DH Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1628;
INSERT INTO `dbc`.`map` SET 
    `id` = 1628,
    `directory` = 'Transport251513',
    `name_enus` = 'Transport: Alliance Battleship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1629;
INSERT INTO `dbc`.`map` SET 
    `id` = 1629,
    `directory` = 'NetherlightTemplePrison',
    `instance_type` = 5,
    `name_enus` = 'Netherlight Temple',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 406,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1630;
INSERT INTO `dbc`.`map` SET 
    `id` = 1630,
    `directory` = 'TolBarad1',
    `instance_type` = 5,
    `name_enus` = 'Tol Barad',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 265,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1632;
INSERT INTO `dbc`.`map` SET 
    `id` = 1632,
    `directory` = 'TheArcwaySuramarScenario',
    `instance_type` = 5,
    `name_enus` = 'The Arcway - Suramar Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 402,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1637;
INSERT INTO `dbc`.`map` SET 
    `id` = 1637,
    `directory` = 'TransportAllianceShipPhaseableMO',
    `name_enus` = 'Transport: Alliance Ship PhaseableMO',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1638;
INSERT INTO `dbc`.`map` SET 
    `id` = 1638,
    `directory` = 'TransportHordeShipPhaseableMO',
    `name_enus` = 'Transport: Horde Ship PhaseableMO',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1639;
INSERT INTO `dbc`.`map` SET 
    `id` = 1639,
    `directory` = 'TransportKvaldirShipPhaseableMO',
    `name_enus` = 'Transport: Kvaldir Ship PhaseableMO',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1642;
INSERT INTO `dbc`.`map` SET 
    `id` = 1642,
    `directory` = 'Zandalar',
    `name_enus` = 'Zandalar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 552,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1643;
INSERT INTO `dbc`.`map` SET 
    `id` = 1643,
    `directory` = 'KulTiras',
    `name_enus` = 'Kul Tiras',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 551,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1644;
INSERT INTO `dbc`.`map` SET 
    `id` = 1644,
    `directory` = 'PlunderIsle',
    `name_enus` = 'Plunder Isle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1645;
INSERT INTO `dbc`.`map` SET 
    `id` = 1645,
    `directory` = 'Islands',
    `instance_type` = 5,
    `name_enus` = 'Crescent Isle (Islands Prototype)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1646;
INSERT INTO `dbc`.`map` SET 
    `id` = 1646,
    `directory` = 'BlackRookSenario',
    `instance_type` = 5,
    `name_enus` = 'Black Rook Hold [Scenario]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1647;
INSERT INTO `dbc`.`map` SET 
    `id` = 1647,
    `directory` = 'VoljinsFuneralPyre',
    `name_enus` = 'Vol''jin''s Funeral Pyre',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1648;
INSERT INTO `dbc`.`map` SET 
    `id` = 1648,
    `directory` = 'Helhiem2',
    `instance_type` = 2,
    `name_enus` = 'Trial of Valor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 422,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1649;
INSERT INTO `dbc`.`map` SET 
    `id` = 1649,
    `directory` = 'Transport254124',
    `name_enus` = 'Transport: Horde Battleship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1650;
INSERT INTO `dbc`.`map` SET 
    `id` = 1650,
    `directory` = 'Acherus',
    `name_enus` = 'Legion Command Ship Transport',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1651;
INSERT INTO `dbc`.`map` SET 
    `id` = 1651,
    `directory` = 'Karazahn1',
    `instance_type` = 1,
    `name_enus` = 'Return to Karazhan',
    `name_flags` = 16712190,
    `area_table_id` = 3457,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 423,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -11110.4,
    `corpse_y` = -2004.06,
    `time_override` = -1,
    `expansion` = 6,
    `max_players` = 10;

DELETE FROM `dbc`.`map` WHERE `id` = 1653;
INSERT INTO `dbc`.`map` SET 
    `id` = 1653,
    `directory` = 'LightsHeart',
    `instance_type` = 5,
    `name_enus` = 'Great Dark Beyond',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1655;
INSERT INTO `dbc`.`map` SET 
    `id` = 1655,
    `directory` = '8DevLand',
    `name_enus` = '8.0 Dev Land',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 146,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1657;
INSERT INTO `dbc`.`map` SET 
    `id` = 1657,
    `directory` = 'BladesEdgeArena2',
    `name_enus` = 'zzOldBlade''s Edge Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 218,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1658;
INSERT INTO `dbc`.`map` SET 
    `id` = 1658,
    `directory` = 'EnvironmentLandDevOnly',
    `name_enus` = 'Environment Art Land - Dev Only',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1661;
INSERT INTO `dbc`.`map` SET 
    `id` = 1661,
    `directory` = 'Gnoll Revolution',
    `name_enus` = '[DEV] Demo Map',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 191,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1662;
INSERT INTO `dbc`.`map` SET 
    `id` = 1662,
    `directory` = 'SuramarEndScenario',
    `instance_type` = 5,
    `name_enus` = 'Suramar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1663;
INSERT INTO `dbc`.`map` SET 
    `id` = 1663,
    `directory` = 'DungeonBlockout',
    `instance_type` = 1,
    `name_enus` = 'Dungeon Blockout',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1666;
INSERT INTO `dbc`.`map` SET 
    `id` = 1666,
    `directory` = 'BrokenShoreIntro',
    `instance_type` = 5,
    `name_enus` = 'The Assault on Broken Shore',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1667;
INSERT INTO `dbc`.`map` SET 
    `id` = 1667,
    `directory` = 'LegionShipVertical',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Vertical',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1668;
INSERT INTO `dbc`.`map` SET 
    `id` = 1668,
    `directory` = 'LegionShipHorizontal',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Horizontal',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1669;
INSERT INTO `dbc`.`map` SET 
    `id` = 1669,
    `directory` = 'Argus 1',
    `name_enus` = 'Argus',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 432,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1670;
INSERT INTO `dbc`.`map` SET 
    `id` = 1670,
    `directory` = 'BrokenshorePristine',
    `name_enus` = 'Broken Shore (Delete)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1671;
INSERT INTO `dbc`.`map` SET 
    `id` = 1671,
    `directory` = 'BrokenShorePrepatch',
    `name_enus` = 'Broken Shore - Prepatch 7.2 (Backup)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1672;
INSERT INTO `dbc`.`map` SET 
    `id` = 1672,
    `directory` = 'bladesedgearena2b',
    `instance_type` = 4,
    `name_enus` = 'Blade''s Edge Arena',
    `name_flags` = 16712190,
    `area_table_id` = 3702,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 424,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1673;
INSERT INTO `dbc`.`map` SET 
    `id` = 1673,
    `directory` = 'EyeofEternityScenario',
    `instance_type` = 5,
    `name_enus` = 'The Eye of Eternity - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1675;
INSERT INTO `dbc`.`map` SET 
    `id` = 1675,
    `directory` = 'WinterAB',
    `name_enus` = 'Winter AB_old',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1676;
INSERT INTO `dbc`.`map` SET 
    `id` = 1676,
    `directory` = 'TombofSargerasRaid',
    `instance_type` = 2,
    `name_enus` = 'Tomb of Sargeras',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 427,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1677;
INSERT INTO `dbc`.`map` SET 
    `id` = 1677,
    `directory` = 'TombofSargerasDeungeon',
    `instance_type` = 1,
    `name_enus` = 'Cathedral of Eternal Night',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 426,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1678;
INSERT INTO `dbc`.`map` SET 
    `id` = 1678,
    `directory` = 'ABPhase1',
    `name_enus` = 'AB Phase 1',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1679;
INSERT INTO `dbc`.`map` SET 
    `id` = 1679,
    `directory` = 'ABPhase2',
    `name_enus` = 'AB Phase 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1680;
INSERT INTO `dbc`.`map` SET 
    `id` = 1680,
    `directory` = 'ABPhase3',
    `name_enus` = 'AB Phase 3',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1681;
INSERT INTO `dbc`.`map` SET 
    `id` = 1681,
    `directory` = 'ABWinter',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Arathi Basin Winter',
    `name_flags` = 16712190,
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 425,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1682;
INSERT INTO `dbc`.`map` SET 
    `id` = 1682,
    `directory` = 'ArtifactsDemonHunterOrderHallPhase',
    `name_enus` = 'The Fel Hammer Terrain Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1683;
INSERT INTO `dbc`.`map` SET 
    `id` = 1683,
    `directory` = 'ArtifactGnomeregan',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Gnomeregan',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 193,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1684;
INSERT INTO `dbc`.`map` SET 
    `id` = 1684,
    `directory` = 'dreadscarriftwarlockplatform',
    `instance_type` = 5,
    `name_enus` = 'Dread Scar Rift - Warlock Scenario Platform',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1685;
INSERT INTO `dbc`.`map` SET 
    `id` = 1685,
    `directory` = 'AITestMap8',
    `name_enus` = 'AI Test Map 8',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1686;
INSERT INTO `dbc`.`map` SET 
    `id` = 1686,
    `directory` = 'AITestMap8b',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'AI Test - Arathi Basin',
    `name_flags` = 16712190,
    `area_table_id` = 8526,
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1687;
INSERT INTO `dbc`.`map` SET 
    `id` = 1687,
    `directory` = 'WailingCavernsPetBattle',
    `instance_type` = 5,
    `name_enus` = 'Wailing Caverns',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 143,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1688;
INSERT INTO `dbc`.`map` SET 
    `id` = 1688,
    `directory` = 'DeadminesPetBattle',
    `instance_type` = 5,
    `name_enus` = 'Deadmines',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 142,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1689;
INSERT INTO `dbc`.`map` SET 
    `id` = 1689,
    `directory` = 'EyeofEternityMageClassMount',
    `instance_type` = 5,
    `name_enus` = 'The Eye of Eternity - Mage Class Mount',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1690;
INSERT INTO `dbc`.`map` SET 
    `id` = 1690,
    `directory` = 'SnakeCave',
    `name_enus` = 'Snake Cave',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1691;
INSERT INTO `dbc`.`map` SET 
    `id` = 1691,
    `directory` = 'CookingImpossible',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Cooking: Impossible',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1692;
INSERT INTO `dbc`.`map` SET 
    `id` = 1692,
    `directory` = 'PitofSaronDeathKnight',
    `name_enus` = 'Pit of Saron - Death Knight Campaign',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 252,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `corpse_x` = 5592.06,
    `corpse_y` = 2010.27,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1693;
INSERT INTO `dbc`.`map` SET 
    `id` = 1693,
    `directory` = 'MardumScenarioClientScene',
    `instance_type` = 5,
    `name_enus` = 'Stormstout Brewery - Monk Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 318,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1694;
INSERT INTO `dbc`.`map` SET 
    `id` = 1694,
    `directory` = 'GnomereganPetBattle',
    `instance_type` = 5,
    `name_enus` = 'Gnomeregan',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 193,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1695;
INSERT INTO `dbc`.`map` SET 
    `id` = 1695,
    `directory` = 'BrokenShoreBattleshipFinale',
    `instance_type` = 5,
    `name_enus` = 'Battleship: Ruin',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1696;
INSERT INTO `dbc`.`map` SET 
    `id` = 1696,
    `directory` = 'LegionCommandCenter',
    `name_enus` = 'Legion - Command Center',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1697;
INSERT INTO `dbc`.`map` SET 
    `id` = 1697,
    `directory` = 'LegionSpiderCave',
    `name_enus` = 'Legion - Legion Spider Cave',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1698;
INSERT INTO `dbc`.`map` SET 
    `id` = 1698,
    `directory` = 'ArtifactAcquisitionTank',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Acquisition - Tank',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1699;
INSERT INTO `dbc`.`map` SET 
    `id` = 1699,
    `directory` = 'LegionFelCave',
    `name_enus` = 'Legion - Legion Fel Cave',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1700;
INSERT INTO `dbc`.`map` SET 
    `id` = 1700,
    `directory` = 'LegionFelFirenovaArea',
    `name_enus` = 'Legion - Legion Fel Firenova Area',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1701;
INSERT INTO `dbc`.`map` SET 
    `id` = 1701,
    `directory` = 'LegionBarracks',
    `name_enus` = 'Legion - Legion Barracks',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1702;
INSERT INTO `dbc`.`map` SET 
    `id` = 1702,
    `directory` = 'ArtifactHighmountainDualBoss',
    `instance_type` = 5,
    `name_enus` = 'Artifact - Highmountain - Dual Boss',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1703;
INSERT INTO `dbc`.`map` SET 
    `id` = 1703,
    `directory` = 'HallsofValorScenario',
    `instance_type` = 5,
    `name_enus` = 'Halls of Valor - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1704;
INSERT INTO `dbc`.`map` SET 
    `id` = 1704,
    `directory` = 'LegionShipHorizontalValsharah',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Horizontal - Valsharah',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1705;
INSERT INTO `dbc`.`map` SET 
    `id` = 1705,
    `directory` = 'LegionShipHorizontalAzsuna',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Horizontal - Azsuna',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1706;
INSERT INTO `dbc`.`map` SET 
    `id` = 1706,
    `directory` = 'LegionShipHorizontalHighMountain',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Vertical - HighMountain',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1707;
INSERT INTO `dbc`.`map` SET 
    `id` = 1707,
    `directory` = 'LegionShipHorizontalStormheim',
    `instance_type` = 5,
    `name_enus` = 'Legion Ship - Vertical - Stormheim',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1708;
INSERT INTO `dbc`.`map` SET 
    `id` = 1708,
    `directory` = 'StratholmePaladinClassMount',
    `instance_type` = 5,
    `name_enus` = 'Stratholme - Paladin Class Mount',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 101,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1710;
INSERT INTO `dbc`.`map` SET 
    `id` = 1710,
    `directory` = 'BlackRookHoldArtifactChallenge',
    `instance_type` = 5,
    `name_enus` = 'Black Rook Hold - Artifact Challenge',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1711;
INSERT INTO `dbc`.`map` SET 
    `id` = 1711,
    `directory` = 'SouthseaPirateShip715BoatHoliday',
    `name_enus` = 'Alliance Submarine (7.1.5 Boat Holiday)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1712;
INSERT INTO `dbc`.`map` SET 
    `id` = 1712,
    `directory` = 'ArgusRaid',
    `instance_type` = 2,
    `name_enus` = 'Antorus, the Burning Throne',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 431,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1260,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1714;
INSERT INTO `dbc`.`map` SET 
    `id` = 1714,
    `directory` = 'HallsOfValorWarriorClassMount',
    `instance_type` = 5,
    `name_enus` = 'Halls Of Valor - Warrior Class Mount',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1715;
INSERT INTO `dbc`.`map` SET 
    `id` = 1715,
    `directory` = 'BlackrockMountainBrawl',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Battle for Blackrock Mountain',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 189,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1716;
INSERT INTO `dbc`.`map` SET 
    `id` = 1716,
    `directory` = 'brokenshorewardentower',
    `name_enus` = 'Broken Shore Mage Tower',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1717;
INSERT INTO `dbc`.`map` SET 
    `id` = 1717,
    `directory` = 'AnimPlayground',
    `name_enus` = 'Anim Playground',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 182,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1718;
INSERT INTO `dbc`.`map` SET 
    `id` = 1718,
    `directory` = 'Nazjatar',
    `name_enus` = 'Nazjatar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 571,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1719;
INSERT INTO `dbc`.`map` SET 
    `id` = 1719,
    `directory` = 'warlockmountscenario',
    `instance_type` = 5,
    `name_enus` = 'Dread Scar Rift - Warlock Mount Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1723;
INSERT INTO `dbc`.`map` SET 
    `id` = 1723,
    `directory` = 'ColdridgeValley',
    `instance_type` = 5,
    `name_enus` = 'Coldridge Valley',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1726;
INSERT INTO `dbc`.`map` SET 
    `id` = 1726,
    `directory` = 'RaceTrackBG',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = '[TEMP] RaceTrackBG',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1728;
INSERT INTO `dbc`.`map` SET 
    `id` = 1728,
    `directory` = 'HallsofValorHunterScenario',
    `instance_type` = 5,
    `name_enus` = 'Halls of Valor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1729;
INSERT INTO `dbc`.`map` SET 
    `id` = 1729,
    `directory` = 'EyeofEternityMageClassMountShort',
    `instance_type` = 5,
    `name_enus` = 'The Eye of Eternity - Mage Class Mount (Shorter Version)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1730;
INSERT INTO `dbc`.`map` SET 
    `id` = 1730,
    `directory` = 'ShrineofAvianaDefenseScenario',
    `instance_type` = 5,
    `name_enus` = 'Shrine of Aviana Defense - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1731;
INSERT INTO `dbc`.`map` SET 
    `id` = 1731,
    `directory` = 'DruidMountFinaleScenario',
    `instance_type` = 5,
    `name_enus` = 'Druid Mount Finale - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1732;
INSERT INTO `dbc`.`map` SET 
    `id` = 1732,
    `directory` = 'FelwingLedgeDemonHunterClassMount',
    `instance_type` = 5,
    `name_enus` = 'Felwing Ledge - Demon Hunter Class Mount',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1733;
INSERT INTO `dbc`.`map` SET 
    `id` = 1733,
    `directory` = 'AzerothsWarningScenario',
    `instance_type` = 5,
    `name_enus` = 'Azeroth''s Warning Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1734;
INSERT INTO `dbc`.`map` SET 
    `id` = 1734,
    `directory` = 'ThroneoftheFourWindsShamanClassMounts',
    `instance_type` = 5,
    `name_enus` = 'Throne of the Four Winds - Shaman Class Mount',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 271,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1735;
INSERT INTO `dbc`.`map` SET 
    `id` = 1735,
    `directory` = 'DKMountScenario',
    `instance_type` = 5,
    `name_enus` = 'Frozen Wastes',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1736;
INSERT INTO `dbc`.`map` SET 
    `id` = 1736,
    `directory` = 'RubySanctumDKMountScenario',
    `instance_type` = 5,
    `name_enus` = 'The Ruby Sanctum',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 254,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1737;
INSERT INTO `dbc`.`map` SET 
    `id` = 1737,
    `directory` = 'AkazamarakHatScenario',
    `instance_type` = 5,
    `name_enus` = 'Pocket Dimension Akazamzaraks Hat Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1738;
INSERT INTO `dbc`.`map` SET 
    `id` = 1738,
    `directory` = 'LostGlacierDKMountScenario',
    `instance_type` = 5,
    `name_enus` = 'The Lost Glacier',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1739;
INSERT INTO `dbc`.`map` SET 
    `id` = 1739,
    `directory` = 'AITestMapABDebug',
    `instance_type` = 5,
    `name_enus` = 'AI Test Map - Arathi Basin - Debug Version',
    `name_flags` = 16712190,
    `area_table_id` = 8526,
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 183,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1740;
INSERT INTO `dbc`.`map` SET 
    `id` = 1740,
    `directory` = 'AITestMapWSGDebug',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'AI Test - Warsong Gulch',
    `name_flags` = 16712190,
    `area_table_id` = 8526,
    `desc_0_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 122,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1741;
INSERT INTO `dbc`.`map` SET 
    `id` = 1741,
    `directory` = 'ExodarDalaran',
    `name_enus` = 'The Vindicaar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1744;
INSERT INTO `dbc`.`map` SET 
    `id` = 1744,
    `directory` = 'MogWeek',
    `instance_type` = 5,
    `name_enus` = 'Trial of Style',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 224,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1746;
INSERT INTO `dbc`.`map` SET 
    `id` = 1746,
    `directory` = 'ArcatrazScenario',
    `instance_type` = 5,
    `name_enus` = 'Tempest Keep: The Arcatraz',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 206,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1747;
INSERT INTO `dbc`.`map` SET 
    `id` = 1747,
    `directory` = 'animationplayground',
    `name_enus` = 'Animation Playground',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 270,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1749;
INSERT INTO `dbc`.`map` SET 
    `id` = 1749,
    `directory` = 'WarfrontBarrens',
    `name_enus` = 'Warfront Barrens',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1750;
INSERT INTO `dbc`.`map` SET 
    `id` = 1750,
    `directory` = 'Azuremyst Isle (7.3 Intro)',
    `name_enus` = 'Azuremyst Isle',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1751;
INSERT INTO `dbc`.`map` SET 
    `id` = 1751,
    `directory` = 'AllianceBattleship73Intro',
    `name_enus` = 'Alliance Battleship (7.3 Intro)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1752;
INSERT INTO `dbc`.`map` SET 
    `id` = 1752,
    `directory` = 'SunstriderShip73Intro',
    `name_enus` = 'Sunstrider Battleship (7.3 Intro)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1753;
INSERT INTO `dbc`.`map` SET 
    `id` = 1753,
    `directory` = 'ArgusDungeon',
    `instance_type` = 1,
    `name_enus` = 'Seat of the Triumvirate',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 430,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1754;
INSERT INTO `dbc`.`map` SET 
    `id` = 1754,
    `directory` = 'PirateTownDungeon',
    `instance_type` = 1,
    `name_enus` = 'Freehold',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 547,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 360,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1756;
INSERT INTO `dbc`.`map` SET 
    `id` = 1756,
    `directory` = 'ChromieScenario',
    `instance_type` = 5,
    `name_enus` = 'The Deaths of Chromie',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 428,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1759;
INSERT INTO `dbc`.`map` SET 
    `id` = 1759,
    `directory` = 'Transport_WarfrontBarrensGunship',
    `name_enus` = 'Transport: WarfrontBarrensGunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1760;
INSERT INTO `dbc`.`map` SET 
    `id` = 1760,
    `directory` = 'LordaeronScenario',
    `instance_type` = 5,
    `name_enus` = 'Lordaeron',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1762;
INSERT INTO `dbc`.`map` SET 
    `id` = 1762,
    `directory` = 'CityofGoldInteriorDungeon',
    `instance_type` = 1,
    `name_enus` = 'Kings'' Rest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 439,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1763;
INSERT INTO `dbc`.`map` SET 
    `id` = 1763,
    `directory` = 'CityofGoldExteriorDungeon',
    `instance_type` = 1,
    `name_enus` = 'Atal''Dazar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 438,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1764;
INSERT INTO `dbc`.`map` SET 
    `id` = 1764,
    `directory` = 'EndlessHallsScenario',
    `instance_type` = 5,
    `name_enus` = 'Endless Halls',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 330,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1765;
INSERT INTO `dbc`.`map` SET 
    `id` = 1765,
    `directory` = 'WarfrontsPrototype',
    `instance_type` = 5,
    `name_enus` = 'Warfronts Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1771;
INSERT INTO `dbc`.`map` SET 
    `id` = 1771,
    `directory` = 'KulTirasPrison',
    `instance_type` = 1,
    `name_enus` = 'Tol Dagor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 550,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1773;
INSERT INTO `dbc`.`map` SET 
    `id` = 1773,
    `directory` = 'VoildElf',
    `name_enus` = 'Shadow of Azeroth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1774;
INSERT INTO `dbc`.`map` SET 
    `id` = 1774,
    `directory` = 'LightforgedDraenei',
    `instance_type` = 5,
    `name_enus` = 'Forge of Aeons',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1775;
INSERT INTO `dbc`.`map` SET 
    `id` = 1775,
    `directory` = 'HighmountainMaw',
    `name_enus` = 'Maw of N''Zoth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1776;
INSERT INTO `dbc`.`map` SET 
    `id` = 1776,
    `directory` = 'OrgrimmarEmbassy',
    `name_enus` = 'Horde Battleship - The Banshee''s Wail',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1778;
INSERT INTO `dbc`.`map` SET 
    `id` = 1778,
    `directory` = 'ArgusRifts',
    `name_enus` = 'Level Design Land',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1779;
INSERT INTO `dbc`.`map` SET 
    `id` = 1779,
    `directory` = 'Argus_Rifts',
    `name_enus` = 'Invasion Points',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1780;
INSERT INTO `dbc`.`map` SET 
    `id` = 1780,
    `directory` = 'Islands8',
    `instance_type` = 5,
    `name_enus` = 'Islands LD Playground',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1782;
INSERT INTO `dbc`.`map` SET 
    `id` = 1782,
    `directory` = 'SilithusBG',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Seething Strand',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1784;
INSERT INTO `dbc`.`map` SET 
    `id` = 1784,
    `directory` = 'PA_SMALL_CAVE01_Pristine_A',
    `name_enus` = '8.0 Islands - Cave - Hozen [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1785;
INSERT INTO `dbc`.`map` SET 
    `id` = 1785,
    `directory` = 'Islands_Pirateship_Plank',
    `name_enus` = '8.0 Islands - Ship - Pirateship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1786;
INSERT INTO `dbc`.`map` SET 
    `id` = 1786,
    `directory` = 'Islands_Transport_Horde_Zeppelin',
    `name_enus` = '8.0 Islands - Zeppelin - Goblin',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1787;
INSERT INTO `dbc`.`map` SET 
    `id` = 1787,
    `directory` = 'Islands_PA_Mogu_Crypt_07',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1788;
INSERT INTO `dbc`.`map` SET 
    `id` = 1788,
    `directory` = 'Islands_6AS_Cave_01',
    `name_enus` = '8.0 Islands - Cave - Primitve [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1789;
INSERT INTO `dbc`.`map` SET 
    `id` = 1789,
    `directory` = 'Islands_Saurok_Cave_Large',
    `name_enus` = '8.0 Islands - Cave - Saurok - Large [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1795;
INSERT INTO `dbc`.`map` SET 
    `id` = 1795,
    `directory` = 'ShwayderLand',
    `name_enus` = 'Vale of Eternal Blossoms',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1802;
INSERT INTO `dbc`.`map` SET 
    `id` = 1802,
    `directory` = 'AzeriteBG',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = '8.0 BG Temp',
    `name_flags` = 16712190,
    `desc_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 245,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1803;
INSERT INTO `dbc`.`map` SET 
    `id` = 1803,
    `directory` = 'AzeriteBG1',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Seething Shore',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 436,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1804;
INSERT INTO `dbc`.`map` SET 
    `id` = 1804,
    `directory` = 'WarfrontsPrototype3',
    `instance_type` = 5,
    `name_enus` = 'The Battle for Stromgarde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1805;
INSERT INTO `dbc`.`map` SET 
    `id` = 1805,
    `directory` = 'Islands_7HU_Transport_Alliance_Battleship01',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1806;
INSERT INTO `dbc`.`map` SET 
    `id` = 1806,
    `directory` = 'StormwindEmbassy',
    `name_enus` = 'Alliance Battleship -  Wind''s Redemption',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1807;
INSERT INTO `dbc`.`map` SET 
    `id` = 1807,
    `directory` = 'Islands_6OR_Horde_Ship01',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1809;
INSERT INTO `dbc`.`map` SET 
    `id` = 1809,
    `directory` = 'MechagnomeIsland',
    `name_enus` = 'Mechagnome Island',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1811;
INSERT INTO `dbc`.`map` SET 
    `id` = 1811,
    `directory` = 'QuestTraining',
    `name_enus` = 'Quest Training',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1812;
INSERT INTO `dbc`.`map` SET 
    `id` = 1812,
    `directory` = 'SuramarNightborneUnlock',
    `instance_type` = 5,
    `name_enus` = 'Suramar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1813;
INSERT INTO `dbc`.`map` SET 
    `id` = 1813,
    `directory` = 'Islands801',
    `instance_type` = 5,
    `name_enus` = 'Un''gol Ruins (Islands 1)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1814;
INSERT INTO `dbc`.`map` SET 
    `id` = 1814,
    `directory` = 'Islands802',
    `instance_type` = 5,
    `name_enus` = 'Havenswood (Islands 2)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1815;
INSERT INTO `dbc`.`map` SET 
    `id` = 1815,
    `directory` = 'Silithus',
    `name_enus` = 'Silithus Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1817;
INSERT INTO `dbc`.`map` SET 
    `id` = 1817,
    `directory` = 'SilithusPhase01',
    `name_enus` = 'Silithus: The Wound',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1818;
INSERT INTO `dbc`.`map` SET 
    `id` = 1818,
    `directory` = 'SilvermoonCity',
    `instance_type` = 5,
    `name_enus` = 'Silvermoon City',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1822;
INSERT INTO `dbc`.`map` SET 
    `id` = 1822,
    `directory` = 'BoralusDungeon',
    `instance_type` = 1,
    `name_enus` = 'Siege of Boralus',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 542,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1825;
INSERT INTO `dbc`.`map` SET 
    `id` = 1825,
    `directory` = 'KulTirasArena',
    `instance_type` = 4,
    `name_enus` = 'Hook Point',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 545,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1839;
INSERT INTO `dbc`.`map` SET 
    `id` = 1839,
    `directory` = 'KarazanChess',
    `name_enus` = 'Karazan Chess',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1840;
INSERT INTO `dbc`.`map` SET 
    `id` = 1840,
    `directory` = 'SunwellUnlockScenario',
    `instance_type` = 5,
    `name_enus` = 'The Sunwell',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 530,
    `corpse_x` = 12551.8,
    `corpse_y` = -6774.56,
    `time_override` = -1,
    `expansion` = 6,
    `max_players` = 25;

DELETE FROM `dbc`.`map` WHERE `id` = 1841;
INSERT INTO `dbc`.`map` SET 
    `id` = 1841,
    `directory` = 'UnderrotDungeon',
    `instance_type` = 1,
    `name_enus` = 'The Underrot',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 553,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1844;
INSERT INTO `dbc`.`map` SET 
    `id` = 1844,
    `directory` = 'Islands_7FK_Forsaken_Ship03',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1845;
INSERT INTO `dbc`.`map` SET 
    `id` = 1845,
    `directory` = 'Islands_7VR_Vrykul_Ship01',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1846;
INSERT INTO `dbc`.`map` SET 
    `id` = 1846,
    `directory` = 'Islands_6HU_Transport_Cargoship',
    `name_enus` = '8.0 Islands - Ship - 6HU Cargoship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1847;
INSERT INTO `dbc`.`map` SET 
    `id` = 1847,
    `directory` = 'Dev Map  G',
    `name_enus` = 'Dev Map - G',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1849;
INSERT INTO `dbc`.`map` SET 
    `id` = 1849,
    `directory` = 'Islands_ND_ICEBREAKER_SHIP_BG_TRANSPORT',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1850;
INSERT INTO `dbc`.`map` SET 
    `id` = 1850,
    `directory` = 'Islands_6HU_Transport_Buccaneer',
    `name_enus` = '8.2.5 - MSEM - 1850',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1851;
INSERT INTO `dbc`.`map` SET 
    `id` = 1851,
    `directory` = 'Islands_7FK_Transport_Buccaneer',
    `name_enus` = '8.0 Islands - Ship - 7FK Buccaneer',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1852;
INSERT INTO `dbc`.`map` SET 
    `id` = 1852,
    `directory` = 'Islands_Horde_Submarine',
    `name_enus` = '8.0 Islands - Ship - Player Horde - Submarine [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1853;
INSERT INTO `dbc`.`map` SET 
    `id` = 1853,
    `directory` = 'Islands_Alliance_Submarine',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1854;
INSERT INTO `dbc`.`map` SET 
    `id` = 1854,
    `directory` = 'Islands_7VS_Cavemicro03',
    `name_enus` = '8.0 Islands - Cave - 7VS Cave Micro 03 [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1855;
INSERT INTO `dbc`.`map` SET 
    `id` = 1855,
    `directory` = 'LightforgedVindicaar',
    `name_enus` = 'The Vindicaar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1856;
INSERT INTO `dbc`.`map` SET 
    `id` = 1856,
    `directory` = 'TransportAzeriteBGAllianceAirship',
    `name_enus` = 'Transport: Azerite BG - Alliance Airship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1857;
INSERT INTO `dbc`.`map` SET 
    `id` = 1857,
    `directory` = 'TransportAzeriteBGHordeGunship',
    `name_enus` = 'Transport: Azerite BG - Horde Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1860;
INSERT INTO `dbc`.`map` SET 
    `id` = 1860,
    `directory` = 'LightforgedDraeneiVindicaar',
    `name_enus` = 'The Vindicaar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1861;
INSERT INTO `dbc`.`map` SET 
    `id` = 1861,
    `directory` = 'NazmirRaid',
    `instance_type` = 2,
    `name_enus` = 'Uldir',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 548,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1862;
INSERT INTO `dbc`.`map` SET 
    `id` = 1862,
    `directory` = 'DrustvarDungeon',
    `instance_type` = 1,
    `name_enus` = 'Waycrest Manor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 437,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1863;
INSERT INTO `dbc`.`map` SET 
    `id` = 1863,
    `directory` = 'BLTestMap',
    `name_enus` = 'BL - Test Map',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1864;
INSERT INTO `dbc`.`map` SET 
    `id` = 1864,
    `directory` = 'SeaPriestDungeon',
    `instance_type` = 1,
    `name_enus` = 'Shrine of the Storm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 543,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1865;
INSERT INTO `dbc`.`map` SET 
    `id` = 1865,
    `directory` = 'VoidElfHub',
    `name_enus` = 'Telogrus Rift',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1876;
INSERT INTO `dbc`.`map` SET 
    `id` = 1876,
    `directory` = 'WarfrontsArathi',
    `instance_type` = 5,
    `name_enus` = 'Warfronts Arathi - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1877;
INSERT INTO `dbc`.`map` SET 
    `id` = 1877,
    `directory` = 'SnakeDungeon',
    `instance_type` = 1,
    `name_enus` = 'Temple of Sethraliss',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 441,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1878;
INSERT INTO `dbc`.`map` SET 
    `id` = 1878,
    `directory` = 'BlackrockDepthsDarkIron',
    `name_enus` = 'zzOLD_Blackrock Depths',
    `name_flags` = 16712190,
    `area_table_id` = 9666,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7178.1,
    `corpse_y` = -928.64,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1879;
INSERT INTO `dbc`.`map` SET 
    `id` = 1879,
    `directory` = 'rymoore',
    `instance_type` = 5,
    `name_enus` = 'Jorundall (Islands 7)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1880;
INSERT INTO `dbc`.`map` SET 
    `id` = 1880,
    `directory` = 'TitanIsland',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Titan Island - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1881;
INSERT INTO `dbc`.`map` SET 
    `id` = 1881,
    `directory` = 'Islands9',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Sinkhole - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1882;
INSERT INTO `dbc`.`map` SET 
    `id` = 1882,
    `directory` = 'Islands10',
    `instance_type` = 5,
    `name_enus` = 'Verdant Wilds (Islands 8)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1883;
INSERT INTO `dbc`.`map` SET 
    `id` = 1883,
    `directory` = 'Islands01',
    `instance_type` = 5,
    `name_enus` = 'Whispering Reef (Islands 10)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1884;
INSERT INTO `dbc`.`map` SET 
    `id` = 1884,
    `directory` = 'SiegeOfOrgrimmarZone',
    `instance_type` = 5,
    `name_enus` = 'Siege of Orgrimmar - Mag''har Orc Unlock Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 359,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1885;
INSERT INTO `dbc`.`map` SET 
    `id` = 1885,
    `directory` = 'Islands803',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - White Mesa - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1886;
INSERT INTO `dbc`.`map` SET 
    `id` = 1886,
    `directory` = 'Islands_7VR_Swamp_Prototype',
    `name_enus` = '8.0 Islands - Swamp - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1887;
INSERT INTO `dbc`.`map` SET 
    `id` = 1887,
    `directory` = 'Islands_7VR_Swamp_Prototype2',
    `name_enus` = '8.0 Islands - Swamp - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1888;
INSERT INTO `dbc`.`map` SET 
    `id` = 1888,
    `directory` = 'Islands888',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands Josh',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1889;
INSERT INTO `dbc`.`map` SET 
    `id` = 1889,
    `directory` = 'Islands666',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Katalina - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1890;
INSERT INTO `dbc`.`map` SET 
    `id` = 1890,
    `directory` = 'AssassinsScenarioDRU',
    `instance_type` = 5,
    `name_enus` = '8.0 Assassins Scenario - Drustvar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1891;
INSERT INTO `dbc`.`map` SET 
    `id` = 1891,
    `directory` = 'Islands805',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Cursed - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1892;
INSERT INTO `dbc`.`map` SET 
    `id` = 1892,
    `directory` = 'Islands11',
    `instance_type` = 5,
    `name_enus` = 'The Rotting Mire (Islands 9)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1893;
INSERT INTO `dbc`.`map` SET 
    `id` = 1893,
    `directory` = 'NecromancyIsland',
    `instance_type` = 5,
    `name_enus` = 'The Dread Chain (Islands 4)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1895;
INSERT INTO `dbc`.`map` SET 
    `id` = 1895,
    `directory` = 'Islands1106',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - lost World Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1896;
INSERT INTO `dbc`.`map` SET 
    `id` = 1896,
    `directory` = 'Islands420',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Wonderland - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1897;
INSERT INTO `dbc`.`map` SET 
    `id` = 1897,
    `directory` = 'Islands24',
    `instance_type` = 5,
    `name_enus` = 'Molten Cay (Islands 6)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1898;
INSERT INTO `dbc`.`map` SET 
    `id` = 1898,
    `directory` = 'Islands22',
    `instance_type` = 5,
    `name_enus` = 'Skittering Hollow (Islands 5)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1899;
INSERT INTO `dbc`.`map` SET 
    `id` = 1899,
    `directory` = 'Islands23',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Junker Gnome Caverns - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1900;
INSERT INTO `dbc`.`map` SET 
    `id` = 1900,
    `directory` = 'Silithus_Airship_Alliance',
    `name_enus` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1901;
INSERT INTO `dbc`.`map` SET 
    `id` = 1901,
    `directory` = 'Silithus_Airship_Horde',
    `name_enus` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1902;
INSERT INTO `dbc`.`map` SET 
    `id` = 1902,
    `directory` = 'SilithusAllianceGunship',
    `name_enus` = 'Silithus Alliance Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1903;
INSERT INTO `dbc`.`map` SET 
    `id` = 1903,
    `directory` = 'SilithusHordeGunship',
    `name_enus` = 'Silithus Horde Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1904;
INSERT INTO `dbc`.`map` SET 
    `id` = 1904,
    `directory` = 'escapefromstockades',
    `instance_type` = 5,
    `name_enus` = 'Stormwind Escape from Stockades',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1906;
INSERT INTO `dbc`.`map` SET 
    `id` = 1906,
    `directory` = 'zandalarcontinentfinale',
    `instance_type` = 5,
    `name_enus` = 'Zandalar Continent Finale',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1907;
INSERT INTO `dbc`.`map` SET 
    `id` = 1907,
    `directory` = 'Islands_Panderan_Farm',
    `instance_type` = 5,
    `name_enus` = 'Snowblossom Village (Islands 3)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1909;
INSERT INTO `dbc`.`map` SET 
    `id` = 1909,
    `directory` = 'TransportKulTirasBridgeportShip',
    `name_enus` = '[UNUSED] Transport: Kul Tiras - Bridgeport',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1910;
INSERT INTO `dbc`.`map` SET 
    `id` = 1910,
    `directory` = 'TransportKulTirasBridgeportMaidens',
    `name_enus` = 'Transport: Kul Tiras - Bridgeport - The Maiden''s Virtue',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1911;
INSERT INTO `dbc`.`map` SET 
    `id` = 1911,
    `directory` = 'ZandalariArena',
    `instance_type` = 4,
    `name_enus` = 'Mugambala',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 546,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1912;
INSERT INTO `dbc`.`map` SET 
    `id` = 1912,
    `directory` = 'Islands_7az_cave02',
    `name_enus` = '8.0 Islands - Cave - 7AZ Cave 02 [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1913;
INSERT INTO `dbc`.`map` SET 
    `id` = 1913,
    `directory` = 'PhaseableMONazmirTriangulationPlatform',
    `name_enus` = 'PhaseableMO: Nazmir - Triangulation Platform',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1916;
INSERT INTO `dbc`.`map` SET 
    `id` = 1916,
    `directory` = 'PhaseableMONazmirShipWorldQuest',
    `name_enus` = 'PhaseableMO: Nazmir - Ship World Quest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1917;
INSERT INTO `dbc`.`map` SET 
    `id` = 1917,
    `directory` = 'GorgrondOrcs',
    `instance_type` = 5,
    `name_enus` = 'Gorgrond - Mag''har Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1080,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1918;
INSERT INTO `dbc`.`map` SET 
    `id` = 1918,
    `directory` = 'Kalimdor 2',
    `name_enus` = 'Kalimdor Darkshore Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1919;
INSERT INTO `dbc`.`map` SET 
    `id` = 1919,
    `directory` = 'Islands_KL_Skywall_Entrance_Building_03',
    `name_enus` = '8.0 Islands - Platform - KL Skywall Entrance Building 03',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1920;
INSERT INTO `dbc`.`map` SET 
    `id` = 1920,
    `directory` = 'Islands_MD_Flamegate_E',
    `name_enus` = '8.0 Islands - Platform - MD Flamegate E',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1921;
INSERT INTO `dbc`.`map` SET 
    `id` = 1921,
    `directory` = 'Islands_8HU_Kultiras_ShipMedium01',
    `name_enus` = '8.0 Islands - Ship - Player Alliance - Kul''Tiras Medium 01 With Gangplank',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1922;
INSERT INTO `dbc`.`map` SET 
    `id` = 1922,
    `directory` = 'Islands_8TR_Zandalari_ShipMediumTransport01',
    `name_enus` = '8.0 Islands - Ship - Player Horde - Zandalari Medium 01 With Gangplank',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1923;
INSERT INTO `dbc`.`map` SET 
    `id` = 1923,
    `directory` = 'Islands_Deepholm_Mercury_Pool01',
    `name_enus` = '8.0 Islands - Platform - Deepholm Mercury Pool 01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1924;
INSERT INTO `dbc`.`map` SET 
    `id` = 1924,
    `directory` = 'Islands_7AZ_Vashjir_Small_Cave_A',
    `name_enus` = '8.0 Islands - Platform - 7AZ Vashjir Small Cave A',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1925;
INSERT INTO `dbc`.`map` SET 
    `id` = 1925,
    `directory` = 'DevMapH',
    `name_enus` = 'Dev Map - H',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1926;
INSERT INTO `dbc`.`map` SET 
    `id` = 1926,
    `directory` = 'KulTiranFlagship',
    `name_enus` = '8.1.5 Allies - Kul Tiran Flagship (JAK)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1927;
INSERT INTO `dbc`.`map` SET 
    `id` = 1927,
    `directory` = 'ZandalariFlagship',
    `name_enus` = 'Zandalari Flagship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1929;
INSERT INTO `dbc`.`map` SET 
    `id` = 1929,
    `directory` = 'HallOfCommunion(Destroyed)',
    `name_enus` = 'Chamber of Heart',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1930;
INSERT INTO `dbc`.`map` SET 
    `id` = 1930,
    `directory` = 'ZandalarAllianceIntroScenerio',
    `name_enus` = 'Zandalar Alliance Intro Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1931;
INSERT INTO `dbc`.`map` SET 
    `id` = 1931,
    `directory` = 'LordaeronBlight',
    `name_enus` = 'Lordaeron Blight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1932;
INSERT INTO `dbc`.`map` SET 
    `id` = 1932,
    `directory` = 'BlackrockDepthsDarkIron2',
    `instance_type` = 5,
    `name_enus` = 'Blackrock Depths - Dark Iron Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7178.1,
    `corpse_y` = -928.64,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1934;
INSERT INTO `dbc`.`map` SET 
    `id` = 1934,
    `directory` = 'Islands_8KUL_CaveMicro_freehold01',
    `name_enus` = '8.0 Islands - Cave - 8KUL_CaveMicro_freehold01 [Dev/Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1935;
INSERT INTO `dbc`.`map` SET 
    `id` = 1935,
    `directory` = 'Islands_8KUL_CaveMicro01',
    `name_enus` = '8.0 Islands - Cave - 8KUL_CaveMicro01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1936;
INSERT INTO `dbc`.`map` SET 
    `id` = 1936,
    `directory` = 'Islands_8KUL_CaveMicro02',
    `name_enus` = '8.0 Islands - Cave - 8KUL_CaveMicro02',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1937;
INSERT INTO `dbc`.`map` SET 
    `id` = 1937,
    `directory` = 'Islands_8KUL_CaveMicro03',
    `name_enus` = '8.0 Islands - Cave - 8KUL_CaveMicro03',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1938;
INSERT INTO `dbc`.`map` SET 
    `id` = 1938,
    `directory` = 'Islands_8RIV_CaveMicro_01',
    `name_enus` = '8.0 Islands - Cave - 8RIV_CaveMicro_01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1939;
INSERT INTO `dbc`.`map` SET 
    `id` = 1939,
    `directory` = 'Islands_8RIV_CaveMicro_02',
    `name_enus` = '8.0 Islands - Cave - 8RIV_CaveMicro_02',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1940;
INSERT INTO `dbc`.`map` SET 
    `id` = 1940,
    `directory` = 'StormwindEmbassyVoldunStatic',
    `name_enus` = 'Alliance Battleship -  Wind''s Redemption Voldun',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1941;
INSERT INTO `dbc`.`map` SET 
    `id` = 1941,
    `directory` = 'TransportNazmirRaidElevator',
    `name_enus` = 'Transport: Nazmir Raid Elevator',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1942;
INSERT INTO `dbc`.`map` SET 
    `id` = 1942,
    `directory` = 'MoltenCoreDarkIron',
    `name_enus` = 'Molten Core',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 192,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = -7178.1,
    `corpse_y` = -928.64,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1943;
INSERT INTO `dbc`.`map` SET 
    `id` = 1943,
    `directory` = 'WarfrontsArathi - Alliance',
    `instance_type` = 5,
    `name_enus` = 'Warfronts Arathi - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1944;
INSERT INTO `dbc`.`map` SET 
    `id` = 1944,
    `directory` = 'ScenarioThrosDeathRealm',
    `instance_type` = 5,
    `name_enus` = 'Thros, The Blighted Lands',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1945;
INSERT INTO `dbc`.`map` SET 
    `id` = 1945,
    `directory` = 'ArathiHighlands2',
    `name_enus` = 'Arathi Highlands 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1946;
INSERT INTO `dbc`.`map` SET 
    `id` = 1946,
    `directory` = 'ProtoShips',
    `name_enus` = 'Prototype - Ships',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1947;
INSERT INTO `dbc`.`map` SET 
    `id` = 1947,
    `directory` = 'TransportProtoAllianceShip',
    `name_enus` = 'Transport: Proto - Alliance Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1948;
INSERT INTO `dbc`.`map` SET 
    `id` = 1948,
    `directory` = 'TransportProtoHordeShip',
    `name_enus` = 'Transport: Proto - Horde Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1949;
INSERT INTO `dbc`.`map` SET 
    `id` = 1949,
    `directory` = '8BoostExperienceAlliance',
    `instance_type` = 1,
    `name_enus` = '8.0 Boost Experience - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1950;
INSERT INTO `dbc`.`map` SET 
    `id` = 1950,
    `directory` = '8BoostExperienceHorde',
    `instance_type` = 1,
    `name_enus` = '8.0 Boost Experience - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1951;
INSERT INTO `dbc`.`map` SET 
    `id` = 1951,
    `directory` = '8TransportBoostExperienceAllianceGunship',
    `name_enus` = '8.0 Transport: Boost Experience - Alliance Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1952;
INSERT INTO `dbc`.`map` SET 
    `id` = 1952,
    `directory` = '8TransportBoostExperienceHordeGunship',
    `name_enus` = '8.0 Transport: Boost Experience - Horde Gunship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1953;
INSERT INTO `dbc`.`map` SET 
    `id` = 1953,
    `directory` = 'Islands_demigod_dome_living',
    `name_enus` = '8.0 Islands - Platform - demigod dome living',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1954;
INSERT INTO `dbc`.`map` SET 
    `id` = 1954,
    `directory` = 'GreatSea',
    `name_enus` = 'The Great Sea Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1955;
INSERT INTO `dbc`.`map` SET 
    `id` = 1955,
    `directory` = 'ScenarioIslandsTutorial',
    `instance_type` = 5,
    `name_enus` = 'Uncharted Island',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1956;
INSERT INTO `dbc`.`map` SET 
    `id` = 1956,
    `directory` = 'Islands_Hot_OldGod_03',
    `name_enus` = '8.0 Islands - Platform - Hot Old God 03',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1957;
INSERT INTO `dbc`.`map` SET 
    `id` = 1957,
    `directory` = 'Islands_OldGod',
    `name_enus` = '8.0 Islands - Platform - Old God',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1958;
INSERT INTO `dbc`.`map` SET 
    `id` = 1958,
    `directory` = 'ZandalariTransportShip',
    `name_enus` = 'The Golden Skipper - Zandalari Transport Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1959;
INSERT INTO `dbc`.`map` SET 
    `id` = 1959,
    `directory` = 'ZandalariTransportShipLarge',
    `name_enus` = 'Zandalari Transport Ship Large',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1962;
INSERT INTO `dbc`.`map` SET 
    `id` = 1962,
    `directory` = 'GoblinShipFinal',
    `name_enus` = 'Goblin Ship Final',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1963;
INSERT INTO `dbc`.`map` SET 
    `id` = 1963,
    `directory` = 'DevMapI',
    `instance_type` = 1,
    `name_enus` = 'Dev Map - I',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1964;
INSERT INTO `dbc`.`map` SET 
    `id` = 1964,
    `directory` = 'WarCampaignHordeCh05Flagship',
    `name_enus` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Flagship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1965;
INSERT INTO `dbc`.`map` SET 
    `id` = 1965,
    `directory` = 'WarCampaignHordeCh05Ship',
    `name_enus` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2066;
INSERT INTO `dbc`.`map` SET 
    `id` = 2066,
    `directory` = 'GreatSeaHorde',
    `name_enus` = 'The Great Sea Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2067;
INSERT INTO `dbc`.`map` SET 
    `id` = 2067,
    `directory` = 'GralsCall',
    `name_enus` = 'Zandalari Battleship - Gral''s Call',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2068;
INSERT INTO `dbc`.`map` SET 
    `id` = 2068,
    `directory` = 'TirisfalGladesPhase01',
    `instance_type` = 1,
    `name_enus` = '[Not Used]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2069;
INSERT INTO `dbc`.`map` SET 
    `id` = 2069,
    `directory` = 'zuldazaralliancebombingrun',
    `name_enus` = 'Zuldazar Alliance Bombing Run',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2070;
INSERT INTO `dbc`.`map` SET 
    `id` = 2070,
    `directory` = 'Zandalarraid',
    `instance_type` = 2,
    `name_enus` = 'Battle of Dazar''alor',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 555,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 660,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2074;
INSERT INTO `dbc`.`map` SET 
    `id` = 2074,
    `directory` = '8TransportBoralusStormwind',
    `name_enus` = '8.0 Transport: Boralus to Stormwind',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2075;
INSERT INTO `dbc`.`map` SET 
    `id` = 2075,
    `directory` = 'Islands_7DU_Helheim_Ghostship',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2076;
INSERT INTO `dbc`.`map` SET 
    `id` = 2076,
    `directory` = 'FirelandsDarkIron',
    `instance_type` = 5,
    `name_enus` = 'Firelands - Dark Iron Dwarf',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2077;
INSERT INTO `dbc`.`map` SET 
    `id` = 2077,
    `directory` = 'Islands_ULDUM_INTERIOR_PYRAMID',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2078;
INSERT INTO `dbc`.`map` SET 
    `id` = 2078,
    `directory` = 'Islands_ULDUM_LARGE_PYRAMID_01',
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2081;
INSERT INTO `dbc`.`map` SET 
    `id` = 2081,
    `directory` = 'BlackrockDepthsDarkIronHub',
    `name_enus` = 'Blackrock Depths - Dark Iron Dwarf Hub',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `corpse_x` = -7178.09,
    `corpse_y` = -928.639,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2082;
INSERT INTO `dbc`.`map` SET 
    `id` = 2082,
    `directory` = 'Islands_PA_Mogu_Crypt_01',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2083;
INSERT INTO `dbc`.`map` SET 
    `id` = 2083,
    `directory` = 'Islands_PA_Mogu_Crypt_02',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2084;
INSERT INTO `dbc`.`map` SET 
    `id` = 2084,
    `directory` = 'Islands_PA_Mogu_Crypt_03',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2085;
INSERT INTO `dbc`.`map` SET 
    `id` = 2085,
    `directory` = 'Islands_PA_Mogu_Crypt_04',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2086;
INSERT INTO `dbc`.`map` SET 
    `id` = 2086,
    `directory` = 'Islands_PA_Mogu_Crypt_05',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2087;
INSERT INTO `dbc`.`map` SET 
    `id` = 2087,
    `directory` = 'Islands_PA_Mogu_Crypt_06',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2088;
INSERT INTO `dbc`.`map` SET 
    `id` = 2088,
    `directory` = 'Islands_PA_Mogu_Crypt_08',
    `name_enus` = '8.0 Islands - Micro - Mogu Crypt',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2094;
INSERT INTO `dbc`.`map` SET 
    `id` = 2094,
    `directory` = '8TransportBoralusCanals',
    `name_enus` = '8.0 Transport: Boralus Canals',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2095;
INSERT INTO `dbc`.`map` SET 
    `id` = 2095,
    `directory` = '8TransportBoralusSound',
    `name_enus` = '8.0 Transport: Boralus Sound',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2096;
INSERT INTO `dbc`.`map` SET 
    `id` = 2096,
    `directory` = 'SeaPriestRaid',
    `instance_type` = 2,
    `name_enus` = 'Crucible of Storms',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 556,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2097;
INSERT INTO `dbc`.`map` SET 
    `id` = 2097,
    `directory` = 'MechagonDungeon',
    `instance_type` = 1,
    `name_enus` = 'Operation: Mechagon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2101;
INSERT INTO `dbc`.`map` SET 
    `id` = 2101,
    `directory` = '8TransportBoralusBarge',
    `name_enus` = '8.0 Transport: Boralus Barge',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2102;
INSERT INTO `dbc`.`map` SET 
    `id` = 2102,
    `directory` = '8TransportBoralusShipSmall',
    `name_enus` = '8.0 Transport: Boralus Ship Small',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2103;
INSERT INTO `dbc`.`map` SET 
    `id` = 2103,
    `directory` = 'DarkshorePrepatchDarnassianShipCosmetic',
    `name_enus` = 'Darkshore Prepatch Darnassian Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2105;
INSERT INTO `dbc`.`map` SET 
    `id` = 2105,
    `directory` = 'WarfrontsDarkshoreAlliance',
    `instance_type` = 5,
    `name_enus` = 'Warfronts Darkshore - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 557,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2106;
INSERT INTO `dbc`.`map` SET 
    `id` = 2106,
    `directory` = 'WarsongGulch2',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Warsong Gulch',
    `name_flags` = 16712190,
    `area_table_id` = 3277,
    `desc_0_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 560,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2107;
INSERT INTO `dbc`.`map` SET 
    `id` = 2107,
    `directory` = 'ArathiBasin2',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Arathi Basin',
    `name_flags` = 16712190,
    `area_table_id` = 3358,
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 559,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2109;
INSERT INTO `dbc`.`map` SET 
    `id` = 2109,
    `directory` = 'IncursionAirshipHorde',
    `name_enus` = '8.1.0 Incursion Airship Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2110;
INSERT INTO `dbc`.`map` SET 
    `id` = 2110,
    `directory` = 'IncursionAirshipAlliance',
    `name_enus` = '8.1.0 Incursion Airship Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2111;
INSERT INTO `dbc`.`map` SET 
    `id` = 2111,
    `directory` = 'WarfrontsDarkshoreHorde',
    `instance_type` = 5,
    `name_enus` = 'Warfronts Darkshore - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 557,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2112;
INSERT INTO `dbc`.`map` SET 
    `id` = 2112,
    `directory` = '9DevLand',
    `name_enus` = '9.0 Dev Land',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2114;
INSERT INTO `dbc`.`map` SET 
    `id` = 2114,
    `directory` = 'Scourge Procedural Dungeon',
    `name_enus` = 'Maw Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2115;
INSERT INTO `dbc`.`map` SET 
    `id` = 2115,
    `directory` = 'DarkshoreTyrandeScenario',
    `instance_type` = 5,
    `name_enus` = '8.1 Darkshore Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2116;
INSERT INTO `dbc`.`map` SET 
    `id` = 2116,
    `directory` = 'Islands7',
    `instance_type` = 5,
    `name_enus` = '8.0 Islands - Event',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2117;
INSERT INTO `dbc`.`map` SET 
    `id` = 2117,
    `directory` = 'NZoth',
    `name_enus` = 'NZoth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2118;
INSERT INTO `dbc`.`map` SET 
    `id` = 2118,
    `directory` = 'WintergraspEpic',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Battle for Wintergrasp',
    `name_flags` = 16712190,
    `desc_0_enus` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.
An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 243,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 2119;
INSERT INTO `dbc`.`map` SET 
    `id` = 2119,
    `directory` = 'TransportCookingImpossibleAllianceBalloon',
    `name_enus` = 'Transport: Cooking: Impossible - Hot Air Balloon - Alliance',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2120;
INSERT INTO `dbc`.`map` SET 
    `id` = 2120,
    `directory` = 'TransportCookingImpossibleHordeBalloon',
    `name_enus` = 'Transport: Cooking: Impossible - Hot Air Balloon - Horde',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2122;
INSERT INTO `dbc`.`map` SET 
    `id` = 2122,
    `directory` = 'N�Zoth',
    `name_enus` = 'DELETE',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2123;
INSERT INTO `dbc`.`map` SET 
    `id` = 2123,
    `directory` = 'SeaPriestDungeonQuests',
    `name_enus` = 'Shrine of the Storm Quests',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 556,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2124;
INSERT INTO `dbc`.`map` SET 
    `id` = 2124,
    `directory` = 'Crestfall',
    `instance_type` = 5,
    `name_enus` = 'Crestfall (Islands 11)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2125;
INSERT INTO `dbc`.`map` SET 
    `id` = 2125,
    `directory` = 'ZandalariTreasury',
    `instance_type` = 5,
    `name_enus` = 'Zandalari Treasury',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 552,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2127;
INSERT INTO `dbc`.`map` SET 
    `id` = 2127,
    `directory` = 'AbandonedMines',
    `name_enus` = 'Abandoned Mines',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2128;
INSERT INTO `dbc`.`map` SET 
    `id` = 2128,
    `directory` = 'DaggerRealm',
    `name_enus` = 'Dagger Realm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2129;
INSERT INTO `dbc`.`map` SET 
    `id` = 2129,
    `directory` = 'DarkshoreHordeQuests',
    `name_enus` = '8.1 Darkshore Horde Quests',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2130;
INSERT INTO `dbc`.`map` SET 
    `id` = 2130,
    `directory` = 'Questfall',
    `name_enus` = 'Questfall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2131;
INSERT INTO `dbc`.`map` SET 
    `id` = 2131,
    `directory` = 'DarkshoreOutdoorPhase',
    `name_enus` = '8.1 Darkshore Outdoor Final Phase',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2132;
INSERT INTO `dbc`.`map` SET 
    `id` = 2132,
    `directory` = '9DevLand2',
    `name_enus` = '9.0 Dev Land 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2134;
INSERT INTO `dbc`.`map` SET 
    `id` = 2134,
    `directory` = 'TolDagorScenario',
    `instance_type` = 5,
    `name_enus` = 'Tol Dagor Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 550,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2135;
INSERT INTO `dbc`.`map` SET 
    `id` = 2135,
    `directory` = 'DevSmoketest',
    `name_enus` = 'Dev Smoketest',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2136;
INSERT INTO `dbc`.`map` SET 
    `id` = 2136,
    `directory` = 'ZuldazarRaidShipTransport',
    `name_enus` = 'Transport: Zuldazar Raid Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2143;
INSERT INTO `dbc`.`map` SET 
    `id` = 2143,
    `directory` = 'Mechagon',
    `name_enus` = 'DO NOT USE [Deprecated]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 551,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2145;
INSERT INTO `dbc`.`map` SET 
    `id` = 2145,
    `directory` = 'Transport312214',
    `name_enus` = 'Transport: Night Elf Warship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2146;
INSERT INTO `dbc`.`map` SET 
    `id` = 2146,
    `directory` = 'Transport312215',
    `name_enus` = 'Transport: Forsaken Warship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2147;
INSERT INTO `dbc`.`map` SET 
    `id` = 2147,
    `directory` = '2147',
    `name_enus` = 'Icecrown Citadel (8.1)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2155;
INSERT INTO `dbc`.`map` SET 
    `id` = 2155,
    `directory` = '2155',
    `instance_type` = 5,
    `name_enus` = 'Halls of Stone Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2156;
INSERT INTO `dbc`.`map` SET 
    `id` = 2156,
    `directory` = '2156',
    `instance_type` = 5,
    `name_enus` = 'Visions of N''Zoth - Prototype',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 23,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2160;
INSERT INTO `dbc`.`map` SET 
    `id` = 2160,
    `directory` = '2160',
    `name_enus` = 'Maw Prototype - Dragonblight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2161;
INSERT INTO `dbc`.`map` SET 
    `id` = 2161,
    `directory` = '2161',
    `instance_type` = 5,
    `name_enus` = 'Maw Prototype - Torment Chambers',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2162;
INSERT INTO `dbc`.`map` SET 
    `id` = 2162,
    `directory` = '2162',
    `instance_type` = 5,
    `name_enus` = 'Torghast, Tower of the Damned',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 590,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2163;
INSERT INTO `dbc`.`map` SET 
    `id` = 2163,
    `directory` = '2163',
    `instance_type` = 5,
    `name_enus` = 'Gnomeregan Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2164;
INSERT INTO `dbc`.`map` SET 
    `id` = 2164,
    `directory` = '2164',
    `instance_type` = 2,
    `name_enus` = 'The Eternal Palace',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 570,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2165;
INSERT INTO `dbc`.`map` SET 
    `id` = 2165,
    `directory` = '2165',
    `name_enus` = 'SpawnedMO: Night Elf Warship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2166;
INSERT INTO `dbc`.`map` SET 
    `id` = 2166,
    `directory` = '2166',
    `name_enus` = 'Transport: Zuldazar Raid Boralus Ship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2167;
INSERT INTO `dbc`.`map` SET 
    `id` = 2167,
    `directory` = '2167',
    `instance_type` = 4,
    `name_enus` = 'The Robodrome',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 562,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2168;
INSERT INTO `dbc`.`map` SET 
    `id` = 2168,
    `directory` = '2168',
    `name_enus` = 'Level Design Process, Techniques and Resources',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2169;
INSERT INTO `dbc`.`map` SET 
    `id` = 2169,
    `directory` = '2169',
    `instance_type` = 5,
    `name_enus` = 'Uldir Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 548,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2170;
INSERT INTO `dbc`.`map` SET 
    `id` = 2170,
    `directory` = '2170',
    `instance_type` = 5,
    `name_enus` = 'Tauren Heritage Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2174;
INSERT INTO `dbc`.`map` SET 
    `id` = 2174,
    `directory` = '2174',
    `instance_type` = 5,
    `name_enus` = 'Scarlet Halls, Dark Ranger',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 332,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = 2869.0,
    `corpse_y` = -820.0,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2175;
INSERT INTO `dbc`.`map` SET 
    `id` = 2175,
    `directory` = '2175',
    `name_enus` = '9.0 NPE (New Player Experience) - Exile''s Reach',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 589,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2176;
INSERT INTO `dbc`.`map` SET 
    `id` = 2176,
    `directory` = '2176',
    `name_enus` = 'SpawnedMO: Forsaken Ship Large',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2177;
INSERT INTO `dbc`.`map` SET 
    `id` = 2177,
    `directory` = '2177',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Arathi Basin Comp Stomp',
    `name_flags` = 16712190,
    `area_table_id` = 3358,
    `desc_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 559,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2178;
INSERT INTO `dbc`.`map` SET 
    `id` = 2178,
    `directory` = '2178',
    `instance_type` = 5,
    `name_enus` = 'The Prison of Ink',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2179;
INSERT INTO `dbc`.`map` SET 
    `id` = 2179,
    `directory` = '2179',
    `instance_type` = 5,
    `name_enus` = 'Stratholme Pet Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 101,
    `minimap_icon_scale` = 1.0,
    `corpse_x` = 3392.32,
    `corpse_y` = -3378.48,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2180;
INSERT INTO `dbc`.`map` SET 
    `id` = 2180,
    `directory` = '2180',
    `instance_type` = 5,
    `name_enus` = 'The Dreamgrove (Hearthstone Tavern)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2186;
INSERT INTO `dbc`.`map` SET 
    `id` = 2186,
    `directory` = '2186',
    `name_enus` = 'The Obsidian Sanctum - 8.2 Magni - Heart of Azeroth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 239,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `corpse_x` = 3438.15,
    `corpse_y` = 260.401,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2187;
INSERT INTO `dbc`.`map` SET 
    `id` = 2187,
    `directory` = '2187',
    `instance_type` = 5,
    `name_enus` = 'Halls of Origination',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 256,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `corpse_x` = -10226.0,
    `corpse_y` = -1837.48,
    `time_override` = 1080,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2193;
INSERT INTO `dbc`.`map` SET 
    `id` = 2193,
    `directory` = '2193',
    `instance_type` = 5,
    `name_enus` = 'Galakrond''s Fall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2194;
INSERT INTO `dbc`.`map` SET 
    `id` = 2194,
    `directory` = '2194',
    `name_enus` = 'Hearthstone Tavern',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2195;
INSERT INTO `dbc`.`map` SET 
    `id` = 2195,
    `directory` = '2195',
    `name_enus` = 'Hearthstone Tavern',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2197;
INSERT INTO `dbc`.`map` SET 
    `id` = 2197,
    `directory` = '2197',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Korrak''s Revenge',
    `name_flags` = 16712190,
    `desc_0_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 104,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2205;
INSERT INTO `dbc`.`map` SET 
    `id` = 2205,
    `directory` = '2205',
    `name_enus` = '9.0 Transport: Zone Transition Test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2207;
INSERT INTO `dbc`.`map` SET 
    `id` = 2207,
    `directory` = '2207',
    `instance_type` = 5,
    `name_enus` = 'Neltharion''s Lair - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2208;
INSERT INTO `dbc`.`map` SET 
    `id` = 2208,
    `directory` = '2208',
    `instance_type` = 5,
    `name_enus` = 'Eastern Kingdoms - Vermillion Redoubt - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1260,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2209;
INSERT INTO `dbc`.`map` SET 
    `id` = 2209,
    `directory` = '2209',
    `instance_type` = 5,
    `name_enus` = 'Emerald Dream - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 418,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2210;
INSERT INTO `dbc`.`map` SET 
    `id` = 2210,
    `directory` = '2210',
    `instance_type` = 5,
    `name_enus` = 'Siege of Orgrimmar - Coup Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 369,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2211;
INSERT INTO `dbc`.`map` SET 
    `id` = 2211,
    `directory` = '2211',
    `instance_type` = 5,
    `name_enus` = 'Gilneas - Worgen Heritage Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2212;
INSERT INTO `dbc`.`map` SET 
    `id` = 2212,
    `directory` = '2212',
    `instance_type` = 5,
    `name_enus` = 'Horrific Vision of Orgrimmar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2213;
INSERT INTO `dbc`.`map` SET 
    `id` = 2213,
    `directory` = '2213',
    `instance_type` = 5,
    `name_enus` = 'Horrific Vision of Stormwind',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2214;
INSERT INTO `dbc`.`map` SET 
    `id` = 2214,
    `directory` = '2214',
    `instance_type` = 5,
    `name_enus` = 'The Maelstrom - Heart of Azeroth',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2215;
INSERT INTO `dbc`.`map` SET 
    `id` = 2215,
    `directory` = '2215',
    `name_enus` = 'Chamber of Heart - Repaired',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2217;
INSERT INTO `dbc`.`map` SET 
    `id` = 2217,
    `directory` = '2217',
    `instance_type` = 2,
    `name_enus` = 'Ny''alotha, the Waking City',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 575,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2218;
INSERT INTO `dbc`.`map` SET 
    `id` = 2218,
    `directory` = '2218',
    `name_enus` = 'Dummy Map (Dev and empty, use if you want)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2222;
INSERT INTO `dbc`.`map` SET 
    `id` = 2222,
    `directory` = '2222',
    `name_enus` = 'The Shadowlands',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2223;
INSERT INTO `dbc`.`map` SET 
    `id` = 2223,
    `directory` = '2223',
    `instance_type` = 5,
    `name_enus` = 'The Eye of Eternity - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `corpse_x` = 3869.98,
    `corpse_y` = 6984.33,
    `time_override` = -1,
    `expansion` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2224;
INSERT INTO `dbc`.`map` SET 
    `id` = 2224,
    `directory` = '2224',
    `name_enus` = 'Programmer Map - Continent',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2225;
INSERT INTO `dbc`.`map` SET 
    `id` = 2225,
    `directory` = '2225',
    `instance_type` = 1,
    `name_enus` = 'Programmer Map - Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2226;
INSERT INTO `dbc`.`map` SET 
    `id` = 2226,
    `directory` = '2226',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Programmer Map - Battlefield',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2227;
INSERT INTO `dbc`.`map` SET 
    `id` = 2227,
    `directory` = '2227',
    `instance_type` = 2,
    `name_enus` = 'Programmer Map - Raid',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2228;
INSERT INTO `dbc`.`map` SET 
    `id` = 2228,
    `directory` = '2228',
    `instance_type` = 5,
    `name_enus` = 'Programmer Map - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2230;
INSERT INTO `dbc`.`map` SET 
    `id` = 2230,
    `directory` = '2230',
    `name_enus` = '9.0 Prototype - Seamless Teleport - A',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2231;
INSERT INTO `dbc`.`map` SET 
    `id` = 2231,
    `directory` = '2231',
    `name_enus` = '9.0 Prototype - Seamless Teleport - B',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2232;
INSERT INTO `dbc`.`map` SET 
    `id` = 2232,
    `directory` = '2232',
    `instance_type` = 5,
    `name_enus` = 'Karazhan Catacombs - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2233;
INSERT INTO `dbc`.`map` SET 
    `id` = 2233,
    `directory` = '2233',
    `instance_type` = 1,
    `name_enus` = 'Temple of the Jade Serpent - HoA Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `corpse_x` = 957.706,
    `corpse_y` = -2473.41,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2234;
INSERT INTO `dbc`.`map` SET 
    `id` = 2234,
    `directory` = '2234',
    `name_enus` = '9.0 Prototype - Seamless Teleport - Transfer Map',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2235;
INSERT INTO `dbc`.`map` SET 
    `id` = 2235,
    `directory` = '2235',
    `instance_type` = 2,
    `name_enus` = 'Caverns of Time - Anniversary',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 212,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2236;
INSERT INTO `dbc`.`map` SET 
    `id` = 2236,
    `directory` = '2236',
    `instance_type` = 1,
    `name_enus` = 'Darkmaul Citadel',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 584,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2237;
INSERT INTO `dbc`.`map` SET 
    `id` = 2237,
    `directory` = '2237',
    `name_enus` = '8.2.5 Orgrimmar',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2240;
INSERT INTO `dbc`.`map` SET 
    `id` = 2240,
    `directory` = '2240',
    `name_enus` = '[UNUSED] [DEV MAP] 8.3 Stormheim',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2241;
INSERT INTO `dbc`.`map` SET 
    `id` = 2241,
    `directory` = '2241',
    `name_enus` = 'Uldum',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2242;
INSERT INTO `dbc`.`map` SET 
    `id` = 2242,
    `directory` = '2242',
    `name_enus` = 'Dev Map - K',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2243;
INSERT INTO `dbc`.`map` SET 
    `id` = 2243,
    `directory` = '2243',
    `name_enus` = 'Dev Map - J',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2245;
INSERT INTO `dbc`.`map` SET 
    `id` = 2245,
    `directory` = '2245',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = 'Deepwind Gorge',
    `name_flags` = 16712190,
    `desc_0_enus` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `desc_0_flags` = 16712190,
    `desc_1_enus` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `desc_1_flags` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 2246;
INSERT INTO `dbc`.`map` SET 
    `id` = 2246,
    `directory` = '2246',
    `name_enus` = 'Solesa Naksu [DNT]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2247;
INSERT INTO `dbc`.`map` SET 
    `id` = 2247,
    `directory` = '2247',
    `instance_type` = 5,
    `name_enus` = 'Mogu''shan Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 312,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2249;
INSERT INTO `dbc`.`map` SET 
    `id` = 2249,
    `directory` = '2249',
    `instance_type` = 2,
    `name_enus` = 'FX Test Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2250;
INSERT INTO `dbc`.`map` SET 
    `id` = 2250,
    `directory` = '2250',
    `name_enus` = 'Test Dungeon PvP',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 560,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2254;
INSERT INTO `dbc`.`map` SET 
    `id` = 2254,
    `directory` = '2254',
    `name_enus` = 'Cinematics Test Map (Development Map)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2255;
INSERT INTO `dbc`.`map` SET 
    `id` = 2255,
    `directory` = '2255',
    `name_enus` = 'Cinematics Test Map II (Development Map)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2257;
INSERT INTO `dbc`.`map` SET 
    `id` = 2257,
    `directory` = '2257',
    `instance_type` = 5,
    `name_enus` = 'Chamber of Heart - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2258;
INSERT INTO `dbc`.`map` SET 
    `id` = 2258,
    `directory` = '2258',
    `instance_type` = 5,
    `name_enus` = 'Crapopolis - Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 120,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2261;
INSERT INTO `dbc`.`map` SET 
    `id` = 2261,
    `directory` = '2261',
    `name_enus` = '9.0 Transport - NPE - Alliance Battleship',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2263;
INSERT INTO `dbc`.`map` SET 
    `id` = 2263,
    `directory` = '2263',
    `name_enus` = 'Crapopolis',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2264;
INSERT INTO `dbc`.`map` SET 
    `id` = 2264,
    `directory` = '2264',
    `instance_type` = 5,
    `name_enus` = 'Visions of N''Zoth - Orgrimmar - Engineering Test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2266;
INSERT INTO `dbc`.`map` SET 
    `id` = 2266,
    `directory` = '2266',
    `instance_type` = 5,
    `name_enus` = 'Blackwing Descent Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 260,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2267;
INSERT INTO `dbc`.`map` SET 
    `id` = 2267,
    `directory` = '2267',
    `name_enus` = 'city',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2268;
INSERT INTO `dbc`.`map` SET 
    `id` = 2268,
    `directory` = '2268',
    `name_enus` = 'Mechagon City',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2274;
INSERT INTO `dbc`.`map` SET 
    `id` = 2274,
    `directory` = '2274',
    `name_enus` = 'Vision of the Twisting Sands',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2275;
INSERT INTO `dbc`.`map` SET 
    `id` = 2275,
    `directory` = '2275',
    `name_enus` = 'Vale of Eternal Twilight',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2276;
INSERT INTO `dbc`.`map` SET 
    `id` = 2276,
    `directory` = '2276',
    `name_enus` = '9.0 Transport - Maldraxxus Badass Necropolis [TEMP NAME]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2277;
INSERT INTO `dbc`.`map` SET 
    `id` = 2277,
    `directory` = '2277',
    `name_enus` = '9.0 SpawnedMO - Maldraxxus Badass Necropolis [TEMP NAME]',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2278;
INSERT INTO `dbc`.`map` SET 
    `id` = 2278,
    `directory` = '2278',
    `instance_type` = 5,
    `name_enus` = 'Revendreth Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2279;
INSERT INTO `dbc`.`map` SET 
    `id` = 2279,
    `directory` = '2279',
    `name_enus` = 'Torghast Test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2282;
INSERT INTO `dbc`.`map` SET 
    `id` = 2282,
    `directory` = '2282',
    `instance_type` = 5,
    `name_enus` = 'Blackrock Depths - Pet Dungeon',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2284;
INSERT INTO `dbc`.`map` SET 
    `id` = 2284,
    `directory` = '2284',
    `instance_type` = 1,
    `name_enus` = 'Sanguine Depths',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 578,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2285;
INSERT INTO `dbc`.`map` SET 
    `id` = 2285,
    `directory` = '2285',
    `instance_type` = 1,
    `name_enus` = 'Spires of Ascension',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 582,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2286;
INSERT INTO `dbc`.`map` SET 
    `id` = 2286,
    `directory` = '2286',
    `instance_type` = 1,
    `name_enus` = 'The Necrotic Wake',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 581,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2287;
INSERT INTO `dbc`.`map` SET 
    `id` = 2287,
    `directory` = '2287',
    `instance_type` = 1,
    `name_enus` = 'Halls of Atonement',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 588,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2288;
INSERT INTO `dbc`.`map` SET 
    `id` = 2288,
    `directory` = '2288',
    `name_enus` = '[DEV] - Arena of Ascension',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 209,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2289;
INSERT INTO `dbc`.`map` SET 
    `id` = 2289,
    `directory` = '2289',
    `instance_type` = 1,
    `name_enus` = 'Plaguefall',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 580,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2290;
INSERT INTO `dbc`.`map` SET 
    `id` = 2290,
    `directory` = '2290',
    `instance_type` = 1,
    `name_enus` = 'Mists of Tirna Scithe',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 586,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 600,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2291;
INSERT INTO `dbc`.`map` SET 
    `id` = 2291,
    `directory` = '2291',
    `instance_type` = 1,
    `name_enus` = 'De Other Side',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 585,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2292;
INSERT INTO `dbc`.`map` SET 
    `id` = 2292,
    `directory` = '2292',
    `instance_type` = 3,
    `pvp` = 1,
    `name_enus` = '8.3 Epic Battleground - Warfront Arathi (PvP)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2293;
INSERT INTO `dbc`.`map` SET 
    `id` = 2293,
    `directory` = '2293',
    `instance_type` = 1,
    `name_enus` = 'Theater of Pain',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 587,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2294;
INSERT INTO `dbc`.`map` SET 
    `id` = 2294,
    `directory` = '2294',
    `instance_type` = 1,
    `name_enus` = '[NOT USED] Realm',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 209,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 1320,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2296;
INSERT INTO `dbc`.`map` SET 
    `id` = 2296,
    `directory` = '2296',
    `instance_type` = 2,
    `name_enus` = 'Castle Nathria',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2297;
INSERT INTO `dbc`.`map` SET 
    `id` = 2297,
    `directory` = '2297',
    `name_enus` = 'Icecrown Citadel (8.3)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2299;
INSERT INTO `dbc`.`map` SET 
    `id` = 2299,
    `directory` = '2299',
    `instance_type` = 5,
    `name_enus` = 'Vision of Ysera Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2300;
INSERT INTO `dbc`.`map` SET 
    `id` = 2300,
    `directory` = '2300',
    `instance_type` = 5,
    `name_enus` = 'Redridge - 9xp Bastion',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2301;
INSERT INTO `dbc`.`map` SET 
    `id` = 2301,
    `directory` = '2301',
    `instance_type` = 5,
    `name_enus` = 'Maldraxxus Finale Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2303;
INSERT INTO `dbc`.`map` SET 
    `id` = 2303,
    `directory` = '2303',
    `instance_type` = 5,
    `name_enus` = 'Ardenweald Zone Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2304;
INSERT INTO `dbc`.`map` SET 
    `id` = 2304,
    `directory` = '2304',
    `instance_type` = 5,
    `name_enus` = 'Ardenweald Tyrande Finale Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2305;
INSERT INTO `dbc`.`map` SET 
    `id` = 2305,
    `directory` = '2305',
    `instance_type` = 5,
    `name_enus` = 'Bastion Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2306;
INSERT INTO `dbc`.`map` SET 
    `id` = 2306,
    `directory` = '2306',
    `name_enus` = 'Julien LoD Test',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2308;
INSERT INTO `dbc`.`map` SET 
    `id` = 2308,
    `directory` = '2308',
    `instance_type` = 5,
    `name_enus` = 'Bastion Night Warrior Finale - Ardenweald Covenant Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2309;
INSERT INTO `dbc`.`map` SET 
    `id` = 2309,
    `directory` = '2309',
    `name_enus` = 'Transport: Torghast Bridge Platform01 Elevator',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2354;
INSERT INTO `dbc`.`map` SET 
    `id` = 2354,
    `directory` = '2354',
    `instance_type` = 5,
    `name_enus` = 'Ardenweald Covenant Chapter 2 Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2355;
INSERT INTO `dbc`.`map` SET 
    `id` = 2355,
    `directory` = '2355',
    `name_enus` = 'The Necrotic Wake (Transport)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 581,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2356;
INSERT INTO `dbc`.`map` SET 
    `id` = 2356,
    `directory` = '2356',
    `instance_type` = 5,
    `name_enus` = 'Castle Nathria Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2360;
INSERT INTO `dbc`.`map` SET 
    `id` = 2360,
    `directory` = '2360',
    `instance_type` = 5,
    `name_enus` = 'Sinfall Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2362;
INSERT INTO `dbc`.`map` SET 
    `id` = 2362,
    `directory` = '2362',
    `instance_type` = 5,
    `name_enus` = 'Maldraxxus Covenant Finale Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2363;
INSERT INTO `dbc`.`map` SET 
    `id` = 2363,
    `directory` = '2363',
    `instance_type` = 5,
    `name_enus` = '9.0 - Ardenweald - Garden - Queen''s Conservatory',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2364;
INSERT INTO `dbc`.`map` SET 
    `id` = 2364,
    `directory` = '2364',
    `name_enus` = 'The Maw',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2365;
INSERT INTO `dbc`.`map` SET 
    `id` = 2365,
    `directory` = '2365',
    `name_enus` = '9.0 Maw - Torghast - 9Maw_Bridge_SmallPlatform01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2366;
INSERT INTO `dbc`.`map` SET 
    `id` = 2366,
    `directory` = '2366',
    `name_enus` = '9.0 Maw - Torghast - 9Maw_Zone_WallTurret01',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2367;
INSERT INTO `dbc`.`map` SET 
    `id` = 2367,
    `directory` = '2367',
    `name_enus` = '9.0 Maw - Torghast - 9Maw_Bridge_Straight03',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2368;
INSERT INTO `dbc`.`map` SET 
    `id` = 2368,
    `directory` = '2368',
    `name_enus` = 'Maldraxxus Broker Islands',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2369;
INSERT INTO `dbc`.`map` SET 
    `id` = 2369,
    `directory` = '2369',
    `name_enus` = '9.0 NPE - Horde - Starter Transport Ship - (STM)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2370;
INSERT INTO `dbc`.`map` SET 
    `id` = 2370,
    `directory` = '2370',
    `name_enus` = 'Maldraxxus Arena',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2371;
INSERT INTO `dbc`.`map` SET 
    `id` = 2371,
    `directory` = '2371',
    `instance_type` = 5,
    `name_enus` = '9.0 Ardenweald Covenant Finale Drust Scenario',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2373;
INSERT INTO `dbc`.`map` SET 
    `id` = 2373,
    `directory` = '2373',
    `instance_type` = 4,
    `name_enus` = 'Empyrean Domain',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 583,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2375;
INSERT INTO `dbc`.`map` SET 
    `id` = 2375,
    `directory` = '2375',
    `instance_type` = 5,
    `name_enus` = '9.0 Bastion Arena - Path of Ascension',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 583,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = 720,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2437;
INSERT INTO `dbc`.`map` SET 
    `id` = 2437,
    `directory` = '2437',
    `name_enus` = 'Dev Map - Internapalooza',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2438;
INSERT INTO `dbc`.`map` SET 
    `id` = 2438,
    `directory` = '2438',
    `instance_type` = 2,
    `name_enus` = 'SpellPref',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2439;
INSERT INTO `dbc`.`map` SET 
    `id` = 2439,
    `directory` = '2439',
    `name_enus` = 'De Other Side (Ardenweald Campaign)',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2440;
INSERT INTO `dbc`.`map` SET 
    `id` = 2440,
    `directory` = '2440',
    `name_enus` = 'World Tree 2',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2452;
INSERT INTO `dbc`.`map` SET 
    `id` = 2452,
    `directory` = '2452',
    `name_enus` = 'Dev Map - Internapalooza',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2453;
INSERT INTO `dbc`.`map` SET 
    `id` = 2453,
    `directory` = '2453',
    `name_enus` = 'Torghast',
    `name_flags` = 16712190,
    `desc_0_flags` = 16712188,
    `desc_1_flags` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_override` = -1,
    `expansion` = 8;

