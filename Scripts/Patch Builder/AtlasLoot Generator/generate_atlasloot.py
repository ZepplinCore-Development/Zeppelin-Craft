#!/usr/bin/env python3
"""
AtlasLoot Generator - Main Script
Generates AtlasLoot Lua tables from live AzerothCore database

Usage:
    python3 generate_atlasloot.py --dungeon stockades
    python3 generate_atlasloot.py --dungeon all
    python3 generate_atlasloot.py --section TheStockade
"""

import argparse
import sys
import os

# Import our modules
from lua_parser import AtlasLootParser
from loot_query import LootDatabase
from lua_generator import LuaGenerator


# Dungeon section name mappings
# Organized by level tier for easy reference
DUNGEON_SECTIONS = {
    # Low Level Dungeons (10-25)
    'ragefire': 'RagefireChasm',
    'wailing1': 'WailingCaverns1',
    'wailing2': 'WailingCaverns2',
    'deadmines1': 'TheDeadmines1',
    'deadmines2': 'TheDeadmines2',
    'shadowfang1': 'ShadowfangKeep1',
    'shadowfang2': 'ShadowfangKeep2',
    'blackfathom1': 'BlackfathomDeeps1',
    'blackfathom2': 'BlackfathomDeeps2',
    'stockades': 'TheStockade',

    # Mid Level Dungeons (25-50)
    'gnomeregan1': 'Gnomeregan1',
    'gnomeregan2': 'Gnomeregan2',
    'rfk1': 'RazorfenKraul1',
    'rfk2': 'RazorfenKraul2',
    'sm_graveyard': 'SMGraveyard',
    'sm_library': 'SMLibrary',
    'sm_armory': 'SMHerod',
    'sm_cathedral': 'SMCathedral',
    'rfd1': 'RazorfenDowns1',
    'rfd2': 'RazorfenDowns2',
    'maraudon1': 'Maraudon1',
    'maraudon2': 'Maraudon2',

    # High Level Dungeons (50-60)
    # Sunken Temple
    'st_atalalarion': 'STAtalalarion',
    'st_dreamscythe': 'STDreamscythe',
    'st_weaver': 'STWeaver',
    'st_hazzas': 'STHazzas',
    'st_morphaz': 'STMorphaz',
    'st_jammalan': 'STJammalan',
    'st_ogom': 'STOgom',
    'st_spawn': 'STSpawnOfHakkar',
    'st_avatar': 'STAvatarofHakkar',
    'st_eranikus': 'STEranikus',
    'st_trolls': 'STTrollMinibosses',

    # Blackrock Depths (many bosses)
    'brd_roccor': 'BRDLordRoccor',
    'brd_pyron': 'BRDPyron',
    'brd_gerstahn': 'BRDHighInterrogatorGerstahn',
    'brd_arena': 'BRDArena',
    'brd_theldren': 'BRDTheldren',
    'brd_houndmaster': 'BRDHoundmaster',
    'brd_loregrain': 'BRDPyromantLoregrain',
    'brd_incendius': 'BRDLordIncendius',
    'brd_baelgar': 'BRDBaelGar',
    'brd_angerforge': 'BRDGeneralAngerforge',
    'brd_golem': 'BRDGolemLordArgelmach',
    'brd_guzzler': 'BRDGuzzler',
    'brd_flamelash': 'BRDFlamelash',
    'brd_panzor': 'BRDPanzor',
    'brd_tomb': 'BRDTomb',
    'brd_magmus': 'BRDMagmus',
    'brd_princess': 'BRDPrincess',
    'brd_emperor': 'BRDImperatorDagranThaurissan',
    'brd_vault': 'BRDTheVault',
    'brd_warder': 'BRDWarderStilgiss',
    'brd_verek': 'BRDVerek',
    'brd_fineous': 'BRDFineousDarkvire',
    'brd_lyceum': 'BRDLyceum',
    'brd_forgewright': 'BRDForgewright',

    # Lower Blackrock Spire
    'lbrs_omokk': 'LBRSOmokk',
    'lbrs_slavener': 'LBRSSlavener',
    'lbrs_vosh': 'LBRSVosh',
    'lbrs_grayhoof': 'LBRSGrayhoof',
    'lbrs_felguard': 'LBRSFelguard',
    'lbrs_smolderweb': 'LBRSSmolderweb',
    'lbrs_crystalfang': 'LBRSCrystalFang',
    'lbrs_doomhowl': 'LBRSDoomhowl',
    'lbrs_grimaxe': 'LBRSGrimaxe',
    'lbrs_spirestone_butcher': 'LBRSSpirestoneButcher',
    'lbrs_spirestone_lord': 'LBRSSpirestoneLord',
    'lbrs_halycon': 'LBRSHalycon',
    'lbrs_voone': 'LBRSVoone',
    'lbrs_wyrmthalak': 'LBRSWyrmthalak',
    'lbrs_zigris': 'LBRSZigris',
    'lbrs_bashguud': 'LBRSBashguud',
    'lbrs_lordmagus': 'LBRSLordMagus',

    # Upper Blackrock Spire
    'ubrs_emberseer': 'UBRSEmberseer',
    'ubrs_runewatcher': 'UBRSRunewatcher',
    'ubrs_solakar': 'UBRSSolakar',
    'ubrs_anvilcrack': 'UBRSAnvilcrack',
    'ubrs_gyth': 'UBRSGyth',
    'ubrs_rend': 'UBRSRend',
    'ubrs_beast': 'UBRSBeast',
    'ubrs_drakkisath': 'UBRSDrakkisath',
    'ubrs_valthalak': 'UBRSValthalak',

    # Dire Maul East
    'dme_pusillin': 'DMEPusillin',
    'dme_zevrim': 'DMEZevrimThornhoof',
    'dme_hydro': 'DMEHydro',
    'dme_lethtendris': 'DMELethtendris',
    'dme_pimgib': 'DMEPimgib',
    'dme_alzzin': 'DMEAlzzin',
    'dme_isalien': 'DMEIsalien',

    # Dire Maul North
    'dmn_fengus': 'DMNGuardFengus',
    'dmn_slipkik': 'DMNGuardSlipkik',
    'dmn_kromcrush': 'DMNCaptainKromcrush',
    'dmn_moldar': 'DMNGuardMoldar',
    'dmn_kreeg': 'DMNStomperKreeg',
    'dmn_chorush': 'DMNChoRush',
    'dmn_gordok': 'DMNKingGordok',
    'dmn_thimblejack': 'DMNThimblejack',

    # Dire Maul West
    'dmw_tendris': 'DMWTendrisWarpwood',
    'dmw_illyanna': 'DMWIllyannaRavenoak',
    'dmw_magister': 'DMWMagisterKalendris',
    'dmw_immolthar': 'DMWImmolthar',
    'dmw_prince': 'DMWPrinceTortheldrin',
    'dmw_helnurath': 'DMWHelnurath',
    'dmw_tsuzee': 'DMWTsuzee',

    # Stratholme
    'strat_courier': 'STRATStratholmeCourier',
    'strat_fras': 'STRATFrasSiabi',
    'strat_hearthsinger': 'STRATHearthsingerForresten',
    'strat_unforgiven': 'STRATTheUnforgiven',
    'strat_timmy': 'STRATTimmytheCruel',
    'strat_malor': 'STRATMalorsStrongbox',
    'strat_magistrate': 'STRATMagistrateBarthilas',
    'strat_ramstein': 'STRATRamsteintheGorger',
    'strat_baron': 'STRATBaronRivendare',
    'strat_nerubenkan': 'STRATNerubenkan',
    'strat_maleki': 'STRATMalekithePallid',
    'strat_baroness': 'STRATBaronessAnastari',
    'strat_cannon': 'STRATCannonMasterWilley',
    'strat_archivist': 'STRATArchivistGalford',
    'strat_balnazzar': 'STRATBalnazzar',
    'strat_stonespine': 'STRATStonespine',
    'strat_sothos': 'STRATSothosJarien',

    # ===== RAIDS (Multi-Boss) =====
    # Multi-boss encounter sections use BabbleBoss format

    # Zul'Gurub (ZG) - 20-man raid
    'zg_edge_of_madness': 'ZGEdgeofMadness',  # Multi-boss rotating encounter (Gri'lek, Hazza'rah, Renataki, Wushoolay)
}

# ===== SINGLE-BOSS SECTIONS =====
# Maps section name -> creature ID (no BabbleBoss parsing needed)
# These sections list items directly without boss headers

SINGLE_BOSS_SECTIONS = {
    # ===== Blackwing Lair (BWL) =====
    'BWLRazorgore': 12435,      # Razorgore the Untamed
    'BWLVaelastrasz': 13020,    # Vaelastrasz the Corrupt
    'BWLLashlayer': 12017,      # Broodlord Lashlayer
    'BWLFiremaw': 11983,        # Firemaw
    'BWLEbonroc': 14601,        # Ebonroc
    'BWLFlamegor': 11981,       # Flamegor
    'BWLChromaggus': 14020,     # Chromaggus
    'BWLNefarian1': 11583,      # Nefarian (page 1)
    'BWLNefarian2': 11583,      # Nefarian (page 2 - same boss, different loot display)

    # ===== Molten Core (MC) =====
    'MCLucifron': 12118,        # Lucifron
    'MCMagmadar': 11982,        # Magmadar
    'MCGehennas': 12259,        # Gehennas
    'MCGarr': 12057,            # Garr
    'MCShazzrah': 12264,        # Shazzrah
    'MCGeddon': 12056,          # Baron Geddon
    'MCGolemagg': 11988,        # Golemagg the Incinerator
    'MCSulfuron': 12098,        # Sulfuron Harbinger
    'MCMajordomo': 12018,       # Majordomo Executus
    'MCRagnaros': 11502,        # Ragnaros

    # ===== Zul'Gurub (ZG) =====
    'ZGJeklik': 14517,          # High Priestess Jeklik
    'ZGVenoxis': 14507,         # High Priest Venoxis
    'ZGMarli': 14510,           # High Priestess Mar'li
    'ZGMandokir': 11382,        # Bloodlord Mandokir
    'ZGThekal': 14509,          # High Priest Thekal
    'ZGArlokk': 14515,          # High Priestess Arlokk
    'ZGHakkar': 14834,          # Hakkar
    'ZGJindo': 11380,           # Jin'do the Hexxer
    'ZGGahzranka': 15114,       # Gahz'ranka

    # ===== Ruins of Ahn'Qiraj (AQ20) =====
    'AQ20Kurinnaxx': 15348,     # Kurinnaxx
    'AQ20Rajaxx': 15341,        # General Rajaxx
    'AQ20Moam': 15340,          # Moam
    'AQ20Buru': 15370,          # Buru the Gorger
    'AQ20Ayamiss': 15369,       # Ayamiss the Hunter
    'AQ20Ossirian': 15339,      # Ossirian the Unscarred

    # ===== Temple of Ahn'Qiraj (AQ40) =====
    'AQ40Skeram': 15263,        # The Prophet Skeram
    'AQ40Vem': 15543,           # Princess Yauj (Bug Trio - Vem section)
    'AQ40Sartura': 15516,       # Battleguard Sartura
    'AQ40Fankriss': 15510,      # Fankriss the Unyielding
    'AQ40Viscidus': 15299,      # Viscidus
    'AQ40Huhuran': 15509,       # Princess Huhuran
    'AQ40Emperors': 15276,      # Emperor Vek'lor (Twin Emperors)
    'AQ40Ouro': 15517,          # Ouro
    'AQ40CThun': 15727,         # C'Thun
}

# ===== TBC SINGLE-BOSS SECTIONS =====
# Maps section name -> creature ID for Burning Crusade content
# File: burningcrusade.lua

TBC_SINGLE_BOSS_SECTIONS = {
    # ===== Hellfire Citadel: Ramparts =====
    'HCRampWatchkeeper': 17306,     # Watchkeeper Gargolmar
    'HCRampWatchkeeperHEROIC': 17306,
    'HCRampOmor': 17308,            # Omor the Unscarred
    'HCRampOmorHEROIC': 17308,
    'HCRampVazruden': 17537,        # Vazruden (Nazan: 17536)
    'HCRampVazrudenHEROIC': 17537,

    # ===== Hellfire Citadel: Blood Furnace =====
    'HCFurnaceMaker': 17381,        # The Maker
    'HCFurnaceMakerHEROIC': 17381,
    'HCFurnaceBroggok': 17380,      # Broggok
    'HCFurnaceBroggokHEROIC': 17380,
    'HCFurnaceBreaker': 17377,      # Keli'dan the Breaker
    'HCFurnaceBreakerHEROIC': 17377,

    # ===== Hellfire Citadel: Shattered Halls =====
    'HCHallsNethekurse': 16807,     # Grand Warlock Nethekurse
    'HCHallsNethekurseHEROIC': 16807,
    'HCHallsPorung': 20923,         # Blood Guard Porung (Heroic only)
    'HCHallsOmrogg': 16809,         # Warbringer O'mrogg
    'HCHallsOmroggHEROIC': 16809,
    'HCHallsKargath': 16808,        # Warchief Kargath Bladefist
    'HCHallsKargathHEROIC': 16808,

    # ===== Coilfang Reservoir: Slave Pens =====
    'CFRSlaveMennu': 17941,         # Mennu the Betrayer
    'CFRSlaveMennuHEROIC': 17941,
    'CFRSlaveRokmar': 17991,        # Rokmar the Crackler
    'CFRSlaveRokmarHEROIC': 17991,
    'CFRSlaveQuagmirran': 17942,    # Quagmirran
    'CFRSlaveQuagmirranHEROIC': 17942,

    # ===== Coilfang Reservoir: Underbog =====
    'CFRUnderHungarfen': 17770,     # Hungarfen
    'CFRUnderHungarfenHEROIC': 17770,
    'CFRUnderGhazan': 18105,        # Ghaz'an
    'CFRUnderGhazanHEROIC': 18105,
    'CFRUnderSwamplord': 17826,     # Swamplord Musel'ek
    'CFRUnderSwamplordHEROIC': 17826,
    'CFRUnderStalker': 17882,       # The Black Stalker
    'CFRUnderStalkerHEROIC': 17882,

    # ===== Coilfang Reservoir: Steamvault =====
    'CFRSteamThespia': 17797,       # Hydromancer Thespia
    'CFRSteamThespiaHEROIC': 17797,
    'CFRSteamSteamrigger': 17796,   # Mekgineer Steamrigger
    'CFRSteamSteamriggerHEROIC': 17796,
    'CFRSteamWarlord': 17798,       # Warlord Kalithresh
    'CFRSteamWarlordHEROIC': 17798,

    # ===== Auchindoun: Mana-Tombs =====
    'AuchManaPandemonius': 18341,   # Pandemonius
    'AuchManaPandemoniusHEROIC': 18341,
    'AuchManaTavarok': 18343,       # Tavarok
    'AuchManaTavarokHEROIC': 18343,
    'AuchManaNexusPrince': 18344,   # Nexus-Prince Shaffar
    'AuchManaNexusPrinceHEROIC': 18344,
    'AuchManaYor': 22930,           # Yor (Heroic only)

    # ===== Auchindoun: Auchenai Crypts =====
    'AuchCryptsShirrak': 18371,     # Shirrak the Dead Watcher
    'AuchCryptsShirrakHEROIC': 18371,
    'AuchCryptsExarch': 18373,      # Exarch Maladaar
    'AuchCryptsExarchHEROIC': 18373,
    'AuchCryptsAvatar': 18478,      # Avatar of the Martyred (Heroic only)

    # ===== Auchindoun: Sethekk Halls =====
    'AuchSethekkDarkweaver': 18472, # Darkweaver Syth
    'AuchSethekkDarkweaverHEROIC': 18472,
    'AuchSethekkRavenGod': 23035,   # Anzu (Heroic only)
    'AuchSethekkTalonKing': 18473,  # Talon King Ikiss
    'AuchSethekkTalonKingHEROIC': 18473,

    # ===== Auchindoun: Shadow Labyrinth =====
    'AuchShadowHellmaw': 18731,     # Ambassador Hellmaw
    'AuchShadowHellmawHEROIC': 18731,
    'AuchShadowBlackheart': 18667,  # Blackheart the Inciter
    'AuchShadowBlackheartHEROIC': 18667,
    'AuchShadowGrandmaster': 18732, # Grandmaster Vorpil
    'AuchShadowGrandmasterHEROIC': 18732,
    'AuchShadowMurmur': 18708,      # Murmur
    'AuchShadowMurmurHEROIC': 18708,

    # ===== Caverns of Time: Old Hillsbrad =====
    'CoTHillsbradDrake': 17848,     # Lieutenant Drake
    'CoTHillsbradDrakeHEROIC': 17848,
    'CoTHillsbradSkarloc': 17862,   # Captain Skarloc
    'CoTHillsbradSkarlocHEROIC': 17862,
    'CoTHillsbradHunter': 18096,    # Epoch Hunter
    'CoTHillsbradHunterHEROIC': 18096,

    # ===== Caverns of Time: Black Morass =====
    'CoTMorassDeja': 17879,         # Chrono Lord Deja
    'CoTMorassDejaHEROIC': 17879,
    'CoTMorassTemporus': 17880,     # Temporus
    'CoTMorassTemporusHEROIC': 17880,
    'CoTMorassAeonus': 17881,       # Aeonus
    'CoTMorassAeonusHEROIC': 17881,

    # ===== Tempest Keep: Mechanar =====
    'TKMechCapacitus': 19219,       # Mechano-Lord Capacitus
    'TKMechCapacitusHEROIC': 19219,
    'TKMechSepethrea': 19221,       # Nethermancer Sepethrea
    'TKMechSepethreaHEROIC': 19221,
    'TKMechCalc': 19220,            # Pathaleon the Calculator
    'TKMechCalcHEROIC': 19220,

    # ===== Tempest Keep: Botanica =====
    'TKBotSarannis': 17976,         # Commander Sarannis
    'TKBotSarannisHEROIC': 17976,
    'TKBotFreywinn': 17975,         # High Botanist Freywinn
    'TKBotFreywinnHEROIC': 17975,
    'TKBotThorngrin': 17978,        # Thorngrin the Tender
    'TKBotThorngrinHEROIC': 17978,
    'TKBotLaj': 17980,              # Laj
    'TKBotLajHEROIC': 17980,
    'TKBotSplinter': 17977,         # Warp Splinter
    'TKBotSplinterHEROIC': 17977,

    # ===== Tempest Keep: Arcatraz =====
    'TKArcUnbound': 20870,          # Zereketh the Unbound
    'TKArcUnboundHEROIC': 20870,
    'TKArcScryer': 20886,           # Wrath-Scryer Soccothrates
    'TKArcScryerHEROIC': 20886,
    'TKArcDalliah': 20885,          # Dalliah the Doomsayer
    'TKArcDalliahHEROIC': 20885,
    'TKArcHarbinger': 20912,        # Harbinger Skyriss
    'TKArcHarbingerHEROIC': 20912,

    # ===== Magister's Terrace =====
    'SMTFireheart': 24723,          # Selin Fireheart
    'SMTFireheartHEROIC': 24723,
    'SMTVexallus': 24744,           # Vexallus
    'SMTVexallusHEROIC': 24744,
    'SMTDelrissa': 24560,           # Priestess Delrissa
    'SMTDelrissaHEROIC': 24560,
    'SMTKaelthas': 24664,           # Kael'thas Sunstrider (5-man)
    'SMTKaelthasHEROIC': 24664,

    # ===== Karazhan (10-man Raid) =====
    'KaraAttumen': 16152,           # Attumen the Huntsman (mounted phase has loot)
    'KaraMoroes': 15687,            # Moroes
    'KaraMaiden': 16457,            # Maiden of Virtue
    'KaraCurator': 15691,           # The Curator
    'KaraIllhoof': 15688,           # Terestian Illhoof
    'KaraAran': 16524,              # Shade of Aran
    'KaraNetherspite': 15689,       # Netherspite
    'KaraNightbane': 17225,         # Nightbane
    'KaraPrince': 15690,            # Prince Malchezaar
    'KaraChess': 0,                 # Chess Event (no creature loot)

    # ===== Gruul's Lair =====
    'GruulsLairHighKingMaulgar': 18831,  # High King Maulgar
    'GruulGruul': 19044,            # Gruul the Dragonkiller

    # ===== Magtheridon's Lair =====
    'HCMagtheridon': 17257,         # Magtheridon

    # ===== Serpentshrine Cavern (SSC) =====
    'CFRSerpentHydross': 21216,     # Hydross the Unstable
    'CFRSerpentLurker': 21217,      # The Lurker Below
    'CFRSerpentLeotheras': 21215,   # Leotheras the Blind
    'CFRSerpentKarathress': 21214,  # Fathom-Lord Karathress
    'CFRSerpentMorogrim': 21213,    # Morogrim Tidewalker
    'CFRSerpentVashj': 21212,       # Lady Vashj

    # ===== Tempest Keep: The Eye =====
    'TKEyeAlar': 19514,             # Al'ar
    'TKEyeVoidReaver': 19516,       # Void Reaver
    'TKEyeSolarian': 18805,         # High Astromancer Solarian
    'TKEyeKaelthas': 19622,         # Kael'thas Sunstrider

    # ===== Battle for Mount Hyjal =====
    'MountHyjalWinterchill': 17767, # Rage Winterchill
    'MountHyjalAnetheron': 17808,   # Anetheron
    'MountHyjalKazrogal': 17888,    # Kaz'rogal
    'MountHyjalAzgalor': 17842,     # Azgalor
    'MountHyjalArchimonde': 17968,  # Archimonde

    # ===== Black Temple =====
    'BTNajentus': 22887,            # High Warlord Naj'entus
    'BTSupremus': 22898,            # Supremus
    'BTAkama': 22841,               # Shade of Akama
    'BTGorefiend': 22871,           # Teron Gorefiend
    'BTBloodboil': 22948,           # Gurtogg Bloodboil
    'BTEssencofSouls': 23420,       # Essence of Anger (Reliquary of Souls)
    'BTShahraz': 22947,             # Mother Shahraz
    'BTCouncil': 22950,             # Illidari Council (High Nethermancer Zerevor)
    'BTIllidanStormrage': 22917,    # Illidan Stormrage

    # ===== Sunwell Plateau =====
    'SPKalecgos': 24844,            # Kalecgos
    'SPBrutallus': 24882,           # Brutallus
    'SPFelmyst': 25038,             # Felmyst
    'SPEredarTwins': 25165,         # Lady Sacrolash (Eredar Twins)
    'SPMuru': 17544,                # M'uru
    'SPKiljaeden': 25315,           # Kil'jaeden

    # ===== Zul'Aman =====
    'ZANalorakk': 23576,            # Nalorakk
    'ZAAkilZon': 23574,             # Akil'zon
    'ZAJanAlai': 23578,             # Jan'alai
    'ZAHalazzi': 23577,             # Halazzi
    'ZAMalacrass': 24239,           # Hex Lord Malacrass
    'ZAZuljin': 23863,              # Zul'jin
}


def generate_single_boss_section(lua_file_path: str, section_name: str,
                                  creature_id: int, db: LootDatabase,
                                  dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update a single-boss AtlasLoot section.

    Used for raid bosses that have their own dedicated sections
    (e.g., BWLFiremaw, MCRagnaros) without BabbleBoss headers.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "BWLFiremaw")
        creature_id: Creature entry ID from database
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing single-boss section: {section_name}")
    print(f"{'='*60}")

    # For HEROIC sections, look up the heroic creature ID (difficulty_entry_1)
    if section_name.endswith('HEROIC'):
        heroic_id = db.get_heroic_creature_id(creature_id)
        if heroic_id:
            print(f"✓ Heroic section detected: using heroic creature ID {heroic_id} (was {creature_id})")
            creature_id = heroic_id
        else:
            print(f"⚠ Warning: No heroic creature ID found for {creature_id}, using normal loot")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/4] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    # Verify section exists, or create it for HEROIC sections
    bounds = parser.find_section_bounds(section_name)
    section_created = False
    if not bounds:
        # For HEROIC sections, try to create the section after the normal version
        if section_name.endswith('HEROIC'):
            normal_section = section_name[:-6]  # Remove 'HEROIC' suffix
            if parser.section_exists(normal_section):
                print(f"✓ Creating new HEROIC section based on '{normal_section}'")
                # Insert placeholder that will be replaced
                parser.insert_section_after(normal_section, section_name,
                    '    { 1, 0, "INV_Box_01", "=q6=Placeholder", "" };\n')
                section_created = True
                bounds = parser.find_section_bounds(section_name)

        if not bounds:
            print(f"✗ Section '{section_name}' not found in Lua file")
            return False

    if not section_created:
        print(f"✓ Found section '{section_name}' at lines {bounds[0]}-{bounds[1]}")

    # Step 2: Get boss name for display
    boss_name = db.get_boss_name(creature_id)
    if boss_name:
        print(f"✓ Boss: {boss_name} (ID: {creature_id})")
    else:
        print(f"✓ Creature ID: {creature_id}")

    # Step 3: Query loot for this boss
    if verbose:
        print("\n[2/4] Querying loot table...")
    loot_items = db.get_boss_loot(creature_id)

    if not loot_items:
        print(f"⚠ No loot items found for creature {creature_id}")
        return False

    print(f"✓ Found {len(loot_items)} loot items")

    if verbose:
        for item in loot_items[:5]:
            print(f"  - {item['item_name']} ({item['item_id']})")
        if len(loot_items) > 5:
            print(f"  ... and {len(loot_items) - 5} more items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[3/4] Generating Lua code...")
    generator = LuaGenerator(section_name)
    new_lua_code = generator.generate_single_boss_section(loot_items)

    if verbose:
        print(f"✓ Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

    # Show preview
    print("\nGenerated code preview:")
    preview_lines = new_lua_code.split('\n')[:10]
    for line in preview_lines:
        print(line)
    if len(new_lua_code.split('\n')) > 10:
        print(f"... ({len(new_lua_code.split(chr(10))) - 10} more lines)")

    # Step 5: Update file
    if dry_run:
        print("\n[DRY RUN] Skipping file update")
        return True

    if verbose:
        print("\n[4/4] Updating Lua file...")

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        print(f"✗ Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=True)
    if save_success:
        print(f"\n✓ Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n✗ Failed to save file")
        return False


def generate_section(lua_file_path: str, section_name: str, db: LootDatabase,
                    dry_run: bool = False, verbose: bool = False) -> bool:
    """
    Generate and update a single AtlasLoot section.

    Args:
        lua_file_path: Path to AtlasLoot Lua file
        section_name: Section name (e.g., "TheStockade")
        db: Database connection object
        dry_run: If True, don't save changes
        verbose: If True, print detailed output

    Returns:
        True if successful, False otherwise
    """
    print(f"\n{'='*60}")
    print(f"Processing section: {section_name}")
    print(f"{'='*60}")

    # Step 1: Parse Lua file
    if verbose:
        print("\n[1/5] Parsing Lua file...")
    parser = AtlasLootParser(lua_file_path)

    # Extract boss names from existing section
    boss_names = parser.extract_boss_names(section_name)
    if not boss_names:
        print(f"✗ No bosses found in section '{section_name}'")
        return False

    print(f"✓ Found {len(boss_names)} bosses: {', '.join(boss_names)}")

    # Step 2: Query database for creature IDs
    if verbose:
        print("\n[2/5] Looking up creature IDs...")
    creature_id_map = {}
    for boss_name in boss_names:
        creature_id = db.get_creature_id(boss_name)
        if creature_id:
            creature_id_map[boss_name] = creature_id
            if verbose:
                print(f"  {boss_name} → ID {creature_id}")
        else:
            print(f"⚠ Warning: Boss '{boss_name}' not found in database")

    if not creature_id_map:
        print("✗ No valid creature IDs found")
        return False

    # Step 3: Query loot for all bosses
    if verbose:
        print("\n[3/5] Querying loot tables...")
    creature_ids = list(creature_id_map.values())
    loot_by_creature_id = db.get_all_bosses_loot(creature_ids)

    total_items = sum(len(items) for items in loot_by_creature_id.values())
    print(f"✓ Found {total_items} total loot items")

    if verbose:
        for boss_name, creature_id in creature_id_map.items():
            loot_count = len(loot_by_creature_id.get(creature_id, []))
            print(f"  {boss_name}: {loot_count} items")

    # Step 4: Generate new Lua code
    if verbose:
        print("\n[4/5] Generating Lua code...")
    generator = LuaGenerator(section_name)
    new_lua_code = generator.generate_from_database_results(
        boss_names, loot_by_creature_id, creature_id_map
    )

    if verbose:
        print(f"✓ Generated {len(new_lua_code.split(chr(10)))} lines of Lua code")

    # Show preview
    print("\nGenerated code preview:")
    preview_lines = new_lua_code.split('\n')[:10]
    for line in preview_lines:
        print(line)
    if len(new_lua_code.split('\n')) > 10:
        print(f"... ({len(new_lua_code.split(chr(10))) - 10} more lines)")

    # Step 5: Update file
    if dry_run:
        print("\n[DRY RUN] Skipping file update")
        return True

    if verbose:
        print("\n[5/5] Updating Lua file...")

    success = parser.replace_section(section_name, new_lua_code)
    if not success:
        print(f"✗ Failed to replace section '{section_name}'")
        return False

    # Save file with backup
    save_success = parser.save_file(backup=True)
    if save_success:
        print(f"\n✓ Section '{section_name}' updated successfully")
        return True
    else:
        print(f"\n✗ Failed to save file")
        return False


def main():
    """Main entry point for the script."""
    parser = argparse.ArgumentParser(
        description='Generate AtlasLoot tables from AzerothCore database'
    )
    parser.add_argument(
        '--all',
        action='store_true',
        help='Generate ALL AtlasLoot content (vanilla dungeons, vanilla raids, TBC)'
    )
    parser.add_argument(
        '--dungeon',
        help='Dungeon name (stockades, deadmines, etc.) - multi-boss sections',
        choices=list(DUNGEON_SECTIONS.keys()) + ['all']
    )
    parser.add_argument(
        '--raid',
        help='Vanilla raid boss section (BWLFiremaw, MCRagnaros, etc.) - single-boss sections',
        choices=list(SINGLE_BOSS_SECTIONS.keys()) + ['all', 'bwl', 'mc', 'zg', 'aq20', 'aq40']
    )
    parser.add_argument(
        '--tbc',
        help='TBC dungeon/raid section - use "all" for everything, or filter by instance prefix',
        choices=list(TBC_SINGLE_BOSS_SECTIONS.keys()) + [
            'all',
            # Dungeons
            'ramparts', 'furnace', 'halls', 'slavepens', 'underbog', 'steamvault',
            'manatomb', 'crypts', 'sethekk', 'shadowlab', 'hillsbrad', 'morass',
            'mechanar', 'botanica', 'arcatraz', 'mgt',
            # Raids
            'kara', 'gruul', 'magtheridon', 'ssc', 'tk', 'hyjal', 'bt', 'sunwell', 'za'
        ]
    )
    parser.add_argument(
        '--section',
        help='Specific AtlasLoot section name (auto-detects single vs multi-boss)'
    )
    parser.add_argument(
        '--lua-file',
        default='/workspace/project/Zeppelin-Craft/MPQ Staging/Patch-Z/Interface/AddOns/AtlasLoot_OriginalWoW/originalwow.lua',
        help='Path to AtlasLoot Lua file'
    )
    parser.add_argument(
        '--dry-run',
        action='store_true',
        help='Preview changes without modifying files'
    )
    parser.add_argument(
        '--verbose', '-v',
        action='store_true',
        help='Print detailed output'
    )

    args = parser.parse_args()

    # Validate arguments
    if not args.all and not args.dungeon and not args.raid and not args.tbc and not args.section:
        parser.error('Must specify --all, --dungeon, --raid, --tbc, or --section')

    # --all flag sets all content types
    if args.all:
        args.dungeon = 'all'
        args.raid = 'all'
        args.tbc = 'all'

    # Check if Lua file exists
    if not os.path.exists(args.lua_file):
        print(f"✗ Error: Lua file not found: {args.lua_file}")
        return 1

    # Connect to database
    print("Connecting to database...")
    db = LootDatabase()
    if not db.connect():
        print("✗ Failed to connect to database")
        return 1
    print("✓ Database connected")

    success_count = 0
    total_count = 0

    # Handle --raid option (single-boss sections)
    if args.raid:
        single_boss_to_process = {}

        if args.raid == 'all':
            single_boss_to_process = SINGLE_BOSS_SECTIONS.copy()
        elif args.raid == 'bwl':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('BWL')}
        elif args.raid == 'mc':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('MC')}
        elif args.raid == 'zg':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('ZG')}
        elif args.raid == 'aq20':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ20')}
        elif args.raid == 'aq40':
            single_boss_to_process = {k: v for k, v in SINGLE_BOSS_SECTIONS.items() if k.startswith('AQ40')}
        else:
            creature_id = SINGLE_BOSS_SECTIONS.get(args.raid)
            if creature_id:
                single_boss_to_process = {args.raid: creature_id}
            else:
                print(f"✗ Unknown raid section: {args.raid}")
                db.disconnect()
                return 1

        total_count += len(single_boss_to_process)
        for section_name, creature_id in single_boss_to_process.items():
            success = generate_single_boss_section(
                args.lua_file, section_name, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --tbc option (TBC single-boss sections)
    if args.tbc:
        # TBC content uses burningcrusade.lua
        tbc_lua_file = '/workspace/project/Zeppelin-Craft/MPQ Staging/Patch-Z/Interface/AddOns/AtlasLoot_BurningCrusade/burningcrusade.lua'

        if not os.path.exists(tbc_lua_file):
            print(f"✗ Error: TBC Lua file not found: {tbc_lua_file}")
            db.disconnect()
            return 1

        tbc_to_process = {}

        if args.tbc == 'all':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if v != 0}
        # Dungeons
        elif args.tbc == 'ramparts':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCRamp')}
        elif args.tbc == 'furnace':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCFurnace')}
        elif args.tbc == 'halls':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('HCHalls')}
        elif args.tbc == 'slavepens':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSlave')}
        elif args.tbc == 'underbog':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRUnder')}
        elif args.tbc == 'steamvault':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSteam')}
        elif args.tbc == 'manatomb':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchMana')}
        elif args.tbc == 'crypts':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchCrypts')}
        elif args.tbc == 'sethekk':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchSethekk')}
        elif args.tbc == 'shadowlab':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('AuchShadow')}
        elif args.tbc == 'hillsbrad':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTHillsbrad')}
        elif args.tbc == 'morass':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CoTMorass')}
        elif args.tbc == 'mechanar':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKMech')}
        elif args.tbc == 'botanica':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKBot')}
        elif args.tbc == 'arcatraz':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKArc')}
        elif args.tbc == 'mgt':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SMT')}
        # Raids
        elif args.tbc == 'kara':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Kara') and v != 0}
        elif args.tbc == 'gruul':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('Gruul')}
        elif args.tbc == 'magtheridon':
            tbc_to_process = {'HCMagtheridon': TBC_SINGLE_BOSS_SECTIONS['HCMagtheridon']}
        elif args.tbc == 'ssc':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('CFRSerpent')}
        elif args.tbc == 'tk':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('TKEye')}
        elif args.tbc == 'hyjal':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('MountHyjal')}
        elif args.tbc == 'bt':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('BT')}
        elif args.tbc == 'sunwell':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('SP')}
        elif args.tbc == 'za':
            tbc_to_process = {k: v for k, v in TBC_SINGLE_BOSS_SECTIONS.items() if k.startswith('ZA')}
        else:
            # Specific section name
            creature_id = TBC_SINGLE_BOSS_SECTIONS.get(args.tbc)
            if creature_id is not None and creature_id != 0:
                tbc_to_process = {args.tbc: creature_id}
            elif creature_id == 0:
                print(f"⚠ Section '{args.tbc}' has no creature loot (creature_id=0), skipping")
            else:
                print(f"✗ Unknown TBC section: {args.tbc}")
                db.disconnect()
                return 1

        total_count += len(tbc_to_process)
        for section_name, creature_id in tbc_to_process.items():
            success = generate_single_boss_section(
                tbc_lua_file, section_name, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --dungeon option (multi-boss sections)
    if args.dungeon:
        sections_to_process = []
        if args.dungeon == 'all':
            sections_to_process = list(DUNGEON_SECTIONS.values())
        else:
            section_name = DUNGEON_SECTIONS.get(args.dungeon)
            if section_name:
                sections_to_process.append(section_name)
            else:
                print(f"✗ Unknown dungeon: {args.dungeon}")
                db.disconnect()
                return 1

        total_count += len(sections_to_process)
        for section_name in sections_to_process:
            success = generate_section(
                args.lua_file, section_name, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
            if success:
                success_count += 1

    # Handle --section option (auto-detect mode)
    if args.section:
        total_count += 1
        # Check if it's a known single-boss section (vanilla)
        if args.section in SINGLE_BOSS_SECTIONS:
            creature_id = SINGLE_BOSS_SECTIONS[args.section]
            success = generate_single_boss_section(
                args.lua_file, args.section, creature_id, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        # Check if it's a TBC section
        elif args.section in TBC_SINGLE_BOSS_SECTIONS:
            creature_id = TBC_SINGLE_BOSS_SECTIONS[args.section]
            if creature_id == 0:
                print(f"⚠ Section '{args.section}' has no creature loot (creature_id=0)")
                success = False
            else:
                tbc_lua_file = '/workspace/project/Zeppelin-Craft/MPQ Staging/Patch-Z/Interface/AddOns/AtlasLoot_BurningCrusade/burningcrusade.lua'
                success = generate_single_boss_section(
                    tbc_lua_file, args.section, creature_id, db,
                    dry_run=args.dry_run, verbose=args.verbose
                )
        else:
            # Try as multi-boss section
            success = generate_section(
                args.lua_file, args.section, db,
                dry_run=args.dry_run, verbose=args.verbose
            )
        if success:
            success_count += 1

    # Disconnect database
    db.disconnect()

    # Summary
    print(f"\n{'='*60}")
    print(f"Summary: {success_count}/{total_count} sections processed successfully")
    print(f"{'='*60}")

    return 0 if success_count == total_count else 1


if __name__ == "__main__":
    sys.exit(main())
