UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */,
    `MapDescription1_Lang_enUS` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall''s own clan of orcs, the Frostwolves.The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' /* was 'Hidden within the Alterac Mountains, Alterac Valley is the home of Thrall's own clan of orcs, the Frostwolves.

The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

The territorial Frostwolves, unwilling to suffer the dwarven incursion, have rallied an army... an army eager for righteous slaughter.' */
WHERE `ID` = 30;

UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */,
    `MapDescription1_Lang_enUS` = 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' /* was 'A valley bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and the Alliance.

Orcs use their Warsong Mill to cut lumber reaped from Ashenvale, provoking the night elves of Silverwing Hold.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.' */
WHERE `ID` = 489;

UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.' */,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.Meanwhile, the Defiler''s elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' /* was 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defiler's elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.' */
WHERE `ID` = 529;

UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.This battlefield is coveted by the blood elves for its rich energy deposits.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.' */,
    `MapDescription1_Lang_enUS` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.This battlefield is coveted by the blood elves for its rich energy deposits.' /* was 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru's mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.' */
WHERE `ID` = 566;

UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */,
    `MapDescription1_Lang_enUS` = 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' /* was 'To the south of Dragonblight lies the resting place of a legendary Titan artifact, known by the Alliance and Horde to possess critical information regarding the Titans and their methods.

Prepare yourself for battle, for fate cannot determine success upon this Strand of the Ancients.' */
WHERE `ID` = 607;

DELETE FROM `dbc`.`map` WHERE `ID` = 627;
INSERT INTO `dbc`.`map` SET 
    `ID` = 627,
    `DirectoryName` = 'unused',
    `InstanceType` = 5,
    `Flags` = 29,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Unused (DELETE ME)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 25,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

UPDATE `dbc`.`map` SET 
    `MapDescription0_Lang_enUS` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */,
    `MapDescription1_Lang_enUS` = 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.With the 7th Legion and the Kor''kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' /* was 'The Isle of Conquest is a point of strategic importance for the Alliance and Horde campaigns in Northrend.

Serving as an ideal staging ground for operations in Icecrown, each side is determined to secure control of the island.

With the 7th Legion and the Kor'kron Guard locked in deadly combat, both factions have issued a call to arms in hopes of tipping the scales in their favor and defeating the opposing general.' */
WHERE `ID` = 628;

DELETE FROM `dbc`.`map` WHERE `ID` = 637;
INSERT INTO `dbc`.`map` SET 
    `ID` = 637,
    `DirectoryName` = 'AbyssalMaw',
    `InstanceType` = 1,
    `Flags` = 1,
    `MapName_Lang_enUS` = 'Abyssal Maw Exterior',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 23,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 638;
INSERT INTO `dbc`.`map` SET 
    `ID` = 638,
    `DirectoryName` = 'Gilneas',
    `Flags` = 1,
    `MapName_Lang_enUS` = 'Gilneas',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 643;
INSERT INTO `dbc`.`map` SET 
    `ID` = 643,
    `DirectoryName` = 'AbyssalMaw_Interior',
    `InstanceType` = 1,
    `Flags` = 29,
    `MapName_Lang_enUS` = 'Throne of the Tides',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 255,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -5585.87,
    `CorpseY` = 5401.65,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 644;
INSERT INTO `dbc`.`map` SET 
    `ID` = 644,
    `DirectoryName` = 'Uldum',
    `InstanceType` = 1,
    `Flags` = 29,
    `MapName_Lang_enUS` = 'Halls of Origination',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 256,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -10226.0,
    `CorpseY` = -1837.48,
    `TimeOfDayOverride` = 1080,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 645;
INSERT INTO `dbc`.`map` SET 
    `ID` = 645,
    `DirectoryName` = 'BlackRockSpire_4_0',
    `InstanceType` = 1,
    `Flags` = 1,
    `MapName_Lang_enUS` = 'Blackrock Caverns',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 267,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7570.25,
    `CorpseY` = -1330.68,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 646;
INSERT INTO `dbc`.`map` SET 
    `ID` = 646,
    `DirectoryName` = 'Deephome',
    `Flags` = 1,
    `MapName_Lang_enUS` = 'Deepholm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 268,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 648;
INSERT INTO `dbc`.`map` SET 
    `ID` = 648,
    `DirectoryName` = 'LostIsles',
    `Flags` = 1,
    `MapName_Lang_enUS` = 'LostIsles',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 651;
INSERT INTO `dbc`.`map` SET 
    `ID` = 651,
    `DirectoryName` = 'ElevatorSpawnTest',
    `Flags` = 285,
    `MapName_Lang_enUS` = 'ElevatorSpawnTest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 654;
INSERT INTO `dbc`.`map` SET 
    `ID` = 654,
    `DirectoryName` = 'Gilneas2',
    `MapName_Lang_enUS` = 'Gilneas2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 655;
INSERT INTO `dbc`.`map` SET 
    `ID` = 655,
    `DirectoryName` = 'GilneasPhase1',
    `MapName_Lang_enUS` = 'GilneasPhase1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 656;
INSERT INTO `dbc`.`map` SET 
    `ID` = 656,
    `DirectoryName` = 'GilneasPhase2',
    `MapName_Lang_enUS` = 'GilneasPhase2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 657;
INSERT INTO `dbc`.`map` SET 
    `ID` = 657,
    `DirectoryName` = 'SkywallDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Vortex Pinnacle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 259,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 659;
INSERT INTO `dbc`.`map` SET 
    `ID` = 659,
    `DirectoryName` = 'LostIslesPhase1',
    `MapName_Lang_enUS` = 'Lost Isles Volcano Eruption',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 660;
INSERT INTO `dbc`.`map` SET 
    `ID` = 660,
    `DirectoryName` = 'Deephomeceiling',
    `MapName_Lang_enUS` = 'Deephome Ceiling',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 661;
INSERT INTO `dbc`.`map` SET 
    `ID` = 661,
    `DirectoryName` = 'LostIslesPhase2',
    `MapName_Lang_enUS` = 'Lost Isles Town in a Box',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 662;
INSERT INTO `dbc`.`map` SET 
    `ID` = 662,
    `DirectoryName` = 'Transport197195',
    `MapName_Lang_enUS` = 'Transport: Alliance Vashj''ir Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 669;
INSERT INTO `dbc`.`map` SET 
    `ID` = 669,
    `DirectoryName` = 'BlackwingDescent',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Blackwing Descent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 260,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7541.77,
    `CorpseY` = -1188.83,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 670;
INSERT INTO `dbc`.`map` SET 
    `ID` = 670,
    `DirectoryName` = 'GrimBatolDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Grim Batol',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 257,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -4047.74,
    `CorpseY` = -3446.35,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 671;
INSERT INTO `dbc`.`map` SET 
    `ID` = 671,
    `DirectoryName` = 'GrimBatolRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'The Bastion of Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 266,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -4903.01,
    `CorpseY` = -4221.21,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 674;
INSERT INTO `dbc`.`map` SET 
    `ID` = 674,
    `DirectoryName` = 'Transport197349-2',
    `MapName_Lang_enUS` = 'Transport: Ship to Vashj''ir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 719;
INSERT INTO `dbc`.`map` SET 
    `ID` = 719,
    `DirectoryName` = 'MountHyjalPhase1',
    `MapName_Lang_enUS` = 'Mount Hyjal Phase 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 720;
INSERT INTO `dbc`.`map` SET 
    `ID` = 720,
    `DirectoryName` = 'Firelands1',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Firelands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 275,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = 3987.2,
    `CorpseY` = -2943.32,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 721;
INSERT INTO `dbc`.`map` SET 
    `ID` = 721,
    `DirectoryName` = 'Firelands2',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Firelands Terrain 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 725;
INSERT INTO `dbc`.`map` SET 
    `ID` = 725,
    `DirectoryName` = 'DeepholmeDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Stonecore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 258,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 646,
    `CorpseX` = 1031.91,
    `CorpseY` = 610.297,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 726;
INSERT INTO `dbc`.`map` SET 
    `ID` = 726,
    `DirectoryName` = 'CataclysmCTF',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Twin Peaks',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Nestled in the Twilight Highlands, Twin Peaks has flared as a point of contention between the Alliance and Horde.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Lend your strength as both factions struggle to take control of this critical high ground!',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 262,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 727;
INSERT INTO `dbc`.`map` SET 
    `ID` = 727,
    `DirectoryName` = 'STV_Mine_BG',
    `InstanceType` = 3,
    `MapName_Lang_enUS` = 'Silvershard Mines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This battleground takes place underneath Stranglethorn Vale in a Venture Co. goblin mine.

Silvershard Mines is a 10 vs 10 escort battleground, in which each side attempts to control diamond carts until they reach the mine depot.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 317,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 728;
INSERT INTO `dbc`.`map` SET 
    `ID` = 728,
    `DirectoryName` = 'TheBattleforGilneas',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'The Battle for Gilneas (Old City Map)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Located in the heart of Gilnean peninsula, the capital city is of vital strategic importance to the Horde''s operations the Eastern Kingdoms.

Long seen by the Forsaken as a natural expansion to their dominion, Sylvanas Windrunner''s armies are ready to defend their most recent conquest at all costs.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Driven from their homelands by the Forsaken, Gilneans continue to view this city as their nation''s rightful capital.

After regrouping in Alliance territories, the people of Gilneas have rallied around King Greymane''s call to arms and are ready to retake Gilneas City with the support of their new allies.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 261,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 730;
INSERT INTO `dbc`.`map` SET 
    `ID` = 730,
    `DirectoryName` = 'MaelstromZone',
    `MapName_Lang_enUS` = 'Maelstrom Zone',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 272,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 731;
INSERT INTO `dbc`.`map` SET 
    `ID` = 731,
    `DirectoryName` = 'DesolaceBomb',
    `MapName_Lang_enUS` = 'Stonetalon Bomb',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 732;
INSERT INTO `dbc`.`map` SET 
    `ID` = 732,
    `DirectoryName` = 'TolBarad',
    `MapName_Lang_enUS` = 'Tol Barad',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 265,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 734;
INSERT INTO `dbc`.`map` SET 
    `ID` = 734,
    `DirectoryName` = 'AhnQirajTerrace',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Ahn''Qiraj Terrace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 184,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 2;

DELETE FROM `dbc`.`map` WHERE `ID` = 736;
INSERT INTO `dbc`.`map` SET 
    `ID` = 736,
    `DirectoryName` = 'TwilightHighlandsDragonmawPhase',
    `MapName_Lang_enUS` = 'Twilight Highlands Dragonmaw Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 738;
INSERT INTO `dbc`.`map` SET 
    `ID` = 738,
    `DirectoryName` = 'Transport200100',
    `MapName_Lang_enUS` = 'Ship to Vashj''ir (Orgrimmar -> Vashj''ir)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 739;
INSERT INTO `dbc`.`map` SET 
    `ID` = 739,
    `DirectoryName` = 'Transport200101',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 740;
INSERT INTO `dbc`.`map` SET 
    `ID` = 740,
    `DirectoryName` = 'Transport200102',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 741;
INSERT INTO `dbc`.`map` SET 
    `ID` = 741,
    `DirectoryName` = 'Transport200103',
    `MapName_Lang_enUS` = 'Twilight Highlands Horde Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 742;
INSERT INTO `dbc`.`map` SET 
    `ID` = 742,
    `DirectoryName` = 'Transport203729',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Horde - Circling Abyssal Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 743;
INSERT INTO `dbc`.`map` SET 
    `ID` = 743,
    `DirectoryName` = 'Transport203730',
    `MapName_Lang_enUS` = 'Vashj''ir Sub - Alliance circling Abyssal Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 746;
INSERT INTO `dbc`.`map` SET 
    `ID` = 746,
    `DirectoryName` = 'UldumPhaseOasis',
    `MapName_Lang_enUS` = 'Uldum Phase Oasis',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 747;
INSERT INTO `dbc`.`map` SET 
    `ID` = 747,
    `DirectoryName` = 'Transport 203732',
    `MapName_Lang_enUS` = 'Transport: Deepholm Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 748;
INSERT INTO `dbc`.`map` SET 
    `ID` = 748,
    `DirectoryName` = 'Transport203858',
    `MapName_Lang_enUS` = 'Transport: Onyxia/Nefarian Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 749;
INSERT INTO `dbc`.`map` SET 
    `ID` = 749,
    `DirectoryName` = 'Transport203859',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 750;
INSERT INTO `dbc`.`map` SET 
    `ID` = 750,
    `DirectoryName` = 'Transport203860',
    `MapName_Lang_enUS` = 'Transport: Gilneas Static Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 751;
INSERT INTO `dbc`.`map` SET 
    `ID` = 751,
    `DirectoryName` = 'RedgridgeOrcBomb',
    `MapName_Lang_enUS` = 'Redridge - Orc Bomb',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 752;
INSERT INTO `dbc`.`map` SET 
    `ID` = 752,
    `DirectoryName` = 'RedridgeBridgePhaseOne',
    `MapName_Lang_enUS` = 'Redridge - Bridge Phase One',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 753;
INSERT INTO `dbc`.`map` SET 
    `ID` = 753,
    `DirectoryName` = 'RedridgeBridgePhaseTwo',
    `MapName_Lang_enUS` = 'Redridge - Bridge Phase Two',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 754;
INSERT INTO `dbc`.`map` SET 
    `ID` = 754,
    `DirectoryName` = 'SkywallRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Throne of the Four Winds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 271,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -11360.6,
    `CorpseY` = 72.0833,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 755;
INSERT INTO `dbc`.`map` SET 
    `ID` = 755,
    `DirectoryName` = 'UldumDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Lost City of the Tol''vir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 264,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -10686.2,
    `CorpseY` = -1308.62,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 757;
INSERT INTO `dbc`.`map` SET 
    `ID` = 757,
    `DirectoryName` = 'BaradinHold',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Baradin Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 269,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 759;
INSERT INTO `dbc`.`map` SET 
    `ID` = 759,
    `DirectoryName` = 'UldumPhasedEntrance',
    `MapName_Lang_enUS` = 'Uldum Phased Entrance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 760;
INSERT INTO `dbc`.`map` SET 
    `ID` = 760,
    `DirectoryName` = 'TwilightHighlandsPhasedEntrance',
    `MapName_Lang_enUS` = 'Twilight Highlands Phased Entrance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 761;
INSERT INTO `dbc`.`map` SET 
    `ID` = 761,
    `DirectoryName` = 'Gilneas_BG_2',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'The Battle for Gilneas',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'As the Greymane wall collapses, the inevitable conflict between the Forsaken and Worgen reaches a new climax.

The Battle for Gilneas is a 10 vs 10 domination battleground, where each side attempts to control the Mine, Lighthouse, and Waterworks for as long as possible.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 270,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1110;

DELETE FROM `dbc`.`map` WHERE `ID` = 762;
INSERT INTO `dbc`.`map` SET 
    `ID` = 762,
    `DirectoryName` = 'Transport 203861',
    `MapName_Lang_enUS` = 'Twilight Highlands Zeppelin 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 763;
INSERT INTO `dbc`.`map` SET 
    `ID` = 763,
    `DirectoryName` = 'Transport 203862',
    `MapName_Lang_enUS` = 'Twilight Highlands Zeppelin 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 764;
INSERT INTO `dbc`.`map` SET 
    `ID` = 764,
    `DirectoryName` = 'UldumPhaseWreckedCamp',
    `MapName_Lang_enUS` = 'Uldum - Phase Wrecked Camp',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 765;
INSERT INTO `dbc`.`map` SET 
    `ID` = 765,
    `DirectoryName` = 'Transport203863',
    `MapName_Lang_enUS` = 'Krazzworks Attack Zeppelin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 766;
INSERT INTO `dbc`.`map` SET 
    `ID` = 766,
    `DirectoryName` = 'Transport 2033864',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship 02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 767;
INSERT INTO `dbc`.`map` SET 
    `ID` = 767,
    `DirectoryName` = 'Transport 2033865',
    `MapName_Lang_enUS` = 'Transport: Gilneas Moving Gunship 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 859;
INSERT INTO `dbc`.`map` SET 
    `ID` = 859,
    `DirectoryName` = 'Zul_Gurub5Man',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Zul''Gurub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 161,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -11916.2,
    `CorpseY` = -1219.84,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 860;
INSERT INTO `dbc`.`map` SET 
    `ID` = 860,
    `DirectoryName` = 'NewRaceStartZone',
    `MapName_Lang_enUS` = 'The Wandering Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 289,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 960;

DELETE FROM `dbc`.`map` WHERE `ID` = 861;
INSERT INTO `dbc`.`map` SET 
    `ID` = 861,
    `DirectoryName` = 'FirelandsDailies',
    `MapName_Lang_enUS` = 'Molten Front',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 274,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 870;
INSERT INTO `dbc`.`map` SET 
    `ID` = 870,
    `DirectoryName` = 'HawaiiMainLand',
    `MapName_Lang_enUS` = 'Pandaria',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 930;
INSERT INTO `dbc`.`map` SET 
    `ID` = 930,
    `DirectoryName` = 'ScenarioAlcazIsland',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'A Dark Place',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 25,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 938;
INSERT INTO `dbc`.`map` SET 
    `ID` = 938,
    `DirectoryName` = 'COTDragonblight',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'End Time',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 286,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -8288.6,
    `CorpseY` = -4454.09,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 939;
INSERT INTO `dbc`.`map` SET 
    `ID` = 939,
    `DirectoryName` = 'COTWarOfTheAncients',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Well of Eternity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 287,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -8595.84,
    `CorpseY` = -3994.94,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 940;
INSERT INTO `dbc`.`map` SET 
    `ID` = 940,
    `DirectoryName` = 'TheHourOfTwilight',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Hour of Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 288,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -8291.13,
    `CorpseY` = -4590.44,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 951;
INSERT INTO `dbc`.`map` SET 
    `ID` = 951,
    `DirectoryName` = 'NexusLegendary',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Nexus Legendary',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 227,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 571,
    `CorpseX` = 3899.93,
    `CorpseY` = 6985.44,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 959;
INSERT INTO `dbc`.`map` SET 
    `ID` = 959,
    `DirectoryName` = 'ShadowpanHideout',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Shado-Pan Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 315,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 960;
INSERT INTO `dbc`.`map` SET 
    `ID` = 960,
    `DirectoryName` = 'EastTemple',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Temple of the Jade Serpent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 311,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 870,
    `CorpseX` = 957.706,
    `CorpseY` = -2473.41,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 961;
INSERT INTO `dbc`.`map` SET 
    `ID` = 961,
    `DirectoryName` = 'StormstoutBrewery',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Stormstout Brewery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 318,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 870,
    `CorpseX` = -688.705,
    `CorpseY` = 1267.45,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 962;
INSERT INTO `dbc`.`map` SET 
    `ID` = 962,
    `DirectoryName` = 'TheGreatWall',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Gate of the Setting Sun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 309,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 870,
    `CorpseX` = 970.811,
    `CorpseY` = 2253.66,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 967;
INSERT INTO `dbc`.`map` SET 
    `ID` = 967,
    `DirectoryName` = 'DeathwingBack',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Dragon Soul',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 279,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -8263.28,
    `CorpseY` = -4512.69,
    `TimeOfDayOverride` = 1080,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 968;
INSERT INTO `dbc`.`map` SET 
    `ID` = 968,
    `DirectoryName` = 'EyeoftheStorm2.0',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Rated Eye of the Storm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

This battlefield is coveted by the blood elves for its rich energy deposits.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Hovering high above the ravaged landscape of Netherstorm is the island known as the Eye of the Storm.

The draenei seek to claim it due to its proximity to the naaru''s mysterious vessel, Tempest Keep.

This battlefield is coveted by the blood elves for its rich energy deposits.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 210,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 971;
INSERT INTO `dbc`.`map` SET 
    `ID` = 971,
    `DirectoryName` = 'JadeForestAllianceHubPhase',
    `MapName_Lang_enUS` = 'Jade Forest Alliance Hub Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 972;
INSERT INTO `dbc`.`map` SET 
    `ID` = 972,
    `DirectoryName` = 'JadeForestBattlefieldPhase',
    `MapName_Lang_enUS` = 'Jade Forest Battlefield Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 974;
INSERT INTO `dbc`.`map` SET 
    `ID` = 974,
    `DirectoryName` = 'DarkmoonFaire',
    `MapName_Lang_enUS` = 'Darkmoon Faire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 278,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 975;
INSERT INTO `dbc`.`map` SET 
    `ID` = 975,
    `DirectoryName` = 'TurtleShipPhase01',
    `MapName_Lang_enUS` = 'Turtle Ship Phase 01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 289,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 960;

DELETE FROM `dbc`.`map` WHERE `ID` = 976;
INSERT INTO `dbc`.`map` SET 
    `ID` = 976,
    `DirectoryName` = 'TurtleShipPhase02',
    `MapName_Lang_enUS` = 'Turtle Ship Phase 02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 289,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 960;

DELETE FROM `dbc`.`map` WHERE `ID` = 977;
INSERT INTO `dbc`.`map` SET 
    `ID` = 977,
    `DirectoryName` = 'MaelstromDeathwingFight',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Maelstrom Deathwing Fight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 980;
INSERT INTO `dbc`.`map` SET 
    `ID` = 980,
    `DirectoryName` = 'TolVirArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Tol''Viron Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 319,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 994;
INSERT INTO `dbc`.`map` SET 
    `ID` = 994,
    `DirectoryName` = 'MoguDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Mogu''shan Palace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 312,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 995;
INSERT INTO `dbc`.`map` SET 
    `ID` = 995,
    `DirectoryName` = 'MoguInteriorRaid',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Depths [UNUSED]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 996;
INSERT INTO `dbc`.`map` SET 
    `ID` = 996,
    `DirectoryName` = 'MoguExteriorRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Terrace of Endless Spring',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 321,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 998;
INSERT INTO `dbc`.`map` SET 
    `ID` = 998,
    `DirectoryName` = 'ValleyOfPower',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Temple of Kotmogu',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Horde and Alliance wage battle for the ancient Mogu Artifact that is foretold to hold great powers.

Temple of Kotmogu is a 10 vs 10 powerball battleground where each side attempts to control the Mogu Artifact for as long as possible in different scoring zones.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 320,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 999;
INSERT INTO `dbc`.`map` SET 
    `ID` = 999,
    `DirectoryName` = 'BFTAllianceScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Theramore''s Fall (H)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 336,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1350,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 1000;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1000,
    `DirectoryName` = 'BFTHordeScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Theramore''s Fall (A)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 335,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 360,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 1001;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1001,
    `DirectoryName` = 'ScarletSanctuaryArmoryAndLibrary',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Scarlet Halls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 332,
    `MinimapIconScale` = 1.0,
    `CorpseX` = 2869.0,
    `CorpseY` = -820.0,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1004;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1004,
    `DirectoryName` = 'ScarletMonasteryCathedralGY',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Scarlet Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 333,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1005;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1005,
    `DirectoryName` = 'BrewmasterScenario01',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'A Brewing Storm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 322,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1007;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1007,
    `DirectoryName` = 'NewScholomance',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Scholomance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 314,
    `MinimapIconScale` = 1.0,
    `CorpseX` = 1274.78,
    `CorpseY` = -2552.56,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1008;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1008,
    `DirectoryName` = 'MogushanPalace',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Mogu''shan Vaults',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 313,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 870,
    `CorpseX` = 3983.0,
    `CorpseY` = 1121.29,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1009;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1009,
    `DirectoryName` = 'MantidRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Heart of Fear',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 310,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1010;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1010,
    `DirectoryName` = 'MistsCTF3',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'CTF3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This new map has yet to be created. Horde guys, go beat up those Alliance jerks.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This new map has yet to be created. Alliance guys, go beat up those Horde jerks.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 262,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1011;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1011,
    `DirectoryName` = 'MantidDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Siege of Niuzao Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 316,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1014;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1014,
    `DirectoryName` = 'MonkAreaScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Peak of Serenity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1019;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1019,
    `DirectoryName` = 'RuinsOfTheramore',
    `MapName_Lang_enUS` = 'Ruins of Theramore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1024;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1024,
    `DirectoryName` = 'PandaFishingVillageScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Greenstone Village',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 331,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1028;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1028,
    `DirectoryName` = 'MoguRuinsScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Mogu Ruins',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1029;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1029,
    `DirectoryName` = 'AncientMoguCryptScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1030;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1030,
    `DirectoryName` = 'AncientMoguCyptDestroyedScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Crypt of Forgotten Kings',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 330,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1031;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1031,
    `DirectoryName` = 'ProvingGroundsScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Arena of Annihilation',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 348,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1032;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1032,
    `DirectoryName` = 'PetBattleJadeForest',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Pet Battle - Jade Forest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1035;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1035,
    `DirectoryName` = 'ValleyOfPowerScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Temple of Kotmogu',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 334,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1043;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1043,
    `DirectoryName` = 'RingOfValorScenario',
    `MapName_Lang_enUS` = 'Brawl''gar Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 343,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 2;

DELETE FROM `dbc`.`map` WHERE `ID` = 1048;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1048,
    `DirectoryName` = 'BrewmasterScenario03',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Unga Ingoo',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 323,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1049;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1049,
    `DirectoryName` = 'BlackOxTempleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '(UNUSED) Scenario: Black Ox Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 21,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1050;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1050,
    `DirectoryName` = 'ScenarioKlaxxiIsland',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Assault on Zan''vess',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 344,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1051;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1051,
    `DirectoryName` = 'ScenarioBrewmaster04',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Brewmoon Festival',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 329,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1060;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1060,
    `DirectoryName` = 'LevelDesignLand-DevOnly',
    `MapName_Lang_enUS` = 'Level Design Land - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1061;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1061,
    `DirectoryName` = 'HordeBeachDailyArea',
    `MapName_Lang_enUS` = 'Horde Beach Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1062;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1062,
    `DirectoryName` = 'AllianceBeachDailyArea',
    `MapName_Lang_enUS` = 'Alliance Beach Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1064;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1064,
    `DirectoryName` = 'MoguIslandDailyArea',
    `MapName_Lang_enUS` = 'Mogu Island Daily Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 346,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1066;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1066,
    `DirectoryName` = 'StormwindGunshipPandariaStartArea',
    `MapName_Lang_enUS` = 'Stormwind Gunship Pandaria Start Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1074;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1074,
    `DirectoryName` = 'OrgrimmarGunshipPandariaStart',
    `MapName_Lang_enUS` = 'Orgrimmar Gunship Pandaria Start',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1075;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1075,
    `DirectoryName` = 'TheramoreScenarioPhase',
    `MapName_Lang_enUS` = 'Theramore''s Fall Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1076;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1076,
    `DirectoryName` = 'JadeForestHordeStartingArea',
    `MapName_Lang_enUS` = 'Jade Forest Horde Starting Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1095;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1095,
    `DirectoryName` = 'HordeAmbushScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Dagger in the Dark',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 342,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1098;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1098,
    `DirectoryName` = 'ThunderIslandRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Throne of Thunder',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 347,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1099;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1099,
    `DirectoryName` = 'NavalBattleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Naval Battle Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 349,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1101;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1101,
    `DirectoryName` = 'DefenseOfTheAleHouseBG',
    `MapName_Lang_enUS` = 'Defense Of The Ale House BG',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1102;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1102,
    `DirectoryName` = 'HordeBaseBeachScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Domination Point',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 341,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1103;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1103,
    `DirectoryName` = 'AllianceBaseBeachScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Lion''s Landing',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 340,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1104;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1104,
    `DirectoryName` = 'ALittlePatienceScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'A Little Patience',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 345,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1105;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1105,
    `DirectoryName` = 'GoldRushBG',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Deepwind Gorge (Legacy)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 354,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1106;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1106,
    `DirectoryName` = 'JainaDalaranScenario',
    `MapName_Lang_enUS` = 'Jaina Dalaran Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 235,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1107;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1107,
    `DirectoryName` = 'WarlockArea',
    `MapName_Lang_enUS` = 'Dreadscar Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 401,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1112;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1112,
    `DirectoryName` = 'BlackTempleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Pursuing the Black Harvest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 215,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1113;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1113,
    `DirectoryName` = 'DarkmoonCarousel',
    `MapName_Lang_enUS` = 'Transport: DarkmoonCarousel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1116;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1116,
    `DirectoryName` = 'Draenor',
    `MapName_Lang_enUS` = 'Draenor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1120;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1120,
    `DirectoryName` = 'ThunderKingHordeHub',
    `MapName_Lang_enUS` = 'Thunder King Horde Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1121;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1121,
    `DirectoryName` = 'ThunderIslandAllianceHub',
    `MapName_Lang_enUS` = 'Thunder Island Alliance Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1122;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1122,
    `DirectoryName` = 'CitySiegeMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'City Siege - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1123;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1123,
    `DirectoryName` = 'LightningForgeMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Lightning Forge - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1124;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1124,
    `DirectoryName` = 'ShipyardMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Shipyard - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1125;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1125,
    `DirectoryName` = 'AllianceHubMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Alliance Hub - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1126;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1126,
    `DirectoryName` = 'HordeHubMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Mogu Island Progression Events',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 346,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1127;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1127,
    `DirectoryName` = 'FinalGateMoguIslandProgressionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Final Gate - Mogu Island Progression Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1128;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1128,
    `DirectoryName` = 'MoguIslandEventsHordeBase',
    `MapName_Lang_enUS` = 'Mogu Island Events - Horde Base',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1129;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1129,
    `DirectoryName` = 'MoguIslandEventsAllianceBase',
    `MapName_Lang_enUS` = 'Mogu Island Events - Alliance Base',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1130;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1130,
    `DirectoryName` = 'ShimmerRidgeScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Blood in the Snow',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 352,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1131;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1131,
    `DirectoryName` = 'DarkHordeScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Secrets of Ragefire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 350,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1132;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1132,
    `DirectoryName` = 'Transport218599',
    `MapName_Lang_enUS` = 'Transport: The Skybag (Brawl''gar Arena)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1133;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1133,
    `DirectoryName` = 'Transport218600',
    `MapName_Lang_enUS` = 'Transport: Zandalari Ship (Mogu Island)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1134;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1134,
    `DirectoryName` = 'ShadoPanArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'The Tiger''s Peak',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 353,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1135;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1135,
    `DirectoryName` = 'MoguIslandLootRoom',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Mogu Island Loot Room',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 347,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1136;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1136,
    `DirectoryName` = 'OrgrimmarRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 359,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1144;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1144,
    `DirectoryName` = 'HeartOfTheOldGodScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Heart of the Old God Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 351,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1148;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1148,
    `DirectoryName` = 'ProvingGrounds',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Proving Grounds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 348,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1152;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1152,
    `DirectoryName` = 'FWHordeGarrisonLevel1',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 373,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1153;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1153,
    `DirectoryName` = 'FWHordeGarrisonLevel2',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 373,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1154;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1154,
    `DirectoryName` = 'FWHordeGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 4',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 373,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1155;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1155,
    `DirectoryName` = 'Stormgarde Keep',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Stromgarde Keep',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1157;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1157,
    `DirectoryName` = 'HalfhillScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halfhill Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1158;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1158,
    `DirectoryName` = 'SMVAllianceGarrisonLevel1',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 374,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1159;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1159,
    `DirectoryName` = 'SMVAllianceGarrisonLevel2',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 374,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1160;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1160,
    `DirectoryName` = 'SMVAllianceGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 4',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 374,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1161;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1161,
    `DirectoryName` = 'CelestialChallenge',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Celestial Tournament',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1200,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1166;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1166,
    `DirectoryName` = 'SmallBattlegroundA',
    `MapName_Lang_enUS` = 'Small Battleground A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1168;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1168,
    `DirectoryName` = 'ThePurgeOfGrommarScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Purge Of Grommar - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1169;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1169,
    `DirectoryName` = 'SmallBattlegroundB',
    `MapName_Lang_enUS` = 'Small Battleground B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1170;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1170,
    `DirectoryName` = 'SmallBattlegroundC',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Shado-Pan Showdown',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 353,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1171;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1171,
    `DirectoryName` = 'SmallBattlegroundD',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Small Battleground D',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Prototype Map',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Prototype Map',
    `MapDescription1_Lang_Mask` = 16712190,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1172;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1172,
    `DirectoryName` = 'Transport_Siege_of_Orgrimmar_Alliance',
    `MapName_Lang_enUS` = 'Transport: Siege of Orgrimmar (Alliance)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1173;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1173,
    `DirectoryName` = 'Transport_Siege_of_Orgrimmar_Horde',
    `MapName_Lang_enUS` = 'Transport: Siege of Orgrimmar (Horde)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1175;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1175,
    `DirectoryName` = 'OgreCompound',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Bloodmaul Slag Mines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 369,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1176;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1176,
    `DirectoryName` = 'MoonCultistHideout',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Shadowmoon Burial Grounds',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 364,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1179;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1179,
    `DirectoryName` = 'WarcraftHeroes',
    `MapName_Lang_enUS` = 'Warcraft Heroes',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1181;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1181,
    `DirectoryName` = 'PattyMackTestGarrisonBldgMap',
    `MapName_Lang_enUS` = 'PattyMack Test Garrison Bldg Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1182;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1182,
    `DirectoryName` = 'DraenorAuchindoun',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Auchindoun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 365,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1187;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1187,
    `DirectoryName` = 'GORAllianceGarrisonLevel1',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1188;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1188,
    `DirectoryName` = 'GORAllianceGarrisonLevel2',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1189;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1189,
    `DirectoryName` = 'GORAllianceGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'GOR Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1190;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1190,
    `DirectoryName` = 'BlastedLands',
    `MapName_Lang_enUS` = 'Blasted Lands Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 1191;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1191,
    `DirectoryName` = 'Ashran',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Ashran',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Off the coast of Tanaan Jungle lies an island home to an ancient Ogre civilization.  An ancient artifact has been rumored to be somewhere within Ashran.  If claimed, will be a devastating weapon to uphold.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1192;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1192,
    `DirectoryName` = 'Transport_Iron_Horde_Gorgrond_Train',
    `MapName_Lang_enUS` = 'Transport: Gorgrond Train',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1195;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1195,
    `DirectoryName` = 'WarWharfSmackdown',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Iron Docks',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 371,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1200;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1200,
    `DirectoryName` = 'BonetownScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Bonetown Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1203;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1203,
    `DirectoryName` = 'FrostfireFinaleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Frostfire Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1205;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1205,
    `DirectoryName` = 'BlackrockFoundryRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Blackrock Foundry',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 363,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1207;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1207,
    `DirectoryName` = 'TaladorIronHordeFinaleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Battle for Shattrath',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1208;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1208,
    `DirectoryName` = 'BlackrockFoundryTrainDepot',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Grimrail Depot',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 368,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1209;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1209,
    `DirectoryName` = 'ArakkoaDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Skyreach',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 367,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1212;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1212,
    `DirectoryName` = '6HU_GARRISON_Blacksmithing_hub',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1213;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1213,
    `DirectoryName` = 'alliance_garrison_alchemy',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1214;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1214,
    `DirectoryName` = 'alliance_garrison_enchanting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1215;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1215,
    `DirectoryName` = 'garrison_alliance_engineering',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1216;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1216,
    `DirectoryName` = 'garrison_alliance_farmhouse',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Farm1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1217;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1217,
    `DirectoryName` = 'garrison_alliance_inscription',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1218;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1218,
    `DirectoryName` = 'garrison_alliance_jewelcrafting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1219;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1219,
    `DirectoryName` = 'garrison_alliance_leatherworking',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1220;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1220,
    `DirectoryName` = 'Troll Raid',
    `MapName_Lang_enUS` = 'Broken Isles',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1221;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1221,
    `DirectoryName` = 'garrison_alliance_mine_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1222;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1222,
    `DirectoryName` = 'garrison_alliance_mine_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1223;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1223,
    `DirectoryName` = 'garrison_alliance_mine_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance Mine 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1224;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1224,
    `DirectoryName` = 'garrison_alliance_stable_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1225;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1225,
    `DirectoryName` = 'garrison_alliance_stable_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1226;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1226,
    `DirectoryName` = 'garrison_alliance_stable_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1227;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1227,
    `DirectoryName` = 'garrison_alliance_tailoring',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1228;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1228,
    `DirectoryName` = 'HighmaulOgreRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Highmaul',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 362,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1110,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1229;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1229,
    `DirectoryName` = 'garrison_alliance_inn_1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1230;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1230,
    `DirectoryName` = 'garrison_alliance_barn',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1231;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1231,
    `DirectoryName` = 'Transport227523',
    `MapName_Lang_enUS` = 'Transport: Wavemurder Barge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1232;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1232,
    `DirectoryName` = 'GorHordeGarrisonLevel0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'GOR Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1233;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1233,
    `DirectoryName` = 'GORHordeGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'GOR Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1234;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1234,
    `DirectoryName` = 'TALAllianceGarrisonLevel0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'TAL Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1235;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1235,
    `DirectoryName` = 'TALAllianceGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'TAL Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1236;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1236,
    `DirectoryName` = 'TALHordeGarrisonLevel0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'TAL Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1237;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1237,
    `DirectoryName` = 'TALHordeGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'TAL Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1238;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1238,
    `DirectoryName` = 'SOAAllianceGarrison0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SOA Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1239;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1239,
    `DirectoryName` = 'SOAAllianceGarrison3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SOA Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1240;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1240,
    `DirectoryName` = 'SOAHordeGarrison0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SOA Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1241;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1241,
    `DirectoryName` = 'SOAHordeGarrison3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SOA Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1242;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1242,
    `DirectoryName` = 'NAGAllianceGarrisonLevel0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'NAG Alliance Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1243;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1243,
    `DirectoryName` = 'NAGAllianceGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'NAG Alliance Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1244;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1244,
    `DirectoryName` = 'NAGHordeGarrisonLevel0',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'NAG Horde Garrison Level 0',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1245;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1245,
    `DirectoryName` = 'NAGHordeGarrisonLevel3',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'NAG Horde Garrison Level 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1247;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1247,
    `DirectoryName` = 'garrison_alliance_armory1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1248;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1248,
    `DirectoryName` = 'garrison_alliance_barracks1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1249;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1249,
    `DirectoryName` = 'garrison_alliance_engineering1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1250;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1250,
    `DirectoryName` = 'alliance_garrison_herb_garden1',
    `MapName_Lang_enUS` = 'Alliance - Garrison - Herb Garden 1 (UNUSED)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1251;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1251,
    `DirectoryName` = 'alliance_garrison_inn1',
    `MapName_Lang_enUS` = 'Alliance - Garrison - Inn 1 DONT USE',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1252;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1252,
    `DirectoryName` = 'garrison_alliance_lumbermill1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1253;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1253,
    `DirectoryName` = 'alliance_garrison_magetower1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1254;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1254,
    `DirectoryName` = 'garrison_alliance_pet_stable1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1255;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1255,
    `DirectoryName` = 'garrison_alliance_salvageyard1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1256;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1256,
    `DirectoryName` = 'garrison_alliance_storehouse1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1257;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1257,
    `DirectoryName` = 'garrison_alliance_trading_post1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1258;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1258,
    `DirectoryName` = 'garrison_alliance_tailoring1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1259;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1259,
    `DirectoryName` = 'garrison_alliance_enchanting',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1260;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1260,
    `DirectoryName` = 'garrison_alliance_blacksmith1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1261;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1261,
    `DirectoryName` = 'garrison_alliance_plot_small',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Plot Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1262;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1262,
    `DirectoryName` = 'garrison_alliance_plot_medium',
    `MapName_Lang_enUS` = 'Garrison - Allilance - Plot Medium',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1263;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1263,
    `DirectoryName` = 'garrison_alliance_plot_large',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Plot Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1264;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1264,
    `DirectoryName` = 'Propland-DevOnly',
    `MapName_Lang_enUS` = 'Propland - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 21,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1265;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1265,
    `DirectoryName` = 'TanaanJungleIntro',
    `MapName_Lang_enUS` = 'Tanaan Jungle Intro',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1266;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1266,
    `DirectoryName` = 'CircleofBloodScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Circle of Blood Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1268;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1268,
    `DirectoryName` = 'TerongorsConfrontation',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Teron''gor''s Confrontation',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1270;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1270,
    `DirectoryName` = 'devland3',
    `MapName_Lang_enUS` = 'Development Land 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1273;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1273,
    `DirectoryName` = 'nagrand_garrison_camp_stable_2',
    `MapName_Lang_enUS` = 'Nagrand - Garrison Camp - Stable2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1277;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1277,
    `DirectoryName` = 'DefenseOfKaraborScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Defense of Karabor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1278;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1278,
    `DirectoryName` = 'garrison_horde_barracks1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1279;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1279,
    `DirectoryName` = 'ShaperDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Everbloom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 370,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1280;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1280,
    `DirectoryName` = 'TrollRaid2',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Southshore vs. Tarren Mill',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1281;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1281,
    `DirectoryName` = 'garrison_horde_alchemy1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1282;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1282,
    `DirectoryName` = 'garrison_horde_armory1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1283;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1283,
    `DirectoryName` = 'garrison_horde_barn1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1284;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1284,
    `DirectoryName` = 'garrison_horde_blacksmith1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1285;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1285,
    `DirectoryName` = 'garrison_horde_enchanting1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1286;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1286,
    `DirectoryName` = 'garrison_horde_engineering1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1287;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1287,
    `DirectoryName` = 'garrison_horde_inn1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1288;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1288,
    `DirectoryName` = 'garrison_horde_inscription1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1289;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1289,
    `DirectoryName` = 'garrison_horde_jewelcrafting1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1290;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1290,
    `DirectoryName` = 'garrison_horde_leatherworking1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1291;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1291,
    `DirectoryName` = 'garrison_horde_lumbermill1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1292;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1292,
    `DirectoryName` = 'garrison_horde_magetower1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1293;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1293,
    `DirectoryName` = 'garrison_horde_mine1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1294;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1294,
    `DirectoryName` = 'garrison_alliance_petstabe',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1295;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1295,
    `DirectoryName` = 'garrison_horde_salvageyard1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1296;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1296,
    `DirectoryName` = 'garrison_horde_sparringarena1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1297;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1297,
    `DirectoryName` = 'garrison_horde_stable1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1298;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1298,
    `DirectoryName` = 'garrison_horde_storehouse1',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1299;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1299,
    `DirectoryName` = 'garrison_horde_tailoring1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1300;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1300,
    `DirectoryName` = 'garrison_horde_tradingpost1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1301;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1301,
    `DirectoryName` = 'garrison_horde_workshop1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1302;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1302,
    `DirectoryName` = 'garrison_alliance_workshop1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1303;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1303,
    `DirectoryName` = 'garrison_horde_farm1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Farm1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1304;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1304,
    `DirectoryName` = 'garrison_horde_plot_large',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1305;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1305,
    `DirectoryName` = 'garrison_horde_plot_medium',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Medium',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1306;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1306,
    `DirectoryName` = 'garrison_horde_plot_small',
    `MapName_Lang_enUS` = 'Garrison - Horde - Plot Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1307;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1307,
    `DirectoryName` = 'TanaanJungleIntroForgePhase',
    `MapName_Lang_enUS` = 'Tanaan Jungle Intro - Forge Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1308;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1308,
    `DirectoryName` = 'garrison_horde_fishing1',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1309;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1309,
    `DirectoryName` = 'garrison_alliance_fishing1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1310;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1310,
    `DirectoryName` = 'Expansion5QAModelMap',
    `MapName_Lang_enUS` = 'Expansion 5 QA Model Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1311;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1311,
    `DirectoryName` = 'outdoorGarrisonArenaHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Arena - Horde (NEEDS WMO)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1312;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1312,
    `DirectoryName` = 'outdoorGarrisonArenaAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Arena - Alliance (NEEDS WMO)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1313;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1313,
    `DirectoryName` = 'outdoorGarrisonLumberMillAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Lumber Mill - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1314;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1314,
    `DirectoryName` = 'outdoorGarrisonLumberMillHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Lumber Mill - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1315;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1315,
    `DirectoryName` = 'outdoorGarrisonArmoryHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Armory - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1316;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1316,
    `DirectoryName` = 'outdoorGarrisonArmoryAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Armory - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1317;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1317,
    `DirectoryName` = 'outdoorGarrisonMageTowerHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Mage Tower - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1318;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1318,
    `DirectoryName` = 'outdoorGarrisonMageTowerAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Mage Tower - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1319;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1319,
    `DirectoryName` = 'outdoorGarrisonStablesHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Stables - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1320;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1320,
    `DirectoryName` = 'outdoorGarrisonStablesAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Stables - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1321;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1321,
    `DirectoryName` = 'outdoorGarrisonWorkshopHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Workshop - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1322;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1322,
    `DirectoryName` = 'outdoorGarrisonWorkshopAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Workshop - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1323;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1323,
    `DirectoryName` = 'outdoorGarrisonInnHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Inn - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1324;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1324,
    `DirectoryName` = 'outdoorGarrisonInnAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Inn - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1325;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1325,
    `DirectoryName` = 'outdoorGarrisonTradingPostHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Tradiing Post 1 - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1326;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1326,
    `DirectoryName` = 'outdoorGarrisonTradingPostAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Tradiing Post - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1327;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1327,
    `DirectoryName` = 'outdoorGarrisonConstructionPlotHorde',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Medium - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1328;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1328,
    `DirectoryName` = 'outdoorGarrisonConstructionPlotAlliance',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Medium - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1329;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1329,
    `DirectoryName` = 'GrommasharScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Grommashar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1330;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1330,
    `DirectoryName` = 'FWHordeGarrisonLeve2new',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'FW Horde Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 373,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1331;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1331,
    `DirectoryName` = 'SMVAllianceGarrisonLevel2new',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'SMV Alliance Garrison Level 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 374,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1332;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1332,
    `DirectoryName` = 'garrison_horde_barracks2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1333;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1333,
    `DirectoryName` = 'garrison_horde_armory2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1334;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1334,
    `DirectoryName` = 'garrison_horde_barn2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1335;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1335,
    `DirectoryName` = 'garrison_horde_inn2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1336;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1336,
    `DirectoryName` = 'garrison_horde_lumbermill2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1337;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1337,
    `DirectoryName` = 'garrison_horde_magetower2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1338;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1338,
    `DirectoryName` = 'garrison_horde_petstable2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1339;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1339,
    `DirectoryName` = 'garrison_horde_stable2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1340;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1340,
    `DirectoryName` = 'garrison_horde_tradingpost2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1341;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1341,
    `DirectoryName` = 'garrison_horde_workshop2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1342;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1342,
    `DirectoryName` = 'garrison_horde_barracks3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barracks 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1343;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1343,
    `DirectoryName` = 'garrison_horde_armory3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Armory 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1344;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1344,
    `DirectoryName` = 'garrison_horde_barn3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Barn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1345;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1345,
    `DirectoryName` = 'garrison_horde_inn3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1346;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1346,
    `DirectoryName` = 'garrison_horde_magetower3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mage Tower 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1347;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1347,
    `DirectoryName` = 'garrison_horde_petstable3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Pet Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1348;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1348,
    `DirectoryName` = 'garrison_horde_stable3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1349;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1349,
    `DirectoryName` = 'garrison_horde_tradingpost3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Trading Post 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1350;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1350,
    `DirectoryName` = 'garrison_horde_workshop3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Workshop 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1351;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1351,
    `DirectoryName` = 'Garrison_Alliance_Large_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Large - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1352;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1352,
    `DirectoryName` = 'Garrison_Alliance_Medium_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Medium - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1353;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1353,
    `DirectoryName` = 'Garrison_Horde_Large_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Large - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1354;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1354,
    `DirectoryName` = 'Garrison_Horde_Medium_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Medium - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1358;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1358,
    `DirectoryName` = 'UpperBlackRockSpire',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Upper Blackrock Spire',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 7307,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 366,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7522.53,
    `CorpseY` = -1233.04,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5,
    `MaxPlayers` = 10;

DELETE FROM `dbc`.`map` WHERE `ID` = 1361;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1361,
    `DirectoryName` = 'garrisonAllianceMageTower2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1362;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1362,
    `DirectoryName` = 'garrisonAllianceMageTower3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Mage Tower 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1363;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1363,
    `DirectoryName` = 'garrison_horde_mine2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1364;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1364,
    `DirectoryName` = 'garrison_horde_mine3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Mine 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1367;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1367,
    `DirectoryName` = 'garrison_alliance_workshop2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1368;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1368,
    `DirectoryName` = 'garrison_alliance_workshop3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Workshop 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1369;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1369,
    `DirectoryName` = 'garrison_alliance_lumbermill2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1370;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1370,
    `DirectoryName` = 'garrison_alliance_lumbermill3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Lumbermill 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1371;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1371,
    `DirectoryName` = 'Garrison_Horde_Small_Construction',
    `MapName_Lang_enUS` = 'Garrison - Horde - Small - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1372;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1372,
    `DirectoryName` = 'Garrison_Alliance_Small_Construction',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Small - Construction',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1374;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1374,
    `DirectoryName` = 'AuchindounQuest',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Auchindoun Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1375;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1375,
    `DirectoryName` = 'alliance_garrison_alchemy_rank2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1376;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1376,
    `DirectoryName` = 'alliance_garrison_alchemy_rank3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Alchemy 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1377;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1377,
    `DirectoryName` = 'garrison_alliance_blacksmith2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Blacksmith 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1378;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1378,
    `DirectoryName` = 'garrison_alliance_enchanting2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Enchanting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1379;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1379,
    `DirectoryName` = 'garrison_alliance_engineering2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Engineering 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1380;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1380,
    `DirectoryName` = 'garrison_alliance_inscription2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1381;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1381,
    `DirectoryName` = 'garrison_alliance_inscription3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inscription 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1382;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1382,
    `DirectoryName` = 'garrison_alliance_jewelcrafting2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1383;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1383,
    `DirectoryName` = 'garrison_alliance_jewelcrafting3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Jewelcrafting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1384;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1384,
    `DirectoryName` = 'garrison_alliance_leatherworking2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1385;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1385,
    `DirectoryName` = 'garrison_alliance_leatherworking3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Leatherworking 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1386;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1386,
    `DirectoryName` = 'garrison_alliance_tailoring2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Tailoring 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1387;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1387,
    `DirectoryName` = 'garrison_alliance_storehouse2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1388;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1388,
    `DirectoryName` = 'garrison_alliance_storehouse3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - StoreHouse 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1389;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1389,
    `DirectoryName` = 'garrison_horde_storehouse2',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1390;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1390,
    `DirectoryName` = 'garrison_horde_storehouse3',
    `MapName_Lang_enUS` = 'Garrison - Horde Storehouse 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1391;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1391,
    `DirectoryName` = 'garrison_alliance_salvageyard2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1392;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1392,
    `DirectoryName` = 'garrison_alliance_salvageyard3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Salvage Yard 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1393;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1393,
    `DirectoryName` = 'garrison_horde_lumbermill3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Lumbermill 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1394;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1394,
    `DirectoryName` = 'garrison_alliance_pet_stable2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1395;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1395,
    `DirectoryName` = 'garrison_alliance_pet_stable3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Sparring Arena 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1396;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1396,
    `DirectoryName` = 'garrison_alliance_trading_post2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1397;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1397,
    `DirectoryName` = 'garrison_alliance_trading_post3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Trading Post 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1398;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1398,
    `DirectoryName` = 'garrison_alliance_barn2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1399;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1399,
    `DirectoryName` = 'garrison_alliance_barn3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1400;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1400,
    `DirectoryName` = 'garrison_alliance_inn_2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1401;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1401,
    `DirectoryName` = 'garrison_alliance_inn_3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Inn 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1402;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1402,
    `DirectoryName` = 'GorgrondFinaleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gorgrond Finale',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1403;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1403,
    `DirectoryName` = 'garrison_alliance_barracks2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1404;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1404,
    `DirectoryName` = 'garrison_alliance_barracks3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Barracks 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1405;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1405,
    `DirectoryName` = 'garrison_alliance_armory2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1406;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1406,
    `DirectoryName` = 'garrison_alliance_armory3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Armory 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1407;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1407,
    `DirectoryName` = 'GorgrondFinaleScenarioMap',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'zzzOld',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1409;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1409,
    `DirectoryName` = 'garrison_horde_sparringarena2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1410;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1410,
    `DirectoryName` = 'garrison_horde_sparringarena3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Sparring Arena 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1411;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1411,
    `DirectoryName` = 'garrison_horde_alchemy2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1412;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1412,
    `DirectoryName` = 'garrison_horde_alchemy3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Alchemy 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1413;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1413,
    `DirectoryName` = 'garrison_horde_blacksmith2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1414;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1414,
    `DirectoryName` = 'garrison_horde_blacksmith3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Blacksmith 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1415;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1415,
    `DirectoryName` = 'garrison_horde_enchanting2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1416;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1416,
    `DirectoryName` = 'garrison_horde_enchanting3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Enchanting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1417;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1417,
    `DirectoryName` = 'garrison_horde_inscription2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1418;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1418,
    `DirectoryName` = 'garrison_horde_inscription3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Inscription 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1419;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1419,
    `DirectoryName` = 'garrison_horde_leatherworking2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1420;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1420,
    `DirectoryName` = 'garrison_horde_leatherworking3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Leatherworking 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1421;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1421,
    `DirectoryName` = 'garrison_horde_jewelcrafting2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1422;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1422,
    `DirectoryName` = 'garrison_horde_jewelcrafting3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Jewelcrafting 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1423;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1423,
    `DirectoryName` = 'garrison_horde_tailoring2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1424;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1424,
    `DirectoryName` = 'garrison_horde_tailoring3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Tailoring 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1425;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1425,
    `DirectoryName` = 'garrison_horde_salvageyard2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1426;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1426,
    `DirectoryName` = 'garrison_horde_salvageyard3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Salvage Yard 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1427;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1427,
    `DirectoryName` = 'PattyMackTestGarrisonBldgMap2',
    `MapName_Lang_enUS` = 'PattyMack Test Garrison Bld Map2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1429;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1429,
    `DirectoryName` = 'garrison_horde_engineering2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1430;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1430,
    `DirectoryName` = 'garrison_horde_engineering3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Engineering 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1431;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1431,
    `DirectoryName` = 'SparringArenaLevel3Stadium',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Coliseum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'KILL EVERYONE',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'KILL EVERYONE',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1432;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1432,
    `DirectoryName` = 'garrison_horde_fishing2',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1433;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1433,
    `DirectoryName` = 'garrison_horde_fishing3',
    `MapName_Lang_enUS` = 'Garrison - Horde - Fishing 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1434;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1434,
    `DirectoryName` = 'garrison_alliance_fishing2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1435;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1435,
    `DirectoryName` = 'garrison_alliance_fishing3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Fishing 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1437;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1437,
    `DirectoryName` = 'garrison_alliance_petstable1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1438;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1438,
    `DirectoryName` = 'garrison_alliance_petstable2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1439;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1439,
    `DirectoryName` = 'garrison_alliance_petstable3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Pet Stable 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1440;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1440,
    `DirectoryName` = 'garrison_alliance_infirmary1',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1441;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1441,
    `DirectoryName` = 'garrison_alliance_infirmary2',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1442;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1442,
    `DirectoryName` = 'garrison_alliance_infirmary3',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Infirmary 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1446;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1446,
    `DirectoryName` = 'outdoorGarrisonConstructionPlotAllianceLarge',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Large - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1447;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1447,
    `DirectoryName` = 'outdoorGarrisonConstructionPlotHordeLarge',
    `MapName_Lang_enUS` = 'Outdoor Garrison - Construction Plot, Large - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1448;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1448,
    `DirectoryName` = 'HellfireRaid62',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Hellfire Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 375,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 360,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1451;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1451,
    `DirectoryName` = 'TanaanLegionTest',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tanaan Legion Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1453;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1453,
    `DirectoryName` = 'ScourgeofNorthshire',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Scourge of Northshire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1454;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1454,
    `DirectoryName` = 'ArtifactAshbringerOrigin',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Broken Shore (old - delete)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 251,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1455;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1455,
    `DirectoryName` = 'EdgeofRealityMount',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Edge of Reality',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 364,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1456;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1456,
    `DirectoryName` = 'NagaDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Eye of Azshara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 416,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1457;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1457,
    `DirectoryName` = 'FXlDesignLand-DevOnly',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Test Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 244,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1458;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1458,
    `DirectoryName` = '7_DungeonExteriorNeltharionsLair',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Neltharion''s Lair',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 407,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1459;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1459,
    `DirectoryName` = 'Transport_The_Iron_Mountain',
    `MapName_Lang_enUS` = 'Transport: The Iron Mountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1460;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1460,
    `DirectoryName` = 'BrokenShoreScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Broken Shore Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1461;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1461,
    `DirectoryName` = 'AzsunaScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Azsuna Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1462;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1462,
    `DirectoryName` = 'IllidansRock',
    `MapName_Lang_enUS` = 'Illidans Rock',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1463;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1463,
    `DirectoryName` = 'HelhiemExteriorArea',
    `MapName_Lang_enUS` = 'Helhiem Exterior Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1464;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1464,
    `DirectoryName` = 'TanaanJungle',
    `MapName_Lang_enUS` = 'Tanaan Jungle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1465;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1465,
    `DirectoryName` = 'TanaanJungleNoHubsPhase',
    `MapName_Lang_enUS` = 'Tanaan Jungle - No Hubs Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1466;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1466,
    `DirectoryName` = 'Emerald_Nightmare_ValSharah_exterior',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Darkheart Thicket',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 397,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1468;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1468,
    `DirectoryName` = 'WardenPrison',
    `MapName_Lang_enUS` = 'Warden Prison DH Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 398,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1469;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1469,
    `DirectoryName` = 'MaelstromShaman',
    `MapName_Lang_enUS` = 'The Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 405,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 1470;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1470,
    `DirectoryName` = 'Legion Dungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Legion Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 215,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1471;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1471,
    `DirectoryName` = '1466',
    `MapName_Lang_enUS` = 'Dungeon Test Map 1466',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1473;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1473,
    `DirectoryName` = 'GarrisonAllianceShipyard',
    `MapName_Lang_enUS` = 'Garrison - Alliance - Shipyard',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1474;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1474,
    `DirectoryName` = 'GarrisonHordeShipyard',
    `MapName_Lang_enUS` = 'Garrison - Horde - Shipyard',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1475;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1475,
    `DirectoryName` = 'TheMawofNashal',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Maw of Nashal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1476;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1476,
    `DirectoryName` = 'Transport_The_Maw_of_Nashal',
    `MapName_Lang_enUS` = 'Transport: The Maw of Nashal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1477;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1477,
    `DirectoryName` = 'Valhallas',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Halls of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 415,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1478;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1478,
    `DirectoryName` = 'ValSharahTempleofEluneScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Temple of Elune',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 182,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1479;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1479,
    `DirectoryName` = 'WarriorArtifactArea',
    `MapName_Lang_enUS` = 'Skyhold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 415,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1480;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1480,
    `DirectoryName` = 'DeathKnightArtifactArea',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Icecrown Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 250,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1481;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1481,
    `DirectoryName` = 'legionnexus',
    `MapName_Lang_enUS` = 'Mardum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 378,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1482;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1482,
    `DirectoryName` = 'GarrisonShipyardAllianceSubmarine',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Submarine - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1483;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1483,
    `DirectoryName` = 'GarrisonShipyardAllianceDestroyer',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Destroyer - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1484;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1484,
    `DirectoryName` = 'GarrisonShipyardTransport',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1485;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1485,
    `DirectoryName` = 'GarrisonShipyardDreadnaught',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Battleship - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1486;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1486,
    `DirectoryName` = 'GarrisonShipyardCarrier',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Carrier - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1487;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1487,
    `DirectoryName` = 'GarrisonShipyardHordeSubmarine',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Submarine - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1488;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1488,
    `DirectoryName` = 'GarrisonShipyardHordeDestroyer',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Destroyer - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1489;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1489,
    `DirectoryName` = 'Artifact-PortalWorldAcqusition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Niskara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 408,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1492;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1492,
    `DirectoryName` = 'Helheim',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Maw of Souls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 399,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1493;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1493,
    `DirectoryName` = 'WardenPrisonDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Vault of the Wardens',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 398,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1494;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1494,
    `DirectoryName` = 'AcquisitionVioletHold',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Violet Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 420,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1495;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1495,
    `DirectoryName` = 'AcquisitionWarriorProt',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Shield''s Rest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1496;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1496,
    `DirectoryName` = 'GarrisonShipyardCarrierAlliance',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Carrier - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1497;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1497,
    `DirectoryName` = 'GarrisonShipyardGalleonHorde',
    `MapName_Lang_enUS` = 'Garrison Shipyard - Battleship - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1498;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1498,
    `DirectoryName` = 'AcquisitionHavoc',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Felsoul Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1499;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1499,
    `DirectoryName` = 'Artifact-Warrior Fury Acquisition',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'oldArtifact - Warrior Fury Acquisition',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1500;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1500,
    `DirectoryName` = 'ArtifactPaladinRetAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Broken Shore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1501;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1501,
    `DirectoryName` = 'BlackRookHoldDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Black Rook Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 404,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1502;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1502,
    `DirectoryName` = 'DalaranUnderbelly',
    `MapName_Lang_enUS` = 'Dalaran Underbelly',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1503;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1503,
    `DirectoryName` = 'ArtifactShamanElementalAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Deepholm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 268,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1504;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1504,
    `DirectoryName` = 'BlackrookHoldArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Black Rook Hold Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 413,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1505;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1505,
    `DirectoryName` = 'NagrandArena2',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Nagrand Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 421,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1509;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1509,
    `DirectoryName` = 'BloodtotemCavernFelPhase',
    `MapName_Lang_enUS` = 'Bloodtotem Cavern - Fel Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1510;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1510,
    `DirectoryName` = 'BloodtotemCavernTaurenPhase',
    `MapName_Lang_enUS` = 'Bloodtotem Cavern - Tauren Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1511;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1511,
    `DirectoryName` = 'Artifact-WarriorFuryAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tideskorn Harbor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1512;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1512,
    `DirectoryName` = 'Artifact-PriestHunterOrderHall',
    `MapName_Lang_enUS` = 'Netherlight Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 406,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1513;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1513,
    `DirectoryName` = 'Artifact-MageOrderHall',
    `MapName_Lang_enUS` = 'Hall of the Guardian',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 410,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1514;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1514,
    `DirectoryName` = 'Artifact-MonkOrderHall',
    `MapName_Lang_enUS` = 'The Wandering Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 393,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1515;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1515,
    `DirectoryName` = 'HulnHighmountain',
    `MapName_Lang_enUS` = 'Huln''s War',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1516;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1516,
    `DirectoryName` = 'SuramarCatacombsDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Arcway',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 402,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1517;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1517,
    `DirectoryName` = 'StormheimPrescenarioWindrunner',
    `MapName_Lang_enUS` = 'Stormheim Prescenario Windrunner',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1518;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1518,
    `DirectoryName` = 'StormheimPrescenarioSkyfire',
    `MapName_Lang_enUS` = 'Stormheim Prescenario Skyfire',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1519;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1519,
    `DirectoryName` = 'ArtifactsDemonHunterOrderHall',
    `MapName_Lang_enUS` = 'The Fel Hammer',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 396,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1520;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1520,
    `DirectoryName` = 'NightmareRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'The Emerald Nightmare',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 400,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1522;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1522,
    `DirectoryName` = 'ArtifactWarlockOrderHallScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Dreadscar Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 401,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1523;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1523,
    `DirectoryName` = 'MardumScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Defense of the Fel Hammer Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 396,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1526;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1526,
    `DirectoryName` = 'Artifact-WhiteTigerTempleAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Temple of the White Tiger',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 334,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1527;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1527,
    `DirectoryName` = 'HighMountain',
    `MapName_Lang_enUS` = 'High Mountain Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1528;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1528,
    `DirectoryName` = 'Artifact-SkywallAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Skywall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 259,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1529;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1529,
    `DirectoryName` = 'KarazhanScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Karazhan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1530;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1530,
    `DirectoryName` = 'SuramarRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'The Nighthold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 412,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1532;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1532,
    `DirectoryName` = 'HighMountainMesa',
    `MapName_Lang_enUS` = 'High Mountain Mesa Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1533;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1533,
    `DirectoryName` = 'Artifact-KarazhanAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Karazhan Catacombs',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1534;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1534,
    `DirectoryName` = 'Artifact-DefenseofMoongladeScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Moonglade',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1535;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1535,
    `DirectoryName` = 'DefenseofMoongladeScenario',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Moonglade',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1536;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1536,
    `DirectoryName` = 'UrsocsLairScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Ursocs Lair',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 397,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1537;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1537,
    `DirectoryName` = 'BoostExperience',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'zzOLD - Boost Experience',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 376,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1538;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1538,
    `DirectoryName` = 'Karazhan Scenario',
    `MapName_Lang_enUS` = 'test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1539;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1539,
    `DirectoryName` = 'Artifact-AcquisitionArmsHolyShadow',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tirisfal Glades',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1540;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1540,
    `DirectoryName` = 'Artifact-Dreamway',
    `MapName_Lang_enUS` = 'Emerald Dreamway',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 418,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1541;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1541,
    `DirectoryName` = 'Artifact-TerraceofEndlessSpringAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Terrace of Endless Spring',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 321,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1544;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1544,
    `DirectoryName` = 'LegionVioletHoldDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Assault on Violet Hold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 420,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1545;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1545,
    `DirectoryName` = 'Artifact-Acquisition-CombatResto',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Azsuna',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1547;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1547,
    `DirectoryName` = 'Artifacts-CombatAcquisitionShip',
    `MapName_Lang_enUS` = 'Artifact - Combat - Acquisition Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1549;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1549,
    `DirectoryName` = 'TechTestSeamlessWorldTransitionA',
    `MapName_Lang_enUS` = 'Tech Test - Seamless World Transition A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1550;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1550,
    `DirectoryName` = 'TechTestSeamlessWorldTransitionB',
    `MapName_Lang_enUS` = 'Tech Test - Seamless World Transition B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1552;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1552,
    `DirectoryName` = 'ValsharahArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Ashamane''s Fall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 417,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1553;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1553,
    `DirectoryName` = 'Artifact-Acquisition-Underlight',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gloaming Reef',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1554;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1554,
    `DirectoryName` = 'BoostExperience2',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '7.0 Boost Experience - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1555;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1555,
    `DirectoryName` = 'TransportBoostExperienceAllianceGunship',
    `MapName_Lang_enUS` = 'zzOLD - Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1556;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1556,
    `DirectoryName` = 'TransportBoostExperienceHordeGunship',
    `MapName_Lang_enUS` = 'zzOLD - Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1557;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1557,
    `DirectoryName` = 'BoostExperience2Horde',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '7.0 Boost Experience - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1559;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1559,
    `DirectoryName` = 'TransportBoostExperienceHordeGunship2',
    `MapName_Lang_enUS` = '7.0 Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1560;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1560,
    `DirectoryName` = 'TransportBoostExperienceAllianceGunship2',
    `MapName_Lang_enUS` = '7.0 Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1561;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1561,
    `DirectoryName` = 'TechTestCosmeticParentPerformance',
    `MapName_Lang_enUS` = 'Tech Test - Cosmetic Parent Performance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1571;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1571,
    `DirectoryName` = 'SuramarCityDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Court of Stars',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 419,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1572;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1572,
    `DirectoryName` = 'MaelstromShamanHubIntroScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 272,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 1579;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1579,
    `DirectoryName` = 'UdluarScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Ulduar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 244,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1580;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1580,
    `DirectoryName` = 'MaelstromTitanScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 272,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1582;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1582,
    `DirectoryName` = 'Artifact�DalaranVaultAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Delete',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1583;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1583,
    `DirectoryName` = 'Artifact-DalaranVaultAcquisition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Nexus Vault',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 227,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1584;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1584,
    `DirectoryName` = 'JulienTestLand-DevOnly',
    `MapName_Lang_enUS` = 'Julien Test Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1586;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1586,
    `DirectoryName` = 'AssualtOnStormwind',
    `MapName_Lang_enUS` = 'Assault on Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1020,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1588;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1588,
    `DirectoryName` = 'DevMapA',
    `MapName_Lang_enUS` = 'Dev Map - A - Jared Coulston',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1589;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1589,
    `DirectoryName` = 'DevMapB',
    `MapName_Lang_enUS` = 'Dev Map - B - Nathaniel Chapman',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = '- NO DESCRIPTION -',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = '- NO DESCRIPTION -',
    `MapDescription1_Lang_Mask` = 16712190,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1590;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1590,
    `DirectoryName` = 'DevMapC',
    `MapName_Lang_enUS` = 'Dev Map - C - Julien Tremblay',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1591;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1591,
    `DirectoryName` = 'DevMapD',
    `MapName_Lang_enUS` = 'Dev Map - D - PotT',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1592;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1592,
    `DirectoryName` = 'DevMapE',
    `MapName_Lang_enUS` = 'Dev Map - E',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1593;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1593,
    `DirectoryName` = 'DevMapF',
    `MapName_Lang_enUS` = 'Dev Map - F',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1594;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1594,
    `DirectoryName` = 'DevMapG',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The MOTHERLODE!!',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 440,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 120,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1599;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1599,
    `DirectoryName` = 'ArtifactRestoAcqusition',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Nordrassil',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1600;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1600,
    `DirectoryName` = 'ArtifactThroneoftheTides',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Throne of the Tides',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 255,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1602;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1602,
    `DirectoryName` = 'SkywallDungeon_OrderHall',
    `MapName_Lang_enUS` = 'Artifact - The Vortex Pinnacle - Shaman Order Hall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 259,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -11522.5,
    `CorpseY` = -2317.93,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1603;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1603,
    `DirectoryName` = 'AbyssalMaw_Interior_Scenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Throne of the Tides Scenario(DELETE)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 255,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -5585.87,
    `CorpseY` = 5401.65,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 3;

DELETE FROM `dbc`.`map` WHERE `ID` = 1604;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1604,
    `DirectoryName` = 'Artifact-PortalWorldNaskora',
    `MapName_Lang_enUS` = 'Artifact - Order Campaign - Portal World Niskara',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 408,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1605;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1605,
    `DirectoryName` = 'FirelandsArtifact',
    `MapName_Lang_enUS` = 'Firelands_Artifact',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 274,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1607;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1607,
    `DirectoryName` = 'ArtifactAcquisitionSubtlety',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Acquisition - Subtlety',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 378,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1608;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1608,
    `DirectoryName` = 'Hyjal Instance',
    `MapName_Lang_enUS` = 'Hyjal War of the Ancients Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1609;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1609,
    `DirectoryName` = 'AcquisitionTempleofstorms',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Temple of Storms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1610;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1610,
    `DirectoryName` = 'Artifact-SerenityLegionScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Serenity Legion Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1611;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1611,
    `DirectoryName` = 'DeathKnightCampaign-LightsHopeChapel',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Death Knight Campaign - Light''s Hope Chapel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1612;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1612,
    `DirectoryName` = 'TheRuinsofFalanaar',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Ruins of Falanaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 417,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1616;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1616,
    `DirectoryName` = 'Faronaar',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Faronaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1617;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1617,
    `DirectoryName` = 'DeathKnightCampaign-Undercity',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Death Knight Campaign - Undercity',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 376,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1618;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1618,
    `DirectoryName` = 'DeathKnightCampaign-ScarletMonastery',
    `MapName_Lang_enUS` = 'Death Knight Campaign - Scarlet Monastery',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1620;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1620,
    `DirectoryName` = 'ArtifactStormwind',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1621;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1621,
    `DirectoryName` = 'BlackTemple-Legion',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Black Temple - Legion',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 215,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1622;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1622,
    `DirectoryName` = 'IllidanTemp',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Telogrus Rift Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1623;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1623,
    `DirectoryName` = 'MageCampaign-TheOculus',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Mage Campaign - The Oculus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 227,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1624;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1624,
    `DirectoryName` = 'BattleofExodar',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Battle of Exodar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1625;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1625,
    `DirectoryName` = 'TrialoftheSerpent',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Trial of the Serpent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 311,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1626;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1626,
    `DirectoryName` = 'TheCollapseSuramarScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Collapse - Suramar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1627;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1627,
    `DirectoryName` = 'FelHammerDHScenario',
    `MapName_Lang_enUS` = 'Fel Hammer DH Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1628;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1628,
    `DirectoryName` = 'Transport251513',
    `MapName_Lang_enUS` = 'Transport: Alliance Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1629;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1629,
    `DirectoryName` = 'NetherlightTemplePrison',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Netherlight Temple',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 406,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1630;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1630,
    `DirectoryName` = 'TolBarad1',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tol Barad',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 265,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1632;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1632,
    `DirectoryName` = 'TheArcwaySuramarScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Arcway - Suramar Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 402,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1637;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1637,
    `DirectoryName` = 'TransportAllianceShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Alliance Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1638;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1638,
    `DirectoryName` = 'TransportHordeShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Horde Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1639;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1639,
    `DirectoryName` = 'TransportKvaldirShipPhaseableMO',
    `MapName_Lang_enUS` = 'Transport: Kvaldir Ship PhaseableMO',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1642;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1642,
    `DirectoryName` = 'Zandalar',
    `MapName_Lang_enUS` = 'Zandalar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 552,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1643;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1643,
    `DirectoryName` = 'KulTiras',
    `MapName_Lang_enUS` = 'Kul Tiras',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 551,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1644;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1644,
    `DirectoryName` = 'PlunderIsle',
    `MapName_Lang_enUS` = 'Plunder Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1645;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1645,
    `DirectoryName` = 'Islands',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Crescent Isle (Islands Prototype)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1646;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1646,
    `DirectoryName` = 'BlackRookSenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Black Rook Hold [Scenario]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 404,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1647;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1647,
    `DirectoryName` = 'VoljinsFuneralPyre',
    `MapName_Lang_enUS` = 'Vol''jin''s Funeral Pyre',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1648;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1648,
    `DirectoryName` = 'Helhiem2',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Trial of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 422,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1649;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1649,
    `DirectoryName` = 'Transport254124',
    `MapName_Lang_enUS` = 'Transport: Horde Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1650;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1650,
    `DirectoryName` = 'Acherus',
    `MapName_Lang_enUS` = 'Legion Command Ship Transport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1651;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1651,
    `DirectoryName` = 'Karazahn1',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Return to Karazhan',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 3457,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 423,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -11110.4,
    `CorpseY` = -2004.06,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6,
    `MaxPlayers` = 10;

DELETE FROM `dbc`.`map` WHERE `ID` = 1653;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1653,
    `DirectoryName` = 'LightsHeart',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Great Dark Beyond',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1655;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1655,
    `DirectoryName` = '8DevLand',
    `MapName_Lang_enUS` = '8.0 Dev Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 146,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1657;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1657,
    `DirectoryName` = 'BladesEdgeArena2',
    `MapName_Lang_enUS` = 'zzOldBlade''s Edge Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 218,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1658;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1658,
    `DirectoryName` = 'EnvironmentLandDevOnly',
    `MapName_Lang_enUS` = 'Environment Art Land - Dev Only',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1661;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1661,
    `DirectoryName` = 'Gnoll Revolution',
    `MapName_Lang_enUS` = '[DEV] Demo Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 191,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1662;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1662,
    `DirectoryName` = 'SuramarEndScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Suramar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1663;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1663,
    `DirectoryName` = 'DungeonBlockout',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Dungeon Blockout',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1666;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1666,
    `DirectoryName` = 'BrokenShoreIntro',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Assault on Broken Shore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1667;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1667,
    `DirectoryName` = 'LegionShipVertical',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1668;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1668,
    `DirectoryName` = 'LegionShipHorizontal',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1669;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1669,
    `DirectoryName` = 'Argus 1',
    `MapName_Lang_enUS` = 'Argus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 432,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1670;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1670,
    `DirectoryName` = 'BrokenshorePristine',
    `MapName_Lang_enUS` = 'Broken Shore (Delete)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1671;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1671,
    `DirectoryName` = 'BrokenShorePrepatch',
    `MapName_Lang_enUS` = 'Broken Shore - Prepatch 7.2 (Backup)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1672;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1672,
    `DirectoryName` = 'bladesedgearena2b',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Blade''s Edge Arena',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 3702,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 424,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1673;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1673,
    `DirectoryName` = 'EyeofEternityScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 236,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1675;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1675,
    `DirectoryName` = 'WinterAB',
    `MapName_Lang_enUS` = 'Winter AB_old',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1676;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1676,
    `DirectoryName` = 'TombofSargerasRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Tomb of Sargeras',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 427,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1677;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1677,
    `DirectoryName` = 'TombofSargerasDeungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Cathedral of Eternal Night',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 426,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1678;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1678,
    `DirectoryName` = 'ABPhase1',
    `MapName_Lang_enUS` = 'AB Phase 1',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1679;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1679,
    `DirectoryName` = 'ABPhase2',
    `MapName_Lang_enUS` = 'AB Phase 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1680;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1680,
    `DirectoryName` = 'ABPhase3',
    `MapName_Lang_enUS` = 'AB Phase 3',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1681;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1681,
    `DirectoryName` = 'ABWinter',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin Winter',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 425,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1682;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1682,
    `DirectoryName` = 'ArtifactsDemonHunterOrderHallPhase',
    `MapName_Lang_enUS` = 'The Fel Hammer Terrain Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 396,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1683;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1683,
    `DirectoryName` = 'ArtifactGnomeregan',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Gnomeregan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 193,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1684;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1684,
    `DirectoryName` = 'dreadscarriftwarlockplatform',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Dread Scar Rift - Warlock Scenario Platform',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 401,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1685;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1685,
    `DirectoryName` = 'AITestMap8',
    `MapName_Lang_enUS` = 'AI Test Map 8',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1686;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1686,
    `DirectoryName` = 'AITestMap8b',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'AI Test - Arathi Basin',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 8526,
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1687;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1687,
    `DirectoryName` = 'WailingCavernsPetBattle',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Wailing Caverns',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 143,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1688;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1688,
    `DirectoryName` = 'DeadminesPetBattle',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Deadmines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 142,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1689;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1689,
    `DirectoryName` = 'EyeofEternityMageClassMount',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Mage Class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 236,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1690;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1690,
    `DirectoryName` = 'SnakeCave',
    `MapName_Lang_enUS` = 'Snake Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1691;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1691,
    `DirectoryName` = 'CookingImpossible',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Cooking: Impossible',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This brawl takes place in the Valley of the Four Winds

Cooking: Impossible is a 10 flag capture style battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 354,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1692;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1692,
    `DirectoryName` = 'PitofSaronDeathKnight',
    `MapName_Lang_enUS` = 'Pit of Saron - Death Knight Campaign',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 252,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `CorpseX` = 5592.06,
    `CorpseY` = 2010.27,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1693;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1693,
    `DirectoryName` = 'MardumScenarioClientScene',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Stormstout Brewery - Monk Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 318,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1694;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1694,
    `DirectoryName` = 'GnomereganPetBattle',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gnomeregan',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 193,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1695;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1695,
    `DirectoryName` = 'BrokenShoreBattleshipFinale',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Battleship: Ruin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1696;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1696,
    `DirectoryName` = 'LegionCommandCenter',
    `MapName_Lang_enUS` = 'Legion - Command Center',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1697;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1697,
    `DirectoryName` = 'LegionSpiderCave',
    `MapName_Lang_enUS` = 'Legion - Legion Spider Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1698;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1698,
    `DirectoryName` = 'ArtifactAcquisitionTank',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Acquisition - Tank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1699;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1699,
    `DirectoryName` = 'LegionFelCave',
    `MapName_Lang_enUS` = 'Legion - Legion Fel Cave',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1700;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1700,
    `DirectoryName` = 'LegionFelFirenovaArea',
    `MapName_Lang_enUS` = 'Legion - Legion Fel Firenova Area',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1701;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1701,
    `DirectoryName` = 'LegionBarracks',
    `MapName_Lang_enUS` = 'Legion - Legion Barracks',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1702;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1702,
    `DirectoryName` = 'ArtifactHighmountainDualBoss',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Artifact - Highmountain - Dual Boss',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 407,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1703;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1703,
    `DirectoryName` = 'HallsofValorScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halls of Valor - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 415,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1704;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1704,
    `DirectoryName` = 'LegionShipHorizontalValsharah',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal - Valsharah',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1705;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1705,
    `DirectoryName` = 'LegionShipHorizontalAzsuna',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Horizontal - Azsuna',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1706;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1706,
    `DirectoryName` = 'LegionShipHorizontalHighMountain',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical - HighMountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1707;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1707,
    `DirectoryName` = 'LegionShipHorizontalStormheim',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Legion Ship - Vertical - Stormheim',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1708;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1708,
    `DirectoryName` = 'StratholmePaladinClassMount',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Stratholme - Paladin Class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 101,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1710;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1710,
    `DirectoryName` = 'BlackRookHoldArtifactChallenge',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Black Rook Hold - Artifact Challenge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 404,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1711;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1711,
    `DirectoryName` = 'SouthseaPirateShip715BoatHoliday',
    `MapName_Lang_enUS` = 'Alliance Submarine (7.1.5 Boat Holiday)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1712;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1712,
    `DirectoryName` = 'ArgusRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Antorus, the Burning Throne',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 431,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1260,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1714;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1714,
    `DirectoryName` = 'HallsOfValorWarriorClassMount',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halls Of Valor - Warrior Class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 415,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1715;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1715,
    `DirectoryName` = 'BlackrockMountainBrawl',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Battle for Blackrock Mountain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 189,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1716;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1716,
    `DirectoryName` = 'brokenshorewardentower',
    `MapName_Lang_enUS` = 'Broken Shore Mage Tower',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1717;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1717,
    `DirectoryName` = 'AnimPlayground',
    `MapName_Lang_enUS` = 'Anim Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 182,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1718;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1718,
    `DirectoryName` = 'Nazjatar',
    `MapName_Lang_enUS` = 'Nazjatar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 571,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1719;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1719,
    `DirectoryName` = 'warlockmountscenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Dread Scar Rift - Warlock Mount Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 401,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1723;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1723,
    `DirectoryName` = 'ColdridgeValley',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Coldridge Valley',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1726;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1726,
    `DirectoryName` = 'RaceTrackBG',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = '[TEMP] RaceTrackBG',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 376,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1728;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1728,
    `DirectoryName` = 'HallsofValorHunterScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halls of Valor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 415,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1729;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1729,
    `DirectoryName` = 'EyeofEternityMageClassMountShort',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - Mage Class Mount (Shorter Version)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 236,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1730;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1730,
    `DirectoryName` = 'ShrineofAvianaDefenseScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Shrine of Aviana Defense - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1731;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1731,
    `DirectoryName` = 'DruidMountFinaleScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Druid Mount Finale - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1732;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1732,
    `DirectoryName` = 'FelwingLedgeDemonHunterClassMount',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Felwing Ledge - Demon Hunter Class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 396,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1733;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1733,
    `DirectoryName` = 'AzerothsWarningScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Azeroth''s Warning Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1734;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1734,
    `DirectoryName` = 'ThroneoftheFourWindsShamanClassMounts',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Throne of the Four Winds - Shaman Class Mount',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 271,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1735;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1735,
    `DirectoryName` = 'DKMountScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Frozen Wastes',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1736;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1736,
    `DirectoryName` = 'RubySanctumDKMountScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Ruby Sanctum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 254,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1737;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1737,
    `DirectoryName` = 'AkazamarakHatScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Pocket Dimension Akazamzaraks Hat Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1738;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1738,
    `DirectoryName` = 'LostGlacierDKMountScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Lost Glacier',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1739;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1739,
    `DirectoryName` = 'AITestMapABDebug',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'AI Test Map - Arathi Basin - Debug Version',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 8526,
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 183,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1740;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1740,
    `DirectoryName` = 'AITestMapWSGDebug',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'AI Test - Warsong Gulch',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 8526,
    `MapDescription0_Lang_enUS` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 122,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1741;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1741,
    `DirectoryName` = 'ExodarDalaran',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1744;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1744,
    `DirectoryName` = 'MogWeek',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Trial of Style',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 224,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1746;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1746,
    `DirectoryName` = 'ArcatrazScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tempest Keep: The Arcatraz',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 206,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1747;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1747,
    `DirectoryName` = 'animationplayground',
    `MapName_Lang_enUS` = 'Animation Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 270,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1749;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1749,
    `DirectoryName` = 'WarfrontBarrens',
    `MapName_Lang_enUS` = 'Warfront Barrens',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1750;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1750,
    `DirectoryName` = 'Azuremyst Isle (7.3 Intro)',
    `MapName_Lang_enUS` = 'Azuremyst Isle',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 198,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1751;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1751,
    `DirectoryName` = 'AllianceBattleship73Intro',
    `MapName_Lang_enUS` = 'Alliance Battleship (7.3 Intro)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1752;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1752,
    `DirectoryName` = 'SunstriderShip73Intro',
    `MapName_Lang_enUS` = 'Sunstrider Battleship (7.3 Intro)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1753;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1753,
    `DirectoryName` = 'ArgusDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Seat of the Triumvirate',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 430,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1754;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1754,
    `DirectoryName` = 'PirateTownDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Freehold',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 547,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 360,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1756;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1756,
    `DirectoryName` = 'ChromieScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Deaths of Chromie',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 428,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1759;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1759,
    `DirectoryName` = 'Transport_WarfrontBarrensGunship',
    `MapName_Lang_enUS` = 'Transport: WarfrontBarrensGunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1760;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1760,
    `DirectoryName` = 'LordaeronScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Lordaeron',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1762;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1762,
    `DirectoryName` = 'CityofGoldInteriorDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Kings'' Rest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 439,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1763;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1763,
    `DirectoryName` = 'CityofGoldExteriorDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Atal''Dazar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 438,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1764;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1764,
    `DirectoryName` = 'EndlessHallsScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Endless Halls',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 330,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1765;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1765,
    `DirectoryName` = 'WarfrontsPrototype',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Warfronts Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1771;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1771,
    `DirectoryName` = 'KulTirasPrison',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Tol Dagor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 550,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1773;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1773,
    `DirectoryName` = 'VoildElf',
    `MapName_Lang_enUS` = 'Shadow of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1774;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1774,
    `DirectoryName` = 'LightforgedDraenei',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Forge of Aeons',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1775;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1775,
    `DirectoryName` = 'HighmountainMaw',
    `MapName_Lang_enUS` = 'Maw of N''Zoth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1776;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1776,
    `DirectoryName` = 'OrgrimmarEmbassy',
    `MapName_Lang_enUS` = 'Horde Battleship - The Banshee''s Wail',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1778;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1778,
    `DirectoryName` = 'ArgusRifts',
    `MapName_Lang_enUS` = 'Level Design Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1779;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1779,
    `DirectoryName` = 'Argus_Rifts',
    `MapName_Lang_enUS` = 'Invasion Points',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1780;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1780,
    `DirectoryName` = 'Islands8',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Islands LD Playground',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1782;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1782,
    `DirectoryName` = 'SilithusBG',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Seething Strand',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1784;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1784,
    `DirectoryName` = 'PA_SMALL_CAVE01_Pristine_A',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Hozen [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1785;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1785,
    `DirectoryName` = 'Islands_Pirateship_Plank',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Pirateship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1786;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1786,
    `DirectoryName` = 'Islands_Transport_Horde_Zeppelin',
    `MapName_Lang_enUS` = '8.0 Islands - Zeppelin - Goblin',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1787;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1787,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_07',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1788;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1788,
    `DirectoryName` = 'Islands_6AS_Cave_01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Primitve [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1789;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1789,
    `DirectoryName` = 'Islands_Saurok_Cave_Large',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - Saurok - Large [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1795;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1795,
    `DirectoryName` = 'ShwayderLand',
    `MapName_Lang_enUS` = 'Vale of Eternal Blossoms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 327,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1802;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1802,
    `DirectoryName` = 'AzeriteBG',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = '8.0 BG Temp',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'This battleground takes place in the Valley of the Four Winds

Gold Rush is a 15 vs 15 resource battle',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 245,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1803;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1803,
    `DirectoryName` = 'AzeriteBG1',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Seething Shore',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Large quantities of Azerite has been discovered off the coast of Feralas in a forgotten unexplored island now known as the Seething Shore.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 436,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1804;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1804,
    `DirectoryName` = 'WarfrontsPrototype3',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Battle for Stromgarde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1805;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1805,
    `DirectoryName` = 'Islands_7HU_Transport_Alliance_Battleship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1806;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1806,
    `DirectoryName` = 'StormwindEmbassy',
    `MapName_Lang_enUS` = 'Alliance Battleship -  Wind''s Redemption',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1807;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1807,
    `DirectoryName` = 'Islands_6OR_Horde_Ship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1809;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1809,
    `DirectoryName` = 'MechagnomeIsland',
    `MapName_Lang_enUS` = 'Mechagnome Island',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1811;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1811,
    `DirectoryName` = 'QuestTraining',
    `MapName_Lang_enUS` = 'Quest Training',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 251,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1812;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1812,
    `DirectoryName` = 'SuramarNightborneUnlock',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Suramar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1813;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1813,
    `DirectoryName` = 'Islands801',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Un''gol Ruins (Islands 1)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1814;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1814,
    `DirectoryName` = 'Islands802',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Havenswood (Islands 2)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1815;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1815,
    `DirectoryName` = 'Silithus',
    `MapName_Lang_enUS` = 'Silithus Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1817;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1817,
    `DirectoryName` = 'SilithusPhase01',
    `MapName_Lang_enUS` = 'Silithus: The Wound',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1818;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1818,
    `DirectoryName` = 'SilvermoonCity',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Silvermoon City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1822;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1822,
    `DirectoryName` = 'BoralusDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Siege of Boralus',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 542,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1825;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1825,
    `DirectoryName` = 'KulTirasArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Hook Point',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 545,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1839;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1839,
    `DirectoryName` = 'KarazanChess',
    `MapName_Lang_enUS` = 'Karazan Chess',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1840;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1840,
    `DirectoryName` = 'SunwellUnlockScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Sunwell',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 530,
    `CorpseX` = 12551.8,
    `CorpseY` = -6774.56,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6,
    `MaxPlayers` = 25;

DELETE FROM `dbc`.`map` WHERE `ID` = 1841;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1841,
    `DirectoryName` = 'UnderrotDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Underrot',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 553,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1844;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1844,
    `DirectoryName` = 'Islands_7FK_Forsaken_Ship03',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1845;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1845,
    `DirectoryName` = 'Islands_7VR_Vrykul_Ship01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1846;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1846,
    `DirectoryName` = 'Islands_6HU_Transport_Cargoship',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - 6HU Cargoship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1847;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1847,
    `DirectoryName` = 'Dev Map  G',
    `MapName_Lang_enUS` = 'Dev Map - G',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1849;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1849,
    `DirectoryName` = 'Islands_ND_ICEBREAKER_SHIP_BG_TRANSPORT',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1850;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1850,
    `DirectoryName` = 'Islands_6HU_Transport_Buccaneer',
    `MapName_Lang_enUS` = '8.2.5 - MSEM - 1850',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1851;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1851,
    `DirectoryName` = 'Islands_7FK_Transport_Buccaneer',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - 7FK Buccaneer',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1852;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1852,
    `DirectoryName` = 'Islands_Horde_Submarine',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Horde - Submarine [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1853;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1853,
    `DirectoryName` = 'Islands_Alliance_Submarine',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1854;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1854,
    `DirectoryName` = 'Islands_7VS_Cavemicro03',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 7VS Cave Micro 03 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1855;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1855,
    `DirectoryName` = 'LightforgedVindicaar',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1856;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1856,
    `DirectoryName` = 'TransportAzeriteBGAllianceAirship',
    `MapName_Lang_enUS` = 'Transport: Azerite BG - Alliance Airship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1857;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1857,
    `DirectoryName` = 'TransportAzeriteBGHordeGunship',
    `MapName_Lang_enUS` = 'Transport: Azerite BG - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1860;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1860,
    `DirectoryName` = 'LightforgedDraeneiVindicaar',
    `MapName_Lang_enUS` = 'The Vindicaar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1861;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1861,
    `DirectoryName` = 'NazmirRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Uldir',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 548,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1862;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1862,
    `DirectoryName` = 'DrustvarDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Waycrest Manor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 437,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1863;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1863,
    `DirectoryName` = 'BLTestMap',
    `MapName_Lang_enUS` = 'BL - Test Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1864;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1864,
    `DirectoryName` = 'SeaPriestDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Shrine of the Storm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 543,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1865;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1865,
    `DirectoryName` = 'VoidElfHub',
    `MapName_Lang_enUS` = 'Telogrus Rift',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1876;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1876,
    `DirectoryName` = 'WarfrontsArathi',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Warfronts Arathi - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 544,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1877;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1877,
    `DirectoryName` = 'SnakeDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Temple of Sethraliss',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 441,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1878;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1878,
    `DirectoryName` = 'BlackrockDepthsDarkIron',
    `MapName_Lang_enUS` = 'zzOLD_Blackrock Depths',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 9666,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 103,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1879;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1879,
    `DirectoryName` = 'rymoore',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Jorundall (Islands 7)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1880;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1880,
    `DirectoryName` = 'TitanIsland',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Titan Island - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1881;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1881,
    `DirectoryName` = 'Islands9',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Sinkhole - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1882;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1882,
    `DirectoryName` = 'Islands10',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Verdant Wilds (Islands 8)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1883;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1883,
    `DirectoryName` = 'Islands01',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Whispering Reef (Islands 10)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1884;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1884,
    `DirectoryName` = 'SiegeOfOrgrimmarZone',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar - Mag''har Orc Unlock Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 359,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1885;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1885,
    `DirectoryName` = 'Islands803',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - White Mesa - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1886;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1886,
    `DirectoryName` = 'Islands_7VR_Swamp_Prototype',
    `MapName_Lang_enUS` = '8.0 Islands - Swamp - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1887;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1887,
    `DirectoryName` = 'Islands_7VR_Swamp_Prototype2',
    `MapName_Lang_enUS` = '8.0 Islands - Swamp - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1888;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1888,
    `DirectoryName` = 'Islands888',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands Josh',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1889;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1889,
    `DirectoryName` = 'Islands666',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Katalina - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 1890;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1890,
    `DirectoryName` = 'AssassinsScenarioDRU',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Assassins Scenario - Drustvar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1891;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1891,
    `DirectoryName` = 'Islands805',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Cursed - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1892;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1892,
    `DirectoryName` = 'Islands11',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Rotting Mire (Islands 9)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1893;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1893,
    `DirectoryName` = 'NecromancyIsland',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Dread Chain (Islands 4)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1895;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1895,
    `DirectoryName` = 'Islands1106',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - lost World Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1896;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1896,
    `DirectoryName` = 'Islands420',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Wonderland - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1897;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1897,
    `DirectoryName` = 'Islands24',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Molten Cay (Islands 6)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1898;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1898,
    `DirectoryName` = 'Islands22',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Skittering Hollow (Islands 5)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1899;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1899,
    `DirectoryName` = 'Islands23',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Junker Gnome Caverns - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1900;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1900,
    `DirectoryName` = 'Silithus_Airship_Alliance',
    `MapName_Lang_enUS` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1901;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1901,
    `DirectoryName` = 'Silithus_Airship_Horde',
    `MapName_Lang_enUS` = 'This Map Was Made In The Wrong Branch - Re-use If Needed',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1902;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1902,
    `DirectoryName` = 'SilithusAllianceGunship',
    `MapName_Lang_enUS` = 'Silithus Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1903;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1903,
    `DirectoryName` = 'SilithusHordeGunship',
    `MapName_Lang_enUS` = 'Silithus Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1904;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1904,
    `DirectoryName` = 'escapefromstockades',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Stormwind Escape from Stockades',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1906;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1906,
    `DirectoryName` = 'zandalarcontinentfinale',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Zandalar Continent Finale',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1907;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1907,
    `DirectoryName` = 'Islands_Panderan_Farm',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Snowblossom Village (Islands 3)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1909;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1909,
    `DirectoryName` = 'TransportKulTirasBridgeportShip',
    `MapName_Lang_enUS` = '[UNUSED] Transport: Kul Tiras - Bridgeport',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1910;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1910,
    `DirectoryName` = 'TransportKulTirasBridgeportMaidens',
    `MapName_Lang_enUS` = 'Transport: Kul Tiras - Bridgeport - The Maiden''s Virtue',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1911;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1911,
    `DirectoryName` = 'ZandalariArena',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Mugambala',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 546,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1912;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1912,
    `DirectoryName` = 'Islands_7az_cave02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 7AZ Cave 02 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1913;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1913,
    `DirectoryName` = 'PhaseableMONazmirTriangulationPlatform',
    `MapName_Lang_enUS` = 'PhaseableMO: Nazmir - Triangulation Platform',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1916;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1916,
    `DirectoryName` = 'PhaseableMONazmirShipWorldQuest',
    `MapName_Lang_enUS` = 'PhaseableMO: Nazmir - Ship World Quest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1917;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1917,
    `DirectoryName` = 'GorgrondOrcs',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gorgrond - Mag''har Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 360,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1080,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1918;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1918,
    `DirectoryName` = 'Kalimdor 2',
    `MapName_Lang_enUS` = 'Kalimdor Darkshore Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1919;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1919,
    `DirectoryName` = 'Islands_KL_Skywall_Entrance_Building_03',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - KL Skywall Entrance Building 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1920;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1920,
    `DirectoryName` = 'Islands_MD_Flamegate_E',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - MD Flamegate E',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1921;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1921,
    `DirectoryName` = 'Islands_8HU_Kultiras_ShipMedium01',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Alliance - Kul''Tiras Medium 01 With Gangplank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1922;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1922,
    `DirectoryName` = 'Islands_8TR_Zandalari_ShipMediumTransport01',
    `MapName_Lang_enUS` = '8.0 Islands - Ship - Player Horde - Zandalari Medium 01 With Gangplank',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1923;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1923,
    `DirectoryName` = 'Islands_Deepholm_Mercury_Pool01',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Deepholm Mercury Pool 01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1924;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1924,
    `DirectoryName` = 'Islands_7AZ_Vashjir_Small_Cave_A',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - 7AZ Vashjir Small Cave A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1925;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1925,
    `DirectoryName` = 'DevMapH',
    `MapName_Lang_enUS` = 'Dev Map - H',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1926;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1926,
    `DirectoryName` = 'KulTiranFlagship',
    `MapName_Lang_enUS` = '8.1.5 Allies - Kul Tiran Flagship (JAK)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1927;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1927,
    `DirectoryName` = 'ZandalariFlagship',
    `MapName_Lang_enUS` = 'Zandalari Flagship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1929;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1929,
    `DirectoryName` = 'HallOfCommunion(Destroyed)',
    `MapName_Lang_enUS` = 'Chamber of Heart',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1930;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1930,
    `DirectoryName` = 'ZandalarAllianceIntroScenerio',
    `MapName_Lang_enUS` = 'Zandalar Alliance Intro Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1931;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1931,
    `DirectoryName` = 'LordaeronBlight',
    `MapName_Lang_enUS` = 'Lordaeron Blight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1932;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1932,
    `DirectoryName` = 'BlackrockDepthsDarkIron2',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Blackrock Depths - Dark Iron Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 103,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1934;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1934,
    `DirectoryName` = 'Islands_8KUL_CaveMicro_freehold01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro_freehold01 [Dev/Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1935;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1935,
    `DirectoryName` = 'Islands_8KUL_CaveMicro01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1936;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1936,
    `DirectoryName` = 'Islands_8KUL_CaveMicro02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1937;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1937,
    `DirectoryName` = 'Islands_8KUL_CaveMicro03',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8KUL_CaveMicro03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1938;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1938,
    `DirectoryName` = 'Islands_8RIV_CaveMicro_01',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8RIV_CaveMicro_01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1939;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1939,
    `DirectoryName` = 'Islands_8RIV_CaveMicro_02',
    `MapName_Lang_enUS` = '8.0 Islands - Cave - 8RIV_CaveMicro_02',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1940;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1940,
    `DirectoryName` = 'StormwindEmbassyVoldunStatic',
    `MapName_Lang_enUS` = 'Alliance Battleship -  Wind''s Redemption Voldun',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1941;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1941,
    `DirectoryName` = 'TransportNazmirRaidElevator',
    `MapName_Lang_enUS` = 'Transport: Nazmir Raid Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1942;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1942,
    `DirectoryName` = 'MoltenCoreDarkIron',
    `MapName_Lang_enUS` = 'Molten Core',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 192,
    `MinimapIconScale` = 1.0,
    `CorpseX` = -7178.1,
    `CorpseY` = -928.64,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1943;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1943,
    `DirectoryName` = 'WarfrontsArathi - Alliance',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Warfronts Arathi - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 544,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1944;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1944,
    `DirectoryName` = 'ScenarioThrosDeathRealm',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Thros, The Blighted Lands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1945;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1945,
    `DirectoryName` = 'ArathiHighlands2',
    `MapName_Lang_enUS` = 'Arathi Highlands 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1946;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1946,
    `DirectoryName` = 'ProtoShips',
    `MapName_Lang_enUS` = 'Prototype - Ships',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1947;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1947,
    `DirectoryName` = 'TransportProtoAllianceShip',
    `MapName_Lang_enUS` = 'Transport: Proto - Alliance Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1948;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1948,
    `DirectoryName` = 'TransportProtoHordeShip',
    `MapName_Lang_enUS` = 'Transport: Proto - Horde Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1949;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1949,
    `DirectoryName` = '8BoostExperienceAlliance',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '8.0 Boost Experience - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1950;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1950,
    `DirectoryName` = '8BoostExperienceHorde',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '8.0 Boost Experience - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1951;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1951,
    `DirectoryName` = '8TransportBoostExperienceAllianceGunship',
    `MapName_Lang_enUS` = '8.0 Transport: Boost Experience - Alliance Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1952;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1952,
    `DirectoryName` = '8TransportBoostExperienceHordeGunship',
    `MapName_Lang_enUS` = '8.0 Transport: Boost Experience - Horde Gunship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 1953;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1953,
    `DirectoryName` = 'Islands_demigod_dome_living',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - demigod dome living',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1954;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1954,
    `DirectoryName` = 'GreatSea',
    `MapName_Lang_enUS` = 'The Great Sea Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1955;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1955,
    `DirectoryName` = 'ScenarioIslandsTutorial',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Uncharted Island',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 1956;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1956,
    `DirectoryName` = 'Islands_Hot_OldGod_03',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Hot Old God 03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1957;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1957,
    `DirectoryName` = 'Islands_OldGod',
    `MapName_Lang_enUS` = '8.0 Islands - Platform - Old God',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1958;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1958,
    `DirectoryName` = 'ZandalariTransportShip',
    `MapName_Lang_enUS` = 'The Golden Skipper - Zandalari Transport Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1959;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1959,
    `DirectoryName` = 'ZandalariTransportShipLarge',
    `MapName_Lang_enUS` = 'Zandalari Transport Ship Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1962;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1962,
    `DirectoryName` = 'GoblinShipFinal',
    `MapName_Lang_enUS` = 'Goblin Ship Final',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1963;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1963,
    `DirectoryName` = 'DevMapI',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Dev Map - I',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1964;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1964,
    `DirectoryName` = 'WarCampaignHordeCh05Flagship',
    `MapName_Lang_enUS` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Flagship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 1965;
INSERT INTO `dbc`.`map` SET 
    `ID` = 1965,
    `DirectoryName` = 'WarCampaignHordeCh05Ship',
    `MapName_Lang_enUS` = 'PhaseableMO: War Campaign - Horde - Chapter 05 - Kul Tiras Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2066;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2066,
    `DirectoryName` = 'GreatSeaHorde',
    `MapName_Lang_enUS` = 'The Great Sea Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2067;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2067,
    `DirectoryName` = 'GralsCall',
    `MapName_Lang_enUS` = 'Zandalari Battleship - Gral''s Call',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2068;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2068,
    `DirectoryName` = 'TirisfalGladesPhase01',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '[Not Used]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2069;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2069,
    `DirectoryName` = 'zuldazaralliancebombingrun',
    `MapName_Lang_enUS` = 'Zuldazar Alliance Bombing Run',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2070;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2070,
    `DirectoryName` = 'Zandalarraid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Battle of Dazar''alor',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 555,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 660,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2074;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2074,
    `DirectoryName` = '8TransportBoralusStormwind',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus to Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2075;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2075,
    `DirectoryName` = 'Islands_7DU_Helheim_Ghostship',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2076;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2076,
    `DirectoryName` = 'FirelandsDarkIron',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Firelands - Dark Iron Dwarf',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 274,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2077;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2077,
    `DirectoryName` = 'Islands_ULDUM_INTERIOR_PYRAMID',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2078;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2078,
    `DirectoryName` = 'Islands_ULDUM_LARGE_PYRAMID_01',
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2081;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2081,
    `DirectoryName` = 'BlackrockDepthsDarkIronHub',
    `MapName_Lang_enUS` = 'Blackrock Depths - Dark Iron Dwarf Hub',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 103,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `CorpseX` = -7178.09,
    `CorpseY` = -928.639,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 2082;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2082,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_01',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2083;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2083,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_02',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2084;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2084,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_03',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2085;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2085,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_04',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2086;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2086,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_05',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2087;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2087,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_06',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2088;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2088,
    `DirectoryName` = 'Islands_PA_Mogu_Crypt_08',
    `MapName_Lang_enUS` = '8.0 Islands - Micro - Mogu Crypt',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2094;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2094,
    `DirectoryName` = '8TransportBoralusCanals',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Canals',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2095;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2095,
    `DirectoryName` = '8TransportBoralusSound',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Sound',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2096;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2096,
    `DirectoryName` = 'SeaPriestRaid',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Crucible of Storms',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 556,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2097;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2097,
    `DirectoryName` = 'MechagonDungeon',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Operation: Mechagon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 572,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2101;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2101,
    `DirectoryName` = '8TransportBoralusBarge',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Barge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2102;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2102,
    `DirectoryName` = '8TransportBoralusShipSmall',
    `MapName_Lang_enUS` = '8.0 Transport: Boralus Ship Small',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2103;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2103,
    `DirectoryName` = 'DarkshorePrepatchDarnassianShipCosmetic',
    `MapName_Lang_enUS` = 'Darkshore Prepatch Darnassian Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2105;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2105,
    `DirectoryName` = 'WarfrontsDarkshoreAlliance',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Warfronts Darkshore - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 557,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2106;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2106,
    `DirectoryName` = 'WarsongGulch2',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Warsong Gulch',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 3277,
    `MapDescription0_Lang_enUS` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'A valley Bordering Ashenvale Forest and the Barrens, Warsong Gulch hosts a constant battle between the Horde and Alliance.

As a 10 vs 10 capture-the-flag battleground, the first faction to capture three flags is victorious.

Eager to aid their allies, members of every race in Azeroth rush to the Gulch to lend sword, or spell, to the conflict.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 560,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2107;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2107,
    `DirectoryName` = 'ArathiBasin2',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 3358,
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 559,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2109;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2109,
    `DirectoryName` = 'IncursionAirshipHorde',
    `MapName_Lang_enUS` = '8.1.0 Incursion Airship Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2110;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2110,
    `DirectoryName` = 'IncursionAirshipAlliance',
    `MapName_Lang_enUS` = '8.1.0 Incursion Airship Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2111;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2111,
    `DirectoryName` = 'WarfrontsDarkshoreHorde',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Warfronts Darkshore - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 557,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2112;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2112,
    `DirectoryName` = '9DevLand',
    `MapName_Lang_enUS` = '9.0 Dev Land',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 198,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2114;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2114,
    `DirectoryName` = 'Scourge Procedural Dungeon',
    `MapName_Lang_enUS` = 'Maw Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2115;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2115,
    `DirectoryName` = 'DarkshoreTyrandeScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.1 Darkshore Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2116;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2116,
    `DirectoryName` = 'Islands7',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '8.0 Islands - Event',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2117;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2117,
    `DirectoryName` = 'NZoth',
    `MapName_Lang_enUS` = 'NZoth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2118;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2118,
    `DirectoryName` = 'WintergraspEpic',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Battle for Wintergrasp',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.
An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'An ancient Titan stronghold built to protect the Vault of Archavon.  Horde and Alliance forces battle furiously for control of the place, eager to seize the artifacts and relics held within the vault for their battle against the Lich King.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 243,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 2;

DELETE FROM `dbc`.`map` WHERE `ID` = 2119;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2119,
    `DirectoryName` = 'TransportCookingImpossibleAllianceBalloon',
    `MapName_Lang_enUS` = 'Transport: Cooking: Impossible - Hot Air Balloon - Alliance',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2120;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2120,
    `DirectoryName` = 'TransportCookingImpossibleHordeBalloon',
    `MapName_Lang_enUS` = 'Transport: Cooking: Impossible - Hot Air Balloon - Horde',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2122;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2122,
    `DirectoryName` = 'N�Zoth',
    `MapName_Lang_enUS` = 'DELETE',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2123;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2123,
    `DirectoryName` = 'SeaPriestDungeonQuests',
    `MapName_Lang_enUS` = 'Shrine of the Storm Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 556,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2124;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2124,
    `DirectoryName` = 'Crestfall',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Crestfall (Islands 11)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2125;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2125,
    `DirectoryName` = 'ZandalariTreasury',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Zandalari Treasury',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 552,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2127;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2127,
    `DirectoryName` = 'AbandonedMines',
    `MapName_Lang_enUS` = 'Abandoned Mines',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2128;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2128,
    `DirectoryName` = 'DaggerRealm',
    `MapName_Lang_enUS` = 'Dagger Realm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2129;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2129,
    `DirectoryName` = 'DarkshoreHordeQuests',
    `MapName_Lang_enUS` = '8.1 Darkshore Horde Quests',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2130;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2130,
    `DirectoryName` = 'Questfall',
    `MapName_Lang_enUS` = 'Questfall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2131;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2131,
    `DirectoryName` = 'DarkshoreOutdoorPhase',
    `MapName_Lang_enUS` = '8.1 Darkshore Outdoor Final Phase',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2132;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2132,
    `DirectoryName` = '9DevLand2',
    `MapName_Lang_enUS` = '9.0 Dev Land 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 198,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2134;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2134,
    `DirectoryName` = 'TolDagorScenario',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tol Dagor Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 550,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2135;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2135,
    `DirectoryName` = 'DevSmoketest',
    `MapName_Lang_enUS` = 'Dev Smoketest',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2136;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2136,
    `DirectoryName` = 'ZuldazarRaidShipTransport',
    `MapName_Lang_enUS` = 'Transport: Zuldazar Raid Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2143;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2143,
    `DirectoryName` = 'Mechagon',
    `MapName_Lang_enUS` = 'DO NOT USE [Deprecated]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 551,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2145;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2145,
    `DirectoryName` = 'Transport312214',
    `MapName_Lang_enUS` = 'Transport: Night Elf Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2146;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2146,
    `DirectoryName` = 'Transport312215',
    `MapName_Lang_enUS` = 'Transport: Forsaken Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2147;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2147,
    `DirectoryName` = '2147',
    `MapName_Lang_enUS` = 'Icecrown Citadel (8.1)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 250,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2155;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2155,
    `DirectoryName` = '2155',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halls of Stone Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2156;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2156,
    `DirectoryName` = '2156',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Visions of N''Zoth - Prototype',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 23,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2160;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2160,
    `DirectoryName` = '2160',
    `MapName_Lang_enUS` = 'Maw Prototype - Dragonblight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2161;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2161,
    `DirectoryName` = '2161',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Maw Prototype - Torment Chambers',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2162;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2162,
    `DirectoryName` = '2162',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Torghast, Tower of the Damned',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 590,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2163;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2163,
    `DirectoryName` = '2163',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gnomeregan Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2164;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2164,
    `DirectoryName` = '2164',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'The Eternal Palace',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 570,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2165;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2165,
    `DirectoryName` = '2165',
    `MapName_Lang_enUS` = 'SpawnedMO: Night Elf Warship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2166;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2166,
    `DirectoryName` = '2166',
    `MapName_Lang_enUS` = 'Transport: Zuldazar Raid Boralus Ship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2167;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2167,
    `DirectoryName` = '2167',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'The Robodrome',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 562,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2168;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2168,
    `DirectoryName` = '2168',
    `MapName_Lang_enUS` = 'Level Design Process, Techniques and Resources',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 251,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2169;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2169,
    `DirectoryName` = '2169',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Uldir Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 548,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2170;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2170,
    `DirectoryName` = '2170',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Tauren Heritage Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2174;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2174,
    `DirectoryName` = '2174',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Scarlet Halls, Dark Ranger',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 332,
    `MinimapIconScale` = 1.0,
    `CorpseX` = 2869.0,
    `CorpseY` = -820.0,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2175;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2175,
    `DirectoryName` = '2175',
    `MapName_Lang_enUS` = '9.0 NPE (New Player Experience) - Exile''s Reach',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 589,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2176;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2176,
    `DirectoryName` = '2176',
    `MapName_Lang_enUS` = 'SpawnedMO: Forsaken Ship Large',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2177;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2177,
    `DirectoryName` = '2177',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Arathi Basin Comp Stomp',
    `MapName_Lang_Mask` = 16712190,
    `AreaTableID` = 3358,
    `MapDescription0_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.

Meanwhile, the League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Arathi Basin is one of the main staging points of war between the humans and the Forsaken in Azeroth.

Arathi Basin is a 15 vs 15 domination battleground, where each side attempts to control the Stables, Blacksmith, Mine, Lumbermill and Farm for as long as possible.

The League of Arathor seek to reclaim lost lands for their benefactors in Stormwind.

Meanwhile, the Defilers'' elite troopers seek to sever the vital connection between the humans and their dwarven allies to the south.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 559,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2178;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2178,
    `DirectoryName` = '2178',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Prison of Ink',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2179;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2179,
    `DirectoryName` = '2179',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Stratholme Pet Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 101,
    `MinimapIconScale` = 1.0,
    `CorpseX` = 3392.32,
    `CorpseY` = -3378.48,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 2180;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2180,
    `DirectoryName` = '2180',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Dreamgrove (Hearthstone Tavern)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 411,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 2186;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2186,
    `DirectoryName` = '2186',
    `MapName_Lang_enUS` = 'The Obsidian Sanctum - 8.2 Magni - Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 239,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 571,
    `CorpseX` = 3438.15,
    `CorpseY` = 260.401,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2187;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2187,
    `DirectoryName` = '2187',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Halls of Origination',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 256,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 1,
    `CorpseX` = -10226.0,
    `CorpseY` = -1837.48,
    `TimeOfDayOverride` = 1080,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2193;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2193,
    `DirectoryName` = '2193',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Galakrond''s Fall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2194;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2194,
    `DirectoryName` = '2194',
    `MapName_Lang_enUS` = 'Hearthstone Tavern',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2195;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2195,
    `DirectoryName` = '2195',
    `MapName_Lang_enUS` = 'Hearthstone Tavern',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2197;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2197,
    `DirectoryName` = '2197',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Korrak''s Revenge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'Hidden within the Alterac Mountains, Alterac Valley is the home of the Frostwolf clan.  The Stormpike dwarves have established a foothold in the valley and seek to plumb its depths for riches and links to their ancestral past.

A large-scale battleground, each side attempts to destroy each other''s tower fortifications and slay the enemy General (Vanndar Stormpike or Drek''Thar).',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 104,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2205;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2205,
    `DirectoryName` = '2205',
    `MapName_Lang_enUS` = '9.0 Transport: Zone Transition Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2207;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2207,
    `DirectoryName` = '2207',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Neltharion''s Lair - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 407,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2208;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2208,
    `DirectoryName` = '2208',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Eastern Kingdoms - Vermillion Redoubt - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1260,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2209;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2209,
    `DirectoryName` = '2209',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Emerald Dream - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 418,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2210;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2210,
    `DirectoryName` = '2210',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Siege of Orgrimmar - Coup Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 369,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2211;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2211,
    `DirectoryName` = '2211',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Gilneas - Worgen Heritage Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2212;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2212,
    `DirectoryName` = '2212',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Horrific Vision of Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 577,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2213;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2213,
    `DirectoryName` = '2213',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Horrific Vision of Stormwind',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 577,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2214;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2214,
    `DirectoryName` = '2214',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Maelstrom - Heart of Azeroth',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 272,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2215;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2215,
    `DirectoryName` = '2215',
    `MapName_Lang_enUS` = 'Chamber of Heart - Repaired',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2217;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2217,
    `DirectoryName` = '2217',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Ny''alotha, the Waking City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 575,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2218;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2218,
    `DirectoryName` = '2218',
    `MapName_Lang_enUS` = 'Dummy Map (Dev and empty, use if you want)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2222;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2222,
    `DirectoryName` = '2222',
    `MapName_Lang_enUS` = 'The Shadowlands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2223;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2223,
    `DirectoryName` = '2223',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'The Eye of Eternity - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 236,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 571,
    `CorpseX` = 3869.98,
    `CorpseY` = 6984.33,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7,
    `MaxPlayers` = 5;

DELETE FROM `dbc`.`map` WHERE `ID` = 2224;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2224,
    `DirectoryName` = '2224',
    `MapName_Lang_enUS` = 'Programmer Map - Continent',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2225;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2225,
    `DirectoryName` = '2225',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Programmer Map - Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2226;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2226,
    `DirectoryName` = '2226',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Programmer Map - Battlefield',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2227;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2227,
    `DirectoryName` = '2227',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Programmer Map - Raid',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2228;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2228,
    `DirectoryName` = '2228',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Programmer Map - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2230;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2230,
    `DirectoryName` = '2230',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - A',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2231;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2231,
    `DirectoryName` = '2231',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - B',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2232;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2232,
    `DirectoryName` = '2232',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Karazhan Catacombs - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 200,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2233;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2233,
    `DirectoryName` = '2233',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Temple of the Jade Serpent - HoA Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 311,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = 870,
    `CorpseX` = 957.706,
    `CorpseY` = -2473.41,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2234;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2234,
    `DirectoryName` = '2234',
    `MapName_Lang_enUS` = '9.0 Prototype - Seamless Teleport - Transfer Map',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2235;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2235,
    `DirectoryName` = '2235',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Caverns of Time - Anniversary',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 212,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2236;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2236,
    `DirectoryName` = '2236',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Darkmaul Citadel',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 584,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2237;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2237,
    `DirectoryName` = '2237',
    `MapName_Lang_enUS` = '8.2.5 Orgrimmar',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2240;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2240,
    `DirectoryName` = '2240',
    `MapName_Lang_enUS` = '[UNUSED] [DEV MAP] 8.3 Stormheim',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2241;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2241,
    `DirectoryName` = '2241',
    `MapName_Lang_enUS` = 'Uldum',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 3,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2242;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2242,
    `DirectoryName` = '2242',
    `MapName_Lang_enUS` = 'Dev Map - K',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2243;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2243,
    `DirectoryName` = '2243',
    `MapName_Lang_enUS` = 'Dev Map - J',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2245;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2245,
    `DirectoryName` = '2245',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = 'Deepwind Gorge',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_enUS` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `MapDescription0_Lang_Mask` = 16712190,
    `MapDescription1_Lang_enUS` = 'The Horde and Alliance battle over territory and the allegiance of the Pandaren  within the Valley of the Four Winds.',
    `MapDescription1_Lang_Mask` = 16712190,
    `LoadingScreenID` = 354,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 4;

DELETE FROM `dbc`.`map` WHERE `ID` = 2246;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2246,
    `DirectoryName` = '2246',
    `MapName_Lang_enUS` = 'Solesa Naksu [DNT]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2247;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2247,
    `DirectoryName` = '2247',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Mogu''shan Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 312,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2249;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2249,
    `DirectoryName` = '2249',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'FX Test Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 244,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2250;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2250,
    `DirectoryName` = '2250',
    `MapName_Lang_enUS` = 'Test Dungeon PvP',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 560,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 2254;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2254,
    `DirectoryName` = '2254',
    `MapName_Lang_enUS` = 'Cinematics Test Map (Development Map)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2255;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2255,
    `DirectoryName` = '2255',
    `MapName_Lang_enUS` = 'Cinematics Test Map II (Development Map)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2257;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2257,
    `DirectoryName` = '2257',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Chamber of Heart - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 434,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2258;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2258,
    `DirectoryName` = '2258',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Crapopolis - Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 440,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 120,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2261;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2261,
    `DirectoryName` = '2261',
    `MapName_Lang_enUS` = '9.0 Transport - NPE - Alliance Battleship',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2263;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2263,
    `DirectoryName` = '2263',
    `MapName_Lang_enUS` = 'Crapopolis',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 440,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2264;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2264,
    `DirectoryName` = '2264',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Visions of N''Zoth - Orgrimmar - Engineering Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2266;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2266,
    `DirectoryName` = '2266',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Blackwing Descent Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 260,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2267;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2267,
    `DirectoryName` = '2267',
    `MapName_Lang_enUS` = 'city',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 572,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2268;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2268,
    `DirectoryName` = '2268',
    `MapName_Lang_enUS` = 'Mechagon City',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 572,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2274;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2274,
    `DirectoryName` = '2274',
    `MapName_Lang_enUS` = 'Vision of the Twisting Sands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 577,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2275;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2275,
    `DirectoryName` = '2275',
    `MapName_Lang_enUS` = 'Vale of Eternal Twilight',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 577,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2276;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2276,
    `DirectoryName` = '2276',
    `MapName_Lang_enUS` = '9.0 Transport - Maldraxxus Badass Necropolis [TEMP NAME]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2277;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2277,
    `DirectoryName` = '2277',
    `MapName_Lang_enUS` = '9.0 SpawnedMO - Maldraxxus Badass Necropolis [TEMP NAME]',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2278;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2278,
    `DirectoryName` = '2278',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Revendreth Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 579,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2279;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2279,
    `DirectoryName` = '2279',
    `MapName_Lang_enUS` = 'Torghast Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 274,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2282;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2282,
    `DirectoryName` = '2282',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Blackrock Depths - Pet Dungeon',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 103,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2284;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2284,
    `DirectoryName` = '2284',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Sanguine Depths',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 578,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2285;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2285,
    `DirectoryName` = '2285',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Spires of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 582,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2286;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2286,
    `DirectoryName` = '2286',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'The Necrotic Wake',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 581,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2287;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2287,
    `DirectoryName` = '2287',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Halls of Atonement',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 588,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2288;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2288,
    `DirectoryName` = '2288',
    `MapName_Lang_enUS` = '[DEV] - Arena of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 209,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2289;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2289,
    `DirectoryName` = '2289',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Plaguefall',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 580,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2290;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2290,
    `DirectoryName` = '2290',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Mists of Tirna Scithe',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 586,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 600,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2291;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2291,
    `DirectoryName` = '2291',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'De Other Side',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 585,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2292;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2292,
    `DirectoryName` = '2292',
    `InstanceType` = 3,
    `PVP` = 1,
    `MapName_Lang_enUS` = '8.3 Epic Battleground - Warfront Arathi (PvP)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 544,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2293;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2293,
    `DirectoryName` = '2293',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = 'Theater of Pain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 587,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2294;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2294,
    `DirectoryName` = '2294',
    `InstanceType` = 1,
    `MapName_Lang_enUS` = '[NOT USED] Realm',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 209,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 1320,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2296;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2296,
    `DirectoryName` = '2296',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'Castle Nathria',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 579,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2297;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2297,
    `DirectoryName` = '2297',
    `MapName_Lang_enUS` = 'Icecrown Citadel (8.3)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 250,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2299;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2299,
    `DirectoryName` = '2299',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Vision of Ysera Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2300;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2300,
    `DirectoryName` = '2300',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Redridge - 9xp Bastion',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 4,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2301;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2301,
    `DirectoryName` = '2301',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Maldraxxus Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2303;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2303,
    `DirectoryName` = '2303',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Zone Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2304;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2304,
    `DirectoryName` = '2304',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Tyrande Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2305;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2305,
    `DirectoryName` = '2305',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Bastion Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2306;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2306,
    `DirectoryName` = '2306',
    `MapName_Lang_enUS` = 'Julien LoD Test',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 216,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 2308;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2308,
    `DirectoryName` = '2308',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Bastion Night Warrior Finale - Ardenweald Covenant Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1;

DELETE FROM `dbc`.`map` WHERE `ID` = 2309;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2309,
    `DirectoryName` = '2309',
    `MapName_Lang_enUS` = 'Transport: Torghast Bridge Platform01 Elevator',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2354;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2354,
    `DirectoryName` = '2354',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Ardenweald Covenant Chapter 2 Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2355;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2355,
    `DirectoryName` = '2355',
    `MapName_Lang_enUS` = 'The Necrotic Wake (Transport)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 581,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2356;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2356,
    `DirectoryName` = '2356',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Castle Nathria Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 579,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2360;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2360,
    `DirectoryName` = '2360',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Sinfall Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 579,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2362;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2362,
    `DirectoryName` = '2362',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = 'Maldraxxus Covenant Finale Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2363;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2363,
    `DirectoryName` = '2363',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '9.0 - Ardenweald - Garden - Queen''s Conservatory',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2364;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2364,
    `DirectoryName` = '2364',
    `MapName_Lang_enUS` = 'The Maw',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2365;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2365,
    `DirectoryName` = '2365',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Bridge_SmallPlatform01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2366;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2366,
    `DirectoryName` = '2366',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Zone_WallTurret01',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2367;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2367,
    `DirectoryName` = '2367',
    `MapName_Lang_enUS` = '9.0 Maw - Torghast - 9Maw_Bridge_Straight03',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2368;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2368,
    `DirectoryName` = '2368',
    `MapName_Lang_enUS` = 'Maldraxxus Broker Islands',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2369;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2369,
    `DirectoryName` = '2369',
    `MapName_Lang_enUS` = '9.0 NPE - Horde - Starter Transport Ship - (STM)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2370;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2370,
    `DirectoryName` = '2370',
    `MapName_Lang_enUS` = 'Maldraxxus Arena',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2371;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2371,
    `DirectoryName` = '2371',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '9.0 Ardenweald Covenant Finale Drust Scenario',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2373;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2373,
    `DirectoryName` = '2373',
    `InstanceType` = 4,
    `MapName_Lang_enUS` = 'Empyrean Domain',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 583,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2375;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2375,
    `DirectoryName` = '2375',
    `InstanceType` = 5,
    `MapName_Lang_enUS` = '9.0 Bastion Arena - Path of Ascension',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 583,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = 720,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2437;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2437,
    `DirectoryName` = '2437',
    `MapName_Lang_enUS` = 'Dev Map - Internapalooza',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2438;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2438,
    `DirectoryName` = '2438',
    `InstanceType` = 2,
    `MapName_Lang_enUS` = 'SpellPref',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 244,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 6;

DELETE FROM `dbc`.`map` WHERE `ID` = 2439;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2439,
    `DirectoryName` = '2439',
    `MapName_Lang_enUS` = 'De Other Side (Ardenweald Campaign)',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2440;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2440,
    `DirectoryName` = '2440',
    `MapName_Lang_enUS` = 'World Tree 2',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

DELETE FROM `dbc`.`map` WHERE `ID` = 2452;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2452,
    `DirectoryName` = '2452',
    `MapName_Lang_enUS` = 'Dev Map - Internapalooza',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 549,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 7;

DELETE FROM `dbc`.`map` WHERE `ID` = 2453;
INSERT INTO `dbc`.`map` SET 
    `ID` = 2453,
    `DirectoryName` = '2453',
    `MapName_Lang_enUS` = 'Torghast',
    `MapName_Lang_Mask` = 16712190,
    `MapDescription0_Lang_Mask` = 16712188,
    `MapDescription1_Lang_Mask` = 16712188,
    `LoadingScreenID` = 576,
    `MinimapIconScale` = 1.0,
    `CorpseMapID` = -1,
    `TimeOfDayOverride` = -1,
    `ExpansionID` = 8;

