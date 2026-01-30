CORE CUSTOMIZATIONS PATCHES
============================

These patches contain all custom modifications to AzerothCore source files.
Created: 2026-01-30 during upstream merge preparation.

APPLYING PATCHES
----------------
From Zeppelin-Core directory:
    git apply ../Zeppelin-Craft/Patches/Core-Customizations/<patch_file>.patch

Or with 3-way merge for conflicts:
    git apply --3way ../Zeppelin-Craft/Patches/Core-Customizations/<patch_file>.patch


PATCH INVENTORY
---------------

F-001 Custom Profession Tools
  - F-001_spelltrigger5_spell_group_fix.patch  (PlayerStorage.cpp)
  - F-001_tools_item_subclass.patch            (ItemTemplate.h)

F-014 Mage Tanking
  - F-014_magical_attunement.patch             (Unit.cpp)
  - F-014_mana_shield_positive_effect.patch    (SpellInfo.cpp)
  - F-014_mage_spell_changes.patch             (spell_mage.cpp)

F-027 Dynamic Potion Spell Descriptions
  - F-027_alchemist_stone_proc_removal.patch   (Unit.cpp, spell_item.cpp)

F-030 Worgoblin Custom Races
  - F-030_worgoblin_races.patch                (Player.cpp, CharacterHandler.cpp, SharedDefines.h)

F-031 Universal Lockpicking
  - F-031_lockpicking_skill_rate_1.patch       (PlayerUpdates.cpp)
  - F-031_lockpicking_skill_rate_2.patch       (PlayerUpdates.cpp)
  - F-031_lockpicking_skill_rate_3.patch       (PlayerUpdates.cpp)
  - F-031_lockpicking_skill_rate_4.patch       (PlayerUpdates.cpp)
  - F-031_lockpicking_hook_rename.patch        (PlayerUpdates.cpp)

F-032 Profession Gathering from Creatures
  - F-032_engineering_gathering_xp.patch       (PlayerUpdates.cpp)

F-033 Rogue Combo Point Persistence
  - F-033_combo_point_persistence.patch        (Unit.cpp)

F-034 AQ40 Solo/Low-Player Scaling
  - F-034_cthun_player_scaling.patch           (boss_cthun.cpp)
  - F-034_cthun_tentacle_cap.patch             (boss_cthun.cpp)
  - F-034_ouro_mound_cap.patch                 (boss_ouro.cpp)
  - F-034_viscidus_adjustments.patch           (boss_viscidus.cpp)
  - F-034_twin_emperors_adjustments.patch      (boss_twinemperors.cpp)

F-035 Auchindoun Dungeon Tuning
  - F-035_maladaar_stolen_soul.patch           (boss_exarch_maladaar.cpp)
  - F-035_shaffar_beacon_frequency.patch       (boss_nexusprince_shaffar.cpp)
  - F-035_pandemonius_void_blast.patch         (boss_pandemonius.cpp)

F-036 Open Azeroth Zone Integration
  - F-036_ghostlands_zone_update.patch         (zone_ghostlands.cpp)

I-087 Disable Swimming Fatigue
  - I-087_disable_swimming_fatigue.patch       (Player.cpp)

I-088 Docker Container Timezone
  - I-088_docker_timezone.patch                (Dockerfile)


SUGGESTED APPLICATION ORDER
---------------------------
Apply in groups by feature to minimize conflicts:

1. Infrastructure (I-088)
2. Core mechanics (F-030, F-033, I-087)
3. Profession tools (F-001, F-031, F-032)
4. Class changes (F-014, F-027)
5. Boss scripts (F-034, F-035)
6. Zone scripts (F-036)


CONFLICT RESOLUTION
-------------------
If patches fail to apply cleanly due to upstream changes:
1. Apply with --3way flag to see conflicts
2. Manually resolve conflicts
3. Reference Joplin feature notes for intended behavior
4. Update patch file after resolution
