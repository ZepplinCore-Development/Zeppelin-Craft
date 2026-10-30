CLASS_DISABLED = "You must choose a different race to be this class";
CUSTOMIZE = "Appearance";
NEXT = "Appearance";
FINISH = "Finish";


CHARACTER_FACING_INCREMENT = 2;
MAX_RACES = 12;
MAX_CLASSES_PER_RACE = 11;
NUM_CHAR_CUSTOMIZATIONS = 9;	-- F-151: 6 eye colour, 7 tattoo, 8 scars, 9 war paint (source-client customizations)
MIN_CHAR_NAME_LENGTH = 2;
CHARACTER_CREATE_ROTATION_START_X = nil;
CHARACTER_CREATE_INITIAL_FACING = nil;
NUM_PREVIEW_FRAMES = 14;
WORGEN_RACE_ID = 6;
TUSKARR_RACE_ID = 6;
local featureIndex = 1
local FeatureType = 1

PAID_CHARACTER_CUSTOMIZATION = 1;
PAID_RACE_CHANGE = 2;
PAID_FACTION_CHANGE = 3;
PAID_SERVICE_CHARACTER_ID = nil;
PAID_SERVICE_TYPE = nil;

PREVIEW_FRAME_HEIGHT = 130;
PREVIEW_FRAME_X_OFFSET = 19;
PREVIEW_FRAME_Y_OFFSET = -7;

FACTION_BACKDROP_COLOR_TABLE = {
	["Alliance"] = {0.5, 0.5, 0.5, 0.09, 0.09, 0.19, 0, 0, 0.2, 0.29, 0.33, 0.91},
	["Horde"] = {0.5, 0.2, 0.2, 0.19, 0.05, 0.05, 0.2, 0, 0, 0.90, 0.05, 0.07},
	["Player"] = {0.2, 0.5, 0.2, 0.05, 0.2, 0.05, 0.05, 0.2, 0.05, 1, 1, 1},
};
FRAMES_TO_BACKDROP_COLOR = {
	"CharacterCreateCharacterRace",
	"CharacterCreateCharacterClass",
--	"CharacterCreateCharacterFaction",
	"CharacterCreateNameEdit",
};
RACE_ICON_TEXTURES = {
	["HUMAN_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-HUMAN_MALE",
	["HUMAN_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-HUMAN_FEMALE",
	["DWARF_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-DWARF_MALE",
	["DWARF_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-DWARF_FEMALE",
	["GNOME_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-GNOME_MALE",
	["GNOME_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-GNOME_FEMALE",
	["NIGHTELF_MALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-NIGHTELF_MALE",
	["NIGHTELF_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-NIGHTELF_FEMALE",
	["DRAENEI_MALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-DRAENEI_MALE",
	["DRAENEI_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-DRAENEI_FEMALE",
	["WORGEN_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-WORGEN_MALE",
	["WORGEN_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-WORGEN_FEMALE",
	["TAUREN_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-TAUREN_MALE",
	["TAUREN_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-TAUREN_FEMALE",
	["SCOURGE_MALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-SCOURGE_MALE",
	["SCOURGE_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-SCOURGE_FEMALE",
	["TROLL_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-TROLL_MALE",
	["TROLL_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-TROLL_FEMALE",
	["ORC_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-ORC_MALE",
	["ORC_FEMALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-ORC_FEMALE",
	["BLOODELF_MALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-BLOODELF_MALE",
	["BLOODELF_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-BLOODELF_FEMALE",
	["GOBLIN_MALE"]		= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-GOBLIN_MALE",
	["GOBLIN_FEMALE"]	= "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Race-GOBLIN_FEMALE",
};
CLASS_ICON_TCOORDS = {
	["WARRIOR"]	= {0, 0.25, 0, 0.25},
	["MAGE"]	= {0.25, 0.49609375, 0, 0.25},
	["ROGUE"]	= {0.49609375, 0.7421875, 0, 0.25},
	["DRUID"]	= {0.7421875, 0.98828125, 0, 0.25},
	["HUNTER"]	= {0, 0.25, 0.25, 0.5},
	["SHAMAN"]	= {0.25, 0.49609375, 0.25, 0.5},
	["PRIEST"]	= {0.49609375, 0.7421875, 0.25, 0.5},
	["WARLOCK"]	= {0.7421875, 0.98828125, 0.25, 0.5},
	["PALADIN"]	= {0, 0.25, 0.5, 0.75},
	["DEATHKNIGHT"]	= {0.25, 0.49609375, 0.5, 0.75},
	["ENGINEER"] = {0.25, 0.49609375, 0.5, 0.75}
};

BANNER_DEFAULT_TEXTURE_COORDS = {0.109375, 0.890625, 0.201171875, 0.80078125};
BANNER_DEFAULT_SIZE = {200, 308};

CHAR_CUSTOMIZE_HAIR_COLOR = 4;

-- F-151 sub-races: a race's skin colours split into named sets. Every colour belongs to exactly one sub-race,
-- so a character's sub-race follows from its skin colour and needs no stored field. Colours are CharSections
-- color_index values per sex; "shared" lists the ones every sub-race offers (death knight skins).
-- Keyed by the race's file name (GetNameForRace).
-- marking layers by region (F-230 regroup): customization 7 = face markings (section 6), 8 = body markings
-- (section 7), 9 = scars (section 8); each sub-race's allowed values are CHAR_CREATE_MARK_GATES below.
-- eye colour (CharSections base_section 5 types; the last is the death knight eye, which only DKs see): the dwarves'
-- full-colour eye (male 11, female 6; eyes_all.json) is Dark Iron only (user review 2026-10-25)
DWARF_EYES = { MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12}, FEMALE = {0, 1, 2, 3, 4, 5, 7} };
-- troll faces without the painted ones (F-230 round 2: male 11 / 12 and female 13 / 14, with their death knight
-- copies, are plain faces + the Shadow brow / eye paint, now Face Markings)
TROLL_FACES = { MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 13}, FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15} };
DARKIRON_EYES = { MALE = {11, 13, 14, 15, 16, 17, 12}, FEMALE = {6, 8, 9, 10, 11, 12, 7} };	-- the full glowing eye and its 5 tints (+ DK eye)
CHAR_CREATE_SUBRACES = {
	-- orc colours 28-43 bake markings (not offered: retail tattoos, scars and war paint now); Blackrock 15, 44, 45 and
	-- Mag'har clan colours 46, 48, 49, 51, 52, 54, 55, 57 bake tattoos or paint (user review 2026-10-24)
	["ORC"] = {
		{ name = "Orc", icon = "ORC",
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8} },
		{ name = "Mag'har", lore = "The Mag'har are the orcs who never drank the blood of Mannoroth. Untouched by the demonic taint, they kept the old ways of Draenor: shamanism, the hunt and the honour of the clans. Now they stand with the Horde as living proof of what the orcs were before the fall.", title = "Mag'har Orc", icon = "MAGHAR",
			MALE = {12, 16, 20, 21, 22, 23, 24, 50, 53},
			FEMALE = {12, 20, 21, 22, 23, 24, 50, 53} },	-- every skin has a home (user, 2026-10-28)
		{ name = "Blackrock", lore = "Forged in the fires of Blackrock Mountain, the Blackrock clan is the iron fist of the orcish war machine. Their smiths turned war into an industry and their warlords led the Horde's first invasions. Those who march under the Horde's banner today trade old conquest for discipline and steel.", title = "Blackrock Orc", icon = "BLACKROCK",
			MALE = {9, 14, 17, 18, 19, 47},
			FEMALE = {11, 13, 18, 19, 47} },
		{ name = "Fel Orc", lore = "Fel orcs carry the Legion's corruption in their very blood, their skin burned red by fel power. Many were bred for war in Hellfire Citadel, but some broke free of their masters' grip. They fight beside the Horde, shunned by many and feared by more, to turn the demons' gift against them.", icon = "FELORC",
			MALE = {10, 25, 26, 27},
			FEMALE = {25, 26, 27} },
	},
	-- retail's allied races that share their base race's model (retail_subrace_colours.py writes 33+ / 62+); dwarf
	-- 9-18 are NPC skins with no face rows; Dark Iron 34, 35, 39, 41 have clashing eye islands (skin audit);
	-- 28, 29, 32 are Dark Iron tones, moved from Wildhammer (user review 2026-10-25)
	["DWARF"] = {
		shared = { MALE = {19, 20, 21}, FEMALE = {11, 12, 13} },
		{ name = "Bronzebeard", title = "Bronzebeard Dwarf", icon = "DWARF", eyes = DWARF_EYES,
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8} },
		{ name = "Dark Iron", lore = "The Dark Iron dwarves were once the bitter rivals of Ironforge, ruled from the burning halls of Shadowforge City. Tempered by fire and magma, they are master smiths and fierce warriors. With old enmities set aside, they now stand with the Alliance.", title = "Dark Iron Dwarf", icon = "DARKIRON", eyes = DARKIRON_EYES,
			MALE = {26, 27, 33, 34, 35, 36, 38, 39, 40, 41, 51, 52},	-- 51, 52 = 28, 29 without their baked face paint (F-230 round 2)
			FEMALE = {26, 27, 33, 34, 35, 36, 38, 39, 40, 41, 51, 52, 53} },	-- 51, 52, 53 = 28, 29, 32 without their baked paint / brand tattoo
		{ name = "Wildhammer", lore = "The Wildhammer dwarves left Ironforge long ago for the cliffs of Grim Batol and later the Hinterlands. They live close to nature, ride gryphons into battle and mark their bodies with tribal tattoos. Proud and free, they answer to no king but their own thanes.", title = "Wildhammer Dwarf", icon = "WILDHAMMER", eyes = DWARF_EYES,
			MALE = {42, 43, 44, 45, 46, 47, 48, 49, 50},	-- plain copies of 0-8; the tattoos are layers now
			FEMALE = {42, 43, 44, 45, 46, 47, 48, 49, 50} },
	},
	-- blood elf 36-61 bake jewellery, tattoos or veins; 87-93 have no faces
	["BLOODELF"] = {
		shared = { MALE = {16, 17, 18}, FEMALE = {16, 17, 18} },
		{ name = "Blood Elf", icon = "BLOODELF",
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85} },
		{ name = "Void Elf", lore = "The void elves were sin'dorei who studied the forbidden powers of the Void and were cast out of Silvermoon for it. Pulled back from the brink of madness by their own iron will, they learned to walk the line between shadow and self. Unwelcome at home but too useful to ignore, they lend their dark gifts to the Horde, ever watchful of the whispers within.", icon = "VOIDELF",
			MALE = {62, 63, 64, 65, 66, 67, 68, 94, 95},	-- 94, 95 = 34, 35 without their void paint (Face Markings 1)
			FEMALE = {62, 63, 64, 65, 66, 67, 68, 94, 95} },
	},
	-- gnome 5, 6 (male) are the NPC leper skins with no face rows
	["GNOME"] = {
		shared = { MALE = {7, 8, 9}, FEMALE = {7, 8, 9} },
		{ name = "Gnome", icon = "GNOME",
			MALE = {0, 1, 2, 3, 4, 10, 11, 12},
			FEMALE = {0, 1, 2, 3, 4, 6, 10, 11, 12} },
		{ name = "Leper", lore = "The leper gnomes survived the radiation Thermaplugg unleashed on Gnomeregan, but it marked them forever. Scarred and sickly, many lost their minds in the dark below. Those who kept their wits refuse to be pitied, and fight to win their city back.", title = "Leper Gnome", icon = "LEPERGNOME",
			MALE = {15, 16, 17},
			FEMALE = {15, 16, 17} },
		{ name = "Cultist", lore = "Not every gnome who fled Gnomeregan returned to the light. The cultists found answers in forbidden tomes and whispered rites, marking their faces with ritual paint and trading tinkering for darker arts. Those who stand with the Alliance swear their knowledge now serves it, though few gnomes sleep easily beside them.", title = "Cultist Gnome", icon = "CULTISTGNOME",
			MALE = {21, 22},	-- = 13, 14 without the cultist mask paint (Face Markings 1, F-230 round 3)
			FEMALE = {21, 22, 23} },	-- = 5, 13, 14 clean
	},
	["DRAENEI"] = {
		shared = { MALE = {14, 15, 16}, FEMALE = {12, 13, 14} },
		{ name = "Draenei", icon = "DRAENEI",
			MALE = {0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 23, 24, 25, 26, 27, 28, 29, 40},
			FEMALE = {0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 22, 23, 24, 25, 26, 27, 28, 40} },
		{ name = "Lightforged", lore = "The Lightforged draenei spent millennia aboard the Genedar, waging the Army of the Light's war against the Burning Legion across countless worlds. Infused with the Light itself, they are zealous, steadfast and uncompromising. They have returned to Azeroth to see the Legion's end.", title = "Lightforged Draenei", icon = "LIGHTFORGED",
			MALE = {5, 33, 34, 35, 37, 38, 39},	-- 32 baked the gilded markings: retired to 5 + Body Markings 4 (F-230 round 2)
			FEMALE = {5, 33, 34, 35, 37, 38, 39, 41} },	-- 41 = 32 without its gilded markings
		{ name = "Eredar", lore = "Long before the draenei fled Argus, their people were the eredar, a race of brilliant mages and scholars. These eredar never bowed to Sargeras, yet still bear the old look of Argus. Wary of their own reflection in the Legion's ranks, they seek to prove that their people's legacy is not only darkness.", icon = "EREDAR",
			MALE = {17, 18, 19, 20, 21, 22, 41, 42},	-- 41, 42 = 30, 31 without the fel lines (Body Markings 5, F-230 round 3)
			FEMALE = {15, 16, 17, 18, 19, 20, 42, 43} },
	},
	-- Grimtotem = the black-furred painted colours 39-41 (user, 2026-10-28)
	["TAUREN"] = {
		shared = { MALE = {19, 20, 21}, FEMALE = {11, 12, 13} },
		{ name = "Tauren", icon = "TAUREN",
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38} },
		{ name = "Grimtotem", lore = "The Grimtotem clan never accepted Cairne Bloodhoof's peace with the younger races. They paint their black fur for war and hold to the old belief that the tauren must rule Kalimdor alone. Those who now walk with the Horde have broken with Magatha's schemes, but they still carry the clan's fierce pride and its war paint.", title = "Grimtotem Tauren", icon = "GRIMTOTEM",
			MALE = {42, 43, 44, 45, 46, 47},	-- black and near-black fur copies; the paint is a layer now
			FEMALE = {42, 43, 44, 45, 46} },
	},
	-- Dark trolls are the purples, Sand trolls the tans (trial, user 2026-10-28)
	["TROLL"] = {
		shared = { MALE = {15, 16, 17}, FEMALE = {15, 16, 17} },
		{ name = "Darkspear", title = "Darkspear Troll", icon = "TROLL", faces = TROLL_FACES,
			MALE = {0, 1, 2, 3, 4, 5, 18, 19, 20, 21, 23, 31},
			FEMALE = {0, 1, 2, 3, 4, 5, 18, 19, 20, 21, 23, 31} },
		{ name = "Dark Troll", lore = "The dark trolls are an ancient people of Kalimdor's forests, purple-skinned and close to the land. Long ago some of their tribes became the first night elves; those who stayed trolls kept to the shadows of Ashenvale and Feralas. A few now answer the Horde's call, bringing old magic and older grudges.", title = "Dark Troll", icon = "DARKTROLL", faces = TROLL_FACES,
			MALE = {24, 25, 26, 27, 28, 29, 30},
			FEMALE = {24, 25, 26, 27, 28, 29, 30} },
		{ name = "Sand Troll", lore = "The Sandfury trolls of Zul'Farrak endured the deserts of Tanaris, their skin burned to the colour of the dunes. Hardened by heat and scarcity, they are cunning raiders and keepers of savage rites. Those who join the Horde trade raiding for war, and bring the desert's endurance with them.", title = "Sand Troll", icon = "SANDTROLL", faces = TROLL_FACES,
			MALE = {22, 32, 33, 34, 35, 36, 39, 40},	-- 39, 40 = 37, 38 without tiger stripes / blood paint (F-230 round 3)
			FEMALE = {22, 32, 33, 34, 35, 36, 39, 40} },
	},
	-- Cultist (user, 2026-10-29): the pale, painted and tattooed skins; the marked faces (blood tears, dark sockets)
	-- are Cultist's own. Cultist itself offers every face, because its skins 18-25 have no rows for the marked ones.
	["HUMAN"] = {
		shared = { MALE = {12, 13, 14}, FEMALE = {12, 13, 14} },
		{ name = "Human", icon = "HUMAN",
			faces = { MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 35, 38},
				FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 32, 35} },
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 15},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 15} },
		{ name = "Cultist", lore = "Some of Lordaeron's survivors found answers in the Cult of the Damned's whispers and kept the marks long after they turned away. Pale, painted and tattooed with old rites, they are feared in every human city. Those who fight for the Alliance swear the darkness now serves the light, and few dare ask them twice.", title = "Cultist", icon = "CULTISTHUMAN",
			MALE = {16, 17},
			FEMALE = {16, 17, 20, 21, 22, 23, 24, 25} },
	},
	-- night elf, undead and worgen sub-races from the 2026-10-28 skin review (marked colours allowed, like Wildhammer)
	["NIGHTELF"] = {
		shared = { MALE = {9, 10, 11}, FEMALE = {9, 10, 11} },
		{ name = "Kaldorei", title = "Night Elf", icon = "NIGHTELF",
			faces = { MALE = {0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17} },	-- plain faces; masked and tattooed are Illidari / Cenarion
			MALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24} },
		{ name = "Illidari", lore = "The Illidari are night elves who followed Illidan Stormrage and drank the fel to hunt the Burning Legion with its own power. Scarred and rune-marked, they emerged from the Black Temple and Mardum as the Legion's most hated foes. Their people still distrust them, but Tyrande has let them return to fight beside the Alliance.", title = "Illidari", icon = "ILLIDARI",
			faces = { MALE = {5, 14} },	-- the blindfolded face (20 / 27 = 5 / 14 + the cheek marks, now Face Markings 21)
			MALE = {33, 40, 41, 42, 43},	-- 40-43 = 34-37 without the fel slashes / runes, now Body Markings 37-40 (F-230 round 3)
			FEMALE = {25, 35, 36, 37, 38} },	-- 35-38 = 26-29 clean (Body Markings 33-36); 33 / 25 keep their fire demon skin
		{ name = "Cenarion", lore = "Sworn to the Cenarion Circle and the Emerald Dream, these night elves bear the marks of Moonglade's rites on their skin. They are the guardians of Kalimdor's wild places, from Ashenvale's glades to the slopes of Mount Hyjal. Where the Alliance marches into the wild, they walk beside it as its keepers.", title = "Cenarion Circle", icon = "CENARION",
			faces = { MALE = {0, 1, 2, 3, 4, 6, 7, 8, 9, 10, 11, 12, 13, 15, 16, 17} },	-- plain faces: the tattooed faces 18-31 are plain faces + Face Markings 15-20 now
			MALE = {38, 39},	-- copies of 0 and 5: colours 25-32 were 0 / 5 + body tattoos, now Body Markings 29-36 (F-230 round 2)
			FEMALE = {33, 34, 39, 40, 41} },	-- 39-41 = 30-32 without the leaf tattoos (Body Markings 37-39); 33 / 34 keep their jewellery
	},
	["SCOURGE"] = {
		{ name = "Forsaken", icon = "SCOURGE",
			MALE = {0, 1, 2, 3, 4, 5, 6, 12, 13, 20, 21},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 12, 13, 20, 21, 25, 26, 27} },	-- 27 = 22 without its baked thorn tattoo
		{ name = "Rimebound", lore = "These Forsaken were raised in Northrend and served in the Lich King's armies before they broke free. The cold of Icecrown never left their flesh, and they know the Scourge's ways from the inside. They serve the Horde as scouts and watchers against the dead they once marched with.", title = "Rimebound Forsaken", icon = "RIMEBOUND",
			MALE = {7, 16, 17},
			FEMALE = {7, 16, 17} },
		{ name = "Plaguebound", lore = "Left to rot in the plague-soaked bogs of the Plaguelands before the Banshee Queen called them back, the Plaguebound wear their decay openly. Many serve the Royal Apothecary Society, steeped in the very blight that killed them. To the Horde they are a reminder that the plague can be turned on its makers.", title = "Plaguebound Forsaken", icon = "PLAGUEBOUND",
			MALE = {9, 18, 19},
			FEMALE = {9, 18, 19} },
		{ name = "Embalmed", lore = "Raised from dry crypts far from Lordaeron's rot, the Embalmed are dead that dried rather than decayed. Their sun-cured flesh holds together better than most Forsaken. They serve the Horde as tomb-wardens and envoys to the desert peoples.", title = "Embalmed Forsaken", icon = "EMBALMED",
			MALE = {8, 10, 11, 14, 15},
			FEMALE = {8, 10, 11, 14, 15} },
	},
	["WORGEN"] = {
		shared = { MALE = {5, 6, 7, 9, 10, 14, 17}, FEMALE = {9, 10, 11, 14, 21, 22} },
		{ name = "Gilnean", title = "Gilnean Worgen", icon = "WORGEN",
			MALE = {0, 1, 2, 3, 4, 8, 12, 15, 18},
			FEMALE = {0, 1, 2, 3, 4, 5, 6, 7, 8, 13, 15, 17, 18, 19} },
		{ name = "Bloodmoon", lore = "The Bloodmoon worgen roam the frozen forests of the Grizzly Hills, their coats bleached white by the Northrend winter. Some broke free of the Wolf Ancient's savagery and travelled south to join the Gilnean packs. They hunt for the Alliance against the Scourge that haunts their homeland.", title = "Bloodmoon Worgen", icon = "BLOODMOON",
			MALE = {11, 13, 16},
			FEMALE = {12, 16, 20} },
	},
};
-- BEGIN GENERATED marking gates (Scripts/Character Skins/markings_glue.py) - do not edit by hand
-- customization 7 = face markings, 8 = body markings, 9 = scars: the values a sub-race may pick (its
-- exclusive set plus the race's common pool); a row with no list here offers every value
CHAR_CREATE_MARK_GATES = {
	["BLOODELF"] = {
		["Blood Elf"] = {
			MALE = { [7] = {0}, [8] = {0, 1, 3, 5, 7, 9, 11, 13, 14, 17, 18, 19, 20, 21, 23, 24, 25, 26, 28, 29, 31, 32} },
			FEMALE = { [7] = {0}, [8] = {0, 1, 3, 5, 7, 9, 11, 13, 14, 17, 18, 19, 21, 22, 24, 25, 27, 28, 30, 31, 33, 34} },
		},
		["Void Elf"] = {
			MALE = { [7] = {0, 1}, [8] = {0, 2, 4, 6, 8, 10, 12, 14, 15, 16, 22, 27, 30, 33} },
			FEMALE = { [7] = {0, 1}, [8] = {0, 2, 4, 6, 8, 10, 12, 14, 15, 16, 20, 23, 26, 29, 32, 35} },
		},
	},
	["DRAENEI"] = {
		["Draenei"] = {
			MALE = { [8] = {0} },
			FEMALE = { [8] = {0} },
		},
		["Eredar"] = {
			MALE = { [8] = {0, 5} },
			FEMALE = { [8] = {0, 5} },
		},
		["Lightforged"] = {
			MALE = { [8] = {0, 1, 2, 3, 4} },
			FEMALE = { [8] = {0, 1, 2, 3, 4} },
		},
	},
	["DWARF"] = {
		["Bronzebeard"] = {
			MALE = { [7] = {0, 3, 7, 11, 15, 19, 23, 27, 32}, [8] = {0, 3, 7, 11, 15, 19, 23, 27, 32} },
			FEMALE = { [7] = {0, 3, 7, 11, 15, 20}, [8] = {0, 3, 7, 11, 15, 19, 23, 27, 31} },
		},
		["Dark Iron"] = {
			MALE = { [7] = {0, 2, 6, 10, 14, 18, 22, 26, 31, 33, 34, 35, 36, 37, 38, 39}, [8] = {0, 2, 6, 10, 14, 18, 22, 26, 31, 33} },
			FEMALE = { [7] = {0, 2, 6, 10, 14, 19, 21, 22, 23, 24, 25, 26, 27}, [8] = {0, 2, 6, 10, 14, 18, 22, 26, 32} },
		},
		["Wildhammer"] = {
			MALE = { [7] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29, 30}, [8] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29, 30} },
			FEMALE = { [7] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 18}, [8] = {0, 1, 4, 5, 8, 9, 12, 13, 16, 17, 20, 21, 24, 25, 28, 29, 30} },
		},
	},
	["GNOME"] = {
		["Cultist"] = {
			MALE = { [7] = {0, 1} },
			FEMALE = { [7] = {0, 1} },
		},
		["Gnome"] = {
			MALE = { [7] = {0} },
			FEMALE = { [7] = {0} },
		},
		["Leper"] = {
			MALE = { [7] = {0} },
			FEMALE = { [7] = {0} },
		},
	},
	["HUMAN"] = {
		["Cultist"] = {
			MALE = { [7] = {0, 1, 2} },
			FEMALE = { [7] = {0, 1, 2, 3, 4, 5, 6}, [8] = {0, 1} },
		},
		["Human"] = {
			MALE = { [7] = {0} },
			FEMALE = { [7] = {0, 1, 2, 3, 4, 5, 6}, [8] = {0} },
		},
	},
	["NIGHTELF"] = {
		["Cenarion"] = {
			MALE = { [7] = {0, 2, 3, 4, 5, 15, 16, 17, 18, 19, 20}, [8] = {0, 1, 2, 3, 4, 29, 30, 31, 32, 33, 34, 35, 36}, [9] = {0, 2, 3, 4, 5} },
			FEMALE = { [7] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15}, [8] = {0, 13, 14, 15, 16, 23, 24, 25, 26, 37, 38, 39}, [9] = {0, 2, 3, 4, 5} },
		},
		["Illidari"] = {
			MALE = { [7] = {0, 21}, [8] = {0, 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 37, 38, 39, 40}, [9] = {0} },
			FEMALE = { [7] = {0, 3, 8, 9, 10, 11, 12, 13}, [8] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19, 20, 21, 22, 25, 26, 33, 34, 35, 36}, [9] = {0, 2, 3, 4, 5} },
		},
		["Kaldorei"] = {
			MALE = { [7] = {0, 1, 2, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, [8] = {0, 1, 4}, [9] = {0, 1, 2, 3, 4, 5} },
			FEMALE = { [7] = {0, 3, 8, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23}, [8] = {0, 15, 16, 25, 26, 27, 28, 29, 30, 31, 32}, [9] = {0, 1, 2, 3, 4, 5} },
		},
	},
	["ORC"] = {
		["Blackrock"] = {
			MALE = { [7] = {0, 3, 4, 8, 12, 16}, [8] = {0, 7, 11, 15}, [9] = {0, 1, 2, 3} },
			FEMALE = { [7] = {0, 7, 11, 15}, [8] = {0, 7, 11, 15}, [9] = {0, 1, 2, 3, 4} },
		},
		["Fel Orc"] = {
			MALE = { [7] = {0, 3, 4, 7, 11, 15}, [8] = {0, 6, 10, 14}, [9] = {0, 1, 2, 3} },
			FEMALE = { [7] = {0, 6, 10, 14}, [8] = {0, 6, 10, 14}, [9] = {0, 1, 2, 3, 4} },
		},
		["Mag'har"] = {
			MALE = { [7] = {0, 3, 4, 5, 9, 13}, [8] = {0, 4, 8, 12, 16, 17}, [9] = {0, 1, 2, 3} },
			FEMALE = { [7] = {0, 4, 8, 12}, [8] = {0, 4, 8, 12, 16, 17}, [9] = {0, 1, 2, 3, 4} },
		},
		["Orc"] = {
			MALE = { [7] = {0, 1, 2, 3, 4, 6, 10, 14}, [8] = {0, 1, 2, 3, 5, 9, 13}, [9] = {0, 1, 2, 3} },
			FEMALE = { [7] = {0, 1, 2, 3, 5, 9, 13}, [8] = {0, 1, 2, 3, 5, 9, 13}, [9] = {0, 1, 2, 3, 4} },
		},
	},
	["SCOURGE"] = {
		["Embalmed"] = {
			FEMALE = { [8] = {0} },
		},
		["Forsaken"] = {
			FEMALE = { [8] = {0, 1} },
		},
		["Plaguebound"] = {
			FEMALE = { [8] = {0} },
		},
		["Rimebound"] = {
			FEMALE = { [8] = {0} },
		},
	},
	["TAUREN"] = {
		["Grimtotem"] = {
			MALE = { [7] = {0, 2, 7, 12, 16, 18, 19, 20, 21}, [8] = {0, 2, 7, 12, 16, 18, 19, 20, 21} },
			FEMALE = { [7] = {0, 2, 7, 12, 16, 18, 19, 20, 21}, [8] = {0, 2, 7, 12, 16, 18, 19, 20, 21} },
		},
		["Tauren"] = {
			MALE = { [7] = {0, 1, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 17}, [8] = {0, 1, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 17} },
			FEMALE = { [7] = {0, 1, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 17}, [8] = {0, 1, 3, 4, 5, 6, 8, 9, 10, 11, 13, 14, 15, 17} },
		},
	},
	["TROLL"] = {
		["Dark Troll"] = {
			MALE = { [7] = {0, 13, 14, 17, 18, 26, 27, 30, 31, 32, 33, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82}, [8] = {0, 1, 2, 5, 6, 7, 8, 9, 10, 15, 16, 17, 18} },
			FEMALE = { [7] = {0, 1, 2, 3, 7, 8, 9, 10, 11, 12, 16, 17, 18, 19, 20}, [8] = {0, 1, 2, 3, 7, 8, 9, 10, 11, 12, 16, 17, 18} },
		},
		["Darkspear"] = {
			MALE = { [7] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 19, 20, 21, 22, 23, 24, 25, 32, 33, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58}, [8] = {0} },
			FEMALE = { [7] = {0, 19, 20}, [8] = {0} },
		},
		["Sand Troll"] = {
			MALE = { [7] = {0, 15, 16, 28, 29, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 59, 60, 61, 62, 83, 84}, [8] = {0, 3, 4, 11, 12, 13, 14, 19, 20} },
			FEMALE = { [7] = {0, 4, 5, 6, 13, 14, 15, 19, 20, 21, 22}, [8] = {0, 4, 5, 6, 13, 14, 15, 19, 20, 21, 22} },
		},
	},
};
for race, subs in pairs(CHAR_CREATE_MARK_GATES) do
	for _, subRace in ipairs(CHAR_CREATE_SUBRACES[race]) do
		subRace.marks = subs[subRace.name];
	end
end
-- END GENERATED marking gates
MAX_SUBRACES = 4;

function CharacterCreate_OnLoad(self)
	self:RegisterEvent("RANDOM_CHARACTER_NAME_RESULT");
	self:RegisterEvent("GLUE_UPDATE_EXPANSION_LEVEL");

	self:SetSequence(0);
	self:SetCamera(0);

	CharacterCreate.numRaces = 0;
	CharacterCreate.selectedRace = 0;
	CharacterCreate.numClasses = 0;
	CharacterCreate.selectedClass = 0;
	CharacterCreate.selectedGender = 0;

	SetCharCustomizeFrame("CharacterCreate");
	CharacterCreateFrame:EnableMouseWheel(true);	-- F-151 zoom

	for i=1, NUM_CHAR_CUSTOMIZATIONS, 1 do
		_G["CharCreateCustomizationButton"..i].text:SetText(_G["CHAR_CUSTOMIZATION"..i.."_DESC"]);
	end
	CharCreateCustomizationButton6.text:SetText(CHAR_CUSTOMIZATION_EYES_DESC);		-- F-151
	CharCreateCustomizationButton7.text:SetText(CHAR_CUSTOMIZATION_MARKINGS_DESC);
	CharCreateCustomizationButton8.text:SetText(CHAR_CUSTOMIZATION_BODY_MARKINGS_DESC);
	CharCreateCustomizationButton9.text:SetText(CHAR_CUSTOMIZATION_WAR_PAINT_DESC);

	-- Color edit box backdrop
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE["Alliance"];
	CharacterCreateNameEdit:SetBackdropBorderColor(backdropColor[1], backdropColor[2], backdropColor[3]);
	CharacterCreateNameEdit:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);

	CharCreatePreviewFrame.previews = { };

	CharCreateLayout_Build();	-- F-151: the Race and Appearance steps' panels
end

function CharCustomizeButtonClick(id, button)
	if (button == 'LeftButton') then
		CharacterCustomization_Right(id)
	elseif (button == 'RightButton') then
		CharacterCustomization_Left(id)
	end
end

function CharacterCreate_OnShow()
	for i=1, MAX_CLASSES_PER_RACE, 1 do
		local button = _G["CharCreateClassButton"..i];
		button:Enable();
		--button:SetScale(0.8)
		SetButtonDesaturated(button, false)
	end

	for i=1, MAX_RACES, 1 do
		local button = _G["CharCreateRaceButton"..i];
		button:Enable();
		--button:SetScale(0.8)
		SetButtonDesaturated(button, false)
	end

	CharacterCreate.subRaces = nil;	-- F-151: re-derive the sub-race from the new character's skin
	CharacterCreate.racePicked = PAID_SERVICE_TYPE ~= nil;	-- F-151: a new character opens on the two factions
	CharacterCreate_ShowOutfit(true);	-- F-151: every visit starts dressed

	if ( PAID_SERVICE_TYPE ) then
		CustomizeExistingCharacter( PAID_SERVICE_CHARACTER_ID );
		CharacterCreateNameEdit:SetText( PaidChange_GetName() );
	else
		--randomly selects a combination
		ResetCharCustomize();
		CharacterCreateNameEdit:SetText("");
	end

	CharacterCreateEnumerateRaces(GetAvailableRaces());
	SetCharacterRace(GetSelectedRace());

	CharacterCreateEnumerateClasses(GetAvailableClasses());
	local_,_,index = GetSelectedClass();
	SetCharacterClass(index);

	--[[if ( GetSelectedRace() == TUSKARR_RACE_ID ) then
		SetCharacterGender(SEX_MALE);
		CharCreateMaleButton:SetChecked(1);
		CharCreateFemaleButton:SetChecked(0);
	else]]
	SetCharacterGender(GetSelectedSex());
	--end

	-- Hair customization stuff
	CharacterCreate_UpdateHairCustomization();

	SetCharacterCreateFacing(-15);

	-- setup customization
	CharacterChangeFixup();

	-- F-151: two steps, Race then Appearance (CharCreate_SetStep); a paid customization has no race to pick
	CharCreateCustomizationFrame_OnShow();
	CharCreate_SetStep(PAID_SERVICE_TYPE == PAID_CHARACTER_CUSTOMIZATION and 2 or 1);
end

function CharacterCreate_OnHide()
	PAID_SERVICE_CHARACTER_ID = nil;
	PAID_SERVICE_TYPE = nil;
	-- character previews will need to be redone if coming back to character create
	CharCreatePreviewFrame.rebuildPreviews = true;
end

function CharacterCreate_OnEvent(event, arg1, arg2, arg3)
	if ( event == "RANDOM_CHARACTER_NAME_RESULT" ) then
		if ( arg1 == 0 ) then
			-- Failed.  Generate a random name locally.
			CharacterCreateNameEdit:SetText(GenerateRandomName());
		else
			-- Succeeded.  Use what the server sent.
			CharacterCreateNameEdit:SetText(arg2);
		end
		CharacterCreateRandomName:Enable();
		CharCreateOkayButton:Enable();
		PlaySound("gsCharacterCreationLook");
	elseif ( event == "GLUE_UPDATE_EXPANSION_LEVEL" ) then
		-- Expansion level changed while online, so enable buttons as needed
		if ( CharacterCreateFrame:IsShown() ) then
			CharacterCreateEnumerateRaces(GetAvailableRaces());
			CharacterCreateEnumerateClasses(GetAvailableClasses());
		end
	end
end

function CharacterCreateFrame_OnMouseDown(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		CHARACTER_CREATE_INITIAL_FACING = GetCharacterCreateFacing();
	end
end

function CharacterCreateFrame_OnMouseUp(button)
	if ( button == "LeftButton" ) then
		CHARACTER_CREATE_ROTATION_START_X = nil
	end
end

-- F-151: mouse-wheel zoom toward the character's head (SetCharacterCreateZoom, a source-client API).
-- CHAR_CREATE_ZOOM is the target (0 = stock framing, 1 = face), eased each frame. It stops at
-- CHAR_CREATE_ZOOM_MAX: closer than that the face textures show their pixels on a 4K screen.
CHAR_CREATE_ZOOM = 0;
CHAR_CREATE_ZOOM_SHOWN = 0;
CHAR_CREATE_ZOOM_STEP = 0.2;
CHAR_CREATE_ZOOM_MAX = 0.8;

function CharacterCreate_Zoom(delta)
	CHAR_CREATE_ZOOM = math.min(CHAR_CREATE_ZOOM_MAX, math.max(0, CHAR_CREATE_ZOOM + delta * CHAR_CREATE_ZOOM_STEP));
end

function CharacterCreate_UpdateZoom(elapsed)
	if ( not SetCharacterCreateZoom ) then
		return;
	end
	local shown = CHAR_CREATE_ZOOM_SHOWN + (CHAR_CREATE_ZOOM - CHAR_CREATE_ZOOM_SHOWN) * math.min(1, elapsed * 10);
	if ( math.abs(shown - CHAR_CREATE_ZOOM) < 0.002 ) then
		shown = CHAR_CREATE_ZOOM;
	end
	CHAR_CREATE_ZOOM_SHOWN = shown;
	SetCharacterCreateZoom(shown);
end

-- F-151: "Label | 3/20" on the customization buttons (GetCharCustomizationInfo is a source-client API)
CHAR_CREATE_COUNT_TIMER = 0;

function CharCreate_UpdateCustomizationCounts()
	CharCreate_UpdateFaceLayerButtons();
	for i = 1, NUM_CHAR_CUSTOMIZATIONS do
		local button = _G["CharCreateCustomizationButton"..i];
		if ( button and button.count ) then
			local position, count;
			if ( GetCharCustomizationInfo ) then
				position, count = GetCharCustomizationInfo(i);
			end
			if ( count and count > 0 ) then
				button.count:SetText(position.."/"..count);
				button.count:Show();
				button.divider:Show();
			else
				button.count:Hide();
				button.divider:Hide();
			end
		end
	end
	CharCreateLayout_RefreshOptions();
end

-- F-151: Eye Color (6), Tattoo (7), Scars (8) and War Paint (9) show only for a race that has more than one choice, below the last
-- shown stock button.
-- F-151: the outfit toggle above Finish (SetCharacterCreateOutfitShown is a source-client API)
function CharacterCreate_ShowOutfit(shown)
	if ( not SetCharacterCreateOutfitShown ) then
		CharCreateOutfitButton:Hide();
		return;
	end
	SetCharacterCreateOutfitShown(shown);
	CharCreateOutfitButton:SetText(shown and CHAR_CREATE_HIDE_OUTFIT or CHAR_CREATE_SHOW_OUTFIT);
	CharCreateOutfitButton:Show();
end

function CharacterCreate_ToggleOutfit()
	CharacterCreate_ShowOutfit(not IsCharacterCreateOutfitShown());
	PlaySound("gsCharacterCreationLook");
end

function CharCreate_UpdateFaceLayerButtons()
	local below = CharCreateCustomizationButton1;
	for i = 2, 5 do
		if ( _G["CharCreateCustomizationButton"..i]:IsShown() ) then
			below = _G["CharCreateCustomizationButton"..i];
		end
	end
	for i = 6, 9 do
		local button = _G["CharCreateCustomizationButton"..i];
		local count;
		if ( GetCharCustomizationInfo ) then
			_, count = GetCharCustomizationInfo(i);
		end
		if ( count and count > 1 ) then
			button:ClearAllPoints();
			button:SetPoint("TOP", below, "BOTTOM", 0, 0);
			button:Show();
			below = button;
		else
			button:Hide();
		end
	end
end

-- F-151 sub-races (CHAR_CREATE_SUBRACES): portraits beside the selected race, its skin colours limited to the
-- chosen sub-race (SetCharCustomizationFilter is a source-client API), and the sub-race's name on the race
-- button and the race info title.
function CharCreate_SubRaceGender()
	if ( GetSelectedSex() == SEX_MALE ) then
		return "MALE";
	end
	return "FEMALE";
end

function CharCreate_SubRaceOf(subRaces, gender, skin)
	for i, subRace in ipairs(subRaces) do
		for _, colour in ipairs(subRace[gender]) do
			if ( colour == skin ) then
				return i;
			end
		end
	end
end

function CharCreate_ApplySubRace()
	local subRaces = CharacterCreate.subRaces;
	local gender = CharCreate_SubRaceGender();
	local colours = {};
	for _, colour in ipairs(subRaces[CharacterCreate.subRace][gender]) do
		tinsert(colours, colour);
	end
	if ( subRaces.shared ) then
		for _, colour in ipairs(subRaces.shared[gender]) do
			tinsert(colours, colour);
		end
	end
	SetCharCustomizationFilter(1, unpack(colours));
	-- face markings, body markings and scars: the sub-race's exclusive set plus the race's common pool
	local gates = subRaces[CharacterCreate.subRace].marks;
	for index = 7, 9 do
		local marks = gates and gates[gender] and gates[gender][index];
		if ( marks ) then
			SetCharCustomizationFilter(index, unpack(marks));
		else
			SetCharCustomizationFilter(index);
		end
	end
	-- faces (CharSections face types; each list includes the death knight copies) a sub-race keeps to itself
	local faces = subRaces[CharacterCreate.subRace].faces;
	if ( faces and faces[gender] ) then
		SetCharCustomizationFilter(2, unpack(faces[gender]));
	else
		SetCharCustomizationFilter(2);
	end
	local eyes = subRaces[CharacterCreate.subRace].eyes;
	if ( eyes ) then
		SetCharCustomizationFilter(6, unpack(eyes[gender]));
	else
		SetCharCustomizationFilter(6);
	end
end

function CharCreate_UpdateSubRaces()
	local _, fileString = GetNameForRace();
	local subRaces = SetCharCustomizationFilter and fileString and CHAR_CREATE_SUBRACES[strupper(fileString)];
	if ( not subRaces ) then
		if ( CharacterCreate.subRaces ) then
			SetCharCustomizationFilter(1);
			SetCharCustomizationFilter(2);
			SetCharCustomizationFilter(6);
			SetCharCustomizationFilter(7);
			SetCharCustomizationFilter(8);
			SetCharCustomizationFilter(9);
			CharacterCreate.subRaces = nil;
		end
		CharCreateLayout_RefreshRaces();
		return;
	end

	local gender = CharCreate_SubRaceGender();
	if ( CharacterCreate.subRaces ~= subRaces ) then
		-- a newly selected race starts in the sub-race its (random or existing) skin colour belongs to
		local _, _, skin = GetCharCustomizationInfo(1);
		CharacterCreate.subRaces = subRaces;
		CharacterCreate.subRace = CharCreate_SubRaceOf(subRaces, gender, skin) or 1;
	end
	CharCreate_ApplySubRace();
	CharCreateLayout_RefreshRaces();
	CharCreateLayout_RefreshRaceInfo();	-- the sub-race's title on the lore and the Appearance heading
end

-- a sub-race portrait on a race's row (CharCreateLayout_RefreshRaces): selects that race, then that sub-race
function CharCreateSubRace_OnClick(self)
	local raceButton = _G["CharCreateRaceButton"..self.raceIndex];
	if ( GetSelectedRace() ~= self.raceIndex ) then
		CharacterRace_OnClick(raceButton, self.raceIndex);
	else
		PlaySound("gsCharacterCreationClass");
	end
	CharacterCreate.subRace = self:GetID();
	CharCreate_UpdateSubRaces();
end

function CharacterCreateFrame_OnUpdate(self, elapsed)
	CharacterCreate_UpdateZoom(elapsed);
	CharCreateLayout_RingUpdate(elapsed);	-- F-151: the inner ring fanning out
	CHAR_CREATE_COUNT_TIMER = CHAR_CREATE_COUNT_TIMER - elapsed;
	if ( CHAR_CREATE_COUNT_TIMER <= 0 ) then
		CHAR_CREATE_COUNT_TIMER = 0.15;
		CharCreate_UpdateCustomizationCounts();
	end
	if ( CHARACTER_CREATE_ROTATION_START_X ) then
		local x = GetCursorPosition();
		local diff = (x - CHARACTER_CREATE_ROTATION_START_X) * CHARACTER_ROTATION_CONSTANT;
		CHARACTER_CREATE_ROTATION_START_X = GetCursorPosition();
		SetCharacterCreateFacing(GetCharacterCreateFacing() + diff);
		CharCreate_RotatePreviews();
	end
	CharacterCreateWhileMouseDown_Update(elapsed);
end

function CharacterCreateEnumerateRaces(...)
	CharacterCreate.numRaces = select("#", ...)/3;
	if ( CharacterCreate.numRaces > MAX_RACES ) then
		message("Too many races!  Update MAX_RACES");
		return;
	end
	local index = 1;
	local button;
	local gender;
	local selectedSex = GetSelectedSex();
	if ( selectedSex == SEX_MALE ) then
		gender = "MALE";
	else
		gender = "FEMALE";
	end
	for i=1, select("#", ...), 3 do
		local name = select(i, ...);
		local unlocalizedname = strupper(select(i+1, ...))

		local raceTexture = RACE_ICON_TEXTURES[strupper(select(i+1, ...).."_"..gender)];
		_G["CharCreateRaceButton"..index.."NormalTexture"]:SetTexture(raceTexture);
		_G["CharCreateRaceButton"..index.."NormalTexture"]:SetTexCoord(0, 1, 0, 1);
		_G["CharCreateRaceButton"..index.."PushedTexture"]:SetTexture(raceTexture);
		_G["CharCreateRaceButton"..index.."PushedTexture"]:SetTexCoord(0, 1, 0, 1);
		button = _G["CharCreateRaceButton"..index];
		if ( not button  ) then
			return;
		end

		button.nameFrame.text:SetText(name);
		button.fileString = unlocalizedname;	-- F-151: the ring's sub-races (CharCreateLayout_RefreshRaces)
		button.raceTexture = raceTexture;	-- F-151: the selected race's slot shows the faction crest instead
		if ( select(i+2, ...) == 1 ) then
			button:Enable();
			SetButtonDesaturated(button);
			button.name = name;
			button.tooltip = name;
		else
			button:Disable();
			SetButtonDesaturated(button, 1);
			button.name = name;
			local disabledReason = _G[strupper(select(i+1, ...).."_".."DISABLED")];
			if ( disabledReason ) then
				button.tooltip = name.."|n"..disabledReason;
			else
				button.tooltip = nil;
			end
		end

		local abilityIndex = 1;
		local tempText = _G["ABILITY_INFO_"..unlocalizedname..abilityIndex];
		abilityText = "";
		while ( tempText ) do
			abilityText = abilityText..tempText.."\n\n";
			abilityIndex = abilityIndex + 1;
			tempText = _G["ABILITY_INFO_"..unlocalizedname..abilityIndex];
		end

		text = GetFlavorText("RACE_INFO_"..unlocalizedname, gender)
		button.tooltip = "|r"..text
		button.tooltip = button.tooltip.."\n\n|cffFFFFFF"..abilityText


		index = index + 1;
	end
	for i=CharacterCreate.numRaces + 1, MAX_RACES, 1 do
		_G["CharCreateRaceButton"..i]:Hide();
	end
	CharCreateLayout_RefreshRaces();
end

function CharacterCreateEnumerateClasses(...)
	CharacterCreate.numClasses = select("#", ...)/3;
	if ( CharacterCreate.numClasses > MAX_CLASSES_PER_RACE ) then
		message("Too many classes!  Update MAX_CLASSES_PER_RACE");
		return;
	end
	local coords;
	local index = 1;
	local button;
	for i=1, select("#", ...), 3 do
		local unlocalizedname = strupper(select(i+1, ...))

		coords = CLASS_ICON_TCOORDS[strupper(select(i+1, ...))];
		_G["CharCreateClassButton"..index.."NormalTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		_G["CharCreateClassButton"..index.."PushedTexture"]:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
		button = _G["CharCreateClassButton"..index];
		button:Show();
		button.nameFrame.text:SetText(select(i, ...));
		button.tooltip = ""
		button.tooltip = button.nameFrame.text:GetText()
		
		local abilityIndex = 0;
		local tempText = _G["CLASS_INFO_"..unlocalizedname..abilityIndex];
		abilityText = "";
		while ( tempText ) do
			abilityText = abilityText..tempText.."\n\n";
			abilityIndex = abilityIndex + 1;
			tempText = _G["CLASS_INFO_"..unlocalizedname..abilityIndex];
		end
				
		if ( select(i+2, ...) == 1 ) then
			if (IsRaceClassValid(CharacterCreate.selectedRace, index)) then
				button:Enable();
				SetButtonDesaturated(button);
				text = GetFlavorText("CLASS_"..strupper(unlocalizedname), "MALE").."|n|n"
				button.tooltip = "|r"..text
				button.tooltip = button.tooltip.."\n\n|cffFFFFFF"..abilityText
				--button.tooltip = nil;
				-- _G["CharCreateClassButton"..index.."DisableTexture"]:Hide();
			else
				button:Disable();
				SetButtonDesaturated(button, 1);
				button.tooltip = CLASS_DISABLED;
				text = GetFlavorText("CLASS_"..strupper(unlocalizedname), "MALE").."|n|n"
		        button.tooltip = "|cffFFFFFF"..button.tooltip.."|r\n\n"
				_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
			end
		else
			button:Disable();
			SetButtonDesaturated(button, 1);
			_G["CharCreateClassButton"..index.."DisableTexture"]:Show();
		end
				
		index = index + 1;
	end
	for i=CharacterCreate.numClasses + 1, MAX_CLASSES_PER_RACE, 1 do
		_G["CharCreateClassButton"..i]:Hide();
	end
end

function SetCharacterRace(id)

	CharacterCreate.selectedRace = id;
	for i=1, CharacterCreate.numRaces, 1 do
		local button = _G["CharCreateRaceButton"..i];
		if ( i == id ) then
			button:SetChecked(1);
		else
			button:SetChecked(0);
		end
	end

	local name, faction = GetFactionForRace(CharacterCreate.selectedRace);

	if faction == nil then
		faction = "Alliance";
	end

	-- during a paid service we have to set alliance/horde for neutral races
	-- hard-coded for Pandaren because of alliance/horde pseudo buttons
	local canProceed = true;
	-- if ( id == TUSKARR_RACE_ID and PAID_SERVICE_TYPE ) then
	-- 	--[[
	-- 	--local currentFaction = PaidChange_GetCurrentFaction();
	-- 	if ( PaidChange_GetCurrentRaceIndex() == TUSKARR_RACE_ID and PAID_SERVICE_TYPE == PAID_FACTION_CHANGE ) then
	-- 		-- this is an original pandaren staying or becoming selected
	-- 		-- check the pseudo-buttons
	-- 		faction = PandarenFactionButtons_GetSelectedFaction();
	-- 		--if ( faction == currentFaction ) then
	-- 			canProceed = false;
	-- 		--end
	-- 	else
	-- 		-- for faction change use the opposite faction of current character
	-- 		if ( PAID_SERVICE_TYPE == PAID_FACTION_CHANGE ) then
	-- 			--if ( currentFaction == "Horde" ) then
	-- 				faction = "Alliance";
	-- 			--elseif ( currentFaction == "Alliance" ) then
	-- 			--	faction = "Horde";
	-- 			--end
	-- 		-- for race change and customization use the same faction as current character
	-- 		else
	-- 			faction = "Alliance";
	-- 		end
	-- 	end
	-- 	]]
	-- else
	-- 	PandarenFactionButtons_ClearSelection();
	-- end
	CharCreate_EnableNextButton(canProceed);

	-- Set background
	local backgroundFilename = GetCreateBackgroundModel(faction);
	--[[if CharacterCreate.selectedClass == 11 then
		backgroundFilename = "DEMONHUNTER"
	end]]

	if (faction == "Alliance") then
		SetBackgroundModel(CharacterCreate, "HUMAN");
	else
		SetBackgroundModel(CharacterCreate, "ORC");
	end

	-- Set backdrop colors based on faction
	local backdropColor = FACTION_BACKDROP_COLOR_TABLE[faction];
	--CharCreateRaceFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);
	--CharCreateClassFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);
	--CharCreateCustomizationFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);
	--harCreatePreviewFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);
	CharCreateCustomizationFrameBanner:SetVertexColor(backdropColor[10], backdropColor[11], backdropColor[12]);
	CharacterCreateNameEdit:SetBackdropColor(backdropColor[4], backdropColor[5], backdropColor[6]);
	--CharCreateRaceInfoFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);
	--CharCreateClassInfoFrame.factionBg:SetGradient("VERTICAL", 0, 0, 0, backdropColor[7], backdropColor[8], backdropColor[9]);

	-- race info
	local frame = CharCreateRaceInfoFrame;
	local race, fileString = GetNameForRace();
	frame.title:SetText(race);
	fileString = strupper(fileString);
	local gender;
	if ( GetSelectedSex() == SEX_MALE ) then
		gender = "MALE";
	else
		gender = "FEMALE";
	end
	local raceText = _G["RACE_INFO_"..fileString];
	local abilityIndex = 1;
	local tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["ABILITY_INFO_"..fileString..abilityIndex];
	end
	CharCreateRaceInfoFrameScrollFrameScrollBar:SetValue(0);
	local text
	text = GetFlavorText("RACE_INFO_"..strupper(fileString), GetSelectedSex())
	if not text then
		text = "Not in GlueXML."
	end
	CharCreateRaceInfoFrame.scrollFrame.scrollChild.infoText:SetText(text.."|n|n");
	if ( abilityText and abilityText ~= "" ) then
		CharCreateRaceInfoFrame.scrollFrame.scrollChild.bulletText:SetText(abilityText);
	else
		CharCreateRaceInfoFrame.scrollFrame.scrollChild.bulletText:SetText("");
	end

	CharCreate_UpdateSubRaces();
	CharCreateLayout_RefreshRaceInfo();

	-- Altered form
	--[[if (HasAlteredForm()) then
		SetPortraitTexture(CharacterCreateAlternateFormTopPortrait, 22, GetSelectedSex());
		SetPortraitTexture(CharacterCreateAlternateFormBottomPortrait, 23, GetSelectedSex());
		CharacterCreateAlternateFormTop:Show();
		CharacterCreateAlternateFormBottom:Show();
		if( IsViewingAlteredForm() ) then
			CharacterCreateAlternateFormTop:SetChecked(false);
			CharacterCreateAlternateFormBottom:SetChecked(true);
		else
			CharacterCreateAlternateFormTop:SetChecked(true);
			CharacterCreateAlternateFormBottom:SetChecked(false);
		end
	else
		CharacterCreateAlternateFormTop:Hide();
		CharacterCreateAlternateFormBottom:Hide();
	end]]
end

function SetCharacterClass(id)
	if id == 11 then
		return
	end
	CharacterCreate.selectedClass = id;
	for i=1, CharacterCreate.numClasses, 1 do
		local button = _G["CharCreateClassButton"..i];
		if ( i == id ) then
			button:SetChecked(1);
		else
			button:SetChecked(0);
			button.selection:Hide();
		end
	end

	-- class info
	local frame = CharCreateClassInfoFrame;
	local className, classFileName, _, tank, healer, damage = GetSelectedClass();
	local abilityIndex = 0;
	if not classFileName then
		classFileName = "WARRIOR"
	end
	local tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	abilityText = "";
	while ( tempText ) do
		abilityText = abilityText..tempText.."\n\n";
		abilityIndex = abilityIndex + 1;
		tempText = _G["CLASS_INFO_"..classFileName..abilityIndex];
	end
	CharCreateClassInfoFrame.title:SetText(className);
	CharCreateClassInfoFrame.scrollFrame.scrollChild.bulletText:SetText(abilityText);
	CharCreateClassInfoFrame.scrollFrame.scrollChild.infoText:SetText(GetFlavorText("CLASS_"..strupper(classFileName), GetSelectedSex()).."|n|n");
	CharCreateClassInfoFrameScrollFrameScrollBar:SetValue(0);
	CharCreateLayout_RefreshClass();
end

function CharacterCreate_OnChar()
end

function CharacterCreate_OnKeyDown(key)
	if ( key == "ESCAPE" ) then
		CharacterCreate_Back();
	elseif ( key == "ENTER" ) then
		CharacterCreate_Forward();
	elseif ( key == "PRINTSCREEN" ) then
		Screenshot();
	end
end

function CharacterCreate_UpdateModel(self)
	UpdateCustomizationScene();
	self:AdvanceTime();
end

function CharacterCreate_Finish()
	PlaySound("gsCharacterCreationCreateChar");

	-- If something disabled this button, ignore this message.
	-- This can happen if you press enter while it's disabled, for example.
	if ( not CharCreateOkayButton:IsEnabled() ) then
		return;
	end

	if ( PAID_SERVICE_TYPE ) then
		GlueDialog_Show("CONFIRM_PAID_SERVICE");
	else
		-- if using templates, pandaren must pick a faction
		local _, faction = GetFactionForRace(CharacterCreate.selectedRace);
		--if ( IsUsingCharacterTemplate() and ( faction ~= "Alliance" and faction ~= "Horde" ) ) then
		--	CharacterTemplateConfirmDialog:Show();
		--else
			CreateCharacter(CharacterCreateNameEdit:GetText());
		--end
	end
end

function CharacterCreate_Back()
	PlaySound("gsCharacterCreationCancel");
	if ( CharacterCreate.step == 2 ) then	-- F-151: Appearance goes back to Race
		CharCreate_SetStep(1);
		return;
	end
	CHARACTER_SELECT_BACK_FROM_CREATE = true;
	SetGlueScreen("charselect");
end

function CharacterCreate_UpdateFacialHairCustomization()
	if ( GetFacialHairCustomization() == "NONE" ) then
		CharacterCustomizationButtonFrame5:Hide();
		--CharCreateRandomizeButton:SetPoint("TOP", "CharacterCustomizationButtonFrame5", "BOTTOM", 0, -5);
	else
		CharacterCustomizationButtonFrame5Text:SetText(_G["FACIAL_HAIR_"..GetFacialHairCustomization()]);
		CharacterCustomizationButtonFrame5:Show();
		--CharCreateRandomizeButton:SetPoint("TOP", "CharacterCustomizationButtonFrame5", "BOTTOM", 0, -5);
	end
end

function CharacterCreate_UpdateHairCustomization()
	if not _G["HAIR_"..GetHairCustomization().."_STYLE"] or _G["HAIR_"..GetHairCustomization().."_STYLE"] == "" then
		CharCreateCustomizationButton3:Hide()
		CharCreateCustomizationButton4:SetPoint("TOP", CharCreateCustomizationButton2, "BOTTOM", 0, -20)
	else
		CharCreateCustomizationButton3:Show()
		CharCreateCustomizationButton3.text:SetText(_G["HAIR_"..GetHairCustomization().."_STYLE"])
		--CharCreateCustomizationButton4:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, -20)
	end

	if not _G["HAIR_"..GetHairCustomization().."_COLOR"] or _G["HAIR_"..GetHairCustomization().."_COLOR"] == "" then
		CharCreateCustomizationButton4:Hide()
		if CharCreateCustomizationButton3:IsShown() then
			CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
		else
			CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton3, "BOTTOM", 0, 0)
		end
	else
		CharCreateCustomizationButton4:Show()
		CharCreateCustomizationButton4.text:SetText(_G["HAIR_"..GetHairCustomization().."_COLOR"])
		CharCreateCustomizationButton5:SetPoint("TOP", CharCreateCustomizationButton4, "BOTTOM", 0, 0)
	end

	if not _G["FACIAL_HAIR_"..GetFacialHairCustomization()] or _G["FACIAL_HAIR_"..GetFacialHairCustomization()] == "" then
		CharCreateCustomizationButton5:Hide()
	else
		CharCreateCustomizationButton5:Show()
		CharCreateCustomizationButton5.text:SetText(_G["FACIAL_HAIR_"..GetFacialHairCustomization()])
	end

end

function CharacterCreate_Forward()
	if ( CharacterCreate.step == 1 ) then	-- F-151: Race goes on to Appearance, once a race is picked
		if ( not CharacterCreate.racePicked ) then
			return;
		end
		PlaySound("gsCharacterCreationClass");
		CharCreate_SetStep(2);
		return;
	end
	CharacterCreate_Finish();
end

function CharCreateCustomizationFrame_OnShow ()
	-- reset size/tex coord to default to facilitate switching between genders for Pandaren
	CharCreateCustomizationFrameBanner:SetSize(BANNER_DEFAULT_SIZE[1], BANNER_DEFAULT_SIZE[2]);
	CharCreateCustomizationFrameBanner:SetTexCoord(BANNER_DEFAULT_TEXTURE_COORDS[1], BANNER_DEFAULT_TEXTURE_COORDS[2], BANNER_DEFAULT_TEXTURE_COORDS[3], BANNER_DEFAULT_TEXTURE_COORDS[4]);

	-- check each button and hide it if there are no values select
	local resize = 0;
	local lastGood = 0;
	local isSkinVariantHair = false --GetSkinVariationIsHairColor(CharacterCreate.selectedRace);
	local isDefaultSet = 0;
	local checkedButton = 1;

	-- check if this was set, if not, default to 1
	if ( CharacterCreateFrame.customizationType == 0 or CharacterCreateFrame.customizationType == nil ) then
		CharacterCreateFrame.customizationType = 1;
	end
	for i=1, NUM_CHAR_CUSTOMIZATIONS, 1 do
		if ( ( --[[GetNumFeatureVariationsForType(i)]]5 <= 1 ) or ( isSkinVariantHair and i == CHAR_CUSTOMIZE_HAIR_COLOR ) ) then
			resize = resize + 1;
			_G["CharCreateCustomizationButton"..i]:Hide();
		else
			_G["CharCreateCustomizationButton"..i]:Show();
			--_G["CharCreateCustomizationButton"..i]:SetChecked(0); -- we will handle default selection
			-- this must be done since a selected button can 'disappear' when swapping genders
			if ( isDefaultSet == 0 and CharacterCreateFrame.customizationType == i) then
				isDefaultSet = 1;
				checkedButton = i;
			end
			-- set your anchor to be the last good, this currently means button 1 HAS to be shown
			if (i > 1) then
				_G["CharCreateCustomizationButton"..i]:SetPoint( "TOP",_G["CharCreateCustomizationButton"..lastGood]:GetName() , "BOTTOM");
			end
			lastGood = i;
		end
	end

	if (isDefaultSet == 0) then
		CharacterCreateFrame.customizationType = lastGood;
		checkedButton = lastGood;
	end
	--_G["CharCreateCustomizationButton"..checkedButton]:SetChecked(1);

	if (resize > 0) then
	-- we need to resize and remap the banner texture
		local buttonx, buttony = CharCreateCustomizationButton1:GetSize()
		local screenamount = resize*buttony;
		print(screenamount);
		local frameX, frameY = CharCreateCustomizationFrameBanner:GetSize();
		local pctShrink = .2*resize;
		local uvXDefaultSize = BANNER_DEFAULT_TEXTURE_COORDS[2] - BANNER_DEFAULT_TEXTURE_COORDS[1];
		local uvYDefaultSize = BANNER_DEFAULT_TEXTURE_COORDS[4] - BANNER_DEFAULT_TEXTURE_COORDS[3];
		local newYUV = pctShrink*uvYDefaultSize + BANNER_DEFAULT_TEXTURE_COORDS[3];
		-- end coord stay the same
		CharCreateCustomizationFrameBanner:SetTexCoord(BANNER_DEFAULT_TEXTURE_COORDS[1], BANNER_DEFAULT_TEXTURE_COORDS[2], newYUV, BANNER_DEFAULT_TEXTURE_COORDS[4]);
		print(pctShrink);
		CharCreateCustomizationFrameBanner:SetSize(frameX, frameY - screenamount);
		print(CharCreateCustomizationFrameBanner:GetTexCoord());
	end

	--CharCreateRandomizeButton:SetPoint("TOP", _G["CharCreateCustomizationButton"..lastGood]:GetName(), "BOTTOM", 0, 0);
end

function CharacterClass_OnClick(self, id)
	if( self:IsEnabled() ) then
		PlaySound("gsCharacterCreationClass");
		local _,_,currClass = GetSelectedClass();
		if ( currClass ~= id ) then
			SetSelectedClass(id);
			SetCharacterClass(id);
			SetCharacterRace(GetSelectedRace());
			CharacterChangeFixup();
		else
			self:SetChecked(1);
		end
	else
		self:SetChecked(0);
	end
end

function CharacterRace_OnClick(self, id, forceSelect)
	if( self:IsEnabled() ) then
		CharacterCreate.racePicked = true;	-- F-151: the creator opens with no race picked
		PlaySound("gsCharacterCreationClass");
		if ( GetSelectedRace() ~= id or forceSelect ) then
			SetSelectedRace(id);
			SetCharacterRace(id);
			--[[if ( id == TUSKARR_RACE_ID ) then
				SetCharacterGender(SEX_MALE);
			else]]
				SetCharacterGender(GetSelectedSex());
			--end
			SetCharacterCreateFacing(-15);
			CharacterCreateEnumerateClasses(GetAvailableClasses());
			local _,_,classIndex = GetSelectedClass();
			if ( PAID_SERVICE_TYPE ) then
				classIndex = PaidChange_GetCurrentClassIndex();
				SetSelectedClass(classIndex);	-- selecting a race would have changed class to default
			end
			SetCharacterClass(classIndex);

			-- Hair customization stuff
			CharacterCreate_UpdateHairCustomization();
			CharCreateCustomizationFrame_OnShow();

			CharacterChangeFixup();
		end
		-- F-151: the race's own portrait is its first sub-race (a sub-race portrait sets its own after this)
		if ( CharacterCreate.subRaces and CharacterCreate.subRace ~= 1 ) then
			CharacterCreate.subRace = 1;
			CharCreate_UpdateSubRaces();
		end
		CharCreateLayout_RefreshRaces();
	else
		self:SetChecked(0);
	end
end

function SetCharacterGender(sex)
	local gender;

	if ( sex == SEX_MALE ) then
		CharCreateMaleButton:SetChecked(1);
		CharCreateFemaleButton:SetChecked(0);
	else
		CharCreateMaleButton:SetChecked(0);
		CharCreateFemaleButton:SetChecked(1);
	end
	SetSelectedSex(sex);

	-- Update race images to reflect gender
	CharacterCreateEnumerateRaces(GetAvailableRaces());
	CharacterCreateEnumerateClasses(GetAvailableClasses());
 	SetCharacterRace(GetSelectedRace());

	local _,_,classIndex = GetSelectedClass();
	if ( PAID_SERVICE_TYPE ) then
		classIndex = PaidChange_GetCurrentClassIndex();
		-- PandarenFactionButtons_SetTextures();
	end
	SetCharacterClass(classIndex);

	CharacterCreate_UpdateHairCustomization();
	CharacterChangeFixup();

	-- Update customization buttons for new gender
	CharCreateCustomizationFrame_OnShow();
end

function CharacterCustomization_Left(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, -1);
end

function CharacterCustomization_Right(id)
	PlaySound("gsCharacterCreationLook");
	CycleCharCustomization(id, 1);
end

function CharacterCreate_GenerateRandomName(button)
	CharacterCreateNameEdit:SetText(GetRandomName());
end

function CharacterCreate_Randomize()
	-- Disabled: randomize causes client lag/crash with custom CharSections.dbc
end

function CharacterCreateRotateRight_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() + CHARACTER_FACING_INCREMENT);
		CharCreate_RotatePreviews();
	end
end

function CharacterCreateRotateLeft_OnUpdate(self)
	if ( self:GetButtonState() == "PUSHED" ) then
		SetCharacterCreateFacing(GetCharacterCreateFacing() - CHARACTER_FACING_INCREMENT);
		CharCreate_RotatePreviews();
	end
end

function SetButtonDesaturated(button, desaturated, r, g, b)
	if ( not button ) then
		return;
	end
	local icon = button:GetNormalTexture();
	if ( not icon ) then
		return;
	end
	local shaderSupported = icon:SetDesaturated(desaturated);

	if ( not desaturated ) then
		r = 1.0;
		g = 1.0;
		b = 1.0;
	elseif ( not r or not shaderSupported ) then
		r = 0.5;
		g = 0.5;
		b = 0.5;
	end

	icon:SetVertexColor(r, g, b);
end

function GetFlavorText(tagname, sex)
	local primary, secondary;
	if ( sex == SEX_MALE ) then
		primary = "";
		secondary = "_FEMALE";
	else
		primary = "_FEMALE";
		secondary = "";
	end
	local text = _G[tagname..primary];
	if ( (text == nil) or (text == "") ) then
		text = _G[tagname..secondary];
	end
	return text;
end

function CharacterCreate_DeathKnightSwap(self)
	local _, classFilename = GetSelectedClass();
	if ( classFilename == "DEATHKNIGHT" ) then
		if (self.currentModel ~= "DEATHKNIGHT") then
			self.currentModel = "DEATHKNIGHT";
			self:SetNormalTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Up-Blue");
			self:SetPushedTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Down-Blue");
			self:SetHighlightTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Highlight-Blue");
		end
	else
		if (self.currentModel == "DEATHKNIGHT") then
			self.currentModel = nil;
			self:SetNormalTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Up");
			self:SetPushedTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Down");
			self:SetHighlightTexture("Interface\\Glues\\Common\\Glue-Panel-Button-Highlight");
		end
	end
end

function CharacterChangeFixup()
	if ( PAID_SERVICE_TYPE ) then
		-- no class changing as a paid service
		CharCreateClassFrame:SetAlpha(0.5);
		for i=1, MAX_CLASSES_PER_RACE, 1 do
			if (CharacterCreate.selectedClass ~= i) then
				local button = _G["CharCreateClassButton"..i];
				button:Disable();
				SetButtonDesaturated(button, true);
			end
		end

		local numAllowedRaces = 0;
		for i=1, MAX_RACES, 1 do
			local allow = false;
			if ( PAID_SERVICE_TYPE == PAID_FACTION_CHANGE ) then
				--[[local faction = PaidChange_GetCurrentFaction();
				if ( (i == PaidChange_GetCurrentRaceIndex()) or ((GetFactionForRace(i) ~= faction) and (IsRaceClassValid(i,CharacterCreate.selectedClass))) ) then
					allow = true;
				end]]
				for i=1,MAX_RACES do
					allow = true
				end
			elseif ( PAID_SERVICE_TYPE == PAID_RACE_CHANGE ) then
				--[[local faction = PaidChange_GetCurrentFaction();
				if ( (i == PaidChange_GetCurrentRaceIndex()) or ((GetFactionForRace(i) == faction or IsNeutralRace(i)) and (IsRaceClassValid(i,CharacterCreate.selectedClass))) ) then
					allow = true
				end]]
				local fact = CharacterCreate.selectedRace
				--local str = tostring(fact)..": "
				for i=1,MAX_RACES do
					if (fact < MAX_RACES and i < MAX_RACES) or (fact > (MAX_RACES-1) and i > (MAX_RACES-1)) then
						allow = true
						local button = _G["CharCreateRaceButton"..i];
						button:Enable();
						SetButtonDesaturated(button, false);
					else
						allow = false
						--str = str..tostring(i)..", "
						local button = _G["CharCreateRaceButton"..i];
						button:Disable();
						SetButtonDesaturated(button, true);
					end
				end
				--message(str)
			elseif ( PAID_SERVICE_TYPE == PAID_CHARACTER_CUSTOMIZATION ) then
				if ( i == CharacterCreate.selectedRace ) then
					allow = true
				end
			end
			if (not allow) then
				--local button = _G["CharCreateRaceButton"..i];
				--button:Disable();
				--SetButtonDesaturated(button, true);
			else
				numAllowedRaces = numAllowedRaces + 1;
			end
		end
		if ( numAllowedRaces > 1 ) then
			CharCreateRaceButtonsFrame:SetAlpha(1);
		else
			CharCreateRaceButtonsFrame:SetAlpha(0.5);
		end
	else
		CharCreateRaceButtonsFrame:SetAlpha(1);
		CharCreateClassFrame:SetAlpha(1);
	end
end

function CharCreateSelectCustomizationType(newType)
	-- deselect previous type selection
	if ( CharacterCreateFrame.customizationType and CharacterCreateFrame.customizationType ~= newType ) then
		--_G["CharCreateCustomizationButton"..CharacterCreateFrame.customizationType]:SetChecked(0);
	end
	--_G["CharCreateCustomizationButton"..newType]:SetChecked(1);
	CharacterCreateFrame.customizationType = newType;
	CharCreate_ResetFeaturesDisplay();

	--[[if (newType > 1) then
		SetFaceCustomizeCamera(true);
	else
		SetFaceCustomizeCamera(false);
	end]]
end

function CharCreate_ResetFeaturesDisplay()
	--SetPreviewFramesFeature(CharacterCreateFrame.customizationType);
	-- set the previews scrollframe container height
	-- since the first and the last previews need to be in the center position when scrolled all the way
	-- to the top or to the bottom, there will be gaps of height equal to 2 previews on each side
	local numTotalButtons = 4--GetNumFeatureVariations() + 4;
	CharCreatePreviewFrame.scrollFrame.container:SetHeight(numTotalButtons * PREVIEW_FRAME_HEIGHT - PREVIEW_FRAME_Y_OFFSET);

	for _, previewFrame in pairs(CharCreatePreviewFrame.previews) do
		previewFrame.featureType = 0;
	end

	CharCreate_DisplayPreviewModels();
end

function CharCreate_PrepPreviewModels(reloadModels)
	local displayFrame = CharCreatePreviewFrame;

	-- clear models if rebuildPreviews got flagged
	local rebuildPreviews = displayFrame.rebuildPreviews;
	displayFrame.rebuildPreviews = nil;

	-- need to reload models class was swapped to or from DK
	local classSwap = false;
	local _, class = GetSelectedClass();
	--[[if ( class == "DEATHKNIGHT" or displayFrame.lastClass == "DEATHKNIGHT" ) and ( class ~= displayFrame.lastClass ) then
		classSwap = true;
	end]]

	-- always clear the featureType
	for index, previewFrame in pairs(displayFrame.previews) do
		previewFrame.featureType = 0;
		-- force model reload if class changed
		if ( classSwap ) then
			previewFrame.race = nil;
			previewFrame.gender = nil;
		end
		if ( rebuildPreviews ) then
			--SetPreviewFrame(previewFrame.model:GetName(), index);
		end
	end
end

function CharCreate_DisplayPreviewModels(selectionIndex)
	if ( not selectionIndex ) then
		selectionIndex = featureIndex--GetSelectedFeatureVariation();
	end

	local displayFrame = CharCreatePreviewFrame;
	local previews = displayFrame.previews;
	local numVariations = 8--GetNumFeatureVariations();
	local currentFeatureType = CharacterCreateFrame.customizationType;

	local race = GetSelectedRace();
	local gender = GetSelectedSex();

	-- selection index is the center preview
	-- there are 2 previews above and 2 below, and will pad it out to 1 more on each side, for a total of 7 previews to set up
	for index = selectionIndex - 3, selectionIndex + 3 do
		-- there is empty space both at the beginning and at end of the list, each gap the height of 2 previews
		if ( index > 0 and index <= numVariations ) then
			local previewFrame = previews[index];
			-- create button if we don't have it yet
			if ( not previewFrame ) then
				previewFrame = CreateFrame("BUTTON", "PreviewFrame"..index, displayFrame.scrollFrame.container, "CharCreatePreviewFrameTemplate");
				-- index + 1 because of 2 gaps at the top and -1 for the current preview
				previewFrame:SetPoint("TOPLEFT", PREVIEW_FRAME_X_OFFSET, (index + 1) * -PREVIEW_FRAME_HEIGHT + PREVIEW_FRAME_Y_OFFSET);
				previewFrame.button.index = index;
				previews[index] = previewFrame;
				--SetPreviewFrame(previewFrame.model:GetName(), index);
				-- no texture as of yet
				--previewFrame:SetNormalTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-Classes")
			end
			-- load model if needed, may have been cleared by different race/gender selection
			if ( previewFrame.race ~= race or previewFrame.gender ~= gender ) then
				--SetPreviewFrameModel(index);
				previewFrame.race = race;
				previewFrame.gender = gender;
				-- apply settings
				local model = previewFrame.model;
				--model:SetCustomCamera(cameraID);
				local scale = 1--model:GetWorldScale();
				--model:SetCameraTarget(config.tx * scale, config.ty * scale, config.tz * scale);
				--model:SetCameraDistance(config.distance * scale);
				local cx, cy, cz = model:GetPosition();
				-- model:SetPosition(cx-15, cy, cz)
				--model:SetCameraPosition(cx, cy, config.cz * scale);
				previewFrame.model:SetLight(1, 0, 0, 0, 0, 1, 1.0, 1.0, 1.0);
			end
			-- need to reset the model if it was last used to preview a different feature
			if ( previewFrame.featureType ~= currentFeatureType ) then
				--ResetPreviewFrameModel(index);
				--ShowPreviewFrameVariation(index);
				previewFrame.featureType = currentFeatureType;
			end
			previewFrame:Show();
		else
			-- need to hide tail previews when going to features with fewer styles
			if ( previews[index] ) then
				previews[index]:Hide();
			end
		end
	end
	displayFrame.border.number:SetText("Option "..selectionIndex.."                     ");
	displayFrame.selectionIndex = selectionIndex;
	CharCreate_RotatePreviews();
	CharCreatePreviewFrame_UpdateStyleButtons();
	-- scroll to center the selection
	if ( not displayFrame.animating ) then
		displayFrame.scrollFrame:SetVerticalScroll((selectionIndex - 1) * PREVIEW_FRAME_HEIGHT);
	end
end


function CharCreate_RotatePreviews()
	if ( CharCreatePreviewFrame:IsShown() ) then
		local facing = ((GetCharacterCreateFacing())/ -180) * math.pi;
		local previews = CharCreatePreviewFrame.previews;
		--CharCreatePreviewFrame.selectionIndex = 0;
		for index = CharCreatePreviewFrame.selectionIndex - 3, CharCreatePreviewFrame.selectionIndex + 3 do
			local previewFrame = previews[index];
			if ( previewFrame ) then -- and previewFrame.model:HasCustomCamera()
				--previewFrame.model:SetCameraFacing(facing);
			end
		end
	end
end

function CharCreate_ChangeFeatureVariation(delta)
	local numVariations = 8--GetNumFeatureVariations();
	local startIndex = featureIndex--GetSelectedFeatureVariation();
	local endIndex = startIndex + delta;
	if ( endIndex < 1 or endIndex > numVariations ) then
		return;
	end
	PlaySound("gsCharacterCreationClass");
	featureIndex = endIndex
	CharCreatePreviewFrame_SelectFeatureVariation(endIndex);
end

function CharCreatePreviewFrameButton_OnClick(self)
	PlaySound("gsCharacterCreationClass");
	CharCreatePreviewFrame_SelectFeatureVariation(self.index);
end

function CharCreatePreviewFrame_SelectFeatureVariation(endIndex)
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		if ( not self.queuedIndex ) then
			self.queuedIndex = endIndex;
		end
	else
		local startIndex = featureIndex--GetSelectedFeatureVariation();
		--SelectFeatureVariation(endIndex);
		for i=1,endIndex do
			CycleCharCustomization(FeatureType, 1);
		end
		CharCreatePreviewFrame_UpdateStyleButtons();
		featureIndex = endIndex
		CharCreatePreviewFrame_StartAnimating(startIndex, endIndex);
	end
end

function CharCreatePreviewFrame_StartAnimating(startIndex, endIndex)
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		return;
	else
		self.startIndex = startIndex;
		self.currentIndex = startIndex;
		self.endIndex = endIndex;
		self.queuedIndex = nil;
		self.direction = 1;
		if ( self.startIndex > self.endIndex ) then
			self.direction = -1;
		end
		self.movedTotal = 0;
		self.moveUntilUpdate = PREVIEW_FRAME_HEIGHT;
		self.animating = true;
	end
end

function CharCreatePreviewFrame_StopAnimating()
	local self = CharCreatePreviewFrame;
	if ( self.animating ) then
		self.animating = false;
	end
end

local ANIMATION_SPEED = 5;
function CharCreatePreviewFrame_OnUpdate(self, elapsed)
	if ( self.animating ) then
		local moveIncrement = PREVIEW_FRAME_HEIGHT * elapsed * ANIMATION_SPEED;
		self.movedTotal = self.movedTotal + moveIncrement;
		self.scrollFrame:SetVerticalScroll((self.startIndex - 1) * PREVIEW_FRAME_HEIGHT + self.movedTotal * self.direction);
		self.moveUntilUpdate = self.moveUntilUpdate - moveIncrement;
		if ( self.moveUntilUpdate <= 0 ) then
			self.currentIndex = self.currentIndex + self.direction;
			self.moveUntilUpdate = PREVIEW_FRAME_HEIGHT;
			-- reset movedTotal to account for rounding errors
			self.movedTotal = abs(self.startIndex - self.currentIndex) * PREVIEW_FRAME_HEIGHT;
			CharCreate_DisplayPreviewModels(self.currentIndex);
		end
		if ( self.currentIndex == self.endIndex ) then
			self.animating = false;
			CharCreate_DisplayPreviewModels();
			if ( self.queuedIndex ) then
				local newIndex = self.queuedIndex;
				self.queuedIndex = nil;
				--SelectFeatureVariation(newIndex);
				featureIndex = newIndex
				CycleCharCustomization(FeatureType, featureIndex);
				CharCreatePreviewFrame_UpdateStyleButtons();
				CharCreatePreviewFrame_StartAnimating(self.endIndex, newIndex);
			end
		end
	end
end

function CharCreatePreviewFrame_UpdateStyleButtons()
	local selectionIndex = math.random(1,5)--GetSelectedFeatureVariation();
	local numVariations = 8--GetNumFeatureVariations();
	if ( selectionIndex == 1 ) then
		CharCreateStyleUpButton:Enable();
		CharCreateStyleUpButton.arrow:SetDesaturated(true);
	else
		CharCreateStyleUpButton:Enable();
		CharCreateStyleUpButton.arrow:SetDesaturated(false);
	end
	if ( selectionIndex == numVariations ) then
		CharCreateStyleDownButton:Disable();
		CharCreateStyleDownButton.arrow:SetDesaturated(true);
	else
		CharCreateStyleDownButton:Disable(true);
		CharCreateStyleDownButton.arrow:SetDesaturated(false);
	end
end

local TotalTime = 0;
local KeepScrolling = nil;
local TIME_TO_SCROLL = 0.5;
function CharacterCreateWhileMouseDown_OnMouseDown(direction)
	TIME_TO_SCROLL = 0.5;
	TotalTime = 0;
	KeepScrolling = direction;
end
function CharacterCreateWhileMouseDown_OnMouseUp()
	KeepScrolling = nil;
end
function CharacterCreateWhileMouseDown_Update(elapsed)
	if ( KeepScrolling ) then
		TotalTime = TotalTime + elapsed;
		if ( TotalTime >= TIME_TO_SCROLL ) then
			CharCreate_ChangeFeatureVariation(KeepScrolling);
			TIME_TO_SCROLL = 0.25;
			TotalTime = 0;
		end
	end
end

-- pandaren stuff related to faction change
function CharCreate_EnableNextButton(enabled)
	local button = CharCreateOkayButton;
	if enabled then
		button:Enable();
	else
		button:Disable();
	end
end

-- -- function PandarenFactionButtons_OnLoad(self)
-- -- 	self.PandarenButton = CharCreateRaceButton6;
-- -- end
-- --
-- -- function PandarenFactionButtons_OnLoad(self)
-- -- 	self.PandarenButton = CharCreateRaceButton6;
-- -- end
--
-- function PandarenFactionButtons_Show()
-- 	local frame = CharCreatePandarenFactionFrame;
-- 	-- set the name
-- 	local raceName = GetNameForRace();
-- 	frame.AllianceButton.nameFrame.text:SetText(raceName);
-- 	frame.AllianceButton.tooltip = raceName;
-- 	frame.HordeButton.nameFrame.text:SetText(raceName);
-- 	frame.HordeButton.tooltip = raceName;
-- 	-- set the texture
-- 	PandarenFactionButtons_SetTextures();
-- 	-- set selected button
-- 	local faction = PaidChange_GetCurrentFaction();
-- 	-- deselect first in case of multiple pandaren faction changes
-- 	PandarenFactionButtons_ClearSelection();
-- 	frame[faction.."Button"]:SetChecked(1);
-- 	-- show the frame on top of the normal pandaren button
-- 	frame:Show();
-- 	frame:SetFrameLevel(frame.PandarenButton:GetFrameLevel() + 2);
-- 	CharCreate_EnableNextButton(false);
-- end
--
-- function PandarenFactionButtons_Hide()
-- 	CharCreatePandarenFactionFrame:Hide();
-- 	CharCreate_EnableNextButton(true);
-- end
--
-- function PandarenFactionButtons_SetTextures()
-- 	--[[local gender = "MALE";
-- 	local coords = RACE_ICON_TCOORDS["TUSKARR_"..gender];
-- 	CharCreatePandarenFactionFrameAllianceButtonNormalTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
-- 	CharCreatePandarenFactionFrameAllianceButtonPushedTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
-- 	CharCreatePandarenFactionFrameHordeButtonNormalTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);
-- 	CharCreatePandarenFactionFrameHordeButtonPushedTexture:SetTexCoord(coords[1], coords[2], coords[3], coords[4]);	]]
-- end
--
-- function PandarenFactionButtons_ClearSelection()
-- 	CharCreatePandarenFactionFrame.AllianceButton:SetChecked(0);
-- 	CharCreatePandarenFactionFrame.HordeButton:SetChecked(0);
-- end
--
-- function PandarenFactionButtons_GetSelectedFaction()
-- 	if ( CharCreatePandarenFactionFrame.AllianceButton:GetChecked() ) then
-- 		return "Alliance";
-- 	elseif ( CharCreatePandarenFactionFrame.HordeButton:GetChecked() ) then
-- 		return "Horde";
-- 	end
-- end
--
-- function PandarenFactionButton_OnClick(self)
-- 	PandarenFactionButtons_ClearSelection();
-- 	self:SetChecked(1);
-- 	CharacterRace_OnClick(CharCreatePandarenFactionFrame.PandarenButton, CharCreatePandarenFactionFrame.PandarenButton:GetID(), true);
-- end

-- F-151 two-step creator (user design 2026-10-27, after Esteria's): step 1 Race = a panel per faction with one row per
-- race and its sub-races beside it, the selected race's lore and racials below its rows, gender and class around the
-- model; step 2 Appearance = the customizations as rows with arrows in two panels, the name under the model.
-- CharCreate_SetStep switches them. The stock CharCreateCustomizationButtons stay the source of which options a race
-- has and what they are called, but are never drawn.
CHAR_CREATE_CUSTOMIZE = "Customize";
CHAR_CREATE_PANEL_WIDTH = 300;
CHAR_CREATE_ROW_HEIGHT = 44;
CHAR_CREATE_ROWS_TOP = -84;
CHAR_CREATE_APPEARANCE_ROWS = {1, 2, 3, 4, 6};	-- skin, face, hair style, hair colour, eye colour
CHAR_CREATE_DETAIL_ROWS = {5, 11, 12, 13, 14, 15, 16, 7, 8, 9};	-- features, F-230 feature slots 0-5 (11+s), tattoo, scars, war paint
CHAR_CREATE_CLASS_ORDER = {1, 2, 3, 4, 5, 7, 8, 9, 10, 6, 11};	-- enumerate index; death knight (6) last
CHAR_CREATE_CLASS_SPACING = 58;
CHAR_CREATE_CLASS_SIZE = 34;			-- round class icons (UI-Classes-Circles), spread across the centre
-- step 1's race ring (user design 2026-10-27, option A): per faction panel, the six races on a ring around the faction
-- crest. Picking a race swaps it with the crest: the crest takes the race's slot on the ring, and the race goes to the
-- middle, alone when it has no sub-races, else as the inner ring of its sub-races (the race itself first)
CHAR_CREATE_RACE_RINGS = { {1, 2, 3, 4, 5, 6}, {7, 8, 9, 10, 12, 11} };	-- Alliance, Horde, clockwise from the top
CHAR_CREATE_ICON_SIZE = 40;			-- every round portrait on the rings: race, sub-race
CHAR_CREATE_CREST_SIZE = 52;			-- the faction crest, 30% larger (user, 2026-10-27)
CHAR_CREATE_RING_RADIUS = 105;
CHAR_CREATE_INNER_RADIUS = 44;
CHAR_CREATE_RING_TOP = 26;				-- from the headings' rule to the top of the ring
CHAR_CREATE_RING_FAN_TIME = 0.2;		-- seconds for the inner ring to open
CHAR_CREATE_INFO_WIDTH = CHAR_CREATE_PANEL_WIDTH - 40;
CHAR_CREATE_INFO_BOTTOM = 80;			-- the info blocks stop above the Back / Customize buttons

-- headings: the glue's large fonts draw a thick outline that crowds the letters together at this size (user,
-- 2026-10-30); the same face with a soft drop shadow instead keeps the gaps open
function CharCreateLayout_Heading(fontString, size)
	fontString:SetFont("Fonts\\FRIZQT__.TTF", size or 17, "");
	fontString:SetShadowColor(0, 0, 0, 1);
	fontString:SetShadowOffset(1, -1);
	fontString:SetTextColor(1, 0.82, 0);
	return fontString;
end

local function CharCreateLayout_Line(parent, r, g, b, a)
	local line = parent:CreateTexture(nil, "ARTWORK");
	line:SetTexture(r, g, b, a);
	return line;
end

-- a full-height panel down one side: its shade is drawn on CharacterCreateFrame itself so it sits under every
-- button (a frame's own textures draw below its children); the panel frame carries the heading
local function CharCreateLayout_Panel(name, side)
	local inner = (side == "LEFT") and "RIGHT" or "LEFT";
	local shade = CharacterCreateFrame:CreateTexture(nil, "BACKGROUND");
	shade:SetTexture(0, 0, 0, 0.62);
	shade:SetWidth(CHAR_CREATE_PANEL_WIDTH);
	shade:SetPoint("TOP"..side, CharacterCreateFrame, "TOP"..side);
	shade:SetPoint("BOTTOM"..side, CharacterCreateFrame, "BOTTOM"..side);
	local edge = CharacterCreateFrame:CreateTexture(nil, "BORDER");
	edge:SetTexture(0.75, 0.6, 0.25, 0.8);
	edge:SetWidth(1);
	edge:SetPoint("TOP"..side, shade, "TOP"..inner);
	edge:SetPoint("BOTTOM"..side, shade, "BOTTOM"..inner);

	local panel = CreateFrame("Frame", name, CharacterCreateFrame);
	panel:SetAllPoints(shade);
	local x = (side == "LEFT") and 24 or -24;
	panel.title = CharCreateLayout_Heading(panel:CreateFontString(nil, "OVERLAY", "GlueFontNormalLarge"), 18);
	panel.title:SetPoint("TOP"..side, panel, "TOP"..side, x, -20);
	panel.subtitle = panel:CreateFontString(nil, "OVERLAY", "GlueFontHighlightSmall");
	panel.subtitle:SetPoint("TOP"..side, panel.title, "BOTTOM"..side, 0, -4);
	local rule = CharCreateLayout_Line(panel, 1, 0.82, 0, 0.45);
	rule:SetHeight(1);
	rule:SetPoint("TOPLEFT", panel, "TOPLEFT", 18, -62);
	rule:SetPoint("TOPRIGHT", panel, "TOPRIGHT", -18, -62);
	-- step 2's option rows live in their own child so one Hide clears them
	panel.rows = CreateFrame("Frame", nil, panel);
	panel.rows:SetAllPoints(panel);
	return panel;
end

local function CharCreateLayout_Arrow(row, id, delta, texture)
	local button = CreateFrame("Button", nil, row);
	button:SetWidth(26);
	button:SetHeight(26);
	button:SetNormalTexture("Interface\\Buttons\\UI-SpellbookIcon-"..texture.."-Up");
	button:SetPushedTexture("Interface\\Buttons\\UI-SpellbookIcon-"..texture.."-Down");
	button:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD");
	button:SetScript("OnClick", function()
		if ( delta < 0 ) then
			CharacterCustomization_Left(id);
		else
			CharacterCustomization_Right(id);
		end
	end);
	return button;
end

-- "Skin Color      <  3 / 20  >": arrows step it, a click on the row steps it too (right-click back), as before
local function CharCreateLayout_OptionRow(panel, id)
	local row = CreateFrame("Frame", "CharCreateOptionRow"..id, panel.rows);
	row:SetHeight(CHAR_CREATE_ROW_HEIGHT);
	row:EnableMouse(true);
	row:SetScript("OnMouseUp", function(self, button)
		CharCustomizeButtonClick(id, button);
	end);
	row.label = row:CreateFontString(nil, "OVERLAY", "GlueFontHighlight");
	row.label:SetPoint("LEFT", row, "LEFT", 8, 0);
	row.value = row:CreateFontString(nil, "OVERLAY", "GlueFontNormal");
	row.value:SetPoint("CENTER", row, "RIGHT", -64, 0);
	row.left = CharCreateLayout_Arrow(row, id, -1, "PrevPage");
	row.left:SetPoint("CENTER", row, "RIGHT", -116, 0);	-- leaves "Body Markings" room
	row.right = CharCreateLayout_Arrow(row, id, 1, "NextPage");
	row.right:SetPoint("CENTER", row, "RIGHT", -12, 0);
	local rule = CharCreateLayout_Line(row, 1, 0.82, 0, 0.15);
	rule:SetHeight(1);
	rule:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT");
	rule:SetPoint("BOTTOMRIGHT", row, "BOTTOMRIGHT");
	row:Hide();
	return row;
end

local function CharCreateLayout_StepButton(index, label)
	local button = CreateFrame("Button", "CharCreateStep"..index, CharacterCreateFrame);
	button:SetWidth(150);
	button:SetHeight(24);
	button.text = button:CreateFontString(nil, "OVERLAY", "GlueFontNormal");
	button.text:SetPoint("CENTER");
	button.text:SetText(index.."   "..label);
	button:SetScript("OnClick", function()
		if ( index ~= CharacterCreate.step ) then
			if ( index == 1 ) then
				CharacterCreate_Back();
			else
				CharacterCreate_Forward();
			end
		end
	end);
	return button;
end

function CharCreateLayout_Build()
	CharCreateLayout_Panel("CharCreateLeftPanel", "LEFT");
	CharCreateLayout_Panel("CharCreateRightPanel", "RIGHT");

	-- "1  RACE  ———  2  APPEARANCE" at the top centre
	local step1 = CharCreateLayout_StepButton(1, "RACE");
	local step2 = CharCreateLayout_StepButton(2, "APPEARANCE");
	step1:SetPoint("TOPRIGHT", CharacterCreateFrame, "TOP", -40, -14);
	step2:SetPoint("TOPLEFT", CharacterCreateFrame, "TOP", 40, -14);
	local link = CharCreateLayout_Line(step1, 1, 0.82, 0, 0.5);
	link:SetHeight(1);
	link:SetPoint("LEFT", step1, "RIGHT", 0, 0);
	link:SetPoint("RIGHT", step2, "LEFT", 0, 0);

	-- step 1: the race grid is placed by CharCreateLayout_RefreshRaces; gender sits under the step strip
	for i = 1, MAX_RACES do
		local raceButton = _G["CharCreateRaceButton"..i];
		CharCreateLayout_RoundButton(raceButton, CHAR_CREATE_ICON_SIZE);
		-- no hover popup on the ring: the race panel describes the selection (user, 2026-10-28)
		raceButton:SetScript("OnEnter", nil);
		raceButton:SetScript("OnLeave", nil);
	end
	CharCreateMaleButton:ClearAllPoints();
	CharCreateMaleButton:SetPoint("TOP", CharacterCreateFrame, "TOP", -25, -46);
	CharCreateFemaleButton:ClearAllPoints();
	CharCreateFemaleButton:SetPoint("TOP", CharacterCreateFrame, "TOP", 25, -46);
	-- Hide Armor (step 2 only) under the step strip
	CharCreateOutfitButton:ClearAllPoints();
	CharCreateOutfitButton:SetPoint("TOP", CharacterCreateFrame, "TOP", 0, -50);
	CharCreateOutfitButton:SetWidth(130);
	CharCreateOutfitButton:SetHeight(40);

	-- the selected race's lore and racials under its own faction's grid, the selected class's text under the other
	-- (CharCreateLayout_RefreshRaceInfo, CharCreateLayout_RefreshClass)
	CharCreateLayout_InfoBlock("CharCreateRaceLore");
	CharCreateLayout_InfoBlock("CharCreateClassLore");

	-- class: one row of icons under the model, the selected class's name above it (names under each would collide)
	CharCreateClassFrame:SetBackdrop(nil);
	CharCreateClassFrame:ClearAllPoints();
	-- level with Back / Customize (their centre is 20 + 50 / 2 up)
	CharCreateClassFrame:SetPoint("BOTTOM", CharacterCreateFrame, "BOTTOM", 0, 20);
	CharCreateClassFrame:SetHeight(50);
	for i = 1, MAX_CLASSES_PER_RACE do
		local button = _G["CharCreateClassButton"..i];
		-- the round class icons share UI-CharacterCreate-Classes' layout, so CLASS_ICON_TCOORDS still applies
		_G[button:GetName().."NormalTexture"]:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles");
		_G[button:GetName().."PushedTexture"]:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles");
		CharCreateLayout_RoundButton(button, CHAR_CREATE_CLASS_SIZE);
	end
	local className = CharCreateLayout_Heading(CharacterCreateFrame:CreateFontString("CharCreateClassName", "OVERLAY", "GlueFontNormalLarge"));
	className:SetPoint("BOTTOM", CharacterCreateFrame, "BOTTOM", 0, 20 + 25 + CHAR_CREATE_CLASS_SIZE / 2 + 12);

	-- Back and Customize / Finish centred in their panels
	CharCreateBackButton:ClearAllPoints();
	CharCreateBackButton:SetPoint("BOTTOM", CharCreateLeftPanel, "BOTTOM", 0, 20);
	CharCreateOkayButton:ClearAllPoints();
	CharCreateOkayButton:SetPoint("BOTTOM", CharCreateRightPanel, "BOTTOM", 0, 20);

	-- step 2: the option rows and the name under the model
	for _, id in ipairs(CHAR_CREATE_APPEARANCE_ROWS) do
		CharCreateLayout_OptionRow(CharCreateLeftPanel, id);
	end
	for _, id in ipairs(CHAR_CREATE_DETAIL_ROWS) do
		CharCreateLayout_OptionRow(CharCreateRightPanel, id);
	end
	CharacterCreateNameEdit:ClearAllPoints();
	CharacterCreateNameEdit:SetPoint("BOTTOM", CharacterCreateFrame, "BOTTOM", 16, 96);
	CharCreateCustomizationFrame:Hide();
end

CHAR_CREATE_ROUND = "Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-SubRace-";	-- ..<NAME>_<SEX>, CREST_<FACTION>, Ring, RingChecked

-- a stock square icon button restyled as a round one of `size`: its square shadow and bevel hidden, the gold ring as its
-- checked and hover state, the thin ring over it (the portrait itself is its normal texture, set by the caller)
function CharCreateLayout_RoundButton(button, size)
	button:SetWidth(size);
	button:SetHeight(size);
	for _, part in ipairs({ "Shadow", "BevelEdge" }) do
		local texture = _G[button:GetName()..part];
		if ( texture ) then
			texture:Hide();
		end
	end
	button:SetCheckedTexture(CHAR_CREATE_ROUND.."RingChecked");
	button:SetHighlightTexture(CHAR_CREATE_ROUND.."RingChecked", "ADD");
	-- the template's checked and highlight textures keep its atlas coordinates when their file changes
	button:GetCheckedTexture():SetTexCoord(0, 1, 0, 1);
	button:GetHighlightTexture():SetTexCoord(0, 1, 0, 1);
	for _, texture in ipairs({ button:GetNormalTexture(), button:GetPushedTexture(), button:GetCheckedTexture(), button:GetHighlightTexture() }) do
		if ( texture ) then
			texture:ClearAllPoints();
			texture:SetAllPoints(button);
		end
	end
	if ( not button.ring ) then
		button.ring = button:CreateTexture(nil, "OVERLAY");
		button.ring:SetTexture(CHAR_CREATE_ROUND.."Ring");
		button.ring:SetAllPoints(button);
	end
end

-- a title, a paragraph and a bullet list, CHAR_CREATE_INFO_WIDTH wide
function CharCreateLayout_InfoBlock(name)
	local block = CreateFrame("Frame", name, CharacterCreateFrame);
	block:SetWidth(CHAR_CREATE_INFO_WIDTH);
	block:SetHeight(200);
	block.title = CharCreateLayout_Heading(block:CreateFontString(nil, "OVERLAY", "GlueFontNormalLarge"));
	block.title:SetPoint("TOPLEFT");
	block.text = block:CreateFontString(nil, "OVERLAY", "GlueFontHighlightSmall");
	block.text:SetWidth(CHAR_CREATE_INFO_WIDTH);
	block.text:SetJustifyH("LEFT");
	block.text:SetPoint("TOPLEFT", block.title, "BOTTOMLEFT", 0, -8);
	block.bullets = block:CreateFontString(nil, "OVERLAY", "GlueFontNormalSmall");
	block.bullets:SetWidth(CHAR_CREATE_INFO_WIDTH);
	block.bullets:SetJustifyH("LEFT");
	block.bullets:SetPoint("TOPLEFT", block.text, "BOTTOMLEFT", 0, -10);
	return block;
end

-- puts an info block under a faction panel's race grid (CharCreateLayout_RefreshRaces sets the panel's gridBottom); the
-- paragraph gets what room is left above the Back / Customize buttons once the title and the bullets are placed, so a
-- long racial list (worgen) never runs into them
function CharCreateLayout_PlaceInfo(block, panel)
	local top = (panel.gridBottom or -400) - 18;
	block:ClearAllPoints();
	block:SetPoint("TOPLEFT", panel, "TOPLEFT", 20, top);
	local room = CharacterCreateFrame:GetHeight() + top - CHAR_CREATE_INFO_BOTTOM - block.title:GetHeight() - 18
		- block.bullets:GetHeight();
	block.text:SetHeight(0);
	block.text:SetHeight(math.max(1, math.min(block.text:GetStringHeight(), room)));
end

-- the class icons in one centred row, in CHAR_CREATE_CLASS_ORDER, skipping the ones this client hides
function CharCreateLayout_PlaceClasses()
	local shown = {};
	for _, index in ipairs(CHAR_CREATE_CLASS_ORDER) do
		local button = _G["CharCreateClassButton"..index];
		if ( button and button:IsShown() ) then
			tinsert(shown, button);
		end
	end
	local width = #shown * CHAR_CREATE_CLASS_SPACING;
	CharCreateClassFrame:SetWidth(width);
	for i, button in ipairs(shown) do
		button:ClearAllPoints();
		button:SetPoint("CENTER", CharCreateClassFrame, "LEFT", (i - 0.5) * CHAR_CREATE_CLASS_SPACING, 0);
		button.nameFrame:Hide();
	end
end

function CharCreateLayout_RefreshClass()
	if ( not CharCreateClassName ) then
		return;
	end
	CharCreateLayout_PlaceClasses();
	local className, classFileName = GetSelectedClass();
	CharCreateClassName:SetText(className or "");
	classFileName = strupper(classFileName or "WARRIOR");
	local abilities = {};
	local index = 0;
	while ( _G["CLASS_INFO_"..classFileName..index] ) do
		tinsert(abilities, _G["CLASS_INFO_"..classFileName..index]);
		index = index + 1;
	end
	CharCreateClassLore.title:SetText(className or "");
	CharCreateClassLore.text:SetText(GetFlavorText("CLASS_"..classFileName, GetSelectedSex()) or "");
	CharCreateClassLore.bullets:SetText(table.concat(abilities, "\n"));
	CharCreateLayout_PlaceLore();
end

-- race lore under the selected race's faction grid, class text under the other faction's
function CharCreateLayout_PlaceLore()
	local _, faction = GetFactionForRace(CharacterCreate.selectedRace);
	local racePanel, classPanel = CharCreateLeftPanel, CharCreateRightPanel;
	if ( faction == "Horde" ) then
		racePanel, classPanel = CharCreateRightPanel, CharCreateLeftPanel;
	end
	CharCreateLayout_PlaceInfo(CharCreateRaceLore, racePanel);
	CharCreateLayout_PlaceInfo(CharCreateClassLore, classPanel);
end

-- the ring's centre in a faction panel, from its top left
local function CharCreateLayout_RingCentre()
	return CHAR_CREATE_PANEL_WIDTH / 2, CHAR_CREATE_ROWS_TOP - CHAR_CREATE_RING_TOP - CHAR_CREATE_RING_RADIUS;
end

-- the medallion in the middle of a faction's ring
local function CharCreateLayout_Medal(panel)
	if ( not panel.medal ) then
		local medal = CreateFrame("Frame", nil, CharCreateRaceButtonsFrame);
		medal:SetWidth(CHAR_CREATE_ICON_SIZE);
		medal:SetHeight(CHAR_CREATE_ICON_SIZE);
		local cx, cy = CharCreateLayout_RingCentre();
		medal:SetPoint("CENTER", panel, "TOPLEFT", cx, cy);
		medal.icon = medal:CreateTexture(nil, "ARTWORK");
		medal.icon:SetAllPoints();
		medal.ring = medal:CreateTexture(nil, "OVERLAY");
		medal.ring:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-SubRace-RingChecked");
		medal.ring:SetAllPoints();
		panel.medal = medal;
	end
	return panel.medal;
end

-- the race rings: per faction panel, CHAR_CREATE_RACE_RINGS on a circle, each with a "+n" badge when it has sub-races.
-- The middle (the medallion) holds the faction crest; the selected race trades places with it: its ring slot shows the
-- crest, and the middle shows the race alone, or, for a race with sub-races, nothing but the inner ring of its
-- sub-races (its own first), fanning out from the race's side (CharCreateLayout_RingUpdate). Sets each panel's gridBottom.
function CharCreateLayout_RefreshRaces()
	if ( not CharCreateLeftPanel or not CharacterCreate.numRaces ) then
		return;
	end
	local gender = CharCreate_SubRaceGender();
	local cx, cy = CharCreateLayout_RingCentre();
	for faction, ring in ipairs(CHAR_CREATE_RACE_RINGS) do
		local panel = (faction == 1) and CharCreateLeftPanel or CharCreateRightPanel;
		local medal = CharCreateLayout_Medal(panel);
		local crest = CHAR_CREATE_ROUND.."CREST_"..((faction == 1) and "ALLIANCE" or "HORDE");
		medal.icon:SetTexture(crest);
		medal.ring:SetTexture(CHAR_CREATE_ROUND.."Ring");
		medal:SetWidth(CHAR_CREATE_CREST_SIZE);
		medal:SetHeight(CHAR_CREATE_CREST_SIZE);
		medal:Show();
		local count = 0;
		for slot, i in ipairs(ring) do
			local raceButton = _G["CharCreateRaceButton"..i];
			if ( i <= CharacterCreate.numRaces ) then
				count = count + 1;
				local angle = math.rad(90 - (slot - 1) * 360 / #ring);
				raceButton:ClearAllPoints();
				raceButton:SetPoint("CENTER", panel, "TOPLEFT", cx + CHAR_CREATE_RING_RADIUS * math.cos(angle),
					cy + CHAR_CREATE_RING_RADIUS * math.sin(angle));
				raceButton.ringAngle = angle;
				-- the name outside the ring: above a portrait on its top half, below on its bottom half
				local label = raceButton.nameFrame.text;
				label:ClearAllPoints();
				if ( math.sin(angle) > 0.1 ) then
					label:SetPoint("BOTTOM", raceButton, "TOP", 0, 3);
				else
					label:SetPoint("TOP", raceButton, "BOTTOM", 0, -3);
				end

				local subRaces = SetCharCustomizationFilter and raceButton.fileString and CHAR_CREATE_SUBRACES[raceButton.fileString];
				local selected = CharacterCreate.racePicked and (i == CharacterCreate.selectedRace);
				raceButton:SetChecked(0);	-- the selection's gold ring is in the middle; the race's slot holds the crest
				-- the round portrait: the race's first sub-race icon, or its own file name's
				raceButton.roundTexture = CHAR_CREATE_ROUND..((subRaces and subRaces[1].icon) or raceButton.fileString).."_"..gender;
				local portrait = selected and crest or raceButton.roundTexture;
				if ( selected ) then	-- the crest's slot needs no name (the race panel shows it) and is crest-sized
					raceButton.nameFrame.text:Hide();
				else
					raceButton.nameFrame.text:Show();
				end
				raceButton:SetWidth(selected and CHAR_CREATE_CREST_SIZE or CHAR_CREATE_ICON_SIZE);
				raceButton:SetHeight(selected and CHAR_CREATE_CREST_SIZE or CHAR_CREATE_ICON_SIZE);
				_G["CharCreateRaceButton"..i.."NormalTexture"]:SetTexture(portrait);
				_G["CharCreateRaceButton"..i.."PushedTexture"]:SetTexture(portrait);
				raceButton.nameFrame.text:SetText(raceButton.name);	-- the race's own name; the panel title names the sub-race

				for k = 1, MAX_SUBRACES do
					local name = "CharCreateRaceSub"..i.."_"..k;
					local button = _G[name];
					local subRace = selected and subRaces and subRaces[k];
					if ( subRace ) then
						if ( not button ) then
							button = CreateFrame("CheckButton", name, CharCreateRaceButtonsFrame, "CharCreateSubRaceButtonTemplate");
							button:SetID(k);
							button:SetWidth(CHAR_CREATE_ICON_SIZE);
							button:SetHeight(CHAR_CREATE_ICON_SIZE);
						end
						button.raceIndex = i;
						button.panel = panel;
						button.angle = angle + (k - 1) * 2 * math.pi / #subRaces;	-- the first (the race itself) sits towards its race
						button.icon:SetTexture("Interface\\Glues\\CharacterCreate\\UI-CharacterCreate-SubRace-"..subRace.icon.."_"..gender);
						button:SetChecked(CharacterCreate.subRace == k and 1 or 0);
						button:Show();
					elseif ( button ) then
						button:Hide();
					end
				end
				if ( selected ) then
					if ( subRaces ) then
						medal:Hide();	-- the inner ring is the middle
					else
						medal.icon:SetTexture(raceButton.roundTexture);
						medal.ring:SetTexture(CHAR_CREATE_ROUND.."RingChecked");
						medal:SetWidth(CHAR_CREATE_ICON_SIZE);
						medal:SetHeight(CHAR_CREATE_ICON_SIZE);
					end
					if ( not subRaces ) then
						CHAR_CREATE_RING_OPEN = nil;
					elseif ( CHAR_CREATE_RING_OPEN ~= i ) then
						CHAR_CREATE_RING_OPEN = i;	-- a newly picked race fans its sub-races out
						CHAR_CREATE_RING_TIME = 0;
					end
				end
			end
		end
		panel.raceCount = count;
		panel.gridBottom = cy - CHAR_CREATE_RING_RADIUS - 52;
	end
	CharCreateLayout_RingUpdate(0);
	CharCreate_UpdatePanelHeadings();
	CharCreateLayout_ShowPicked();
end

-- the creator opens on the two factions with no race picked (CharacterCreate.racePicked): until one is, the Race step
-- shows only the rings and "Choose a race", and Customize waits
CHAR_CREATE_CHOOSE_RACE = "Choose a race";
function CharCreateLayout_ShowPicked()
	if ( CharacterCreate.step ~= 1 ) then
		return;
	end
	local picked = CharacterCreate.racePicked;
	for _, frame in ipairs({ CharCreateRaceLore, CharCreateClassLore, CharCreateClassFrame }) do
		if ( picked ) then
			frame:Show();
		else
			frame:Hide();
		end
	end
	if ( picked ) then
		CharCreateOkayButton:Enable();
		CharCreateClassName:SetText(GetSelectedClass() or "");
	else
		CharCreateOkayButton:Disable();
		CharCreateClassName:SetText(CHAR_CREATE_CHOOSE_RACE);
	end
end

-- places the open inner ring, easing its radius out over CHAR_CREATE_RING_FAN_TIME (CharacterCreateFrame_OnUpdate)
CHAR_CREATE_RING_TIME = 0;
function CharCreateLayout_RingUpdate(elapsed)
	local i = CHAR_CREATE_RING_OPEN;
	if ( not i or CHAR_CREATE_RING_TIME > CHAR_CREATE_RING_FAN_TIME and elapsed > 0 ) then
		return;
	end
	CHAR_CREATE_RING_TIME = CHAR_CREATE_RING_TIME + elapsed;
	local t = math.min(1, CHAR_CREATE_RING_TIME / CHAR_CREATE_RING_FAN_TIME);
	local radius = CHAR_CREATE_INNER_RADIUS * (1 - (1 - t) * (1 - t));
	local cx, cy = CharCreateLayout_RingCentre();
	for k = 1, MAX_SUBRACES do
		local button = _G["CharCreateRaceSub"..i.."_"..k];
		if ( button and button:IsShown() ) then
			button:ClearAllPoints();
			button:SetPoint("CENTER", button.panel, "TOPLEFT", cx + radius * math.cos(button.angle), cy + radius * math.sin(button.angle));
		end
	end
end

-- the selected race's name (its sub-race's title), lore and racials, under its faction's rows
function CharCreateLayout_RefreshRaceInfo()
	if ( not CharCreateRaceLore ) then
		return;
	end
	local race, fileString = GetNameForRace();
	fileString = strupper(fileString or "");
	local title = race;
	local subRaces = CharacterCreate.subRaces;
	local lore;
	if ( subRaces and subRaces[CharacterCreate.subRace] ) then
		local subRace = subRaces[CharacterCreate.subRace];
		title = subRace.title or subRace.name;
		lore = subRace.lore;	-- a sub-race's own backstory (the base sub-race uses the race's)
	end
	CharacterCreate.raceTitle = title;
	local racials = {};
	local index = 1;
	while ( _G["ABILITY_INFO_"..fileString..index] ) do
		tinsert(racials, _G["ABILITY_INFO_"..fileString..index]);
		index = index + 1;
	end
	CharCreateRaceLore.title:SetText(title);
	CharCreateRaceLore.text:SetText(lore or GetFlavorText("RACE_INFO_"..fileString, GetSelectedSex()) or "");
	CharCreateRaceLore.bullets:SetText(table.concat(racials, "\n"));
	CharCreateLayout_PlaceLore();
	CharCreate_UpdatePanelHeadings();
end

-- step 2's rows: an option shows when its stock button would (CharCreate_UpdateFaceLayerButtons, the hair
-- checks), with that button's label and "position / count"; shown rows stack from the top of their panel
-- whether an option row shows and its label. 1-9 follow their stock button (and its label); F-230:
-- 5 (facial hair) follows the client's mode for the race (hidden when the race's features are all split into
-- slots), and 11-16 are the race's feature slots from Zeppelin\CharCustomizations.txt (GetZepCustomizationSlot)
function CharCreateLayout_OptionLabel(id)
	if ( id >= 11 ) then
		local slotType = GetZepCustomizationSlot and GetZepCustomizationSlot(id - 11);
		if ( not slotType ) then
			return false;
		end
		return true, _G["ZEP_CUSTOMIZATION_TYPE_"..slotType] or "";
	end
	local source = _G["CharCreateCustomizationButton"..id];
	if ( id == 5 and GetZepFacialHairMode ) then
		local mode, labelType = GetZepFacialHairMode();
		if ( mode == "hidden" ) then
			return false;
		elseif ( mode and labelType and _G["ZEP_CUSTOMIZATION_TYPE_"..labelType] ) then
			return source:IsShown(), _G["ZEP_CUSTOMIZATION_TYPE_"..labelType];
		end
	end
	return source:IsShown(), source.text:GetText();
end

function CharCreateLayout_RefreshOptions()
	if ( not CharCreateLeftPanel ) then
		return;
	end
	for _, list in ipairs({ CHAR_CREATE_APPEARANCE_ROWS, CHAR_CREATE_DETAIL_ROWS }) do
		local y = CHAR_CREATE_ROWS_TOP;
		for _, id in ipairs(list) do
			local row = _G["CharCreateOptionRow"..id];
			local shown, label = CharCreateLayout_OptionLabel(id);
			local position, count;
			if ( shown and GetCharCustomizationInfo ) then
				position, count = GetCharCustomizationInfo(id);
				if ( id >= 11 and count and count <= 1 ) then
					shown = false;	-- a feature slot with a single choice has nothing to pick
				end
			end
			if ( shown ) then
				row.label:SetText(label);
				if ( count and count > 0 ) then
					row.value:SetText(position.." / "..count);
				else
					row.value:SetText("");
				end
				if ( row.y ~= y ) then
					row:ClearAllPoints();
					row:SetPoint("TOPLEFT", row:GetParent(), "TOPLEFT", 18, y);
					row:SetPoint("TOPRIGHT", row:GetParent(), "TOPRIGHT", -18, y);
					row.y = y;
				end
				row:Show();
				y = y - CHAR_CREATE_ROW_HEIGHT;
			else
				row:Hide();
			end
		end
	end
end

function CharCreate_UpdatePanelHeadings()
	if ( not CharCreateLeftPanel ) then
		return;
	end
	if ( CharacterCreate.step == 2 ) then
		local sex = (GetSelectedSex() == SEX_MALE) and "male" or "female";
		CharCreateLeftPanel.title:SetText("APPEARANCE");
		CharCreateLeftPanel.subtitle:SetText((CharacterCreate.raceTitle or "")..", "..sex);
		CharCreateRightPanel.title:SetText("DETAILS");
		CharCreateRightPanel.subtitle:SetText("Features and markings");
	else
		CharCreateLeftPanel.title:SetText(strupper(ALLIANCE));
		CharCreateLeftPanel.subtitle:SetText((CharCreateLeftPanel.raceCount or 0).." races");
		CharCreateRightPanel.title:SetText(strupper(HORDE));
		CharCreateRightPanel.subtitle:SetText((CharCreateRightPanel.raceCount or 0).." races");
	end
end

-- 1 = Race (races, sub-races, lore, gender, class; dressed in CharStartOutfit's display column, the tier look),
-- 2 = Appearance (option rows, name, Hide Armor; dressed in the items the character really starts with)
function CharCreate_SetStep(step)
	CharacterCreate.step = step;
	local race = (step == 1);
	local function Shown(frame, shown)
		if ( shown ) then
			frame:Show();
		else
			frame:Hide();
		end
	end
	Shown(CharCreateRaceFrame, race);
	Shown(CharCreateRaceLore, race);
	Shown(CharCreateClassLore, race);
	Shown(CharCreateClassFrame, race);	-- CharCreateLayout_ShowPicked hides these again until a race is picked
	Shown(CharCreateClassName, race);
	Shown(CharCreateMaleButton, race);
	Shown(CharCreateFemaleButton, race);
	Shown(CharCreateLeftPanel.rows, not race);
	Shown(CharCreateRightPanel.rows, not race);
	Shown(CharacterCreateNameEdit, not race);
	Shown(CharacterCreateRandomName, not race);
	CharCreateCustomizationFrame:Hide();
	CharCreateStep1.text:SetFontObject(race and GlueFontNormal or GlueFontDisable);
	CharCreateStep2.text:SetFontObject(race and GlueFontDisable or GlueFontNormal);
	CharCreateOkayButton:SetText(race and CHAR_CREATE_CUSTOMIZE or FINISH);
	if ( SetCharacterCreateStartOutfit ) then	-- a source-client API (F-151)
		SetCharacterCreateStartOutfit(not race);
	end
	if ( race ) then
		CharacterCreate_ShowOutfit(true);	-- the Race step always shows the outfit, without the toggle
	end
	Shown(CharCreateOutfitButton, not race and SetCharacterCreateOutfitShown ~= nil);
	if ( race ) then
		CharacterCreateNameEdit:ClearFocus();
		CharCreateLayout_RefreshClass();
	else
		CharacterCreateNameEdit:SetFocus();
		CharCreateLayout_RefreshOptions();
	end
	CharCreate_UpdatePanelHeadings();
	CharCreateLayout_ShowPicked();
end
