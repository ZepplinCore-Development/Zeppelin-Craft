UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */,
    `map_description_1_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */
WHERE `id` = 30;

UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */,
    `map_description_1_enus` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */
WHERE `id` = 489;

UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' */,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.Meanwhile, the Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' */
WHERE `id` = 529;

UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.This battlefield is coveted by the blood elves for its rich energy deposits.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.' */,
    `map_description_1_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.This battlefield is coveted by the blood elves for its rich energy deposits.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.' */
WHERE `id` = 566;

UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */,
    `map_description_1_enus` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */
WHERE `id` = 607;

DELETE FROM `dbc`.`map` WHERE `id` = 627;
INSERT INTO `dbc`.`map` SET 
    `id` = 627,
    `directory` = 'unused',
    `instance_type` = 5,
    `flags` = 29,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Unused (DELETE ME)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 25,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

UPDATE `dbc`.`map` SET 
    `map_description_0_enus` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */,
    `map_description_1_enus` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */
WHERE `id` = 628;

DELETE FROM `dbc`.`map` WHERE `id` = 637;
INSERT INTO `dbc`.`map` SET 
    `id` = 637,
    `directory` = 'AbyssalMaw',
    `instance_type` = 1,
    `flags` = 1,
    `MapName_Lang_enUS` = 'Abyssal Maw Exterior',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 23,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 638;
INSERT INTO `dbc`.`map` SET 
    `id` = 638,
    `directory` = 'Gilneas',
    `flags` = 1,
    `MapName_Lang_enUS` = 'Gilneas',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 643;
INSERT INTO `dbc`.`map` SET 
    `id` = 643,
    `directory` = 'AbyssalMaw_Interior',
    `instance_type` = 1,
    `flags` = 29,
    `MapName_Lang_enUS` = 'Throne of the Tides',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -5585.87,
    `CorpseY` = 5401.65,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 644;
INSERT INTO `dbc`.`map` SET 
    `id` = 644,
    `directory` = 'Uldum',
    `instance_type` = 1,
    `flags` = 29,
    `MapName_Lang_enUS` = 'Halls of Origination',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 256,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -10226.0,
    `CorpseY` = -1837.48,
    `time_of_day_override` = 1080,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 645;
INSERT INTO `dbc`.`map` SET 
    `id` = 645,
    `directory` = 'BlackRockSpire_4_0',
    `instance_type` = 1,
    `flags` = 1,
    `MapName_Lang_enUS` = 'Blackrock Caverns',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 267,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7570.25,
    `CorpseY` = -1330.68,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 646;
INSERT INTO `dbc`.`map` SET 
    `id` = 646,
    `directory` = 'Deephome',
    `flags` = 1,
    `MapName_Lang_enUS` = 'Deepholm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 268,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 648;
INSERT INTO `dbc`.`map` SET 
    `id` = 648,
    `directory` = 'LostIsles',
    `flags` = 1,
    `MapName_Lang_enUS` = 'LostIsles',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 651;
INSERT INTO `dbc`.`map` SET 
    `id` = 651,
    `directory` = 'ElevatorSpawnTest',
    `flags` = 285,
    `MapName_Lang_enUS` = 'ElevatorSpawnTest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 654;
INSERT INTO `dbc`.`map` SET 
    `id` = 654,
    `directory` = 'Gilneas2',
    `MapName_Lang_enUS` = 'Gilneas2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 655;
INSERT INTO `dbc`.`map` SET 
    `id` = 655,
    `directory` = 'GilneasPhase1',
    `MapName_Lang_enUS` = 'GilneasPhase1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 656;
INSERT INTO `dbc`.`map` SET 
    `id` = 656,
    `directory` = 'GilneasPhase2',
    `MapName_Lang_enUS` = 'GilneasPhase2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 657;
INSERT INTO `dbc`.`map` SET 
    `id` = 657,
    `directory` = 'SkywallDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Vortex Pinnacle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 659;
INSERT INTO `dbc`.`map` SET 
    `id` = 659,
    `directory` = 'LostIslesPhase1',
    `MapName_Lang_enUS` = 'Lost Isles Volcano Eruption',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 660;
INSERT INTO `dbc`.`map` SET 
    `id` = 660,
    `directory` = 'Deephomeceiling',
    `MapName_Lang_enUS` = 'Deephome Ceiling',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 661;
INSERT INTO `dbc`.`map` SET 
    `id` = 661,
    `directory` = 'LostIslesPhase2',
    `MapName_Lang_enUS` = 'Lost Isles Town in a Box',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 662;
INSERT INTO `dbc`.`map` SET 
    `id` = 662,
    `directory` = 'Transport197195',
    `MapName_Lang_enUS` = 'Transport: Alliance Vashj''ir Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 669;
INSERT INTO `dbc`.`map` SET 
    `id` = 669,
    `directory` = 'BlackwingDescent',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Blackwing Descent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 260,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7541.77,
    `CorpseY` = -1188.83,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 670;
INSERT INTO `dbc`.`map` SET 
    `id` = 670,
    `directory` = 'GrimBatolDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Grim Batol',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 257,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -4047.74,
    `CorpseY` = -3446.35,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 671;
INSERT INTO `dbc`.`map` SET 
    `id` = 671,
    `directory` = 'GrimBatolRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'The Bastion of Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 266,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -4903.01,
    `CorpseY` = -4221.21,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 674;
INSERT INTO `dbc`.`map` SET 
    `id` = 674,
    `directory` = 'Transport197349-2',
    `MapName_Lang_enUS` = 'Transport: Ship to Vashj''ir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 719;
INSERT INTO `dbc`.`map` SET 
    `id` = 719,
    `directory` = 'MountHyjalPhase1',
    `MapName_Lang_enUS` = 'Mount Hyjal Phase 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 720;
INSERT INTO `dbc`.`map` SET 
    `id` = 720,
    `directory` = 'Firelands1',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Firelands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 275,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = 3987.2,
    `CorpseY` = -2943.32,
    `time_of_day_override` = 720,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 721;
INSERT INTO `dbc`.`map` SET 
    `id` = 721,
    `directory` = 'Firelands2',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Firelands Terrain 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 725;
INSERT INTO `dbc`.`map` SET 
    `id` = 725,
    `directory` = 'DeepholmeDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Stonecore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 258,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 646,
    `CorpseX` = 1031.91,
    `CorpseY` = 610.297,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 726;
INSERT INTO `dbc`.`map` SET 
    `id` = 726,
    `directory` = 'CataclysmCTF',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Twin Peaks',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 262,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 727;
INSERT INTO `dbc`.`map` SET 
    `id` = 727,
    `directory` = 'STV_Mine_BG',
    `instance_type` = 3,
    `MapName_Lang_enUS` = 'Silvershard Mines',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 317,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 728;
INSERT INTO `dbc`.`map` SET 
    `id` = 728,
    `directory` = 'TheBattleforGilneas',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'The Battle for Gilneas (Old City Map)',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Located in the heart of Gilnean peninsula, the capital city is of vital strategic importance to the Horde''s operations the Eastern Kingdoms.

Long seen by the Forsaken as a natural expansion to their dominion, Sylvanas Windrunner''s armies are ready to defend their most recent conquest at all costs.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Driven from their homelands by the Forsaken, Gilneans continue to view this city as their nation''s rightful capital.

After regrouping in Alliance territories, the people of Gilneas have rallied around King Greymane''s call to arms and are ready to retake Gilneas City with the support of their new allies.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 261,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 730;
INSERT INTO `dbc`.`map` SET 
    `id` = 730,
    `directory` = 'MaelstromZone',
    `MapName_Lang_enUS` = 'Maelstrom Zone',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 731;
INSERT INTO `dbc`.`map` SET 
    `id` = 731,
    `directory` = 'DesolaceBomb',
    `MapName_Lang_enUS` = 'Stonetalon Bomb',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 732;
INSERT INTO `dbc`.`map` SET 
    `id` = 732,
    `directory` = 'TolBarad',
    `MapName_Lang_enUS` = 'Tol Barad',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 265,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 734;
INSERT INTO `dbc`.`map` SET 
    `id` = 734,
    `directory` = 'AhnQirajTerrace',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Ahn''Qiraj Terrace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 184,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 736;
INSERT INTO `dbc`.`map` SET 
    `id` = 736,
    `directory` = 'TwilightHighlandsDragonmawPhase',
    `MapName_Lang_enUS` = 'Twilight Highlands Dragonmaw Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 738;
INSERT INTO `dbc`.`map` SET 
    `id` = 738,
    `directory` = 'Transport200100',
    `MapName_Lang_enUS` = 'Ship to Vashj''ir (Orgrimmar -> Vashj''ir)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 739;
INSERT INTO `dbc`.`map` SET 
    `id` = 739,
    `directory` = 'Transport200101',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 740;
INSERT INTO `dbc`.`map` SET 
    `id` = 740,
    `directory` = 'Transport200102',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 741;
INSERT INTO `dbc`.`map` SET 
    `id` = 741,
    `directory` = 'Transport200103',
    `MapName_Lang_enUS` = 'Twilight Highlands Horde Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 742;
INSERT INTO `dbc`.`map` SET 
    `id` = 742,
    `directory` = 'Transport203729',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Horde - Circling Abyssal Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 743;
INSERT INTO `dbc`.`map` SET 
    `id` = 743,
    `directory` = 'Transport203730',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Alliance circling Abyssal Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 746;
INSERT INTO `dbc`.`map` SET 
    `id` = 746,
    `directory` = 'UldumPhaseOasis',
    `MapName_Lang_enUS` = 'Uldum Phase Oasis',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 747;
INSERT INTO `dbc`.`map` SET 
    `id` = 747,
    `directory` = 'Transport 203732',
    `MapName_Lang_enUS` = 'Transport: Deepholm Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 748;
INSERT INTO `dbc`.`map` SET 
    `id` = 748,
    `directory` = 'Transport203858',
    `MapName_Lang_enUS` = 'Transport: Onyxia/Nefarian Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 749;
INSERT INTO `dbc`.`map` SET 
    `id` = 749,
    `directory` = 'Transport203859',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 750;
INSERT INTO `dbc`.`map` SET 
    `id` = 750,
    `directory` = 'Transport203860',
    `MapName_Lang_enUS` = 'Transport: Gilneas Static Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 751;
INSERT INTO `dbc`.`map` SET 
    `id` = 751,
    `directory` = 'RedgridgeOrcBomb',
    `MapName_Lang_enUS` = 'Redridge - Orc Bomb',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 752;
INSERT INTO `dbc`.`map` SET 
    `id` = 752,
    `directory` = 'RedridgeBridgePhaseOne',
    `MapName_Lang_enUS` = 'Redridge - Bridge Phase One',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 753;
INSERT INTO `dbc`.`map` SET 
    `id` = 753,
    `directory` = 'RedridgeBridgePhaseTwo',
    `MapName_Lang_enUS` = 'Redridge - Bridge Phase Two',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 754;
INSERT INTO `dbc`.`map` SET 
    `id` = 754,
    `directory` = 'SkywallRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Throne of the Four Winds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 271,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -11360.6,
    `CorpseY` = 72.0833,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 755;
INSERT INTO `dbc`.`map` SET 
    `id` = 755,
    `directory` = 'UldumDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Lost City of the Tol''vir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 264,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -10686.2,
    `CorpseY` = -1308.62,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 757;
INSERT INTO `dbc`.`map` SET 
    `id` = 757,
    `directory` = 'BaradinHold',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Baradin Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 269,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 759;
INSERT INTO `dbc`.`map` SET 
    `id` = 759,
    `directory` = 'UldumPhasedEntrance',
    `MapName_Lang_enUS` = 'Uldum Phased Entrance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 760;
INSERT INTO `dbc`.`map` SET 
    `id` = 760,
    `directory` = 'TwilightHighlandsPhasedEntrance',
    `MapName_Lang_enUS` = 'Twilight Highlands Phased Entrance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 761;
INSERT INTO `dbc`.`map` SET 
    `id` = 761,
    `directory` = 'Gilneas_BG_2',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'The Battle for Gilneas',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 270,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1110;

DELETE FROM `dbc`.`map` WHERE `id` = 762;
INSERT INTO `dbc`.`map` SET 
    `id` = 762,
    `directory` = 'Transport 203861',
    `MapName_Lang_enUS` = 'Twilight Highlands Zeppelin 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 763;
INSERT INTO `dbc`.`map` SET 
    `id` = 763,
    `directory` = 'Transport 203862',
    `MapName_Lang_enUS` = 'Twilight Highlands Zeppelin 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 764;
INSERT INTO `dbc`.`map` SET 
    `id` = 764,
    `directory` = 'UldumPhaseWreckedCamp',
    `MapName_Lang_enUS` = 'Uldum - Phase Wrecked Camp',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 765;
INSERT INTO `dbc`.`map` SET 
    `id` = 765,
    `directory` = 'Transport203863',
    `MapName_Lang_enUS` = 'Krazzworks Attack Zeppelin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 766;
INSERT INTO `dbc`.`map` SET 
    `id` = 766,
    `directory` = 'Transport 2033864',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship 02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 767;
INSERT INTO `dbc`.`map` SET 
    `id` = 767,
    `directory` = 'Transport 2033865',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 859;
INSERT INTO `dbc`.`map` SET 
    `id` = 859,
    `directory` = 'Zul_Gurub5Man',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Zul''Gurub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 161,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -11916.2,
    `CorpseY` = -1219.84,
    `time_of_day_override` = 720,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 860;
INSERT INTO `dbc`.`map` SET 
    `id` = 860,
    `directory` = 'NewRaceStartZone',
    `MapName_Lang_enUS` = 'The Wandering Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 861;
INSERT INTO `dbc`.`map` SET 
    `id` = 861,
    `directory` = 'FirelandsDailies',
    `MapName_Lang_enUS` = 'Molten Front',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 870;
INSERT INTO `dbc`.`map` SET 
    `id` = 870,
    `directory` = 'HawaiiMainLand',
    `MapName_Lang_enUS` = 'Pandaria',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 930;
INSERT INTO `dbc`.`map` SET 
    `id` = 930,
    `directory` = 'ScenarioAlcazIsland',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'A Dark Place',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 25,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 938;
INSERT INTO `dbc`.`map` SET 
    `id` = 938,
    `directory` = 'COTDragonblight',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'End Time',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 286,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -8288.6,
    `CorpseY` = -4454.09,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 939;
INSERT INTO `dbc`.`map` SET 
    `id` = 939,
    `directory` = 'COTWarOfTheAncients',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Well of Eternity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 287,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -8595.84,
    `CorpseY` = -3994.94,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 940;
INSERT INTO `dbc`.`map` SET 
    `id` = 940,
    `directory` = 'TheHourOfTwilight',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Hour of Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 288,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -8291.13,
    `CorpseY` = -4590.44,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 951;
INSERT INTO `dbc`.`map` SET 
    `id` = 951,
    `directory` = 'NexusLegendary',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Nexus Legendary',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `CorpseX` = 3899.93,
    `CorpseY` = 6985.44,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 959;
INSERT INTO `dbc`.`map` SET 
    `id` = 959,
    `directory` = 'ShadowpanHideout',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Shado-Pan Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 315,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 960;
INSERT INTO `dbc`.`map` SET 
    `id` = 960,
    `directory` = 'EastTemple',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Temple of the Jade Serpent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `CorpseX` = 957.706,
    `CorpseY` = -2473.41,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 961;
INSERT INTO `dbc`.`map` SET 
    `id` = 961,
    `directory` = 'StormstoutBrewery',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Stormstout Brewery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 318,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `CorpseX` = -688.705,
    `CorpseY` = 1267.45,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 962;
INSERT INTO `dbc`.`map` SET 
    `id` = 962,
    `directory` = 'TheGreatWall',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Gate of the Setting Sun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 309,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `CorpseX` = 970.811,
    `CorpseY` = 2253.66,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 967;
INSERT INTO `dbc`.`map` SET 
    `id` = 967,
    `directory` = 'DeathwingBack',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Dragon Soul',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 279,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -8263.28,
    `CorpseY` = -4512.69,
    `time_of_day_override` = 1080,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 968;
INSERT INTO `dbc`.`map` SET 
    `id` = 968,
    `directory` = 'EyeoftheStorm2.0',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Rated Eye of the Storm',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 210,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 971;
INSERT INTO `dbc`.`map` SET 
    `id` = 971,
    `directory` = 'JadeForestAllianceHubPhase',
    `MapName_Lang_enUS` = 'Jade Forest Alliance Hub Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 972;
INSERT INTO `dbc`.`map` SET 
    `id` = 972,
    `directory` = 'JadeForestBattlefieldPhase',
    `MapName_Lang_enUS` = 'Jade Forest Battlefield Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 974;
INSERT INTO `dbc`.`map` SET 
    `id` = 974,
    `directory` = 'DarkmoonFaire',
    `MapName_Lang_enUS` = 'Darkmoon Faire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 278,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 975;
INSERT INTO `dbc`.`map` SET 
    `id` = 975,
    `directory` = 'TurtleShipPhase01',
    `MapName_Lang_enUS` = 'Turtle Ship Phase 01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 976;
INSERT INTO `dbc`.`map` SET 
    `id` = 976,
    `directory` = 'TurtleShipPhase02',
    `MapName_Lang_enUS` = 'Turtle Ship Phase 02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 289,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 960;

DELETE FROM `dbc`.`map` WHERE `id` = 977;
INSERT INTO `dbc`.`map` SET 
    `id` = 977,
    `directory` = 'MaelstromDeathwingFight',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Maelstrom Deathwing Fight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 980;
INSERT INTO `dbc`.`map` SET 
    `id` = 980,
    `directory` = 'TolVirArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Tol''Viron Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 319,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 994;
INSERT INTO `dbc`.`map` SET 
    `id` = 994,
    `directory` = 'MoguDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Mogu''shan Palace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 312,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 995;
INSERT INTO `dbc`.`map` SET 
    `id` = 995,
    `directory` = 'MoguInteriorRaid',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Depths [UNUSED]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 996;
INSERT INTO `dbc`.`map` SET 
    `id` = 996,
    `directory` = 'MoguExteriorRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Terrace of Endless Spring',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 321,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 998;
INSERT INTO `dbc`.`map` SET 
    `id` = 998,
    `directory` = 'ValleyOfPower',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Temple of Kotmogu',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 320,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 999;
INSERT INTO `dbc`.`map` SET 
    `id` = 999,
    `directory` = 'BFTAllianceScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Theramore''s Fall (H)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 336,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1350,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1000;
INSERT INTO `dbc`.`map` SET 
    `id` = 1000,
    `directory` = 'BFTHordeScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Theramore''s Fall (A)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 335,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 360,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1001;
INSERT INTO `dbc`.`map` SET 
    `id` = 1001,
    `directory` = 'ScarletSanctuaryArmoryAndLibrary',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Scarlet Halls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 332,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = 2869.0,
    `CorpseY` = -820.0,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1004;
INSERT INTO `dbc`.`map` SET 
    `id` = 1004,
    `directory` = 'ScarletMonasteryCathedralGY',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Scarlet Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 333,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1005;
INSERT INTO `dbc`.`map` SET 
    `id` = 1005,
    `directory` = 'BrewmasterScenario01',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'A Brewing Storm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 322,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1007;
INSERT INTO `dbc`.`map` SET 
    `id` = 1007,
    `directory` = 'NewScholomance',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Scholomance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 314,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = 1274.78,
    `CorpseY` = -2552.56,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1008;
INSERT INTO `dbc`.`map` SET 
    `id` = 1008,
    `directory` = 'MogushanPalace',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Mogu''shan Vaults',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 313,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `CorpseX` = 3983.0,
    `CorpseY` = 1121.29,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1009;
INSERT INTO `dbc`.`map` SET 
    `id` = 1009,
    `directory` = 'MantidRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Heart of Fear',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 310,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1010;
INSERT INTO `dbc`.`map` SET 
    `id` = 1010,
    `directory` = 'MistsCTF3',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'CTF3',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This new map has yet to be created. Horde guys, go beat up those Alliance jerks.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This new map has yet to be created. Alliance guys, go beat up those Horde jerks.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 262,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1011;
INSERT INTO `dbc`.`map` SET 
    `id` = 1011,
    `directory` = 'MantidDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Siege of Niuzao Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 316,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1014;
INSERT INTO `dbc`.`map` SET 
    `id` = 1014,
    `directory` = 'MonkAreaScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Peak of Serenity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1019;
INSERT INTO `dbc`.`map` SET 
    `id` = 1019,
    `directory` = 'RuinsOfTheramore',
    `MapName_Lang_enUS` = 'Ruins of Theramore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1024;
INSERT INTO `dbc`.`map` SET 
    `id` = 1024,
    `directory` = 'PandaFishingVillageScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Greenstone Village',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 331,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1028;
INSERT INTO `dbc`.`map` SET 
    `id` = 1028,
    `directory` = 'MoguRuinsScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Mogu Ruins',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1029;
INSERT INTO `dbc`.`map` SET 
    `id` = 1029,
    `directory` = 'AncientMoguCryptScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1030;
INSERT INTO `dbc`.`map` SET 
    `id` = 1030,
    `directory` = 'AncientMoguCyptDestroyedScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Crypt of Forgotten Kings',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 330,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1031;
INSERT INTO `dbc`.`map` SET 
    `id` = 1031,
    `directory` = 'ProvingGroundsScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Arena of Annihilation',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 348,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1032;
INSERT INTO `dbc`.`map` SET 
    `id` = 1032,
    `directory` = 'PetBattleJadeForest',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Pet Battle - Jade Forest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1035;
INSERT INTO `dbc`.`map` SET 
    `id` = 1035,
    `directory` = 'ValleyOfPowerScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Temple of Kotmogu',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 334,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1043;
INSERT INTO `dbc`.`map` SET 
    `id` = 1043,
    `directory` = 'RingOfValorScenario',
    `MapName_Lang_enUS` = 'Brawl''gar Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 343,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 1048;
INSERT INTO `dbc`.`map` SET 
    `id` = 1048,
    `directory` = 'BrewmasterScenario03',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Unga Ingoo',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 323,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1049;
INSERT INTO `dbc`.`map` SET 
    `id` = 1049,
    `directory` = 'BlackOxTempleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Black Ox Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 21,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1050;
INSERT INTO `dbc`.`map` SET 
    `id` = 1050,
    `directory` = 'ScenarioKlaxxiIsland',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Assault on Zan''vess',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 344,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1051;
INSERT INTO `dbc`.`map` SET 
    `id` = 1051,
    `directory` = 'ScenarioBrewmaster04',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Brewmoon Festival',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 329,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1060;
INSERT INTO `dbc`.`map` SET 
    `id` = 1060,
    `directory` = 'LevelDesignLand-DevOnly',
    `MapName_Lang_enUS` = 'Level Design Land - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1061;
INSERT INTO `dbc`.`map` SET 
    `id` = 1061,
    `directory` = 'HordeBeachDailyArea',
    `MapName_Lang_enUS` = 'Horde Beach Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1062;
INSERT INTO `dbc`.`map` SET 
    `id` = 1062,
    `directory` = 'AllianceBeachDailyArea',
    `MapName_Lang_enUS` = 'Alliance Beach Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1064;
INSERT INTO `dbc`.`map` SET 
    `id` = 1064,
    `directory` = 'MoguIslandDailyArea',
    `MapName_Lang_enUS` = 'Mogu Island Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 346,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1066;
INSERT INTO `dbc`.`map` SET 
    `id` = 1066,
    `directory` = 'StormwindGunshipPandariaStartArea',
    `MapName_Lang_enUS` = 'Stormwind Gunship Pandaria Start Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1074;
INSERT INTO `dbc`.`map` SET 
    `id` = 1074,
    `directory` = 'OrgrimmarGunshipPandariaStart',
    `MapName_Lang_enUS` = 'Orgrimmar Gunship Pandaria Start',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1075;
INSERT INTO `dbc`.`map` SET 
    `id` = 1075,
    `directory` = 'TheramoreScenarioPhase',
    `MapName_Lang_enUS` = 'Theramore''s Fall Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1076;
INSERT INTO `dbc`.`map` SET 
    `id` = 1076,
    `directory` = 'JadeForestHordeStartingArea',
    `MapName_Lang_enUS` = 'Jade Forest Horde Starting Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1095;
INSERT INTO `dbc`.`map` SET 
    `id` = 1095,
    `directory` = 'HordeAmbushScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Dagger in the Dark',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 342,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1098;
INSERT INTO `dbc`.`map` SET 
    `id` = 1098,
    `directory` = 'ThunderIslandRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Throne of Thunder',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 347,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1099;
INSERT INTO `dbc`.`map` SET 
    `id` = 1099,
    `directory` = 'NavalBattleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Naval Battle Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 349,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1101;
INSERT INTO `dbc`.`map` SET 
    `id` = 1101,
    `directory` = 'DefenseOfTheAleHouseBG',
    `MapName_Lang_enUS` = 'Defense Of The Ale House BG',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1102;
INSERT INTO `dbc`.`map` SET 
    `id` = 1102,
    `directory` = 'HordeBaseBeachScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Domination Point',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 341,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1103;
INSERT INTO `dbc`.`map` SET 
    `id` = 1103,
    `directory` = 'AllianceBaseBeachScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Lion''s Landing',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 340,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1104;
INSERT INTO `dbc`.`map` SET 
    `id` = 1104,
    `directory` = 'ALittlePatienceScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'A Little Patience',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 345,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1105;
INSERT INTO `dbc`.`map` SET 
    `id` = 1105,
    `directory` = 'GoldRushBG',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Deepwind Gorge (Legacy)',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1106;
INSERT INTO `dbc`.`map` SET 
    `id` = 1106,
    `directory` = 'JainaDalaranScenario',
    `MapName_Lang_enUS` = 'Jaina Dalaran Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 235,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1107;
INSERT INTO `dbc`.`map` SET 
    `id` = 1107,
    `directory` = 'WarlockArea',
    `MapName_Lang_enUS` = 'Dreadscar Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1112;
INSERT INTO `dbc`.`map` SET 
    `id` = 1112,
    `directory` = 'BlackTempleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Pursuing the Black Harvest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1113;
INSERT INTO `dbc`.`map` SET 
    `id` = 1113,
    `directory` = 'DarkmoonCarousel',
    `MapName_Lang_enUS` = 'Transport: DarkmoonCarousel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1116;
INSERT INTO `dbc`.`map` SET 
    `id` = 1116,
    `directory` = 'Draenor',
    `MapName_Lang_enUS` = 'Draenor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1120;
INSERT INTO `dbc`.`map` SET 
    `id` = 1120,
    `directory` = 'ThunderKingHordeHub',
    `MapName_Lang_enUS` = 'Thunder King Horde Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1121;
INSERT INTO `dbc`.`map` SET 
    `id` = 1121,
    `directory` = 'ThunderIslandAllianceHub',
    `MapName_Lang_enUS` = 'Thunder Island Alliance Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1122;
INSERT INTO `dbc`.`map` SET 
    `id` = 1122,
    `directory` = 'CitySiegeMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'City Siege - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1123;
INSERT INTO `dbc`.`map` SET 
    `id` = 1123,
    `directory` = 'LightningForgeMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Lightning Forge - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1124;
INSERT INTO `dbc`.`map` SET 
    `id` = 1124,
    `directory` = 'ShipyardMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Shipyard - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1125;
INSERT INTO `dbc`.`map` SET 
    `id` = 1125,
    `directory` = 'AllianceHubMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Alliance Hub - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1126;
INSERT INTO `dbc`.`map` SET 
    `id` = 1126,
    `directory` = 'HordeHubMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Mogu Island Progression Events',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 346,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1127;
INSERT INTO `dbc`.`map` SET 
    `id` = 1127,
    `directory` = 'FinalGateMoguIslandProgressionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Final Gate - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1128;
INSERT INTO `dbc`.`map` SET 
    `id` = 1128,
    `directory` = 'MoguIslandEventsHordeBase',
    `MapName_Lang_enUS` = 'Mogu Island Events - Horde Base',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1129;
INSERT INTO `dbc`.`map` SET 
    `id` = 1129,
    `directory` = 'MoguIslandEventsAllianceBase',
    `MapName_Lang_enUS` = 'Mogu Island Events - Alliance Base',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1130;
INSERT INTO `dbc`.`map` SET 
    `id` = 1130,
    `directory` = 'ShimmerRidgeScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Blood in the Snow',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 352,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1131;
INSERT INTO `dbc`.`map` SET 
    `id` = 1131,
    `directory` = 'DarkHordeScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Secrets of Ragefire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 350,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1132;
INSERT INTO `dbc`.`map` SET 
    `id` = 1132,
    `directory` = 'Transport218599',
    `MapName_Lang_enUS` = 'Transport: The Skybag (Brawl''gar Arena)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1133;
INSERT INTO `dbc`.`map` SET 
    `id` = 1133,
    `directory` = 'Transport218600',
    `MapName_Lang_enUS` = 'Transport: Zandalari Ship (Mogu Island)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1134;
INSERT INTO `dbc`.`map` SET 
    `id` = 1134,
    `directory` = 'ShadoPanArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'The Tiger''s Peak',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 353,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1135;
INSERT INTO `dbc`.`map` SET 
    `id` = 1135,
    `directory` = 'MoguIslandLootRoom',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Mogu Island Loot Room',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 347,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1136;
INSERT INTO `dbc`.`map` SET 
    `id` = 1136,
    `directory` = 'OrgrimmarRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 359,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1144;
INSERT INTO `dbc`.`map` SET 
    `id` = 1144,
    `directory` = 'HeartOfTheOldGodScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Heart of the Old God Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 351,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1148;
INSERT INTO `dbc`.`map` SET 
    `id` = 1148,
    `directory` = 'ProvingGrounds',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Proving Grounds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 348,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1152;
INSERT INTO `dbc`.`map` SET 
    `id` = 1152,
    `directory` = 'FWHordeGarrisonLevel1',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1153;
INSERT INTO `dbc`.`map` SET 
    `id` = 1153,
    `directory` = 'FWHordeGarrisonLevel2',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1154;
INSERT INTO `dbc`.`map` SET 
    `id` = 1154,
    `directory` = 'FWHordeGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 4',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1155;
INSERT INTO `dbc`.`map` SET 
    `id` = 1155,
    `directory` = 'Stormgarde Keep',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Stromgarde Keep',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1157;
INSERT INTO `dbc`.`map` SET 
    `id` = 1157,
    `directory` = 'HalfhillScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halfhill Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1158;
INSERT INTO `dbc`.`map` SET 
    `id` = 1158,
    `directory` = 'SMVAllianceGarrisonLevel1',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1159;
INSERT INTO `dbc`.`map` SET 
    `id` = 1159,
    `directory` = 'SMVAllianceGarrisonLevel2',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1160;
INSERT INTO `dbc`.`map` SET 
    `id` = 1160,
    `directory` = 'SMVAllianceGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 4',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1161;
INSERT INTO `dbc`.`map` SET 
    `id` = 1161,
    `directory` = 'CelestialChallenge',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Celestial Tournament',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1200,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1166;
INSERT INTO `dbc`.`map` SET 
    `id` = 1166,
    `directory` = 'SmallBattlegroundA',
    `MapName_Lang_enUS` = 'Small Battleground A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1168;
INSERT INTO `dbc`.`map` SET 
    `id` = 1168,
    `directory` = 'ThePurgeOfGrommarScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Purge Of Grommar - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1169;
INSERT INTO `dbc`.`map` SET 
    `id` = 1169,
    `directory` = 'SmallBattlegroundB',
    `MapName_Lang_enUS` = 'Small Battleground B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1170;
INSERT INTO `dbc`.`map` SET 
    `id` = 1170,
    `directory` = 'SmallBattlegroundC',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Shado-Pan Showdown',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 353,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1171;
INSERT INTO `dbc`.`map` SET 
    `id` = 1171,
    `directory` = 'SmallBattlegroundD',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Small Battleground D',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Prototype Map',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Prototype Map',
    `MapDescription1_Lang_Mask` = 16712190,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1172;
INSERT INTO `dbc`.`map` SET 
    `id` = 1172,
    `directory` = 'Transport_Siege_of_Orgrimmar_Alliance',
    `MapName_Lang_enUS` = 'Transport: Siege of Orgrimmar (Alliance)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1173;
INSERT INTO `dbc`.`map` SET 
    `id` = 1173,
    `directory` = 'Transport_Siege_of_Orgrimmar_Horde',
    `MapName_Lang_enUS` = 'Transport: Siege of Orgrimmar (Horde)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1175;
INSERT INTO `dbc`.`map` SET 
    `id` = 1175,
    `directory` = 'OgreCompound',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Bloodmaul Slag Mines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 369,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1176;
INSERT INTO `dbc`.`map` SET 
    `id` = 1176,
    `directory` = 'MoonCultistHideout',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Shadowmoon Burial Grounds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 364,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1179;
INSERT INTO `dbc`.`map` SET 
    `id` = 1179,
    `directory` = 'WarcraftHeroes',
    `MapName_Lang_enUS` = 'Warcraft Heroes',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1181;
INSERT INTO `dbc`.`map` SET 
    `id` = 1181,
    `directory` = 'PattyMackTestGarrisonBldgMap',
    `MapName_Lang_enUS` = 'PattyMack Test Garrison Bldg Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1182;
INSERT INTO `dbc`.`map` SET 
    `id` = 1182,
    `directory` = 'DraenorAuchindoun',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Auchindoun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 365,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1187;
INSERT INTO `dbc`.`map` SET 
    `id` = 1187,
    `directory` = 'GORAllianceGarrisonLevel1',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1188;
INSERT INTO `dbc`.`map` SET 
    `id` = 1188,
    `directory` = 'GORAllianceGarrisonLevel2',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1189;
INSERT INTO `dbc`.`map` SET 
    `id` = 1189,
    `directory` = 'GORAllianceGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1190;
INSERT INTO `dbc`.`map` SET 
    `id` = 1190,
    `directory` = 'BlastedLands',
    `MapName_Lang_enUS` = 'Blasted Lands Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 1191;
INSERT INTO `dbc`.`map` SET 
    `id` = 1191,
    `directory` = 'Ashran',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Ashran',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1192;
INSERT INTO `dbc`.`map` SET 
    `id` = 1192,
    `directory` = 'Transport_Iron_Horde_Gorgrond_Train',
    `MapName_Lang_enUS` = 'Transport: Gorgrond Train',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1195;
INSERT INTO `dbc`.`map` SET 
    `id` = 1195,
    `directory` = 'WarWharfSmackdown',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Iron Docks',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 371,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1200;
INSERT INTO `dbc`.`map` SET 
    `id` = 1200,
    `directory` = 'BonetownScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Bonetown Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1203;
INSERT INTO `dbc`.`map` SET 
    `id` = 1203,
    `directory` = 'FrostfireFinaleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Frostfire Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1205;
INSERT INTO `dbc`.`map` SET 
    `id` = 1205,
    `directory` = 'BlackrockFoundryRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Blackrock Foundry',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 363,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1207;
INSERT INTO `dbc`.`map` SET 
    `id` = 1207,
    `directory` = 'TaladorIronHordeFinaleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Battle for Shattrath',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1208;
INSERT INTO `dbc`.`map` SET 
    `id` = 1208,
    `directory` = 'BlackrockFoundryTrainDepot',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Grimrail Depot',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 368,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1209;
INSERT INTO `dbc`.`map` SET 
    `id` = 1209,
    `directory` = 'ArakkoaDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Skyreach',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 367,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1212;
INSERT INTO `dbc`.`map` SET 
    `id` = 1212,
    `directory` = '6HU_GARRISON_Blacksmithing_hub',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1213;
INSERT INTO `dbc`.`map` SET 
    `id` = 1213,
    `directory` = 'alliance_garrison_alchemy',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1214;
INSERT INTO `dbc`.`map` SET 
    `id` = 1214,
    `directory` = 'alliance_garrison_enchanting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1215;
INSERT INTO `dbc`.`map` SET 
    `id` = 1215,
    `directory` = 'garrison_alliance_engineering',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1216;
INSERT INTO `dbc`.`map` SET 
    `id` = 1216,
    `directory` = 'garrison_alliance_farmhouse',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Farm1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1217;
INSERT INTO `dbc`.`map` SET 
    `id` = 1217,
    `directory` = 'garrison_alliance_inscription',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1218;
INSERT INTO `dbc`.`map` SET 
    `id` = 1218,
    `directory` = 'garrison_alliance_jewelcrafting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1219;
INSERT INTO `dbc`.`map` SET 
    `id` = 1219,
    `directory` = 'garrison_alliance_leatherworking',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1220;
INSERT INTO `dbc`.`map` SET 
    `id` = 1220,
    `directory` = 'Troll Raid',
    `MapName_Lang_enUS` = 'Broken Isles',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1221;
INSERT INTO `dbc`.`map` SET 
    `id` = 1221,
    `directory` = 'garrison_alliance_mine_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1222;
INSERT INTO `dbc`.`map` SET 
    `id` = 1222,
    `directory` = 'garrison_alliance_mine_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1223;
INSERT INTO `dbc`.`map` SET 
    `id` = 1223,
    `directory` = 'garrison_alliance_mine_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1224;
INSERT INTO `dbc`.`map` SET 
    `id` = 1224,
    `directory` = 'garrison_alliance_stable_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1225;
INSERT INTO `dbc`.`map` SET 
    `id` = 1225,
    `directory` = 'garrison_alliance_stable_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1226;
INSERT INTO `dbc`.`map` SET 
    `id` = 1226,
    `directory` = 'garrison_alliance_stable_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1227;
INSERT INTO `dbc`.`map` SET 
    `id` = 1227,
    `directory` = 'garrison_alliance_tailoring',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1228;
INSERT INTO `dbc`.`map` SET 
    `id` = 1228,
    `directory` = 'HighmaulOgreRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Highmaul',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 362,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1110,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1229;
INSERT INTO `dbc`.`map` SET 
    `id` = 1229,
    `directory` = 'garrison_alliance_inn_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1230;
INSERT INTO `dbc`.`map` SET 
    `id` = 1230,
    `directory` = 'garrison_alliance_barn',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1231;
INSERT INTO `dbc`.`map` SET 
    `id` = 1231,
    `directory` = 'Transport227523',
    `MapName_Lang_enUS` = 'Transport: Wavemurder Barge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1232;
INSERT INTO `dbc`.`map` SET 
    `id` = 1232,
    `directory` = 'GorHordeGarrisonLevel0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'GOR Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1233;
INSERT INTO `dbc`.`map` SET 
    `id` = 1233,
    `directory` = 'GORHordeGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'GOR Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1234;
INSERT INTO `dbc`.`map` SET 
    `id` = 1234,
    `directory` = 'TALAllianceGarrisonLevel0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'TAL Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1235;
INSERT INTO `dbc`.`map` SET 
    `id` = 1235,
    `directory` = 'TALAllianceGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'TAL Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1236;
INSERT INTO `dbc`.`map` SET 
    `id` = 1236,
    `directory` = 'TALHordeGarrisonLevel0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'TAL Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1237;
INSERT INTO `dbc`.`map` SET 
    `id` = 1237,
    `directory` = 'TALHordeGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'TAL Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1238;
INSERT INTO `dbc`.`map` SET 
    `id` = 1238,
    `directory` = 'SOAAllianceGarrison0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SOA Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1239;
INSERT INTO `dbc`.`map` SET 
    `id` = 1239,
    `directory` = 'SOAAllianceGarrison3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SOA Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1240;
INSERT INTO `dbc`.`map` SET 
    `id` = 1240,
    `directory` = 'SOAHordeGarrison0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SOA Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1241;
INSERT INTO `dbc`.`map` SET 
    `id` = 1241,
    `directory` = 'SOAHordeGarrison3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SOA Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1242;
INSERT INTO `dbc`.`map` SET 
    `id` = 1242,
    `directory` = 'NAGAllianceGarrisonLevel0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'NAG Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1243;
INSERT INTO `dbc`.`map` SET 
    `id` = 1243,
    `directory` = 'NAGAllianceGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'NAG Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1244;
INSERT INTO `dbc`.`map` SET 
    `id` = 1244,
    `directory` = 'NAGHordeGarrisonLevel0',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'NAG Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1245;
INSERT INTO `dbc`.`map` SET 
    `id` = 1245,
    `directory` = 'NAGHordeGarrisonLevel3',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'NAG Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1247;
INSERT INTO `dbc`.`map` SET 
    `id` = 1247,
    `directory` = 'garrison_alliance_armory1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1248;
INSERT INTO `dbc`.`map` SET 
    `id` = 1248,
    `directory` = 'garrison_alliance_barracks1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1249;
INSERT INTO `dbc`.`map` SET 
    `id` = 1249,
    `directory` = 'garrison_alliance_engineering1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1250;
INSERT INTO `dbc`.`map` SET 
    `id` = 1250,
    `directory` = 'alliance_garrison_herb_garden1',
    `MapName_Lang_enUS` = 'Alliance - Garrison - Herb Garden 1 (UNUSED)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1251;
INSERT INTO `dbc`.`map` SET 
    `id` = 1251,
    `directory` = 'alliance_garrison_inn1',
    `MapName_Lang_enUS` = 'Alliance - Garrison - Inn 1 DONT USE',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1252;
INSERT INTO `dbc`.`map` SET 
    `id` = 1252,
    `directory` = 'garrison_alliance_lumbermill1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1253;
INSERT INTO `dbc`.`map` SET 
    `id` = 1253,
    `directory` = 'alliance_garrison_magetower1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1254;
INSERT INTO `dbc`.`map` SET 
    `id` = 1254,
    `directory` = 'garrison_alliance_pet_stable1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1255;
INSERT INTO `dbc`.`map` SET 
    `id` = 1255,
    `directory` = 'garrison_alliance_salvageyard1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1256;
INSERT INTO `dbc`.`map` SET 
    `id` = 1256,
    `directory` = 'garrison_alliance_storehouse1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1257;
INSERT INTO `dbc`.`map` SET 
    `id` = 1257,
    `directory` = 'garrison_alliance_trading_post1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1258;
INSERT INTO `dbc`.`map` SET 
    `id` = 1258,
    `directory` = 'garrison_alliance_tailoring1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1259;
INSERT INTO `dbc`.`map` SET 
    `id` = 1259,
    `directory` = 'garrison_alliance_enchanting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1260;
INSERT INTO `dbc`.`map` SET 
    `id` = 1260,
    `directory` = 'garrison_alliance_blacksmith1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1261;
INSERT INTO `dbc`.`map` SET 
    `id` = 1261,
    `directory` = 'garrison_alliance_plot_small',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Plot Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1262;
INSERT INTO `dbc`.`map` SET 
    `id` = 1262,
    `directory` = 'garrison_alliance_plot_medium',
    `MapName_Lang_enUS` = 'Garrison - Allilance - Plot Medium',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1263;
INSERT INTO `dbc`.`map` SET 
    `id` = 1263,
    `directory` = 'garrison_alliance_plot_large',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Plot Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1264;
INSERT INTO `dbc`.`map` SET 
    `id` = 1264,
    `directory` = 'Propland-DevOnly',
    `MapName_Lang_enUS` = 'Propland - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 21,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1265;
INSERT INTO `dbc`.`map` SET 
    `id` = 1265,
    `directory` = 'TanaanJungleIntro',
    `MapName_Lang_enUS` = 'Tanaan Jungle Intro',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1266;
INSERT INTO `dbc`.`map` SET 
    `id` = 1266,
    `directory` = 'CircleofBloodScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Circle of Blood Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1268;
INSERT INTO `dbc`.`map` SET 
    `id` = 1268,
    `directory` = 'TerongorsConfrontation',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Teron''gor''s Confrontation',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1270;
INSERT INTO `dbc`.`map` SET 
    `id` = 1270,
    `directory` = 'devland3',
    `MapName_Lang_enUS` = 'Development Land 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1273;
INSERT INTO `dbc`.`map` SET 
    `id` = 1273,
    `directory` = 'nagrand_garrison_camp_stable_2',
    `MapName_Lang_enUS` = 'Nagrand - Garrison Camp - Stable2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1277;
INSERT INTO `dbc`.`map` SET 
    `id` = 1277,
    `directory` = 'DefenseOfKaraborScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Defense of Karabor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1278;
INSERT INTO `dbc`.`map` SET 
    `id` = 1278,
    `directory` = 'garrison_horde_barracks1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1279;
INSERT INTO `dbc`.`map` SET 
    `id` = 1279,
    `directory` = 'ShaperDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Everbloom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 370,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1280;
INSERT INTO `dbc`.`map` SET 
    `id` = 1280,
    `directory` = 'TrollRaid2',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Southshore vs. Tarren Mill',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1281;
INSERT INTO `dbc`.`map` SET 
    `id` = 1281,
    `directory` = 'garrison_horde_alchemy1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1282;
INSERT INTO `dbc`.`map` SET 
    `id` = 1282,
    `directory` = 'garrison_horde_armory1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1283;
INSERT INTO `dbc`.`map` SET 
    `id` = 1283,
    `directory` = 'garrison_horde_barn1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1284;
INSERT INTO `dbc`.`map` SET 
    `id` = 1284,
    `directory` = 'garrison_horde_blacksmith1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1285;
INSERT INTO `dbc`.`map` SET 
    `id` = 1285,
    `directory` = 'garrison_horde_enchanting1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1286;
INSERT INTO `dbc`.`map` SET 
    `id` = 1286,
    `directory` = 'garrison_horde_engineering1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1287;
INSERT INTO `dbc`.`map` SET 
    `id` = 1287,
    `directory` = 'garrison_horde_inn1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1288;
INSERT INTO `dbc`.`map` SET 
    `id` = 1288,
    `directory` = 'garrison_horde_inscription1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1289;
INSERT INTO `dbc`.`map` SET 
    `id` = 1289,
    `directory` = 'garrison_horde_jewelcrafting1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1290;
INSERT INTO `dbc`.`map` SET 
    `id` = 1290,
    `directory` = 'garrison_horde_leatherworking1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1291;
INSERT INTO `dbc`.`map` SET 
    `id` = 1291,
    `directory` = 'garrison_horde_lumbermill1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1292;
INSERT INTO `dbc`.`map` SET 
    `id` = 1292,
    `directory` = 'garrison_horde_magetower1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1293;
INSERT INTO `dbc`.`map` SET 
    `id` = 1293,
    `directory` = 'garrison_horde_mine1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1294;
INSERT INTO `dbc`.`map` SET 
    `id` = 1294,
    `directory` = 'garrison_alliance_petstabe',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1295;
INSERT INTO `dbc`.`map` SET 
    `id` = 1295,
    `directory` = 'garrison_horde_salvageyard1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1296;
INSERT INTO `dbc`.`map` SET 
    `id` = 1296,
    `directory` = 'garrison_horde_sparringarena1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1297;
INSERT INTO `dbc`.`map` SET 
    `id` = 1297,
    `directory` = 'garrison_horde_stable1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1298;
INSERT INTO `dbc`.`map` SET 
    `id` = 1298,
    `directory` = 'garrison_horde_storehouse1',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1299;
INSERT INTO `dbc`.`map` SET 
    `id` = 1299,
    `directory` = 'garrison_horde_tailoring1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1300;
INSERT INTO `dbc`.`map` SET 
    `id` = 1300,
    `directory` = 'garrison_horde_tradingpost1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1301;
INSERT INTO `dbc`.`map` SET 
    `id` = 1301,
    `directory` = 'garrison_horde_workshop1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1302;
INSERT INTO `dbc`.`map` SET 
    `id` = 1302,
    `directory` = 'garrison_alliance_workshop1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1303;
INSERT INTO `dbc`.`map` SET 
    `id` = 1303,
    `directory` = 'garrison_horde_farm1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Farm1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1304;
INSERT INTO `dbc`.`map` SET 
    `id` = 1304,
    `directory` = 'garrison_horde_plot_large',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1305;
INSERT INTO `dbc`.`map` SET 
    `id` = 1305,
    `directory` = 'garrison_horde_plot_medium',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Medium',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1306;
INSERT INTO `dbc`.`map` SET 
    `id` = 1306,
    `directory` = 'garrison_horde_plot_small',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1307;
INSERT INTO `dbc`.`map` SET 
    `id` = 1307,
    `directory` = 'TanaanJungleIntroForgePhase',
    `MapName_Lang_enUS` = 'Tanaan Jungle Intro - Forge Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1308;
INSERT INTO `dbc`.`map` SET 
    `id` = 1308,
    `directory` = 'garrison_horde_fishing1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1309;
INSERT INTO `dbc`.`map` SET 
    `id` = 1309,
    `directory` = 'garrison_alliance_fishing1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1310;
INSERT INTO `dbc`.`map` SET 
    `id` = 1310,
    `directory` = 'Expansion5QAModelMap',
    `MapName_Lang_enUS` = 'Expansion 5 QA Model Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1311;
INSERT INTO `dbc`.`map` SET 
    `id` = 1311,
    `directory` = 'outdoorGarrisonArenaHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Arena - Horde (NEEDS WMO)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1312;
INSERT INTO `dbc`.`map` SET 
    `id` = 1312,
    `directory` = 'outdoorGarrisonArenaAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Arena - Alliance (NEEDS WMO)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1313;
INSERT INTO `dbc`.`map` SET 
    `id` = 1313,
    `directory` = 'outdoorGarrisonLumberMillAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Lumber Mill - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1314;
INSERT INTO `dbc`.`map` SET 
    `id` = 1314,
    `directory` = 'outdoorGarrisonLumberMillHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Lumber Mill - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1315;
INSERT INTO `dbc`.`map` SET 
    `id` = 1315,
    `directory` = 'outdoorGarrisonArmoryHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Armory - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1316;
INSERT INTO `dbc`.`map` SET 
    `id` = 1316,
    `directory` = 'outdoorGarrisonArmoryAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Armory - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1317;
INSERT INTO `dbc`.`map` SET 
    `id` = 1317,
    `directory` = 'outdoorGarrisonMageTowerHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Mage Tower - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1318;
INSERT INTO `dbc`.`map` SET 
    `id` = 1318,
    `directory` = 'outdoorGarrisonMageTowerAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Mage Tower - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1319;
INSERT INTO `dbc`.`map` SET 
    `id` = 1319,
    `directory` = 'outdoorGarrisonStablesHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Stables - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1320;
INSERT INTO `dbc`.`map` SET 
    `id` = 1320,
    `directory` = 'outdoorGarrisonStablesAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Stables - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1321;
INSERT INTO `dbc`.`map` SET 
    `id` = 1321,
    `directory` = 'outdoorGarrisonWorkshopHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Workshop - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1322;
INSERT INTO `dbc`.`map` SET 
    `id` = 1322,
    `directory` = 'outdoorGarrisonWorkshopAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Workshop - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1323;
INSERT INTO `dbc`.`map` SET 
    `id` = 1323,
    `directory` = 'outdoorGarrisonInnHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Inn - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1324;
INSERT INTO `dbc`.`map` SET 
    `id` = 1324,
    `directory` = 'outdoorGarrisonInnAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Inn - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1325;
INSERT INTO `dbc`.`map` SET 
    `id` = 1325,
    `directory` = 'outdoorGarrisonTradingPostHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Tradiing Post 1 - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1326;
INSERT INTO `dbc`.`map` SET 
    `id` = 1326,
    `directory` = 'outdoorGarrisonTradingPostAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Tradiing Post - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1327;
INSERT INTO `dbc`.`map` SET 
    `id` = 1327,
    `directory` = 'outdoorGarrisonConstructionPlotHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Medium - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1328;
INSERT INTO `dbc`.`map` SET 
    `id` = 1328,
    `directory` = 'outdoorGarrisonConstructionPlotAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Medium - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1329;
INSERT INTO `dbc`.`map` SET 
    `id` = 1329,
    `directory` = 'GrommasharScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Grommashar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1330;
INSERT INTO `dbc`.`map` SET 
    `id` = 1330,
    `directory` = 'FWHordeGarrisonLeve2new',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 373,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1331;
INSERT INTO `dbc`.`map` SET 
    `id` = 1331,
    `directory` = 'SMVAllianceGarrisonLevel2new',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 374,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1332;
INSERT INTO `dbc`.`map` SET 
    `id` = 1332,
    `directory` = 'garrison_horde_barracks2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1333;
INSERT INTO `dbc`.`map` SET 
    `id` = 1333,
    `directory` = 'garrison_horde_armory2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1334;
INSERT INTO `dbc`.`map` SET 
    `id` = 1334,
    `directory` = 'garrison_horde_barn2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1335;
INSERT INTO `dbc`.`map` SET 
    `id` = 1335,
    `directory` = 'garrison_horde_inn2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1336;
INSERT INTO `dbc`.`map` SET 
    `id` = 1336,
    `directory` = 'garrison_horde_lumbermill2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1337;
INSERT INTO `dbc`.`map` SET 
    `id` = 1337,
    `directory` = 'garrison_horde_magetower2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1338;
INSERT INTO `dbc`.`map` SET 
    `id` = 1338,
    `directory` = 'garrison_horde_petstable2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1339;
INSERT INTO `dbc`.`map` SET 
    `id` = 1339,
    `directory` = 'garrison_horde_stable2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1340;
INSERT INTO `dbc`.`map` SET 
    `id` = 1340,
    `directory` = 'garrison_horde_tradingpost2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1341;
INSERT INTO `dbc`.`map` SET 
    `id` = 1341,
    `directory` = 'garrison_horde_workshop2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1342;
INSERT INTO `dbc`.`map` SET 
    `id` = 1342,
    `directory` = 'garrison_horde_barracks3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1343;
INSERT INTO `dbc`.`map` SET 
    `id` = 1343,
    `directory` = 'garrison_horde_armory3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1344;
INSERT INTO `dbc`.`map` SET 
    `id` = 1344,
    `directory` = 'garrison_horde_barn3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1345;
INSERT INTO `dbc`.`map` SET 
    `id` = 1345,
    `directory` = 'garrison_horde_inn3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1346;
INSERT INTO `dbc`.`map` SET 
    `id` = 1346,
    `directory` = 'garrison_horde_magetower3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1347;
INSERT INTO `dbc`.`map` SET 
    `id` = 1347,
    `directory` = 'garrison_horde_petstable3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1348;
INSERT INTO `dbc`.`map` SET 
    `id` = 1348,
    `directory` = 'garrison_horde_stable3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1349;
INSERT INTO `dbc`.`map` SET 
    `id` = 1349,
    `directory` = 'garrison_horde_tradingpost3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1350;
INSERT INTO `dbc`.`map` SET 
    `id` = 1350,
    `directory` = 'garrison_horde_workshop3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1351;
INSERT INTO `dbc`.`map` SET 
    `id` = 1351,
    `directory` = 'Garrison_Alliance_Large_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Large - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1352;
INSERT INTO `dbc`.`map` SET 
    `id` = 1352,
    `directory` = 'Garrison_Alliance_Medium_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Medium - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1353;
INSERT INTO `dbc`.`map` SET 
    `id` = 1353,
    `directory` = 'Garrison_Horde_Large_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Large - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1354;
INSERT INTO `dbc`.`map` SET 
    `id` = 1354,
    `directory` = 'Garrison_Horde_Medium_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Medium - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1358;
INSERT INTO `dbc`.`map` SET 
    `id` = 1358,
    `directory` = 'UpperBlackRockSpire',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Upper Blackrock Spire',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 7307,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 366,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7522.53,
    `CorpseY` = -1233.04,
    `time_of_day_override` = -1,
    `expansion_id` = 5,
    `max_players` = 10;

DELETE FROM `dbc`.`map` WHERE `id` = 1361;
INSERT INTO `dbc`.`map` SET 
    `id` = 1361,
    `directory` = 'garrisonAllianceMageTower2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1362;
INSERT INTO `dbc`.`map` SET 
    `id` = 1362,
    `directory` = 'garrisonAllianceMageTower3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1363;
INSERT INTO `dbc`.`map` SET 
    `id` = 1363,
    `directory` = 'garrison_horde_mine2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1364;
INSERT INTO `dbc`.`map` SET 
    `id` = 1364,
    `directory` = 'garrison_horde_mine3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1367;
INSERT INTO `dbc`.`map` SET 
    `id` = 1367,
    `directory` = 'garrison_alliance_workshop2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1368;
INSERT INTO `dbc`.`map` SET 
    `id` = 1368,
    `directory` = 'garrison_alliance_workshop3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1369;
INSERT INTO `dbc`.`map` SET 
    `id` = 1369,
    `directory` = 'garrison_alliance_lumbermill2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1370;
INSERT INTO `dbc`.`map` SET 
    `id` = 1370,
    `directory` = 'garrison_alliance_lumbermill3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1371;
INSERT INTO `dbc`.`map` SET 
    `id` = 1371,
    `directory` = 'Garrison_Horde_Small_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Small - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1372;
INSERT INTO `dbc`.`map` SET 
    `id` = 1372,
    `directory` = 'Garrison_Alliance_Small_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Small - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1374;
INSERT INTO `dbc`.`map` SET 
    `id` = 1374,
    `directory` = 'AuchindounQuest',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Auchindoun Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1375;
INSERT INTO `dbc`.`map` SET 
    `id` = 1375,
    `directory` = 'alliance_garrison_alchemy_rank2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1376;
INSERT INTO `dbc`.`map` SET 
    `id` = 1376,
    `directory` = 'alliance_garrison_alchemy_rank3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1377;
INSERT INTO `dbc`.`map` SET 
    `id` = 1377,
    `directory` = 'garrison_alliance_blacksmith2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1378;
INSERT INTO `dbc`.`map` SET 
    `id` = 1378,
    `directory` = 'garrison_alliance_enchanting2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1379;
INSERT INTO `dbc`.`map` SET 
    `id` = 1379,
    `directory` = 'garrison_alliance_engineering2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1380;
INSERT INTO `dbc`.`map` SET 
    `id` = 1380,
    `directory` = 'garrison_alliance_inscription2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1381;
INSERT INTO `dbc`.`map` SET 
    `id` = 1381,
    `directory` = 'garrison_alliance_inscription3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1382;
INSERT INTO `dbc`.`map` SET 
    `id` = 1382,
    `directory` = 'garrison_alliance_jewelcrafting2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1383;
INSERT INTO `dbc`.`map` SET 
    `id` = 1383,
    `directory` = 'garrison_alliance_jewelcrafting3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1384;
INSERT INTO `dbc`.`map` SET 
    `id` = 1384,
    `directory` = 'garrison_alliance_leatherworking2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1385;
INSERT INTO `dbc`.`map` SET 
    `id` = 1385,
    `directory` = 'garrison_alliance_leatherworking3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1386;
INSERT INTO `dbc`.`map` SET 
    `id` = 1386,
    `directory` = 'garrison_alliance_tailoring2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1387;
INSERT INTO `dbc`.`map` SET 
    `id` = 1387,
    `directory` = 'garrison_alliance_storehouse2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1388;
INSERT INTO `dbc`.`map` SET 
    `id` = 1388,
    `directory` = 'garrison_alliance_storehouse3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1389;
INSERT INTO `dbc`.`map` SET 
    `id` = 1389,
    `directory` = 'garrison_horde_storehouse2',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1390;
INSERT INTO `dbc`.`map` SET 
    `id` = 1390,
    `directory` = 'garrison_horde_storehouse3',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1391;
INSERT INTO `dbc`.`map` SET 
    `id` = 1391,
    `directory` = 'garrison_alliance_salvageyard2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1392;
INSERT INTO `dbc`.`map` SET 
    `id` = 1392,
    `directory` = 'garrison_alliance_salvageyard3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1393;
INSERT INTO `dbc`.`map` SET 
    `id` = 1393,
    `directory` = 'garrison_horde_lumbermill3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1394;
INSERT INTO `dbc`.`map` SET 
    `id` = 1394,
    `directory` = 'garrison_alliance_pet_stable2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1395;
INSERT INTO `dbc`.`map` SET 
    `id` = 1395,
    `directory` = 'garrison_alliance_pet_stable3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1396;
INSERT INTO `dbc`.`map` SET 
    `id` = 1396,
    `directory` = 'garrison_alliance_trading_post2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1397;
INSERT INTO `dbc`.`map` SET 
    `id` = 1397,
    `directory` = 'garrison_alliance_trading_post3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1398;
INSERT INTO `dbc`.`map` SET 
    `id` = 1398,
    `directory` = 'garrison_alliance_barn2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1399;
INSERT INTO `dbc`.`map` SET 
    `id` = 1399,
    `directory` = 'garrison_alliance_barn3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1400;
INSERT INTO `dbc`.`map` SET 
    `id` = 1400,
    `directory` = 'garrison_alliance_inn_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1401;
INSERT INTO `dbc`.`map` SET 
    `id` = 1401,
    `directory` = 'garrison_alliance_inn_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1402;
INSERT INTO `dbc`.`map` SET 
    `id` = 1402,
    `directory` = 'GorgrondFinaleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gorgrond Finale',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1403;
INSERT INTO `dbc`.`map` SET 
    `id` = 1403,
    `directory` = 'garrison_alliance_barracks2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1404;
INSERT INTO `dbc`.`map` SET 
    `id` = 1404,
    `directory` = 'garrison_alliance_barracks3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1405;
INSERT INTO `dbc`.`map` SET 
    `id` = 1405,
    `directory` = 'garrison_alliance_armory2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1406;
INSERT INTO `dbc`.`map` SET 
    `id` = 1406,
    `directory` = 'garrison_alliance_armory3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1407;
INSERT INTO `dbc`.`map` SET 
    `id` = 1407,
    `directory` = 'GorgrondFinaleScenarioMap',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'zzzOld',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1409;
INSERT INTO `dbc`.`map` SET 
    `id` = 1409,
    `directory` = 'garrison_horde_sparringarena2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1410;
INSERT INTO `dbc`.`map` SET 
    `id` = 1410,
    `directory` = 'garrison_horde_sparringarena3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1411;
INSERT INTO `dbc`.`map` SET 
    `id` = 1411,
    `directory` = 'garrison_horde_alchemy2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1412;
INSERT INTO `dbc`.`map` SET 
    `id` = 1412,
    `directory` = 'garrison_horde_alchemy3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1413;
INSERT INTO `dbc`.`map` SET 
    `id` = 1413,
    `directory` = 'garrison_horde_blacksmith2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1414;
INSERT INTO `dbc`.`map` SET 
    `id` = 1414,
    `directory` = 'garrison_horde_blacksmith3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1415;
INSERT INTO `dbc`.`map` SET 
    `id` = 1415,
    `directory` = 'garrison_horde_enchanting2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1416;
INSERT INTO `dbc`.`map` SET 
    `id` = 1416,
    `directory` = 'garrison_horde_enchanting3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1417;
INSERT INTO `dbc`.`map` SET 
    `id` = 1417,
    `directory` = 'garrison_horde_inscription2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1418;
INSERT INTO `dbc`.`map` SET 
    `id` = 1418,
    `directory` = 'garrison_horde_inscription3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1419;
INSERT INTO `dbc`.`map` SET 
    `id` = 1419,
    `directory` = 'garrison_horde_leatherworking2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1420;
INSERT INTO `dbc`.`map` SET 
    `id` = 1420,
    `directory` = 'garrison_horde_leatherworking3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1421;
INSERT INTO `dbc`.`map` SET 
    `id` = 1421,
    `directory` = 'garrison_horde_jewelcrafting2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1422;
INSERT INTO `dbc`.`map` SET 
    `id` = 1422,
    `directory` = 'garrison_horde_jewelcrafting3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1423;
INSERT INTO `dbc`.`map` SET 
    `id` = 1423,
    `directory` = 'garrison_horde_tailoring2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1424;
INSERT INTO `dbc`.`map` SET 
    `id` = 1424,
    `directory` = 'garrison_horde_tailoring3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1425;
INSERT INTO `dbc`.`map` SET 
    `id` = 1425,
    `directory` = 'garrison_horde_salvageyard2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1426;
INSERT INTO `dbc`.`map` SET 
    `id` = 1426,
    `directory` = 'garrison_horde_salvageyard3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1427;
INSERT INTO `dbc`.`map` SET 
    `id` = 1427,
    `directory` = 'PattyMackTestGarrisonBldgMap2',
    `MapName_Lang_enUS` = 'PattyMack Test Garrison Bld Map2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1429;
INSERT INTO `dbc`.`map` SET 
    `id` = 1429,
    `directory` = 'garrison_horde_engineering2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1430;
INSERT INTO `dbc`.`map` SET 
    `id` = 1430,
    `directory` = 'garrison_horde_engineering3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1431;
INSERT INTO `dbc`.`map` SET 
    `id` = 1431,
    `directory` = 'SparringArenaLevel3Stadium',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Coliseum',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'KILL EVERYONE',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'KILL EVERYONE',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1432;
INSERT INTO `dbc`.`map` SET 
    `id` = 1432,
    `directory` = 'garrison_horde_fishing2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1433;
INSERT INTO `dbc`.`map` SET 
    `id` = 1433,
    `directory` = 'garrison_horde_fishing3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1434;
INSERT INTO `dbc`.`map` SET 
    `id` = 1434,
    `directory` = 'garrison_alliance_fishing2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1435;
INSERT INTO `dbc`.`map` SET 
    `id` = 1435,
    `directory` = 'garrison_alliance_fishing3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1437;
INSERT INTO `dbc`.`map` SET 
    `id` = 1437,
    `directory` = 'garrison_alliance_petstable1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1438;
INSERT INTO `dbc`.`map` SET 
    `id` = 1438,
    `directory` = 'garrison_alliance_petstable2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1439;
INSERT INTO `dbc`.`map` SET 
    `id` = 1439,
    `directory` = 'garrison_alliance_petstable3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1440;
INSERT INTO `dbc`.`map` SET 
    `id` = 1440,
    `directory` = 'garrison_alliance_infirmary1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1441;
INSERT INTO `dbc`.`map` SET 
    `id` = 1441,
    `directory` = 'garrison_alliance_infirmary2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1442;
INSERT INTO `dbc`.`map` SET 
    `id` = 1442,
    `directory` = 'garrison_alliance_infirmary3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1446;
INSERT INTO `dbc`.`map` SET 
    `id` = 1446,
    `directory` = 'outdoorGarrisonConstructionPlotAllianceLarge',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Large - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1447;
INSERT INTO `dbc`.`map` SET 
    `id` = 1447,
    `directory` = 'outdoorGarrisonConstructionPlotHordeLarge',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Large - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1448;
INSERT INTO `dbc`.`map` SET 
    `id` = 1448,
    `directory` = 'HellfireRaid62',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Hellfire Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 375,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 360,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1451;
INSERT INTO `dbc`.`map` SET 
    `id` = 1451,
    `directory` = 'TanaanLegionTest',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tanaan Legion Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1453;
INSERT INTO `dbc`.`map` SET 
    `id` = 1453,
    `directory` = 'ScourgeofNorthshire',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Scourge of Northshire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1454;
INSERT INTO `dbc`.`map` SET 
    `id` = 1454,
    `directory` = 'ArtifactAshbringerOrigin',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Broken Shore (old - delete)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1455;
INSERT INTO `dbc`.`map` SET 
    `id` = 1455,
    `directory` = 'EdgeofRealityMount',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Edge of Reality',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 364,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1456;
INSERT INTO `dbc`.`map` SET 
    `id` = 1456,
    `directory` = 'NagaDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Eye of Azshara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 416,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1457;
INSERT INTO `dbc`.`map` SET 
    `id` = 1457,
    `directory` = 'FXlDesignLand-DevOnly',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Test Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1458;
INSERT INTO `dbc`.`map` SET 
    `id` = 1458,
    `directory` = '7_DungeonExteriorNeltharionsLair',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Neltharion''s Lair',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1459;
INSERT INTO `dbc`.`map` SET 
    `id` = 1459,
    `directory` = 'Transport_The_Iron_Mountain',
    `MapName_Lang_enUS` = 'Transport: The Iron Mountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1460;
INSERT INTO `dbc`.`map` SET 
    `id` = 1460,
    `directory` = 'BrokenShoreScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Broken Shore Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1461;
INSERT INTO `dbc`.`map` SET 
    `id` = 1461,
    `directory` = 'AzsunaScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Azsuna Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1462;
INSERT INTO `dbc`.`map` SET 
    `id` = 1462,
    `directory` = 'IllidansRock',
    `MapName_Lang_enUS` = 'Illidans Rock',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1463;
INSERT INTO `dbc`.`map` SET 
    `id` = 1463,
    `directory` = 'HelhiemExteriorArea',
    `MapName_Lang_enUS` = 'Helhiem Exterior Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1464;
INSERT INTO `dbc`.`map` SET 
    `id` = 1464,
    `directory` = 'TanaanJungle',
    `MapName_Lang_enUS` = 'Tanaan Jungle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1465;
INSERT INTO `dbc`.`map` SET 
    `id` = 1465,
    `directory` = 'TanaanJungleNoHubsPhase',
    `MapName_Lang_enUS` = 'Tanaan Jungle - No Hubs Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1466;
INSERT INTO `dbc`.`map` SET 
    `id` = 1466,
    `directory` = 'Emerald_Nightmare_ValSharah_exterior',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Darkheart Thicket',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 397,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1468;
INSERT INTO `dbc`.`map` SET 
    `id` = 1468,
    `directory` = 'WardenPrison',
    `MapName_Lang_enUS` = 'Warden Prison DH Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 398,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1469;
INSERT INTO `dbc`.`map` SET 
    `id` = 1469,
    `directory` = 'MaelstromShaman',
    `MapName_Lang_enUS` = 'The Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 405,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1470;
INSERT INTO `dbc`.`map` SET 
    `id` = 1470,
    `directory` = 'Legion Dungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Legion Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1471;
INSERT INTO `dbc`.`map` SET 
    `id` = 1471,
    `directory` = '1466',
    `MapName_Lang_enUS` = 'Dungeon Test Map 1466',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1473;
INSERT INTO `dbc`.`map` SET 
    `id` = 1473,
    `directory` = 'GarrisonAllianceShipyard',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Shipyard',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1474;
INSERT INTO `dbc`.`map` SET 
    `id` = 1474,
    `directory` = 'GarrisonHordeShipyard',
    `MapName_Lang_enUS` = 'Garrison - Horde - Shipyard',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1475;
INSERT INTO `dbc`.`map` SET 
    `id` = 1475,
    `directory` = 'TheMawofNashal',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Maw of Nashal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1476;
INSERT INTO `dbc`.`map` SET 
    `id` = 1476,
    `directory` = 'Transport_The_Maw_of_Nashal',
    `MapName_Lang_enUS` = 'Transport: The Maw of Nashal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1477;
INSERT INTO `dbc`.`map` SET 
    `id` = 1477,
    `directory` = 'Valhallas',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Halls of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1478;
INSERT INTO `dbc`.`map` SET 
    `id` = 1478,
    `directory` = 'ValSharahTempleofEluneScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Temple of Elune',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 182,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1479;
INSERT INTO `dbc`.`map` SET 
    `id` = 1479,
    `directory` = 'WarriorArtifactArea',
    `MapName_Lang_enUS` = 'Skyhold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1480;
INSERT INTO `dbc`.`map` SET 
    `id` = 1480,
    `directory` = 'DeathKnightArtifactArea',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Icecrown Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1481;
INSERT INTO `dbc`.`map` SET 
    `id` = 1481,
    `directory` = 'legionnexus',
    `MapName_Lang_enUS` = 'Mardum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 378,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1482;
INSERT INTO `dbc`.`map` SET 
    `id` = 1482,
    `directory` = 'GarrisonShipyardAllianceSubmarine',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Submarine - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1483;
INSERT INTO `dbc`.`map` SET 
    `id` = 1483,
    `directory` = 'GarrisonShipyardAllianceDestroyer',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Destroyer - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1484;
INSERT INTO `dbc`.`map` SET 
    `id` = 1484,
    `directory` = 'GarrisonShipyardTransport',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1485;
INSERT INTO `dbc`.`map` SET 
    `id` = 1485,
    `directory` = 'GarrisonShipyardDreadnaught',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Battleship - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1486;
INSERT INTO `dbc`.`map` SET 
    `id` = 1486,
    `directory` = 'GarrisonShipyardCarrier',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Carrier - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1487;
INSERT INTO `dbc`.`map` SET 
    `id` = 1487,
    `directory` = 'GarrisonShipyardHordeSubmarine',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Submarine - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1488;
INSERT INTO `dbc`.`map` SET 
    `id` = 1488,
    `directory` = 'GarrisonShipyardHordeDestroyer',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Destroyer - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1489;
INSERT INTO `dbc`.`map` SET 
    `id` = 1489,
    `directory` = 'Artifact-PortalWorldAcqusition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Niskara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 408,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1492;
INSERT INTO `dbc`.`map` SET 
    `id` = 1492,
    `directory` = 'Helheim',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Maw of Souls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 399,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1493;
INSERT INTO `dbc`.`map` SET 
    `id` = 1493,
    `directory` = 'WardenPrisonDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Vault of the Wardens',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 398,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1494;
INSERT INTO `dbc`.`map` SET 
    `id` = 1494,
    `directory` = 'AcquisitionVioletHold',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Violet Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 420,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1495;
INSERT INTO `dbc`.`map` SET 
    `id` = 1495,
    `directory` = 'AcquisitionWarriorProt',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Shield''s Rest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1496;
INSERT INTO `dbc`.`map` SET 
    `id` = 1496,
    `directory` = 'GarrisonShipyardCarrierAlliance',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Carrier - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1497;
INSERT INTO `dbc`.`map` SET 
    `id` = 1497,
    `directory` = 'GarrisonShipyardGalleonHorde',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Battleship - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1498;
INSERT INTO `dbc`.`map` SET 
    `id` = 1498,
    `directory` = 'AcquisitionHavoc',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Felsoul Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1499;
INSERT INTO `dbc`.`map` SET 
    `id` = 1499,
    `directory` = 'Artifact-Warrior Fury Acquisition',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'oldArtifact - Warrior Fury Acquisition',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1500;
INSERT INTO `dbc`.`map` SET 
    `id` = 1500,
    `directory` = 'ArtifactPaladinRetAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Broken Shore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1501;
INSERT INTO `dbc`.`map` SET 
    `id` = 1501,
    `directory` = 'BlackRookHoldDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Black Rook Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1502;
INSERT INTO `dbc`.`map` SET 
    `id` = 1502,
    `directory` = 'DalaranUnderbelly',
    `MapName_Lang_enUS` = 'Dalaran Underbelly',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1503;
INSERT INTO `dbc`.`map` SET 
    `id` = 1503,
    `directory` = 'ArtifactShamanElementalAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Deepholm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 268,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1504;
INSERT INTO `dbc`.`map` SET 
    `id` = 1504,
    `directory` = 'BlackrookHoldArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Black Rook Hold Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 413,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1505;
INSERT INTO `dbc`.`map` SET 
    `id` = 1505,
    `directory` = 'NagrandArena2',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Nagrand Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 421,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1509;
INSERT INTO `dbc`.`map` SET 
    `id` = 1509,
    `directory` = 'BloodtotemCavernFelPhase',
    `MapName_Lang_enUS` = 'Bloodtotem Cavern - Fel Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1510;
INSERT INTO `dbc`.`map` SET 
    `id` = 1510,
    `directory` = 'BloodtotemCavernTaurenPhase',
    `MapName_Lang_enUS` = 'Bloodtotem Cavern - Tauren Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1511;
INSERT INTO `dbc`.`map` SET 
    `id` = 1511,
    `directory` = 'Artifact-WarriorFuryAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tideskorn Harbor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1512;
INSERT INTO `dbc`.`map` SET 
    `id` = 1512,
    `directory` = 'Artifact-PriestHunterOrderHall',
    `MapName_Lang_enUS` = 'Netherlight Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 406,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1513;
INSERT INTO `dbc`.`map` SET 
    `id` = 1513,
    `directory` = 'Artifact-MageOrderHall',
    `MapName_Lang_enUS` = 'Hall of the Guardian',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 410,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1514;
INSERT INTO `dbc`.`map` SET 
    `id` = 1514,
    `directory` = 'Artifact-MonkOrderHall',
    `MapName_Lang_enUS` = 'The Wandering Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 393,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1515;
INSERT INTO `dbc`.`map` SET 
    `id` = 1515,
    `directory` = 'HulnHighmountain',
    `MapName_Lang_enUS` = 'Huln''s War',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1516;
INSERT INTO `dbc`.`map` SET 
    `id` = 1516,
    `directory` = 'SuramarCatacombsDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Arcway',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 402,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1517;
INSERT INTO `dbc`.`map` SET 
    `id` = 1517,
    `directory` = 'StormheimPrescenarioWindrunner',
    `MapName_Lang_enUS` = 'Stormheim Prescenario Windrunner',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1518;
INSERT INTO `dbc`.`map` SET 
    `id` = 1518,
    `directory` = 'StormheimPrescenarioSkyfire',
    `MapName_Lang_enUS` = 'Stormheim Prescenario Skyfire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1519;
INSERT INTO `dbc`.`map` SET 
    `id` = 1519,
    `directory` = 'ArtifactsDemonHunterOrderHall',
    `MapName_Lang_enUS` = 'The Fel Hammer',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1520;
INSERT INTO `dbc`.`map` SET 
    `id` = 1520,
    `directory` = 'NightmareRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'The Emerald Nightmare',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 400,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1522;
INSERT INTO `dbc`.`map` SET 
    `id` = 1522,
    `directory` = 'ArtifactWarlockOrderHallScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Dreadscar Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1523;
INSERT INTO `dbc`.`map` SET 
    `id` = 1523,
    `directory` = 'MardumScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Defense of the Fel Hammer Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1526;
INSERT INTO `dbc`.`map` SET 
    `id` = 1526,
    `directory` = 'Artifact-WhiteTigerTempleAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Temple of the White Tiger',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 334,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1527;
INSERT INTO `dbc`.`map` SET 
    `id` = 1527,
    `directory` = 'HighMountain',
    `MapName_Lang_enUS` = 'High Mountain Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1528;
INSERT INTO `dbc`.`map` SET 
    `id` = 1528,
    `directory` = 'Artifact-SkywallAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Skywall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1529;
INSERT INTO `dbc`.`map` SET 
    `id` = 1529,
    `directory` = 'KarazhanScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Karazhan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1530;
INSERT INTO `dbc`.`map` SET 
    `id` = 1530,
    `directory` = 'SuramarRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'The Nighthold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 412,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1532;
INSERT INTO `dbc`.`map` SET 
    `id` = 1532,
    `directory` = 'HighMountainMesa',
    `MapName_Lang_enUS` = 'High Mountain Mesa Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1533;
INSERT INTO `dbc`.`map` SET 
    `id` = 1533,
    `directory` = 'Artifact-KarazhanAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Karazhan Catacombs',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1534;
INSERT INTO `dbc`.`map` SET 
    `id` = 1534,
    `directory` = 'Artifact-DefenseofMoongladeScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Moonglade',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1535;
INSERT INTO `dbc`.`map` SET 
    `id` = 1535,
    `directory` = 'DefenseofMoongladeScenario',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Moonglade',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1536;
INSERT INTO `dbc`.`map` SET 
    `id` = 1536,
    `directory` = 'UrsocsLairScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Ursocs Lair',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 397,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1537;
INSERT INTO `dbc`.`map` SET 
    `id` = 1537,
    `directory` = 'BoostExperience',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'zzOLD - Boost Experience',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1538;
INSERT INTO `dbc`.`map` SET 
    `id` = 1538,
    `directory` = 'Karazhan Scenario',
    `MapName_Lang_enUS` = 'test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1539;
INSERT INTO `dbc`.`map` SET 
    `id` = 1539,
    `directory` = 'Artifact-AcquisitionArmsHolyShadow',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tirisfal Glades',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1540;
INSERT INTO `dbc`.`map` SET 
    `id` = 1540,
    `directory` = 'Artifact-Dreamway',
    `MapName_Lang_enUS` = 'Emerald Dreamway',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 418,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1541;
INSERT INTO `dbc`.`map` SET 
    `id` = 1541,
    `directory` = 'Artifact-TerraceofEndlessSpringAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Terrace of Endless Spring',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 321,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1544;
INSERT INTO `dbc`.`map` SET 
    `id` = 1544,
    `directory` = 'LegionVioletHoldDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Assault on Violet Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 420,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1545;
INSERT INTO `dbc`.`map` SET 
    `id` = 1545,
    `directory` = 'Artifact-Acquisition-CombatResto',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Azsuna',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1547;
INSERT INTO `dbc`.`map` SET 
    `id` = 1547,
    `directory` = 'Artifacts-CombatAcquisitionShip',
    `MapName_Lang_enUS` = 'Artifact - Combat - Acquisition Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1549;
INSERT INTO `dbc`.`map` SET 
    `id` = 1549,
    `directory` = 'TechTestSeamlessWorldTransitionA',
    `MapName_Lang_enUS` = 'Tech Test - Seamless World Transition A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1550;
INSERT INTO `dbc`.`map` SET 
    `id` = 1550,
    `directory` = 'TechTestSeamlessWorldTransitionB',
    `MapName_Lang_enUS` = 'Tech Test - Seamless World Transition B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1552;
INSERT INTO `dbc`.`map` SET 
    `id` = 1552,
    `directory` = 'ValsharahArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Ashamane''s Fall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 417,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1553;
INSERT INTO `dbc`.`map` SET 
    `id` = 1553,
    `directory` = 'Artifact-Acquisition-Underlight',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gloaming Reef',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1554;
INSERT INTO `dbc`.`map` SET 
    `id` = 1554,
    `directory` = 'BoostExperience2',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '7.0 Boost Experience - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1555;
INSERT INTO `dbc`.`map` SET 
    `id` = 1555,
    `directory` = 'TransportBoostExperienceAllianceGunship',
    `MapName_Lang_enUS` = 'zzOLD - Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1556;
INSERT INTO `dbc`.`map` SET 
    `id` = 1556,
    `directory` = 'TransportBoostExperienceHordeGunship',
    `MapName_Lang_enUS` = 'zzOLD - Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1557;
INSERT INTO `dbc`.`map` SET 
    `id` = 1557,
    `directory` = 'BoostExperience2Horde',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '7.0 Boost Experience - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1559;
INSERT INTO `dbc`.`map` SET 
    `id` = 1559,
    `directory` = 'TransportBoostExperienceHordeGunship2',
    `MapName_Lang_enUS` = '7.0 Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1560;
INSERT INTO `dbc`.`map` SET 
    `id` = 1560,
    `directory` = 'TransportBoostExperienceAllianceGunship2',
    `MapName_Lang_enUS` = '7.0 Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1561;
INSERT INTO `dbc`.`map` SET 
    `id` = 1561,
    `directory` = 'TechTestCosmeticParentPerformance',
    `MapName_Lang_enUS` = 'Tech Test - Cosmetic Parent Performance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1571;
INSERT INTO `dbc`.`map` SET 
    `id` = 1571,
    `directory` = 'SuramarCityDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Court of Stars',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 419,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1572;
INSERT INTO `dbc`.`map` SET 
    `id` = 1572,
    `directory` = 'MaelstromShamanHubIntroScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1579;
INSERT INTO `dbc`.`map` SET 
    `id` = 1579,
    `directory` = 'UdluarScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Ulduar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1580;
INSERT INTO `dbc`.`map` SET 
    `id` = 1580,
    `directory` = 'MaelstromTitanScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1582;
INSERT INTO `dbc`.`map` SET 
    `id` = 1582,
    `directory` = 'Artifact�DalaranVaultAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Delete',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1583;
INSERT INTO `dbc`.`map` SET 
    `id` = 1583,
    `directory` = 'Artifact-DalaranVaultAcquisition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Nexus Vault',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1584;
INSERT INTO `dbc`.`map` SET 
    `id` = 1584,
    `directory` = 'JulienTestLand-DevOnly',
    `MapName_Lang_enUS` = 'Julien Test Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1586;
INSERT INTO `dbc`.`map` SET 
    `id` = 1586,
    `directory` = 'AssualtOnStormwind',
    `MapName_Lang_enUS` = 'Assault on Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1020,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1588;
INSERT INTO `dbc`.`map` SET 
    `id` = 1588,
    `directory` = 'DevMapA',
    `MapName_Lang_enUS` = 'Dev Map - A - Jared Coulston',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1589;
INSERT INTO `dbc`.`map` SET 
    `id` = 1589,
    `directory` = 'DevMapB',
    `MapName_Lang_enUS` = 'Dev Map - B - Nathaniel Chapman',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = '- NO DESCRIPTION -',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = '- NO DESCRIPTION -',
    `MapDescription1_Lang_Mask` = 16712190,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1590;
INSERT INTO `dbc`.`map` SET 
    `id` = 1590,
    `directory` = 'DevMapC',
    `MapName_Lang_enUS` = 'Dev Map - C - Julien Tremblay',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1591;
INSERT INTO `dbc`.`map` SET 
    `id` = 1591,
    `directory` = 'DevMapD',
    `MapName_Lang_enUS` = 'Dev Map - D - PotT',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1592;
INSERT INTO `dbc`.`map` SET 
    `id` = 1592,
    `directory` = 'DevMapE',
    `MapName_Lang_enUS` = 'Dev Map - E',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1593;
INSERT INTO `dbc`.`map` SET 
    `id` = 1593,
    `directory` = 'DevMapF',
    `MapName_Lang_enUS` = 'Dev Map - F',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1594;
INSERT INTO `dbc`.`map` SET 
    `id` = 1594,
    `directory` = 'DevMapG',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The MOTHERLODE!!',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 120,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1599;
INSERT INTO `dbc`.`map` SET 
    `id` = 1599,
    `directory` = 'ArtifactRestoAcqusition',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Nordrassil',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1600;
INSERT INTO `dbc`.`map` SET 
    `id` = 1600,
    `directory` = 'ArtifactThroneoftheTides',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Throne of the Tides',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1602;
INSERT INTO `dbc`.`map` SET 
    `id` = 1602,
    `directory` = 'SkywallDungeon_OrderHall',
    `MapName_Lang_enUS` = 'Artifact - The Vortex Pinnacle - Shaman Order Hall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 259,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1603;
INSERT INTO `dbc`.`map` SET 
    `id` = 1603,
    `directory` = 'AbyssalMaw_Interior_Scenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Throne of the Tides Scenario(DELETE)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 255,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -5585.87,
    `CorpseY` = 5401.65,
    `time_of_day_override` = -1,
    `expansion_id` = 3;

DELETE FROM `dbc`.`map` WHERE `id` = 1604;
INSERT INTO `dbc`.`map` SET 
    `id` = 1604,
    `directory` = 'Artifact-PortalWorldNaskora',
    `MapName_Lang_enUS` = 'Artifact - Order Campaign - Portal World Niskara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 408,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1605;
INSERT INTO `dbc`.`map` SET 
    `id` = 1605,
    `directory` = 'FirelandsArtifact',
    `MapName_Lang_enUS` = 'Firelands_Artifact',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1607;
INSERT INTO `dbc`.`map` SET 
    `id` = 1607,
    `directory` = 'ArtifactAcquisitionSubtlety',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Acquisition - Subtlety',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 378,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1608;
INSERT INTO `dbc`.`map` SET 
    `id` = 1608,
    `directory` = 'Hyjal Instance',
    `MapName_Lang_enUS` = 'Hyjal War of the Ancients Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1609;
INSERT INTO `dbc`.`map` SET 
    `id` = 1609,
    `directory` = 'AcquisitionTempleofstorms',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Temple of Storms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1610;
INSERT INTO `dbc`.`map` SET 
    `id` = 1610,
    `directory` = 'Artifact-SerenityLegionScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Serenity Legion Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1611;
INSERT INTO `dbc`.`map` SET 
    `id` = 1611,
    `directory` = 'DeathKnightCampaign-LightsHopeChapel',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Death Knight Campaign - Light''s Hope Chapel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1612;
INSERT INTO `dbc`.`map` SET 
    `id` = 1612,
    `directory` = 'TheRuinsofFalanaar',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Ruins of Falanaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 417,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1616;
INSERT INTO `dbc`.`map` SET 
    `id` = 1616,
    `directory` = 'Faronaar',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Faronaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1617;
INSERT INTO `dbc`.`map` SET 
    `id` = 1617,
    `directory` = 'DeathKnightCampaign-Undercity',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Death Knight Campaign - Undercity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1618;
INSERT INTO `dbc`.`map` SET 
    `id` = 1618,
    `directory` = 'DeathKnightCampaign-ScarletMonastery',
    `MapName_Lang_enUS` = 'Death Knight Campaign - Scarlet Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1620;
INSERT INTO `dbc`.`map` SET 
    `id` = 1620,
    `directory` = 'ArtifactStormwind',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1621;
INSERT INTO `dbc`.`map` SET 
    `id` = 1621,
    `directory` = 'BlackTemple-Legion',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Black Temple - Legion',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 215,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1622;
INSERT INTO `dbc`.`map` SET 
    `id` = 1622,
    `directory` = 'IllidanTemp',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Telogrus Rift Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1623;
INSERT INTO `dbc`.`map` SET 
    `id` = 1623,
    `directory` = 'MageCampaign-TheOculus',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Mage Campaign - The Oculus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 227,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1624;
INSERT INTO `dbc`.`map` SET 
    `id` = 1624,
    `directory` = 'BattleofExodar',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Battle of Exodar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1625;
INSERT INTO `dbc`.`map` SET 
    `id` = 1625,
    `directory` = 'TrialoftheSerpent',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Trial of the Serpent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1626;
INSERT INTO `dbc`.`map` SET 
    `id` = 1626,
    `directory` = 'TheCollapseSuramarScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Collapse - Suramar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1627;
INSERT INTO `dbc`.`map` SET 
    `id` = 1627,
    `directory` = 'FelHammerDHScenario',
    `MapName_Lang_enUS` = 'Fel Hammer DH Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1628;
INSERT INTO `dbc`.`map` SET 
    `id` = 1628,
    `directory` = 'Transport251513',
    `MapName_Lang_enUS` = 'Transport: Alliance Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1629;
INSERT INTO `dbc`.`map` SET 
    `id` = 1629,
    `directory` = 'NetherlightTemplePrison',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Netherlight Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 406,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1630;
INSERT INTO `dbc`.`map` SET 
    `id` = 1630,
    `directory` = 'TolBarad1',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tol Barad',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 265,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1632;
INSERT INTO `dbc`.`map` SET 
    `id` = 1632,
    `directory` = 'TheArcwaySuramarScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Arcway - Suramar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 402,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1637;
INSERT INTO `dbc`.`map` SET 
    `id` = 1637,
    `directory` = 'TransportAllianceShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Alliance Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1638;
INSERT INTO `dbc`.`map` SET 
    `id` = 1638,
    `directory` = 'TransportHordeShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Horde Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1639;
INSERT INTO `dbc`.`map` SET 
    `id` = 1639,
    `directory` = 'TransportKvaldirShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Kvaldir Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1642;
INSERT INTO `dbc`.`map` SET 
    `id` = 1642,
    `directory` = 'Zandalar',
    `MapName_Lang_enUS` = 'Zandalar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 552,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1643;
INSERT INTO `dbc`.`map` SET 
    `id` = 1643,
    `directory` = 'KulTiras',
    `MapName_Lang_enUS` = 'Kul Tiras',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 551,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1644;
INSERT INTO `dbc`.`map` SET 
    `id` = 1644,
    `directory` = 'PlunderIsle',
    `MapName_Lang_enUS` = 'Plunder Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1645;
INSERT INTO `dbc`.`map` SET 
    `id` = 1645,
    `directory` = 'Islands',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Crescent Isle (Islands Prototype)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1646;
INSERT INTO `dbc`.`map` SET 
    `id` = 1646,
    `directory` = 'BlackRookSenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Black Rook Hold [Scenario]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1647;
INSERT INTO `dbc`.`map` SET 
    `id` = 1647,
    `directory` = 'VoljinsFuneralPyre',
    `MapName_Lang_enUS` = 'Vol''jin''s Funeral Pyre',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1648;
INSERT INTO `dbc`.`map` SET 
    `id` = 1648,
    `directory` = 'Helhiem2',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Trial of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 422,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1649;
INSERT INTO `dbc`.`map` SET 
    `id` = 1649,
    `directory` = 'Transport254124',
    `MapName_Lang_enUS` = 'Transport: Horde Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1650;
INSERT INTO `dbc`.`map` SET 
    `id` = 1650,
    `directory` = 'Acherus',
    `MapName_Lang_enUS` = 'Legion Command Ship Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1651;
INSERT INTO `dbc`.`map` SET 
    `id` = 1651,
    `directory` = 'Karazahn1',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Return to Karazhan',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 3457,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 423,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -11110.4,
    `CorpseY` = -2004.06,
    `time_of_day_override` = -1,
    `expansion_id` = 6,
    `max_players` = 10;

DELETE FROM `dbc`.`map` WHERE `id` = 1653;
INSERT INTO `dbc`.`map` SET 
    `id` = 1653,
    `directory` = 'LightsHeart',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Great Dark Beyond',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1655;
INSERT INTO `dbc`.`map` SET 
    `id` = 1655,
    `directory` = '8DevLand',
    `MapName_Lang_enUS` = '8.0 Dev Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 146,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1657;
INSERT INTO `dbc`.`map` SET 
    `id` = 1657,
    `directory` = 'BladesEdgeArena2',
    `MapName_Lang_enUS` = 'zzOldBlade''s Edge Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 218,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1658;
INSERT INTO `dbc`.`map` SET 
    `id` = 1658,
    `directory` = 'EnvironmentLandDevOnly',
    `MapName_Lang_enUS` = 'Environment Art Land - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1661;
INSERT INTO `dbc`.`map` SET 
    `id` = 1661,
    `directory` = 'Gnoll Revolution',
    `MapName_Lang_enUS` = '[DEV] Demo Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 191,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1662;
INSERT INTO `dbc`.`map` SET 
    `id` = 1662,
    `directory` = 'SuramarEndScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Suramar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1663;
INSERT INTO `dbc`.`map` SET 
    `id` = 1663,
    `directory` = 'DungeonBlockout',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Dungeon Blockout',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1666;
INSERT INTO `dbc`.`map` SET 
    `id` = 1666,
    `directory` = 'BrokenShoreIntro',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Assault on Broken Shore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1667;
INSERT INTO `dbc`.`map` SET 
    `id` = 1667,
    `directory` = 'LegionShipVertical',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1668;
INSERT INTO `dbc`.`map` SET 
    `id` = 1668,
    `directory` = 'LegionShipHorizontal',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1669;
INSERT INTO `dbc`.`map` SET 
    `id` = 1669,
    `directory` = 'Argus 1',
    `MapName_Lang_enUS` = 'Argus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 432,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1670;
INSERT INTO `dbc`.`map` SET 
    `id` = 1670,
    `directory` = 'BrokenshorePristine',
    `MapName_Lang_enUS` = 'Broken Shore (Delete)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1671;
INSERT INTO `dbc`.`map` SET 
    `id` = 1671,
    `directory` = 'BrokenShorePrepatch',
    `MapName_Lang_enUS` = 'Broken Shore - Prepatch 7.2 (Backup)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1672;
INSERT INTO `dbc`.`map` SET 
    `id` = 1672,
    `directory` = 'bladesedgearena2b',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Blade''s Edge Arena',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 3702,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 424,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1673;
INSERT INTO `dbc`.`map` SET 
    `id` = 1673,
    `directory` = 'EyeofEternityScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1675;
INSERT INTO `dbc`.`map` SET 
    `id` = 1675,
    `directory` = 'WinterAB',
    `MapName_Lang_enUS` = 'Winter AB_old',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1676;
INSERT INTO `dbc`.`map` SET 
    `id` = 1676,
    `directory` = 'TombofSargerasRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Tomb of Sargeras',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 427,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1677;
INSERT INTO `dbc`.`map` SET 
    `id` = 1677,
    `directory` = 'TombofSargerasDeungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Cathedral of Eternal Night',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 426,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1678;
INSERT INTO `dbc`.`map` SET 
    `id` = 1678,
    `directory` = 'ABPhase1',
    `MapName_Lang_enUS` = 'AB Phase 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1679;
INSERT INTO `dbc`.`map` SET 
    `id` = 1679,
    `directory` = 'ABPhase2',
    `MapName_Lang_enUS` = 'AB Phase 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1680;
INSERT INTO `dbc`.`map` SET 
    `id` = 1680,
    `directory` = 'ABPhase3',
    `MapName_Lang_enUS` = 'AB Phase 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1681;
INSERT INTO `dbc`.`map` SET 
    `id` = 1681,
    `directory` = 'ABWinter',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin Winter',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 425,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1682;
INSERT INTO `dbc`.`map` SET 
    `id` = 1682,
    `directory` = 'ArtifactsDemonHunterOrderHallPhase',
    `MapName_Lang_enUS` = 'The Fel Hammer Terrain Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1683;
INSERT INTO `dbc`.`map` SET 
    `id` = 1683,
    `directory` = 'ArtifactGnomeregan',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Gnomeregan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 193,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1684;
INSERT INTO `dbc`.`map` SET 
    `id` = 1684,
    `directory` = 'dreadscarriftwarlockplatform',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Dread Scar Rift - Warlock Scenario Platform',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1685;
INSERT INTO `dbc`.`map` SET 
    `id` = 1685,
    `directory` = 'AITestMap8',
    `MapName_Lang_enUS` = 'AI Test Map 8',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1686;
INSERT INTO `dbc`.`map` SET 
    `id` = 1686,
    `directory` = 'AITestMap8b',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'AI Test - Arathi Basin',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 8526,
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1687;
INSERT INTO `dbc`.`map` SET 
    `id` = 1687,
    `directory` = 'WailingCavernsPetBattle',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Wailing Caverns',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 143,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1688;
INSERT INTO `dbc`.`map` SET 
    `id` = 1688,
    `directory` = 'DeadminesPetBattle',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Deadmines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 142,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1689;
INSERT INTO `dbc`.`map` SET 
    `id` = 1689,
    `directory` = 'EyeofEternityMageClassMount',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Mage class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1690;
INSERT INTO `dbc`.`map` SET 
    `id` = 1690,
    `directory` = 'SnakeCave',
    `MapName_Lang_enUS` = 'Snake Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1691;
INSERT INTO `dbc`.`map` SET 
    `id` = 1691,
    `directory` = 'CookingImpossible',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Cooking: Impossible',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1692;
INSERT INTO `dbc`.`map` SET 
    `id` = 1692,
    `directory` = 'PitofSaronDeathKnight',
    `MapName_Lang_enUS` = 'Pit of Saron - Death Knight Campaign',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 252,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `CorpseX` = 5592.06,
    `CorpseY` = 2010.27,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1693;
INSERT INTO `dbc`.`map` SET 
    `id` = 1693,
    `directory` = 'MardumScenarioClientScene',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Stormstout Brewery - Monk Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 318,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1694;
INSERT INTO `dbc`.`map` SET 
    `id` = 1694,
    `directory` = 'GnomereganPetBattle',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gnomeregan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 193,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1695;
INSERT INTO `dbc`.`map` SET 
    `id` = 1695,
    `directory` = 'BrokenShoreBattleshipFinale',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Battleship: Ruin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1696;
INSERT INTO `dbc`.`map` SET 
    `id` = 1696,
    `directory` = 'LegionCommandCenter',
    `MapName_Lang_enUS` = 'Legion - Command Center',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1697;
INSERT INTO `dbc`.`map` SET 
    `id` = 1697,
    `directory` = 'LegionSpiderCave',
    `MapName_Lang_enUS` = 'Legion - Legion Spider Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1698;
INSERT INTO `dbc`.`map` SET 
    `id` = 1698,
    `directory` = 'ArtifactAcquisitionTank',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Acquisition - Tank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1699;
INSERT INTO `dbc`.`map` SET 
    `id` = 1699,
    `directory` = 'LegionFelCave',
    `MapName_Lang_enUS` = 'Legion - Legion Fel Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1700;
INSERT INTO `dbc`.`map` SET 
    `id` = 1700,
    `directory` = 'LegionFelFirenovaArea',
    `MapName_Lang_enUS` = 'Legion - Legion Fel Firenova Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1701;
INSERT INTO `dbc`.`map` SET 
    `id` = 1701,
    `directory` = 'LegionBarracks',
    `MapName_Lang_enUS` = 'Legion - Legion Barracks',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1702;
INSERT INTO `dbc`.`map` SET 
    `id` = 1702,
    `directory` = 'ArtifactHighmountainDualBoss',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Artifact - Highmountain - Dual Boss',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1703;
INSERT INTO `dbc`.`map` SET 
    `id` = 1703,
    `directory` = 'HallsofValorScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halls of Valor - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1704;
INSERT INTO `dbc`.`map` SET 
    `id` = 1704,
    `directory` = 'LegionShipHorizontalValsharah',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal - Valsharah',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1705;
INSERT INTO `dbc`.`map` SET 
    `id` = 1705,
    `directory` = 'LegionShipHorizontalAzsuna',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal - Azsuna',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1706;
INSERT INTO `dbc`.`map` SET 
    `id` = 1706,
    `directory` = 'LegionShipHorizontalHighMountain',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical - HighMountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1707;
INSERT INTO `dbc`.`map` SET 
    `id` = 1707,
    `directory` = 'LegionShipHorizontalStormheim',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical - Stormheim',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1708;
INSERT INTO `dbc`.`map` SET 
    `id` = 1708,
    `directory` = 'StratholmePaladinClassMount',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Stratholme - Paladin class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 101,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1710;
INSERT INTO `dbc`.`map` SET 
    `id` = 1710,
    `directory` = 'BlackRookHoldArtifactChallenge',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Black Rook Hold - Artifact Challenge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 404,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1711;
INSERT INTO `dbc`.`map` SET 
    `id` = 1711,
    `directory` = 'SouthseaPirateShip715BoatHoliday',
    `MapName_Lang_enUS` = 'Alliance Submarine (7.1.5 Boat Holiday)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1712;
INSERT INTO `dbc`.`map` SET 
    `id` = 1712,
    `directory` = 'ArgusRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Antorus, the Burning Throne',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 431,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1260,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1714;
INSERT INTO `dbc`.`map` SET 
    `id` = 1714,
    `directory` = 'HallsOfValorWarriorClassMount',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halls Of Valor - Warrior class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1715;
INSERT INTO `dbc`.`map` SET 
    `id` = 1715,
    `directory` = 'BlackrockMountainBrawl',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Battle for Blackrock Mountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 189,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1716;
INSERT INTO `dbc`.`map` SET 
    `id` = 1716,
    `directory` = 'brokenshorewardentower',
    `MapName_Lang_enUS` = 'Broken Shore Mage Tower',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1717;
INSERT INTO `dbc`.`map` SET 
    `id` = 1717,
    `directory` = 'AnimPlayground',
    `MapName_Lang_enUS` = 'Anim Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 182,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1718;
INSERT INTO `dbc`.`map` SET 
    `id` = 1718,
    `directory` = 'Nazjatar',
    `MapName_Lang_enUS` = 'Nazjatar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 571,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1719;
INSERT INTO `dbc`.`map` SET 
    `id` = 1719,
    `directory` = 'warlockmountscenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Dread Scar Rift - Warlock Mount Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 401,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1723;
INSERT INTO `dbc`.`map` SET 
    `id` = 1723,
    `directory` = 'ColdridgeValley',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Coldridge Valley',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1726;
INSERT INTO `dbc`.`map` SET 
    `id` = 1726,
    `directory` = 'RaceTrackBG',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = '[TEMP] RaceTrackBG',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 376,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1728;
INSERT INTO `dbc`.`map` SET 
    `id` = 1728,
    `directory` = 'HallsofValorHunterScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halls of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 415,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1729;
INSERT INTO `dbc`.`map` SET 
    `id` = 1729,
    `directory` = 'EyeofEternityMageClassMountShort',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Mage class Mount (Shorter Version)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1730;
INSERT INTO `dbc`.`map` SET 
    `id` = 1730,
    `directory` = 'ShrineofAvianaDefenseScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Shrine of Aviana Defense - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1731;
INSERT INTO `dbc`.`map` SET 
    `id` = 1731,
    `directory` = 'DruidMountFinaleScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Druid Mount Finale - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1732;
INSERT INTO `dbc`.`map` SET 
    `id` = 1732,
    `directory` = 'FelwingLedgeDemonHunterClassMount',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Felwing Ledge - Demon Hunter class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 396,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1733;
INSERT INTO `dbc`.`map` SET 
    `id` = 1733,
    `directory` = 'AzerothsWarningScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Azeroth''s Warning Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1734;
INSERT INTO `dbc`.`map` SET 
    `id` = 1734,
    `directory` = 'ThroneoftheFourWindsShamanClassMounts',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Throne of the Four Winds - Shaman class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 271,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1735;
INSERT INTO `dbc`.`map` SET 
    `id` = 1735,
    `directory` = 'DKMountScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Frozen Wastes',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1736;
INSERT INTO `dbc`.`map` SET 
    `id` = 1736,
    `directory` = 'RubySanctumDKMountScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Ruby Sanctum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 254,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1737;
INSERT INTO `dbc`.`map` SET 
    `id` = 1737,
    `directory` = 'AkazamarakHatScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Pocket Dimension Akazamzaraks Hat Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1738;
INSERT INTO `dbc`.`map` SET 
    `id` = 1738,
    `directory` = 'LostGlacierDKMountScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Lost Glacier',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1739;
INSERT INTO `dbc`.`map` SET 
    `id` = 1739,
    `directory` = 'AITestMapABDebug',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'AI Test Map - Arathi Basin - Debug Version',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 8526,
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 183,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1740;
INSERT INTO `dbc`.`map` SET 
    `id` = 1740,
    `directory` = 'AITestMapWSGDebug',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'AI Test - Warsong Gulch',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 8526,
    `map_description_0_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 122,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1741;
INSERT INTO `dbc`.`map` SET 
    `id` = 1741,
    `directory` = 'ExodarDalaran',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1744;
INSERT INTO `dbc`.`map` SET 
    `id` = 1744,
    `directory` = 'MogWeek',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Trial of Style',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 224,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1746;
INSERT INTO `dbc`.`map` SET 
    `id` = 1746,
    `directory` = 'ArcatrazScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tempest Keep: The Arcatraz',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 206,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1747;
INSERT INTO `dbc`.`map` SET 
    `id` = 1747,
    `directory` = 'animationplayground',
    `MapName_Lang_enUS` = 'Animation Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 270,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1749;
INSERT INTO `dbc`.`map` SET 
    `id` = 1749,
    `directory` = 'WarfrontBarrens',
    `MapName_Lang_enUS` = 'Warfront Barrens',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1750;
INSERT INTO `dbc`.`map` SET 
    `id` = 1750,
    `directory` = 'Azuremyst Isle (7.3 Intro)',
    `MapName_Lang_enUS` = 'Azuremyst Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1751;
INSERT INTO `dbc`.`map` SET 
    `id` = 1751,
    `directory` = 'AllianceBattleship73Intro',
    `MapName_Lang_enUS` = 'Alliance Battleship (7.3 Intro)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1752;
INSERT INTO `dbc`.`map` SET 
    `id` = 1752,
    `directory` = 'SunstriderShip73Intro',
    `MapName_Lang_enUS` = 'Sunstrider Battleship (7.3 Intro)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1753;
INSERT INTO `dbc`.`map` SET 
    `id` = 1753,
    `directory` = 'ArgusDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Seat of the Triumvirate',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 430,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1754;
INSERT INTO `dbc`.`map` SET 
    `id` = 1754,
    `directory` = 'PirateTownDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Freehold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 547,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 360,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1756;
INSERT INTO `dbc`.`map` SET 
    `id` = 1756,
    `directory` = 'ChromieScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Deaths of Chromie',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 428,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1759;
INSERT INTO `dbc`.`map` SET 
    `id` = 1759,
    `directory` = 'Transport_WarfrontBarrensGunship',
    `MapName_Lang_enUS` = 'Transport: WarfrontBarrensGunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1760;
INSERT INTO `dbc`.`map` SET 
    `id` = 1760,
    `directory` = 'LordaeronScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Lordaeron',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1762;
INSERT INTO `dbc`.`map` SET 
    `id` = 1762,
    `directory` = 'CityofGoldInteriorDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Kings'' Rest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 439,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1763;
INSERT INTO `dbc`.`map` SET 
    `id` = 1763,
    `directory` = 'CityofGoldExteriorDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Atal''Dazar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 438,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1764;
INSERT INTO `dbc`.`map` SET 
    `id` = 1764,
    `directory` = 'EndlessHallsScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Endless Halls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 330,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1765;
INSERT INTO `dbc`.`map` SET 
    `id` = 1765,
    `directory` = 'WarfrontsPrototype',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Warfronts Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1771;
INSERT INTO `dbc`.`map` SET 
    `id` = 1771,
    `directory` = 'KulTirasPrison',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Tol Dagor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 550,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1773;
INSERT INTO `dbc`.`map` SET 
    `id` = 1773,
    `directory` = 'VoildElf',
    `MapName_Lang_enUS` = 'Shadow of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1774;
INSERT INTO `dbc`.`map` SET 
    `id` = 1774,
    `directory` = 'LightforgedDraenei',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Forge of Aeons',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1775;
INSERT INTO `dbc`.`map` SET 
    `id` = 1775,
    `directory` = 'HighmountainMaw',
    `MapName_Lang_enUS` = 'Maw of N''Zoth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1776;
INSERT INTO `dbc`.`map` SET 
    `id` = 1776,
    `directory` = 'OrgrimmarEmbassy',
    `MapName_Lang_enUS` = 'Horde Battleship - The Banshee''s Wail',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1778;
INSERT INTO `dbc`.`map` SET 
    `id` = 1778,
    `directory` = 'ArgusRifts',
    `MapName_Lang_enUS` = 'Level Design Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1779;
INSERT INTO `dbc`.`map` SET 
    `id` = 1779,
    `directory` = 'Argus_Rifts',
    `MapName_Lang_enUS` = 'Invasion Points',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1780;
INSERT INTO `dbc`.`map` SET 
    `id` = 1780,
    `directory` = 'Islands8',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Islands LD Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1782;
INSERT INTO `dbc`.`map` SET 
    `id` = 1782,
    `directory` = 'SilithusBG',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Seething Strand',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1784;
INSERT INTO `dbc`.`map` SET 
    `id` = 1784,
    `directory` = 'PA_SMALL_CAVE01_Pristine_A',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Hozen [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1785;
INSERT INTO `dbc`.`map` SET 
    `id` = 1785,
    `directory` = 'Islands_Pirateship_Plank',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Pirateship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1786;
INSERT INTO `dbc`.`map` SET 
    `id` = 1786,
    `directory` = 'Islands_Transport_Horde_Zeppelin',
    `MapName_Lang_enUS` = '8.0 Islands - Zeppelin - Goblin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1787;
INSERT INTO `dbc`.`map` SET 
    `id` = 1787,
    `directory` = 'Islands_PA_Mogu_Crypt_07',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1788;
INSERT INTO `dbc`.`map` SET 
    `id` = 1788,
    `directory` = 'Islands_6AS_Cave_01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Primitve [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1789;
INSERT INTO `dbc`.`map` SET 
    `id` = 1789,
    `directory` = 'Islands_Saurok_Cave_Large',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Saurok - Large [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1795;
INSERT INTO `dbc`.`map` SET 
    `id` = 1795,
    `directory` = 'ShwayderLand',
    `MapName_Lang_enUS` = 'Vale of Eternal Blossoms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 327,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1802;
INSERT INTO `dbc`.`map` SET 
    `id` = 1802,
    `directory` = 'AzeriteBG',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = '8.0 BG Temp',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 245,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1803;
INSERT INTO `dbc`.`map` SET 
    `id` = 1803,
    `directory` = 'AzeriteBG1',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Seething Shore',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 436,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1804;
INSERT INTO `dbc`.`map` SET 
    `id` = 1804,
    `directory` = 'WarfrontsPrototype3',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Battle for Stromgarde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1805;
INSERT INTO `dbc`.`map` SET 
    `id` = 1805,
    `directory` = 'Islands_7HU_Transport_Alliance_Battleship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1806;
INSERT INTO `dbc`.`map` SET 
    `id` = 1806,
    `directory` = 'StormwindEmbassy',
    `MapName_Lang_enUS` = 'Alliance Battleship -  Wind''s Redemption',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1807;
INSERT INTO `dbc`.`map` SET 
    `id` = 1807,
    `directory` = 'Islands_6OR_Horde_Ship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1809;
INSERT INTO `dbc`.`map` SET 
    `id` = 1809,
    `directory` = 'MechagnomeIsland',
    `MapName_Lang_enUS` = 'Mechagnome Island',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1811;
INSERT INTO `dbc`.`map` SET 
    `id` = 1811,
    `directory` = 'QuestTraining',
    `MapName_Lang_enUS` = 'Quest Training',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1812;
INSERT INTO `dbc`.`map` SET 
    `id` = 1812,
    `directory` = 'SuramarNightborneUnlock',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Suramar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1813;
INSERT INTO `dbc`.`map` SET 
    `id` = 1813,
    `directory` = 'Islands801',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Un''gol Ruins (Islands 1)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1814;
INSERT INTO `dbc`.`map` SET 
    `id` = 1814,
    `directory` = 'Islands802',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Havenswood (Islands 2)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1815;
INSERT INTO `dbc`.`map` SET 
    `id` = 1815,
    `directory` = 'Silithus',
    `MapName_Lang_enUS` = 'Silithus Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1817;
INSERT INTO `dbc`.`map` SET 
    `id` = 1817,
    `directory` = 'SilithusPhase01',
    `MapName_Lang_enUS` = 'Silithus: The Wound',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1818;
INSERT INTO `dbc`.`map` SET 
    `id` = 1818,
    `directory` = 'SilvermoonCity',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Silvermoon City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1822;
INSERT INTO `dbc`.`map` SET 
    `id` = 1822,
    `directory` = 'BoralusDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Siege of Boralus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 542,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1825;
INSERT INTO `dbc`.`map` SET 
    `id` = 1825,
    `directory` = 'KulTirasArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Hook Point',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 545,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1839;
INSERT INTO `dbc`.`map` SET 
    `id` = 1839,
    `directory` = 'KarazanChess',
    `MapName_Lang_enUS` = 'Karazan Chess',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1840;
INSERT INTO `dbc`.`map` SET 
    `id` = 1840,
    `directory` = 'SunwellUnlockScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Sunwell',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 530,
    `CorpseX` = 12551.8,
    `CorpseY` = -6774.56,
    `time_of_day_override` = -1,
    `expansion_id` = 6,
    `max_players` = 25;

DELETE FROM `dbc`.`map` WHERE `id` = 1841;
INSERT INTO `dbc`.`map` SET 
    `id` = 1841,
    `directory` = 'UnderrotDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Underrot',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 553,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1844;
INSERT INTO `dbc`.`map` SET 
    `id` = 1844,
    `directory` = 'Islands_7FK_Forsaken_Ship03',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1845;
INSERT INTO `dbc`.`map` SET 
    `id` = 1845,
    `directory` = 'Islands_7VR_Vrykul_Ship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1846;
INSERT INTO `dbc`.`map` SET 
    `id` = 1846,
    `directory` = 'Islands_6HU_Transport_Cargoship',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - 6HU Cargoship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1847;
INSERT INTO `dbc`.`map` SET 
    `id` = 1847,
    `directory` = 'Dev Map  G',
    `MapName_Lang_enUS` = 'Dev Map - G',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1849;
INSERT INTO `dbc`.`map` SET 
    `id` = 1849,
    `directory` = 'Islands_ND_ICEBREAKER_SHIP_BG_TRANSPORT',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1850;
INSERT INTO `dbc`.`map` SET 
    `id` = 1850,
    `directory` = 'Islands_6HU_Transport_Buccaneer',
    `MapName_Lang_enUS` = '8.2.5 - MSEM - 1850',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1851;
INSERT INTO `dbc`.`map` SET 
    `id` = 1851,
    `directory` = 'Islands_7FK_Transport_Buccaneer',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - 7FK Buccaneer',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1852;
INSERT INTO `dbc`.`map` SET 
    `id` = 1852,
    `directory` = 'Islands_Horde_Submarine',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Horde - Submarine [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1853;
INSERT INTO `dbc`.`map` SET 
    `id` = 1853,
    `directory` = 'Islands_Alliance_Submarine',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1854;
INSERT INTO `dbc`.`map` SET 
    `id` = 1854,
    `directory` = 'Islands_7VS_Cavemicro03',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 7VS Cave Micro 03 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1855;
INSERT INTO `dbc`.`map` SET 
    `id` = 1855,
    `directory` = 'LightforgedVindicaar',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1856;
INSERT INTO `dbc`.`map` SET 
    `id` = 1856,
    `directory` = 'TransportAzeriteBGAllianceAirship',
    `MapName_Lang_enUS` = 'Transport: Azerite BG - Alliance Airship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1857;
INSERT INTO `dbc`.`map` SET 
    `id` = 1857,
    `directory` = 'TransportAzeriteBGHordeGunship',
    `MapName_Lang_enUS` = 'Transport: Azerite BG - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1860;
INSERT INTO `dbc`.`map` SET 
    `id` = 1860,
    `directory` = 'LightforgedDraeneiVindicaar',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1861;
INSERT INTO `dbc`.`map` SET 
    `id` = 1861,
    `directory` = 'NazmirRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Uldir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 548,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1862;
INSERT INTO `dbc`.`map` SET 
    `id` = 1862,
    `directory` = 'DrustvarDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Waycrest Manor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 437,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1863;
INSERT INTO `dbc`.`map` SET 
    `id` = 1863,
    `directory` = 'BLTestMap',
    `MapName_Lang_enUS` = 'BL - Test Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1864;
INSERT INTO `dbc`.`map` SET 
    `id` = 1864,
    `directory` = 'SeaPriestDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Shrine of the Storm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 543,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1865;
INSERT INTO `dbc`.`map` SET 
    `id` = 1865,
    `directory` = 'VoidElfHub',
    `MapName_Lang_enUS` = 'Telogrus Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1876;
INSERT INTO `dbc`.`map` SET 
    `id` = 1876,
    `directory` = 'WarfrontsArathi',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Warfronts Arathi - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1877;
INSERT INTO `dbc`.`map` SET 
    `id` = 1877,
    `directory` = 'SnakeDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Temple of Sethraliss',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 441,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1878;
INSERT INTO `dbc`.`map` SET 
    `id` = 1878,
    `directory` = 'BlackrockDepthsDarkIron',
    `MapName_Lang_enUS` = 'zzOLD_Blackrock Depths',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 9666,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1879;
INSERT INTO `dbc`.`map` SET 
    `id` = 1879,
    `directory` = 'rymoore',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Jorundall (Islands 7)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1880;
INSERT INTO `dbc`.`map` SET 
    `id` = 1880,
    `directory` = 'TitanIsland',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Titan Island - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1881;
INSERT INTO `dbc`.`map` SET 
    `id` = 1881,
    `directory` = 'Islands9',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Sinkhole - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1882;
INSERT INTO `dbc`.`map` SET 
    `id` = 1882,
    `directory` = 'Islands10',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Verdant Wilds (Islands 8)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1883;
INSERT INTO `dbc`.`map` SET 
    `id` = 1883,
    `directory` = 'Islands01',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Whispering Reef (Islands 10)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1884;
INSERT INTO `dbc`.`map` SET 
    `id` = 1884,
    `directory` = 'SiegeOfOrgrimmarZone',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar - Mag''har Orc Unlock Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 359,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1885;
INSERT INTO `dbc`.`map` SET 
    `id` = 1885,
    `directory` = 'Islands803',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - White Mesa - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1886;
INSERT INTO `dbc`.`map` SET 
    `id` = 1886,
    `directory` = 'Islands_7VR_Swamp_Prototype',
    `MapName_Lang_enUS` = '8.0 Islands - Swamp - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1887;
INSERT INTO `dbc`.`map` SET 
    `id` = 1887,
    `directory` = 'Islands_7VR_Swamp_Prototype2',
    `MapName_Lang_enUS` = '8.0 Islands - Swamp - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1888;
INSERT INTO `dbc`.`map` SET 
    `id` = 1888,
    `directory` = 'Islands888',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands Josh',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1889;
INSERT INTO `dbc`.`map` SET 
    `id` = 1889,
    `directory` = 'Islands666',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Katalina - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 1890;
INSERT INTO `dbc`.`map` SET 
    `id` = 1890,
    `directory` = 'AssassinsScenarioDRU',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Assassins Scenario - Drustvar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1891;
INSERT INTO `dbc`.`map` SET 
    `id` = 1891,
    `directory` = 'Islands805',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Cursed - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1892;
INSERT INTO `dbc`.`map` SET 
    `id` = 1892,
    `directory` = 'Islands11',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Rotting Mire (Islands 9)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1893;
INSERT INTO `dbc`.`map` SET 
    `id` = 1893,
    `directory` = 'NecromancyIsland',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Dread Chain (Islands 4)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1895;
INSERT INTO `dbc`.`map` SET 
    `id` = 1895,
    `directory` = 'Islands1106',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - lost World Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1896;
INSERT INTO `dbc`.`map` SET 
    `id` = 1896,
    `directory` = 'Islands420',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Wonderland - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1897;
INSERT INTO `dbc`.`map` SET 
    `id` = 1897,
    `directory` = 'Islands24',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Molten Cay (Islands 6)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1898;
INSERT INTO `dbc`.`map` SET 
    `id` = 1898,
    `directory` = 'Islands22',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Skittering Hollow (Islands 5)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1899;
INSERT INTO `dbc`.`map` SET 
    `id` = 1899,
    `directory` = 'Islands23',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Junker Gnome Caverns - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1900;
INSERT INTO `dbc`.`map` SET 
    `id` = 1900,
    `directory` = 'Silithus_Airship_Alliance',
    `MapName_Lang_enUS` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1901;
INSERT INTO `dbc`.`map` SET 
    `id` = 1901,
    `directory` = 'Silithus_Airship_Horde',
    `MapName_Lang_enUS` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1902;
INSERT INTO `dbc`.`map` SET 
    `id` = 1902,
    `directory` = 'SilithusAllianceGunship',
    `MapName_Lang_enUS` = 'Silithus Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1903;
INSERT INTO `dbc`.`map` SET 
    `id` = 1903,
    `directory` = 'SilithusHordeGunship',
    `MapName_Lang_enUS` = 'Silithus Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1904;
INSERT INTO `dbc`.`map` SET 
    `id` = 1904,
    `directory` = 'escapefromstockades',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Stormwind Escape from Stockades',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1906;
INSERT INTO `dbc`.`map` SET 
    `id` = 1906,
    `directory` = 'zandalarcontinentfinale',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Zandalar Continent Finale',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1907;
INSERT INTO `dbc`.`map` SET 
    `id` = 1907,
    `directory` = 'Islands_Panderan_Farm',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Snowblossom Village (Islands 3)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1909;
INSERT INTO `dbc`.`map` SET 
    `id` = 1909,
    `directory` = 'TransportKulTirasBridgeportShip',
    `MapName_Lang_enUS` = '[UNUSED] Transport: Kul Tiras - Bridgeport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1910;
INSERT INTO `dbc`.`map` SET 
    `id` = 1910,
    `directory` = 'TransportKulTirasBridgeportMaidens',
    `MapName_Lang_enUS` = 'Transport: Kul Tiras - Bridgeport - The Maiden''s Virtue',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1911;
INSERT INTO `dbc`.`map` SET 
    `id` = 1911,
    `directory` = 'ZandalariArena',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Mugambala',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 546,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1912;
INSERT INTO `dbc`.`map` SET 
    `id` = 1912,
    `directory` = 'Islands_7az_cave02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 7AZ Cave 02 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1913;
INSERT INTO `dbc`.`map` SET 
    `id` = 1913,
    `directory` = 'PhaseableMONazmirTriangulationPlatform',
    `MapName_Lang_enUS` = 'PhaseableMO: Nazmir - Triangulation Platform',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1916;
INSERT INTO `dbc`.`map` SET 
    `id` = 1916,
    `directory` = 'PhaseableMONazmirShipWorldQuest',
    `MapName_Lang_enUS` = 'PhaseableMO: Nazmir - Ship World Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1917;
INSERT INTO `dbc`.`map` SET 
    `id` = 1917,
    `directory` = 'GorgrondOrcs',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gorgrond - Mag''har Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 360,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1080,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1918;
INSERT INTO `dbc`.`map` SET 
    `id` = 1918,
    `directory` = 'Kalimdor 2',
    `MapName_Lang_enUS` = 'Kalimdor Darkshore Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1919;
INSERT INTO `dbc`.`map` SET 
    `id` = 1919,
    `directory` = 'Islands_KL_Skywall_Entrance_Building_03',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - KL Skywall Entrance Building 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1920;
INSERT INTO `dbc`.`map` SET 
    `id` = 1920,
    `directory` = 'Islands_MD_Flamegate_E',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - MD Flamegate E',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1921;
INSERT INTO `dbc`.`map` SET 
    `id` = 1921,
    `directory` = 'Islands_8HU_Kultiras_ShipMedium01',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Alliance - Kul''Tiras Medium 01 With Gangplank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1922;
INSERT INTO `dbc`.`map` SET 
    `id` = 1922,
    `directory` = 'Islands_8TR_Zandalari_ShipMediumTransport01',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Horde - Zandalari Medium 01 With Gangplank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1923;
INSERT INTO `dbc`.`map` SET 
    `id` = 1923,
    `directory` = 'Islands_Deepholm_Mercury_Pool01',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Deepholm Mercury Pool 01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1924;
INSERT INTO `dbc`.`map` SET 
    `id` = 1924,
    `directory` = 'Islands_7AZ_Vashjir_Small_Cave_A',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - 7AZ Vashjir Small Cave A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1925;
INSERT INTO `dbc`.`map` SET 
    `id` = 1925,
    `directory` = 'DevMapH',
    `MapName_Lang_enUS` = 'Dev Map - H',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1926;
INSERT INTO `dbc`.`map` SET 
    `id` = 1926,
    `directory` = 'KulTiranFlagship',
    `MapName_Lang_enUS` = '8.1.5 Allies - Kul Tiran Flagship (JAK)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1927;
INSERT INTO `dbc`.`map` SET 
    `id` = 1927,
    `directory` = 'ZandalariFlagship',
    `MapName_Lang_enUS` = 'Zandalari Flagship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1929;
INSERT INTO `dbc`.`map` SET 
    `id` = 1929,
    `directory` = 'HallOfCommunion(Destroyed)',
    `MapName_Lang_enUS` = 'Chamber of Heart',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1930;
INSERT INTO `dbc`.`map` SET 
    `id` = 1930,
    `directory` = 'ZandalarAllianceIntroScenerio',
    `MapName_Lang_enUS` = 'Zandalar Alliance Intro Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1931;
INSERT INTO `dbc`.`map` SET 
    `id` = 1931,
    `directory` = 'LordaeronBlight',
    `MapName_Lang_enUS` = 'Lordaeron Blight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1932;
INSERT INTO `dbc`.`map` SET 
    `id` = 1932,
    `directory` = 'BlackrockDepthsDarkIron2',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Blackrock Depths - Dark Iron Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1934;
INSERT INTO `dbc`.`map` SET 
    `id` = 1934,
    `directory` = 'Islands_8KUL_CaveMicro_freehold01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro_freehold01 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1935;
INSERT INTO `dbc`.`map` SET 
    `id` = 1935,
    `directory` = 'Islands_8KUL_CaveMicro01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1936;
INSERT INTO `dbc`.`map` SET 
    `id` = 1936,
    `directory` = 'Islands_8KUL_CaveMicro02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1937;
INSERT INTO `dbc`.`map` SET 
    `id` = 1937,
    `directory` = 'Islands_8KUL_CaveMicro03',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1938;
INSERT INTO `dbc`.`map` SET 
    `id` = 1938,
    `directory` = 'Islands_8RIV_CaveMicro_01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8RIV_CaveMicro_01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1939;
INSERT INTO `dbc`.`map` SET 
    `id` = 1939,
    `directory` = 'Islands_8RIV_CaveMicro_02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8RIV_CaveMicro_02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1940;
INSERT INTO `dbc`.`map` SET 
    `id` = 1940,
    `directory` = 'StormwindEmbassyVoldunStatic',
    `MapName_Lang_enUS` = 'Alliance Battleship -  Wind''s Redemption Voldun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1941;
INSERT INTO `dbc`.`map` SET 
    `id` = 1941,
    `directory` = 'TransportNazmirRaidElevator',
    `MapName_Lang_enUS` = 'Transport: Nazmir Raid Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1942;
INSERT INTO `dbc`.`map` SET 
    `id` = 1942,
    `directory` = 'MoltenCoreDarkIron',
    `MapName_Lang_enUS` = 'Molten Core',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 192,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1943;
INSERT INTO `dbc`.`map` SET 
    `id` = 1943,
    `directory` = 'WarfrontsArathi - Alliance',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Warfronts Arathi - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1944;
INSERT INTO `dbc`.`map` SET 
    `id` = 1944,
    `directory` = 'ScenarioThrosDeathRealm',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Thros, The Blighted Lands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1945;
INSERT INTO `dbc`.`map` SET 
    `id` = 1945,
    `directory` = 'ArathiHighlands2',
    `MapName_Lang_enUS` = 'Arathi Highlands 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1946;
INSERT INTO `dbc`.`map` SET 
    `id` = 1946,
    `directory` = 'ProtoShips',
    `MapName_Lang_enUS` = 'Prototype - Ships',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1947;
INSERT INTO `dbc`.`map` SET 
    `id` = 1947,
    `directory` = 'TransportProtoAllianceShip',
    `MapName_Lang_enUS` = 'Transport: Proto - Alliance Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1948;
INSERT INTO `dbc`.`map` SET 
    `id` = 1948,
    `directory` = 'TransportProtoHordeShip',
    `MapName_Lang_enUS` = 'Transport: Proto - Horde Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1949;
INSERT INTO `dbc`.`map` SET 
    `id` = 1949,
    `directory` = '8BoostExperienceAlliance',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '8.0 Boost Experience - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1950;
INSERT INTO `dbc`.`map` SET 
    `id` = 1950,
    `directory` = '8BoostExperienceHorde',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '8.0 Boost Experience - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1951;
INSERT INTO `dbc`.`map` SET 
    `id` = 1951,
    `directory` = '8TransportBoostExperienceAllianceGunship',
    `MapName_Lang_enUS` = '8.0 Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1952;
INSERT INTO `dbc`.`map` SET 
    `id` = 1952,
    `directory` = '8TransportBoostExperienceHordeGunship',
    `MapName_Lang_enUS` = '8.0 Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 1953;
INSERT INTO `dbc`.`map` SET 
    `id` = 1953,
    `directory` = 'Islands_demigod_dome_living',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - demigod dome living',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1954;
INSERT INTO `dbc`.`map` SET 
    `id` = 1954,
    `directory` = 'GreatSea',
    `MapName_Lang_enUS` = 'The Great Sea Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1955;
INSERT INTO `dbc`.`map` SET 
    `id` = 1955,
    `directory` = 'ScenarioIslandsTutorial',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Uncharted Island',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 1956;
INSERT INTO `dbc`.`map` SET 
    `id` = 1956,
    `directory` = 'Islands_Hot_OldGod_03',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Hot Old God 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1957;
INSERT INTO `dbc`.`map` SET 
    `id` = 1957,
    `directory` = 'Islands_OldGod',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Old God',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1958;
INSERT INTO `dbc`.`map` SET 
    `id` = 1958,
    `directory` = 'ZandalariTransportShip',
    `MapName_Lang_enUS` = 'The Golden Skipper - Zandalari Transport Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1959;
INSERT INTO `dbc`.`map` SET 
    `id` = 1959,
    `directory` = 'ZandalariTransportShipLarge',
    `MapName_Lang_enUS` = 'Zandalari Transport Ship Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1962;
INSERT INTO `dbc`.`map` SET 
    `id` = 1962,
    `directory` = 'GoblinShipFinal',
    `MapName_Lang_enUS` = 'Goblin Ship Final',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1963;
INSERT INTO `dbc`.`map` SET 
    `id` = 1963,
    `directory` = 'DevMapI',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Dev Map - I',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1964;
INSERT INTO `dbc`.`map` SET 
    `id` = 1964,
    `directory` = 'WarCampaignHordeCh05Flagship',
    `MapName_Lang_enUS` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Flagship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 1965;
INSERT INTO `dbc`.`map` SET 
    `id` = 1965,
    `directory` = 'WarCampaignHordeCh05Ship',
    `MapName_Lang_enUS` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2066;
INSERT INTO `dbc`.`map` SET 
    `id` = 2066,
    `directory` = 'GreatSeaHorde',
    `MapName_Lang_enUS` = 'The Great Sea Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2067;
INSERT INTO `dbc`.`map` SET 
    `id` = 2067,
    `directory` = 'GralsCall',
    `MapName_Lang_enUS` = 'Zandalari Battleship - Gral''s Call',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2068;
INSERT INTO `dbc`.`map` SET 
    `id` = 2068,
    `directory` = 'TirisfalGladesPhase01',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '[Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2069;
INSERT INTO `dbc`.`map` SET 
    `id` = 2069,
    `directory` = 'zuldazaralliancebombingrun',
    `MapName_Lang_enUS` = 'Zuldazar Alliance Bombing Run',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2070;
INSERT INTO `dbc`.`map` SET 
    `id` = 2070,
    `directory` = 'Zandalarraid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Battle of Dazar''alor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 555,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 660,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2074;
INSERT INTO `dbc`.`map` SET 
    `id` = 2074,
    `directory` = '8TransportBoralusStormwind',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus to Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2075;
INSERT INTO `dbc`.`map` SET 
    `id` = 2075,
    `directory` = 'Islands_7DU_Helheim_Ghostship',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2076;
INSERT INTO `dbc`.`map` SET 
    `id` = 2076,
    `directory` = 'FirelandsDarkIron',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Firelands - Dark Iron Dwarf',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2077;
INSERT INTO `dbc`.`map` SET 
    `id` = 2077,
    `directory` = 'Islands_ULDUM_INTERIOR_PYRAMID',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2078;
INSERT INTO `dbc`.`map` SET 
    `id` = 2078,
    `directory` = 'Islands_ULDUM_LARGE_PYRAMID_01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2081;
INSERT INTO `dbc`.`map` SET 
    `id` = 2081,
    `directory` = 'BlackrockDepthsDarkIronHub',
    `MapName_Lang_enUS` = 'Blackrock Depths - Dark Iron Dwarf Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `CorpseX` = -7178.09,
    `CorpseY` = -928.639,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2082;
INSERT INTO `dbc`.`map` SET 
    `id` = 2082,
    `directory` = 'Islands_PA_Mogu_Crypt_01',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2083;
INSERT INTO `dbc`.`map` SET 
    `id` = 2083,
    `directory` = 'Islands_PA_Mogu_Crypt_02',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2084;
INSERT INTO `dbc`.`map` SET 
    `id` = 2084,
    `directory` = 'Islands_PA_Mogu_Crypt_03',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2085;
INSERT INTO `dbc`.`map` SET 
    `id` = 2085,
    `directory` = 'Islands_PA_Mogu_Crypt_04',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2086;
INSERT INTO `dbc`.`map` SET 
    `id` = 2086,
    `directory` = 'Islands_PA_Mogu_Crypt_05',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2087;
INSERT INTO `dbc`.`map` SET 
    `id` = 2087,
    `directory` = 'Islands_PA_Mogu_Crypt_06',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2088;
INSERT INTO `dbc`.`map` SET 
    `id` = 2088,
    `directory` = 'Islands_PA_Mogu_Crypt_08',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2094;
INSERT INTO `dbc`.`map` SET 
    `id` = 2094,
    `directory` = '8TransportBoralusCanals',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Canals',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2095;
INSERT INTO `dbc`.`map` SET 
    `id` = 2095,
    `directory` = '8TransportBoralusSound',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Sound',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2096;
INSERT INTO `dbc`.`map` SET 
    `id` = 2096,
    `directory` = 'SeaPriestRaid',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Crucible of Storms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 556,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2097;
INSERT INTO `dbc`.`map` SET 
    `id` = 2097,
    `directory` = 'MechagonDungeon',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Operation: Mechagon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2101;
INSERT INTO `dbc`.`map` SET 
    `id` = 2101,
    `directory` = '8TransportBoralusBarge',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Barge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2102;
INSERT INTO `dbc`.`map` SET 
    `id` = 2102,
    `directory` = '8TransportBoralusShipSmall',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Ship Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2103;
INSERT INTO `dbc`.`map` SET 
    `id` = 2103,
    `directory` = 'DarkshorePrepatchDarnassianShipCosmetic',
    `MapName_Lang_enUS` = 'Darkshore Prepatch Darnassian Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2105;
INSERT INTO `dbc`.`map` SET 
    `id` = 2105,
    `directory` = 'WarfrontsDarkshoreAlliance',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Warfronts Darkshore - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 557,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2106;
INSERT INTO `dbc`.`map` SET 
    `id` = 2106,
    `directory` = 'WarsongGulch2',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Warsong Gulch',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 3277,
    `map_description_0_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 560,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2107;
INSERT INTO `dbc`.`map` SET 
    `id` = 2107,
    `directory` = 'ArathiBasin2',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 3358,
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 559,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2109;
INSERT INTO `dbc`.`map` SET 
    `id` = 2109,
    `directory` = 'IncursionAirshipHorde',
    `MapName_Lang_enUS` = '8.1.0 Incursion Airship Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2110;
INSERT INTO `dbc`.`map` SET 
    `id` = 2110,
    `directory` = 'IncursionAirshipAlliance',
    `MapName_Lang_enUS` = '8.1.0 Incursion Airship Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2111;
INSERT INTO `dbc`.`map` SET 
    `id` = 2111,
    `directory` = 'WarfrontsDarkshoreHorde',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Warfronts Darkshore - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 557,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2112;
INSERT INTO `dbc`.`map` SET 
    `id` = 2112,
    `directory` = '9DevLand',
    `MapName_Lang_enUS` = '9.0 Dev Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2114;
INSERT INTO `dbc`.`map` SET 
    `id` = 2114,
    `directory` = 'Scourge Procedural Dungeon',
    `MapName_Lang_enUS` = 'Maw Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2115;
INSERT INTO `dbc`.`map` SET 
    `id` = 2115,
    `directory` = 'DarkshoreTyrandeScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.1 Darkshore Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2116;
INSERT INTO `dbc`.`map` SET 
    `id` = 2116,
    `directory` = 'Islands7',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2117;
INSERT INTO `dbc`.`map` SET 
    `id` = 2117,
    `directory` = 'NZoth',
    `MapName_Lang_enUS` = 'NZoth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2118;
INSERT INTO `dbc`.`map` SET 
    `id` = 2118,
    `directory` = 'WintergraspEpic',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Battle for Wintergrasp',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.
An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 243,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 2;

DELETE FROM `dbc`.`map` WHERE `id` = 2119;
INSERT INTO `dbc`.`map` SET 
    `id` = 2119,
    `directory` = 'TransportCookingImpossibleAllianceBalloon',
    `MapName_Lang_enUS` = 'Transport: Cooking: Impossible - Hot Air Balloon - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2120;
INSERT INTO `dbc`.`map` SET 
    `id` = 2120,
    `directory` = 'TransportCookingImpossibleHordeBalloon',
    `MapName_Lang_enUS` = 'Transport: Cooking: Impossible - Hot Air Balloon - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2122;
INSERT INTO `dbc`.`map` SET 
    `id` = 2122,
    `directory` = 'N�Zoth',
    `MapName_Lang_enUS` = 'DELETE',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2123;
INSERT INTO `dbc`.`map` SET 
    `id` = 2123,
    `directory` = 'SeaPriestDungeonQuests',
    `MapName_Lang_enUS` = 'Shrine of the Storm Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 556,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2124;
INSERT INTO `dbc`.`map` SET 
    `id` = 2124,
    `directory` = 'Crestfall',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Crestfall (Islands 11)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2125;
INSERT INTO `dbc`.`map` SET 
    `id` = 2125,
    `directory` = 'ZandalariTreasury',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Zandalari Treasury',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 552,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2127;
INSERT INTO `dbc`.`map` SET 
    `id` = 2127,
    `directory` = 'AbandonedMines',
    `MapName_Lang_enUS` = 'Abandoned Mines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2128;
INSERT INTO `dbc`.`map` SET 
    `id` = 2128,
    `directory` = 'DaggerRealm',
    `MapName_Lang_enUS` = 'Dagger Realm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2129;
INSERT INTO `dbc`.`map` SET 
    `id` = 2129,
    `directory` = 'DarkshoreHordeQuests',
    `MapName_Lang_enUS` = '8.1 Darkshore Horde Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2130;
INSERT INTO `dbc`.`map` SET 
    `id` = 2130,
    `directory` = 'Questfall',
    `MapName_Lang_enUS` = 'Questfall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2131;
INSERT INTO `dbc`.`map` SET 
    `id` = 2131,
    `directory` = 'DarkshoreOutdoorPhase',
    `MapName_Lang_enUS` = '8.1 Darkshore Outdoor Final Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2132;
INSERT INTO `dbc`.`map` SET 
    `id` = 2132,
    `directory` = '9DevLand2',
    `MapName_Lang_enUS` = '9.0 Dev Land 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 198,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2134;
INSERT INTO `dbc`.`map` SET 
    `id` = 2134,
    `directory` = 'TolDagorScenario',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tol Dagor Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 550,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2135;
INSERT INTO `dbc`.`map` SET 
    `id` = 2135,
    `directory` = 'DevSmoketest',
    `MapName_Lang_enUS` = 'Dev Smoketest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2136;
INSERT INTO `dbc`.`map` SET 
    `id` = 2136,
    `directory` = 'ZuldazarRaidShipTransport',
    `MapName_Lang_enUS` = 'Transport: Zuldazar Raid Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2143;
INSERT INTO `dbc`.`map` SET 
    `id` = 2143,
    `directory` = 'Mechagon',
    `MapName_Lang_enUS` = 'DO NOT USE [Deprecated]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 551,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2145;
INSERT INTO `dbc`.`map` SET 
    `id` = 2145,
    `directory` = 'Transport312214',
    `MapName_Lang_enUS` = 'Transport: Night Elf Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2146;
INSERT INTO `dbc`.`map` SET 
    `id` = 2146,
    `directory` = 'Transport312215',
    `MapName_Lang_enUS` = 'Transport: Forsaken Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2147;
INSERT INTO `dbc`.`map` SET 
    `id` = 2147,
    `directory` = '2147',
    `MapName_Lang_enUS` = 'Icecrown Citadel (8.1)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2155;
INSERT INTO `dbc`.`map` SET 
    `id` = 2155,
    `directory` = '2155',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halls of Stone Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2156;
INSERT INTO `dbc`.`map` SET 
    `id` = 2156,
    `directory` = '2156',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Visions of N''Zoth - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 23,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2160;
INSERT INTO `dbc`.`map` SET 
    `id` = 2160,
    `directory` = '2160',
    `MapName_Lang_enUS` = 'Maw Prototype - Dragonblight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2161;
INSERT INTO `dbc`.`map` SET 
    `id` = 2161,
    `directory` = '2161',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Maw Prototype - Torment Chambers',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2162;
INSERT INTO `dbc`.`map` SET 
    `id` = 2162,
    `directory` = '2162',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Torghast, Tower of the Damned',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 590,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2163;
INSERT INTO `dbc`.`map` SET 
    `id` = 2163,
    `directory` = '2163',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gnomeregan Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2164;
INSERT INTO `dbc`.`map` SET 
    `id` = 2164,
    `directory` = '2164',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'The Eternal Palace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 570,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2165;
INSERT INTO `dbc`.`map` SET 
    `id` = 2165,
    `directory` = '2165',
    `MapName_Lang_enUS` = 'SpawnedMO: Night Elf Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2166;
INSERT INTO `dbc`.`map` SET 
    `id` = 2166,
    `directory` = '2166',
    `MapName_Lang_enUS` = 'Transport: Zuldazar Raid Boralus Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2167;
INSERT INTO `dbc`.`map` SET 
    `id` = 2167,
    `directory` = '2167',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'The Robodrome',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 562,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2168;
INSERT INTO `dbc`.`map` SET 
    `id` = 2168,
    `directory` = '2168',
    `MapName_Lang_enUS` = 'Level Design Process, Techniques and Resources',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 251,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2169;
INSERT INTO `dbc`.`map` SET 
    `id` = 2169,
    `directory` = '2169',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Uldir Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 548,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2170;
INSERT INTO `dbc`.`map` SET 
    `id` = 2170,
    `directory` = '2170',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Tauren Heritage Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2174;
INSERT INTO `dbc`.`map` SET 
    `id` = 2174,
    `directory` = '2174',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Scarlet Halls, Dark Ranger',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 332,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = 2869.0,
    `CorpseY` = -820.0,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2175;
INSERT INTO `dbc`.`map` SET 
    `id` = 2175,
    `directory` = '2175',
    `MapName_Lang_enUS` = '9.0 NPE (New Player Experience) - Exile''s Reach',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 589,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2176;
INSERT INTO `dbc`.`map` SET 
    `id` = 2176,
    `directory` = '2176',
    `MapName_Lang_enUS` = 'SpawnedMO: Forsaken Ship Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2177;
INSERT INTO `dbc`.`map` SET 
    `id` = 2177,
    `directory` = '2177',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin Comp Stomp',
    `MapName_Lang_Mask` = 16712190,
    `area_table_id` = 3358,
    `map_description_0_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 559,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2178;
INSERT INTO `dbc`.`map` SET 
    `id` = 2178,
    `directory` = '2178',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Prison of Ink',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2179;
INSERT INTO `dbc`.`map` SET 
    `id` = 2179,
    `directory` = '2179',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Stratholme Pet Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 101,
    `minimap_icon_scale` = 1.0,
    `CorpseX` = 3392.32,
    `CorpseY` = -3378.48,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2180;
INSERT INTO `dbc`.`map` SET 
    `id` = 2180,
    `directory` = '2180',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Dreamgrove (Hearthstone Tavern)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 411,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2186;
INSERT INTO `dbc`.`map` SET 
    `id` = 2186,
    `directory` = '2186',
    `MapName_Lang_enUS` = 'The Obsidian Sanctum - 8.2 Magni - Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 239,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `CorpseX` = 3438.15,
    `CorpseY` = 260.401,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2187;
INSERT INTO `dbc`.`map` SET 
    `id` = 2187,
    `directory` = '2187',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Halls of Origination',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 256,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 1,
    `CorpseX` = -10226.0,
    `CorpseY` = -1837.48,
    `time_of_day_override` = 1080,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2193;
INSERT INTO `dbc`.`map` SET 
    `id` = 2193,
    `directory` = '2193',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Galakrond''s Fall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2194;
INSERT INTO `dbc`.`map` SET 
    `id` = 2194,
    `directory` = '2194',
    `MapName_Lang_enUS` = 'Hearthstone Tavern',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2195;
INSERT INTO `dbc`.`map` SET 
    `id` = 2195,
    `directory` = '2195',
    `MapName_Lang_enUS` = 'Hearthstone Tavern',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2197;
INSERT INTO `dbc`.`map` SET 
    `id` = 2197,
    `directory` = '2197',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Korrak''s Revenge',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 104,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2205;
INSERT INTO `dbc`.`map` SET 
    `id` = 2205,
    `directory` = '2205',
    `MapName_Lang_enUS` = '9.0 Transport: Zone Transition Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2207;
INSERT INTO `dbc`.`map` SET 
    `id` = 2207,
    `directory` = '2207',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Neltharion''s Lair - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 407,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2208;
INSERT INTO `dbc`.`map` SET 
    `id` = 2208,
    `directory` = '2208',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Eastern Kingdoms - Vermillion Redoubt - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1260,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2209;
INSERT INTO `dbc`.`map` SET 
    `id` = 2209,
    `directory` = '2209',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Emerald Dream - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 418,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2210;
INSERT INTO `dbc`.`map` SET 
    `id` = 2210,
    `directory` = '2210',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar - Coup Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 369,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2211;
INSERT INTO `dbc`.`map` SET 
    `id` = 2211,
    `directory` = '2211',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Gilneas - Worgen Heritage Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2212;
INSERT INTO `dbc`.`map` SET 
    `id` = 2212,
    `directory` = '2212',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Horrific Vision of Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2213;
INSERT INTO `dbc`.`map` SET 
    `id` = 2213,
    `directory` = '2213',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Horrific Vision of Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2214;
INSERT INTO `dbc`.`map` SET 
    `id` = 2214,
    `directory` = '2214',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom - Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 272,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2215;
INSERT INTO `dbc`.`map` SET 
    `id` = 2215,
    `directory` = '2215',
    `MapName_Lang_enUS` = 'Chamber of Heart - Repaired',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2217;
INSERT INTO `dbc`.`map` SET 
    `id` = 2217,
    `directory` = '2217',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Ny''alotha, the Waking City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 575,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2218;
INSERT INTO `dbc`.`map` SET 
    `id` = 2218,
    `directory` = '2218',
    `MapName_Lang_enUS` = 'Dummy Map (Dev and empty, use if you want)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2222;
INSERT INTO `dbc`.`map` SET 
    `id` = 2222,
    `directory` = '2222',
    `MapName_Lang_enUS` = 'The Shadowlands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2223;
INSERT INTO `dbc`.`map` SET 
    `id` = 2223,
    `directory` = '2223',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 236,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 571,
    `CorpseX` = 3869.98,
    `CorpseY` = 6984.33,
    `time_of_day_override` = -1,
    `expansion_id` = 7,
    `max_players` = 5;

DELETE FROM `dbc`.`map` WHERE `id` = 2224;
INSERT INTO `dbc`.`map` SET 
    `id` = 2224,
    `directory` = '2224',
    `MapName_Lang_enUS` = 'Programmer Map - Continent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2225;
INSERT INTO `dbc`.`map` SET 
    `id` = 2225,
    `directory` = '2225',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Programmer Map - Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2226;
INSERT INTO `dbc`.`map` SET 
    `id` = 2226,
    `directory` = '2226',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Programmer Map - Battlefield',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2227;
INSERT INTO `dbc`.`map` SET 
    `id` = 2227,
    `directory` = '2227',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Programmer Map - Raid',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2228;
INSERT INTO `dbc`.`map` SET 
    `id` = 2228,
    `directory` = '2228',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Programmer Map - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2230;
INSERT INTO `dbc`.`map` SET 
    `id` = 2230,
    `directory` = '2230',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2231;
INSERT INTO `dbc`.`map` SET 
    `id` = 2231,
    `directory` = '2231',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2232;
INSERT INTO `dbc`.`map` SET 
    `id` = 2232,
    `directory` = '2232',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Karazhan Catacombs - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 200,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2233;
INSERT INTO `dbc`.`map` SET 
    `id` = 2233,
    `directory` = '2233',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Temple of the Jade Serpent - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 311,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = 870,
    `CorpseX` = 957.706,
    `CorpseY` = -2473.41,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2234;
INSERT INTO `dbc`.`map` SET 
    `id` = 2234,
    `directory` = '2234',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - Transfer Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2235;
INSERT INTO `dbc`.`map` SET 
    `id` = 2235,
    `directory` = '2235',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Caverns of Time - Anniversary',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 212,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2236;
INSERT INTO `dbc`.`map` SET 
    `id` = 2236,
    `directory` = '2236',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Darkmaul Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 584,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2237;
INSERT INTO `dbc`.`map` SET 
    `id` = 2237,
    `directory` = '2237',
    `MapName_Lang_enUS` = '8.2.5 Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2240;
INSERT INTO `dbc`.`map` SET 
    `id` = 2240,
    `directory` = '2240',
    `MapName_Lang_enUS` = '[UNUSED] [DEV MAP] 8.3 Stormheim',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2241;
INSERT INTO `dbc`.`map` SET 
    `id` = 2241,
    `directory` = '2241',
    `MapName_Lang_enUS` = 'Uldum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 3,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2242;
INSERT INTO `dbc`.`map` SET 
    `id` = 2242,
    `directory` = '2242',
    `MapName_Lang_enUS` = 'Dev Map - K',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2243;
INSERT INTO `dbc`.`map` SET 
    `id` = 2243,
    `directory` = '2243',
    `MapName_Lang_enUS` = 'Dev Map - J',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2245;
INSERT INTO `dbc`.`map` SET 
    `id` = 2245,
    `directory` = '2245',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = 'Deepwind Gorge',
    `MapName_Lang_Mask` = 16712190,
    `map_description_0_enus` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `MapDescription0_Lang_Mask` = 16712190,
    `map_description_1_enus` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `MapDescription1_Lang_Mask` = 16712190,
    `loading_screen_id` = 354,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 4;

DELETE FROM `dbc`.`map` WHERE `id` = 2246;
INSERT INTO `dbc`.`map` SET 
    `id` = 2246,
    `directory` = '2246',
    `MapName_Lang_enUS` = 'Solesa Naksu [DNT]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2247;
INSERT INTO `dbc`.`map` SET 
    `id` = 2247,
    `directory` = '2247',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Mogu''shan Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 312,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2249;
INSERT INTO `dbc`.`map` SET 
    `id` = 2249,
    `directory` = '2249',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'FX Test Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2250;
INSERT INTO `dbc`.`map` SET 
    `id` = 2250,
    `directory` = '2250',
    `MapName_Lang_enUS` = 'Test Dungeon PvP',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 560,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2254;
INSERT INTO `dbc`.`map` SET 
    `id` = 2254,
    `directory` = '2254',
    `MapName_Lang_enUS` = 'Cinematics Test Map (Development Map)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2255;
INSERT INTO `dbc`.`map` SET 
    `id` = 2255,
    `directory` = '2255',
    `MapName_Lang_enUS` = 'Cinematics Test Map II (Development Map)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2257;
INSERT INTO `dbc`.`map` SET 
    `id` = 2257,
    `directory` = '2257',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Chamber of Heart - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 434,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2258;
INSERT INTO `dbc`.`map` SET 
    `id` = 2258,
    `directory` = '2258',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Crapopolis - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 120,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2261;
INSERT INTO `dbc`.`map` SET 
    `id` = 2261,
    `directory` = '2261',
    `MapName_Lang_enUS` = '9.0 Transport - NPE - Alliance Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2263;
INSERT INTO `dbc`.`map` SET 
    `id` = 2263,
    `directory` = '2263',
    `MapName_Lang_enUS` = 'Crapopolis',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 440,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2264;
INSERT INTO `dbc`.`map` SET 
    `id` = 2264,
    `directory` = '2264',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Visions of N''Zoth - Orgrimmar - Engineering Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2266;
INSERT INTO `dbc`.`map` SET 
    `id` = 2266,
    `directory` = '2266',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Blackwing Descent Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 260,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2267;
INSERT INTO `dbc`.`map` SET 
    `id` = 2267,
    `directory` = '2267',
    `MapName_Lang_enUS` = 'city',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2268;
INSERT INTO `dbc`.`map` SET 
    `id` = 2268,
    `directory` = '2268',
    `MapName_Lang_enUS` = 'Mechagon City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 572,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2274;
INSERT INTO `dbc`.`map` SET 
    `id` = 2274,
    `directory` = '2274',
    `MapName_Lang_enUS` = 'Vision of the Twisting Sands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2275;
INSERT INTO `dbc`.`map` SET 
    `id` = 2275,
    `directory` = '2275',
    `MapName_Lang_enUS` = 'Vale of Eternal Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 577,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2276;
INSERT INTO `dbc`.`map` SET 
    `id` = 2276,
    `directory` = '2276',
    `MapName_Lang_enUS` = '9.0 Transport - Maldraxxus Badass Necropolis [TEMP NAME]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2277;
INSERT INTO `dbc`.`map` SET 
    `id` = 2277,
    `directory` = '2277',
    `MapName_Lang_enUS` = '9.0 SpawnedMO - Maldraxxus Badass Necropolis [TEMP NAME]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2278;
INSERT INTO `dbc`.`map` SET 
    `id` = 2278,
    `directory` = '2278',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Revendreth Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2279;
INSERT INTO `dbc`.`map` SET 
    `id` = 2279,
    `directory` = '2279',
    `MapName_Lang_enUS` = 'Torghast Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 274,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2282;
INSERT INTO `dbc`.`map` SET 
    `id` = 2282,
    `directory` = '2282',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Blackrock Depths - Pet Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 103,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2284;
INSERT INTO `dbc`.`map` SET 
    `id` = 2284,
    `directory` = '2284',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Sanguine Depths',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 578,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2285;
INSERT INTO `dbc`.`map` SET 
    `id` = 2285,
    `directory` = '2285',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Spires of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 582,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2286;
INSERT INTO `dbc`.`map` SET 
    `id` = 2286,
    `directory` = '2286',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'The Necrotic Wake',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 581,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2287;
INSERT INTO `dbc`.`map` SET 
    `id` = 2287,
    `directory` = '2287',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Halls of Atonement',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 588,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2288;
INSERT INTO `dbc`.`map` SET 
    `id` = 2288,
    `directory` = '2288',
    `MapName_Lang_enUS` = '[DEV] - Arena of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 209,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2289;
INSERT INTO `dbc`.`map` SET 
    `id` = 2289,
    `directory` = '2289',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Plaguefall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 580,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2290;
INSERT INTO `dbc`.`map` SET 
    `id` = 2290,
    `directory` = '2290',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Mists of Tirna Scithe',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 586,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 600,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2291;
INSERT INTO `dbc`.`map` SET 
    `id` = 2291,
    `directory` = '2291',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'De Other Side',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 585,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2292;
INSERT INTO `dbc`.`map` SET 
    `id` = 2292,
    `directory` = '2292',
    `instance_type` = 3,
    `pvp` = 1,
    `MapName_Lang_enUS` = '8.3 Epic Battleground - Warfront Arathi (PvP)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 544,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2293;
INSERT INTO `dbc`.`map` SET 
    `id` = 2293,
    `directory` = '2293',
    `instance_type` = 1,
    `MapName_Lang_enUS` = 'Theater of Pain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 587,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2294;
INSERT INTO `dbc`.`map` SET 
    `id` = 2294,
    `directory` = '2294',
    `instance_type` = 1,
    `MapName_Lang_enUS` = '[NOT USED] Realm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 209,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 1320,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2296;
INSERT INTO `dbc`.`map` SET 
    `id` = 2296,
    `directory` = '2296',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'Castle Nathria',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2297;
INSERT INTO `dbc`.`map` SET 
    `id` = 2297,
    `directory` = '2297',
    `MapName_Lang_enUS` = 'Icecrown Citadel (8.3)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 250,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2299;
INSERT INTO `dbc`.`map` SET 
    `id` = 2299,
    `directory` = '2299',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Vision of Ysera Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2300;
INSERT INTO `dbc`.`map` SET 
    `id` = 2300,
    `directory` = '2300',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Redridge - 9xp Bastion',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 4,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2301;
INSERT INTO `dbc`.`map` SET 
    `id` = 2301,
    `directory` = '2301',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Maldraxxus Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2303;
INSERT INTO `dbc`.`map` SET 
    `id` = 2303,
    `directory` = '2303',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Zone Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2304;
INSERT INTO `dbc`.`map` SET 
    `id` = 2304,
    `directory` = '2304',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Tyrande Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2305;
INSERT INTO `dbc`.`map` SET 
    `id` = 2305,
    `directory` = '2305',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Bastion Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2306;
INSERT INTO `dbc`.`map` SET 
    `id` = 2306,
    `directory` = '2306',
    `MapName_Lang_enUS` = 'Julien LoD Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 216,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2308;
INSERT INTO `dbc`.`map` SET 
    `id` = 2308,
    `directory` = '2308',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Bastion Night Warrior Finale - Ardenweald Covenant Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1;

DELETE FROM `dbc`.`map` WHERE `id` = 2309;
INSERT INTO `dbc`.`map` SET 
    `id` = 2309,
    `directory` = '2309',
    `MapName_Lang_enUS` = 'Transport: Torghast Bridge Platform01 Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2354;
INSERT INTO `dbc`.`map` SET 
    `id` = 2354,
    `directory` = '2354',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Covenant Chapter 2 Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2355;
INSERT INTO `dbc`.`map` SET 
    `id` = 2355,
    `directory` = '2355',
    `MapName_Lang_enUS` = 'The Necrotic Wake (Transport)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 581,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2356;
INSERT INTO `dbc`.`map` SET 
    `id` = 2356,
    `directory` = '2356',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Castle Nathria Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2360;
INSERT INTO `dbc`.`map` SET 
    `id` = 2360,
    `directory` = '2360',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Sinfall Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 579,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2362;
INSERT INTO `dbc`.`map` SET 
    `id` = 2362,
    `directory` = '2362',
    `instance_type` = 5,
    `MapName_Lang_enUS` = 'Maldraxxus Covenant Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2363;
INSERT INTO `dbc`.`map` SET 
    `id` = 2363,
    `directory` = '2363',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '9.0 - Ardenweald - Garden - Queen''s Conservatory',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2364;
INSERT INTO `dbc`.`map` SET 
    `id` = 2364,
    `directory` = '2364',
    `MapName_Lang_enUS` = 'The Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2365;
INSERT INTO `dbc`.`map` SET 
    `id` = 2365,
    `directory` = '2365',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Bridge_SmallPlatform01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2366;
INSERT INTO `dbc`.`map` SET 
    `id` = 2366,
    `directory` = '2366',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Zone_WallTurret01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2367;
INSERT INTO `dbc`.`map` SET 
    `id` = 2367,
    `directory` = '2367',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Bridge_Straight03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2368;
INSERT INTO `dbc`.`map` SET 
    `id` = 2368,
    `directory` = '2368',
    `MapName_Lang_enUS` = 'Maldraxxus Broker Islands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2369;
INSERT INTO `dbc`.`map` SET 
    `id` = 2369,
    `directory` = '2369',
    `MapName_Lang_enUS` = '9.0 NPE - Horde - Starter Transport Ship - (STM)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2370;
INSERT INTO `dbc`.`map` SET 
    `id` = 2370,
    `directory` = '2370',
    `MapName_Lang_enUS` = 'Maldraxxus Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2371;
INSERT INTO `dbc`.`map` SET 
    `id` = 2371,
    `directory` = '2371',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '9.0 Ardenweald Covenant Finale Drust Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2373;
INSERT INTO `dbc`.`map` SET 
    `id` = 2373,
    `directory` = '2373',
    `instance_type` = 4,
    `MapName_Lang_enUS` = 'Empyrean Domain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 583,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2375;
INSERT INTO `dbc`.`map` SET 
    `id` = 2375,
    `directory` = '2375',
    `instance_type` = 5,
    `MapName_Lang_enUS` = '9.0 Bastion Arena - Path of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 583,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = 720,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2437;
INSERT INTO `dbc`.`map` SET 
    `id` = 2437,
    `directory` = '2437',
    `MapName_Lang_enUS` = 'Dev Map - Internapalooza',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2438;
INSERT INTO `dbc`.`map` SET 
    `id` = 2438,
    `directory` = '2438',
    `instance_type` = 2,
    `MapName_Lang_enUS` = 'SpellPref',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 244,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 6;

DELETE FROM `dbc`.`map` WHERE `id` = 2439;
INSERT INTO `dbc`.`map` SET 
    `id` = 2439,
    `directory` = '2439',
    `MapName_Lang_enUS` = 'De Other Side (Ardenweald Campaign)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2440;
INSERT INTO `dbc`.`map` SET 
    `id` = 2440,
    `directory` = '2440',
    `MapName_Lang_enUS` = 'World Tree 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

DELETE FROM `dbc`.`map` WHERE `id` = 2452;
INSERT INTO `dbc`.`map` SET 
    `id` = 2452,
    `directory` = '2452',
    `MapName_Lang_enUS` = 'Dev Map - Internapalooza',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 549,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 7;

DELETE FROM `dbc`.`map` WHERE `id` = 2453;
INSERT INTO `dbc`.`map` SET 
    `id` = 2453,
    `directory` = '2453',
    `MapName_Lang_enUS` = 'Torghast',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `loading_screen_id` = 576,
    `minimap_icon_scale` = 1.0,
    `corpse_map_id` = -1,
    `time_of_day_override` = -1,
    `expansion_id` = 8;

