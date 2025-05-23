import re

### TO DO ###
# Allow multiple entries in the INSERT VALUES Method
# Stop Multiple deletes with there are lots of secondary queries...
# Stop inserting NULL for empty strings
# Handle comments inside a query...

# Example usage
query = """


INSERT INTO `mod_auctionhousebot` (`auctionhouse`, `name`, `minitems`, `maxitems`, `percentgreytradegoods`, `percentwhitetradegoods`, `percentgreentradegoods`, `percentbluetradegoods`, `percentpurpletradegoods`, `percentorangetradegoods`, `percentyellowtradegoods`, `percentgreyitems`, `percentwhiteitems`, `percentgreenitems`, `percentblueitems`, `percentpurpleitems`, `percentorangeitems`, `percentyellowitems`, `minpricegrey`, `maxpricegrey`, `minpricewhite`, `maxpricewhite`, `minpricegreen`, `maxpricegreen`, `minpriceblue`, `maxpriceblue`, `minpricepurple`, `maxpricepurple`, `minpriceorange`, `maxpriceorange`, `minpriceyellow`, `maxpriceyellow`, `minbidpricegrey`, `maxbidpricegrey`, `minbidpricewhite`, `maxbidpricewhite`, `minbidpricegreen`, `maxbidpricegreen`, `minbidpriceblue`, `maxbidpriceblue`, `minbidpricepurple`, `maxbidpricepurple`, `minbidpriceorange`, `maxbidpriceorange`, `minbidpriceyellow`, `maxbidpriceyellow`, `maxstackgrey`, `maxstackwhite`, `maxstackgreen`, `maxstackblue`, `maxstackpurple`, `maxstackorange`, `maxstackyellow`, `buyerpricegrey`, `buyerpricewhite`, `buyerpricegreen`, `buyerpriceblue`, `buyerpricepurple`, `buyerpriceorange`, `buyerpriceyellow`, `buyerbiddinginterval`, `buyerbidsperinterval`)
VALUES
(2,'Alliance',25000,25000,0,37,12,10,1,0,0,0,10,15,10,5,0,0,4000,6000,8000,10000,12000,14000,16000,18000,20000,22000,24000,26000,28000,30000,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,5,20,30,40,50,50,1,1),
(6,'Horde',25000,25000,0,37,12,10,1,0,0,0,10,15,10,5,0,0,4000,6000,8000,10000,12000,14000,16000,18000,20000,22000,24000,26000,28000,30000,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,5,20,30,40,50,50,1,1),
(7,'Neutral',25000,25000,0,37,12,10,1,0,0,0,10,15,10,5,0,0,4000,6000,8000,10000,12000,14000,16000,18000,20000,22000,24000,26000,28000,30000,70,100,70,100,80,100,75,100,80,100,80,100,80,100,0,0,3,2,1,1,1,1,5,20,30,40,50,50,1,1);


"""

# Define the table structure and default values
TABLE_STRUCTURES = {
    "mod_auctionhousebot": {
        # Core Identification
        "`auctionhouse`": 0,                      # Map ID of AH (e.g., 1 for Stormwind)
        "`name`": None,                           # Display name (e.g., "Stormwind AH")

        # Item Quantity Control
        "`minitems`": 0,                          # Min items to maintain (0 = use maxitems)
        "`maxitems`": 0,                          # Target item count

        # Trade Goods Distribution (%)
        "`percentgreytradegoods`": 0,
        "`percentwhitetradegoods`": 27,
        "`percentgreentradegoods`": 12,
        "`percentbluetradegoods`": 10,
        "`percentpurpletradegoods`": 1,
        "`percentorangetradegoods`": 0,
        "`percentyellowtradegoods`": 0,

        # Regular Items Distribution (%)
        "`percentgreyitems`": 0,
        "`percentwhiteitems`": 10,
        "`percentgreenitems`": 30,
        "`percentblueitems`": 8,
        "`percentpurpleitems`": 2,
        "`percentorangeitems`": 0,
        "`percentyellowitems`": 0,

        # Buyout Price Ranges (% of vendor price)
        "`minpricegrey`": 250,
        "`maxpricegrey`": 500,
        "`minpricewhite`": 750,
        "`maxpricewhite`": 1000,
        "`minpricegreen`": 1250,
        "`maxpricegreen`": 1500,
        "`minpriceblue`": 1750,
        "`maxpriceblue`": 2000,
        "`minpricepurple`": 3000,
        "`maxpricepurple`": 4000,
        "`minpriceorange`": 5000,
        "`maxpriceorange`": 10000,
        "`minpriceyellow`": 5000,
        "`maxpriceyellow`": 10000,

        # Bid Price Ranges (% of buyout price)
        "`minbidpricegrey`": 70,
        "`maxbidpricegrey`": 100,
        "`minbidpricewhite`": 70,
        "`maxbidpricewhite`": 100,
        "`minbidpricegreen`": 80,
        "`maxbidpricegreen`": 100,
        "`minbidpriceblue`": 75,
        "`maxbidpriceblue`": 100,
        "`minbidpricepurple`": 80,
        "`maxbidpricepurple`": 100,
        "`minbidpriceorange`": 80,
        "`maxbidpriceorange`": 100,
        "`minbidpriceyellow`": 80,
        "`maxbidpriceyellow`": 100,

        # Stack Limits (0 = no limit)
        "`maxstackgrey`": 0,
        "`maxstackwhite`": 0,
        "`maxstackgreen`": 0,
        "`maxstackblue`": 0,
        "`maxstackpurple`": 0,
        "`maxstackorange`": 0,
        "`maxstackyellow`": 0,

        # Buyer Configuration
        "`buyerpricegrey`": 5,                   # Multiplier to vendor price
        "`buyerpricewhite`": 30,
        "`buyerpricegreen`": 40,
        "`buyerpriceblue`": 50,
        "`buyerpricepurple`": 60,
        "`buyerpriceorange`": 80,
        "`buyerpriceyellow`": 100,
        "`buyerbiddinginterval`": 1,             # Minutes between bid cycles
        "`buyerbidsperinterval`": 1              # Bids per cycle
    },

    "achievement_criteria_data": {
        "`criteria_id`": 0,
        "`type`": 0,
        "`value1`": 0,
        "`value2`": 0,
        "`ScriptName`": "",
    },

    "conditions": {
        "`SourceTypeOrReferenceId`": 0,      # 17 = SPELL_SCRIPT_TARGET
        "`SourceGroup`": 0,                  # Often spell family
        "`SourceEntry`": 0,                  # Spell/quest/etc. ID
        "`SourceId`": 0,                     # Usually 0
        "`ElseGroup`": 0,                    # Alternative condition group
        "`ConditionTypeOrReference`": 0,     # 31 = CONDITION_SPELL_SCRIPT_TARGET
        "`ConditionTarget`": 0,              # 0=SOURCE, 1=TARGET
        "`ConditionValue1`": 0,              # Param 1 (type/subtype)
        "`ConditionValue2`": 0,              # Param 2 (entry ID)
        "`ConditionValue3`": 0,              # Param 3 (misc)
        "`NegativeCondition`": 0,            # 0=Must meet, 1=Must NOT meet
        "`ErrorType`": 0,                    # UI error to display
        "`ErrorTextId`": 0,                  # Text ID for error
        "`ScriptName`": "",                  # Custom script hook
        "`Comment`": "",                     # Developer notes
    },

    "creature_template": {
        "`entry`": 0,
        "`difficulty_entry_1`": 0,
        "`difficulty_entry_2`": 0,
        "`difficulty_entry_3`": 0,
        "`KillCredit1`": 0,
        "`KillCredit2`": 0,
        "`modelid1`": 0,
        "`modelid2`": 0,
        "`modelid3`": 0,
        "`modelid4`": 0,
        "`name`": "",
        "`subname`": "",
        "`IconName`": "",
        "`gossip_menu_id`": 0,
        "`minlevel`": 1,
        "`maxlevel`": 1,
        "`exp`": 0,
        "`faction`": 0,
        "`npcflag`": 0,
        "`speed_walk`": 1,
        "`speed_run`": 1.14286,
        "`speed_swim`": 1,
        "`speed_flight`": 1,
        "`detection_range`": 20,
        "`scale`": 1,
        "`rank`": 0,
        "`dmgschool`": 0,
        "`DamageModifier`": 1,
        "`BaseAttackTime`": 0,
        "`RangeAttackTime`": 0, 
        "`BaseVariance`": 1, 
        "`RangeVariance`": 1, 
        "`unit_class`": 0,
        "`unit_flags`": 0, 
        "`unit_flags2`": 0, 
        "`dynamicflags`": 0, 
        "`family`": 0, 
        "`trainer_type`": 0,
        "`trainer_spell`": 0, 
        "`trainer_class`": 0, 
        "`trainer_race`": 0, 
        "`type`": 0, 
        "`type_flags`": 0,
        "`lootid`": 0, 
        "`pickpocketloot`": 0, 
        "`skinloot`": 0, 
        "`PetSpellDataId`": 0, 
        "`VehicleId`": 0,
        "`mingold`": 0, 
        "`maxgold`": 0, 
        "`AIName`": "", 
        "`MovementType`": 0, 
        "`HoverHeight`": 1,
        "`HealthModifier`": 1, 
        "`ManaModifier`": 1, 
        "`ArmorModifier`": 1, 
        "`ExperienceModifier`": 1,
        "`RacialLeader`": 0, 
        "`movementId`": 0, 
        "`RegenHealth`": 1, 
        "`mechanic_immune_mask`": 0,
        "`spell_school_immune_mask`": 0, 
        "`flags_extra`": 0, 
        "`ScriptName`": "", 
        "`VerifiedBuild`": ""
    },

    "creature_addon": {
        "`guid`": 0,                   # Must match creature.guid
        "`path_id`": 0,                # Waypoint path ID (0 = none)
        "`mount`": 0,                  # Display mount ID (0 = none)
        "`bytes1`": 0,                 # StandState/SheathState etc.
        "`bytes2`": 0,                 # UnitFlags
        "`emote`": 0,                  # Persistent emote ID
        "`visibilityDistanceType`": 0, # 0=Default, 1=Tiny, 2=Small, etc.
        "`auras`": None,               # NULL or aura strings
    },

    "creature_model_info": {
        "`DisplayID`": 0,                # Matches CreatureDisplayInfo.dbc
        "`BoundingRadius`": 0.0,          # Melee attack distance
        "`CombatReach`": 0.0,             # Ranged attack range
        "`Gender`": 2,                    # 0=Male, 1=Female, 2=None
        "`DisplayID_Other_Gender`": 0     # Alternate gender model
    },

    "creature_template_model": {
        "`CreatureID`": 0,               # Links to creature_template.entry
        "`Idx`": 0,                      # 0-3 model slot index
        "`CreatureDisplayID`": 0,         # DisplayID from CreatureDisplayInfo.dbc
        "`DisplayScale`": 1.0,            # Model size multiplier
        "`Probability`": 1.0,             # 0-1 (auto-normalized to sum=1)
        "`VerifiedBuild`": 0              # 0=unverified, -1=placeholder
    },

    "creature_loot_template": {
    "`Entry`": 0,
    "`Item`": 0,
    "`Reference`": 0,
    "`Chance`": 100,
    "`QuestRequired`": 0,
    "`LootMode`": 1,
    "`GroupId`": 0,
    "`MinCount`": 1,
    "`MaxCount`": 1,
    "`Comment`": "",
    },

    "creature_questender": {
        "`id`": 0,
        "`quest`": 0,
    },

    "creature_queststarter": {
        "`id`": 0,
        "`quest`": 0,
    },

    "creature": {
    "`guid`": 0,
    "`id1`": 0,
    "`id2`": 0,
    "`id3`": 0,
    "`map`": 0,
    "`zoneId`": 0,
    "`areaId`": 0,
    "`spawnMask`": 1,
    "`phaseMask`": 1,
    "`equipment_id`": 0,
    "`position_x`": 0.0,
    "`position_y`": 0.0,
    "`position_z`": 0.0,
    "`orientation`": 0.0,
    "`spawntimesecs`": 120,
    "`wander_distance`": 0.0,
    "`currentwaypoint`": 0,
    "`curhealth`": 1,
    "`curmana`": 0,
    "`MovementType`": 0,
    "`npcflag`": 0,
    "`unit_flags`": 0,
    "`dynamicflags`": 0,
    "`ScriptName`": "",
    "`VerifiedBuild`": "",
    "`CreateObject`": 0,
    "`Comment`": ""
    },

    "creature_questitem": {
        "`CreatureEntry`": 0,
        "`Idx`": 0,
        "`ItemId`": 0,
        "`VerifiedBuild`": 0,
    },

    "creature_summon_groups": {
        "`summonerId`": 0,            # NPC/GO ID that triggers summon
        "`summonerType`": 0,           # 0=Creature, 1=GameObject
        "`groupId`": 0,                # Group identifier
        "`entry`": 0,                  # Creature ID to summon
        "`position_x`": 0.0,           # Spawn X coordinate
        "`position_y`": 0.0,           # Spawn Y coordinate
        "`position_z`": 0.0,           # Spawn Z coordinate
        "`orientation`": 0.0,          # Facing angle (radians)
        "`summonType`": 4,             # 4=TimedOrCorpseDespawn (common default)
        "`summonTime`": 0,             # Despawn time in ms (0=infinite)
        "`Comment`": "",               # Description
    },

    "dungeon_access_template": {
        "`id`": 0,                      # Unique access template ID
        "`map_id`": 0,                  # Dungeon map ID
        "`difficulty`": 0,              # 0=Normal, 1=Heroic, etc.
        "`min_level`": 0,               # 0 = no level restriction
        "`max_level`": 0,               # 0 = no max level cap
        "`min_avg_item_level`": 0,      # 0 = no ilvl requirement
        "`comment`": "",                # Description
    },

    "dungeon_access_requirements": {
        "`dungeon_access_id`": None,         # Links to dungeon_access_template
        "`requirement_type`": None,          # 0=None, 1=Quest, 2=Item, 3=Achievement
        "`requirement_id`": None,            # Quest/Item/Achievement ID
        "`requirement_note`": None,         # Displayed requirement text
        "`faction`": 2,                   # 0=Alliance, 1=Horde, 2=Both
        "`priority`": None,               # NULL for default ordering
        "`leader_only`": 0,               # 0=All party members, 1=Leader only
        "`comment`": None,                  # Developer notes
    },

    "item_template": {
        "`entry`": 0,
        "`class`": 0,
        "`subclass`": 0,
        "`SoundOverrideSubclass`": -1,
        "`name`": "",
        "`displayid`": 0,
        "`Quality`": 0,
        "`Flags`": 0,
        "`FlagsExtra`": 0,
        "`BuyCount`": 1,
        "`BuyPrice`": 0,
        "`SellPrice`": 0,
        "`InventoryType`": 0,
        "`AllowableClass`": -1,
        "`AllowableRace`": -1,
        "`ItemLevel`": 0,
        "`RequiredLevel`": 0,
        "`RequiredSkill`": 0,
        "`RequiredSkillRank`": 0,
        "`requiredspell`": 0,
        "`requiredhonorrank`": 0,
        "`RequiredCityRank`": 0,
        "`RequiredReputationFaction`": 0,
        "`RequiredReputationRank`": 0,
        "`maxcount`": 0,
        "`stackable`": 1,
        "`ContainerSlots`": 0,
        "`StatsCount`": 1,
        "`stat_type1`": 0,
        "`stat_value1`": 0,
        "`stat_type2`": 0,
        "`stat_value2`": 0,
        "`stat_type3`": 0,
        "`stat_value3`": 0,
        "`stat_type4`": 0,
        "`stat_value4`": 0,
        "`stat_type5`": 0,
        "`stat_value5`": 0,
        "`stat_type6`": 0,
        "`stat_value6`": 0,
        "`stat_type7`": 0,
        "`stat_value7`": 0,
        "`stat_type8`": 0,
        "`stat_value8`": 0,
        "`stat_type9`": 0,
        "`stat_value9`": 0,
        "`stat_type10`": 0,
        "`stat_value10`": 0,
        "`ScalingStatDistribution`": 0,
        "`ScalingStatValue`": 0,
        "`dmg_min1`": 0,
        "`dmg_max1`": 0,
        "`dmg_type1`": 0,
        "`dmg_min2`": 0,
        "`dmg_max2`": 0,
        "`dmg_type2`": 0,
        "`armor`": 0,
        "`holy_res`": 0,
        "`fire_res`": 0,
        "`nature_res`": 0,
        "`frost_res`": 0,
        "`shadow_res`": 0,
        "`arcane_res`": 0,
        "`delay`": 1000,
        "`ammo_type`": 0,
        "`RangedModRange`": 0,
        "`spellid_1`": 0,
        "`spelltrigger_1`": 0,
        "`spellcharges_1`": 0,
        "`spellppmRate_1`": 0,
        "`spellcooldown_1`": -1,
        "`spellcategory_1`": 0,
        "`spellcategorycooldown_1`": -1,
        "`spellid_2`": 0,
        "`spelltrigger_2`": 0,
        "`spellcharges_2`": 0,
        "`spellppmRate_2`": 0,
        "`spellcooldown_2`": -1,
        "`spellcategory_2`": 0,
        "`spellcategorycooldown_2`": -1,
        "`spellid_3`": 0,
        "`spelltrigger_3`": 0,
        "`spellcharges_3`": 0,
        "`spellppmRate_3`": 0,
        "`spellcooldown_3`": -1,
        "`spellcategory_3`": 0,
        "`spellcategorycooldown_3`": -1,
        "`spellid_4`": 0,
        "`spelltrigger_4`": 0,
        "`spellcharges_4`": 0,
        "`spellppmRate_4`": 0,
        "`spellcooldown_4`": -1,
        "`spellcategory_4`": 0,
        "`spellcategorycooldown_4`": -1,
        "`spellid_5`": 0,
        "`spelltrigger_5`": 0,
        "`spellcharges_5`": 0,
        "`spellppmRate_5`": 0,
        "`spellcooldown_5`": -1,
        "`spellcategory_5`": 0,
        "`spellcategorycooldown_5`": -1,
        "`bonding`": 0,
        "`description`": "",
        "`PageText`": 0,
        "`LanguageID`": 0,
        "`PageMaterial`": 0,
        "`startquest`": 0,
        "`lockid`": 0,
        "`Material`": 0,
        "`sheath`": 0,
        "`RandomProperty`": 0,
        "`RandomSuffix`": 0,
        "`block`": 0,
        "`itemset`": 0,
        "`MaxDurability`": 0,
        "`area`": 0,
        "`Map`": 0,
        "`BagFamily`": 0,
        "`TotemCategory`": 0,
        "`socketColor_1`": 0,
        "`socketContent_1`": 0,
        "`socketColor_2`": 0,
        "`socketContent_2`": 0,
        "`socketColor_3`": 0,
        "`socketContent_3`": 0,
        "`socketBonus`": 0,
        "`GemProperties`": 0,
        "`RequiredDisenchantSkill`": -1,
        "`ArmorDamageModifier`": 0,
        "`duration`": 0,
        "`ItemLimitCategory`": 0,
        "`HolidayId`": 0,
        "`ScriptName`": "",
        "`DisenchantID`": 0,
        "`FoodType`": 0,
        "`minMoneyLoot`": 0,
        "`maxMoneyLoot`": 0,
        "`flagsCustom`": 0,
        "`VerifiedBuild`": ""
    },

    "item_loot_template": {
        "`Entry`": 0,               # Source item ID (container)
        "`Item`": 0,                # Loot item ID
        "`Reference`": 0,           # Reference to other loot templates
        "`Chance`": 100.0,          # Drop chance percentage (float)
        "`QuestRequired`": 0,       # 1 = Requires quest
        "`LootMode`": 1,            # Default loot mode
        "`GroupId`": 0,             # Group ID (0 = independent)
        "`MinCount`": 1,            # Minimum quantity
        "`MaxCount`": 1,            # Maximum quantity
        "`Comment`": "",            # Descriptive comment
    },

    "instance_encounters": {
        "`entry`": 0,                  # Unique encounter ID
        "`creditType`": 0,             # 0=Creature, 1=GameObject
        "`creditEntry`": 0,            # Creature/GameObject ID
        "`lastEncounterDungeon`": 0,   # Dungeon achievement reference
        "`comment`": "",               # Encounter description
    },

    "gameobject": {
        "`id`": 0,                  # GameObject template ID
        "`map`": 0,                 # Map ID
        "`zoneId`": 0,              # Zone ID (optional)
        "`areaId`": 0,              # Area ID (optional)
        "`spawnMask`": 1,           # Spawn mask (1 for all modes)
        "`phaseMask`": 1,           # Phase mask (1 = visible in all phases)
        "`position_x`": 0.0,        # World X coordinate
        "`position_y`": 0.0,        # World Y coordinate
        "`position_z`": 0.0,        # World Z coordinate
        "`orientation`": 0.0,       # Facing angle (radians)
        "`rotation0`": 0.0,         # Quaternion rotation X
        "`rotation1`": 0.0,         # Quaternion rotation Y
        "`rotation2`": 0.0,         # Quaternion rotation Z
        "`rotation3`": 1.0,         # Quaternion rotation W (default 1.0)
        "`spawntimesecs`": 300,     # Respawn time in seconds
        "`animprogress`": 0,        # Animation progress (0-100)
        "`state`": 1,               # GameObject state (1 = active)
        "`ScriptName`": "",         # Empty string unless scripted
        "`VerifiedBuild`": None,    # NULL for custom entries
    },

    "gameobject_loot_template": {
        "`Entry`": 0,              # GameObject template ID
        "`Item`": 0,                # Item ID from item_template
        "`Reference`": 0,           # Reference to other loot templates
        "`Chance`": 100.0,          # Drop chance percentage (float)
        "`QuestRequired`": 0,       # 1 = Only drops for quest
        "`LootMode`": 1,            # Default loot mode
        "`GroupId`": 0,             # Grouping for mutual exclusivity
        "`MinCount`": 1,            # Minimum quantity
        "`MaxCount`": 1,            # Maximum quantity
        "`Comment`": "",            # Descriptive comment
    },

    "lfg_dungeon_template": {
        "`dungeonId`": 0,              # LFG dungeon ID
        "`name`": "",                   # Dungeon display name
        "`position_x`": 0.0,            # Teleport X coordinate
        "`position_y`": 0.0,            # Teleport Y coordinate
        "`position_z`": 0.0,            # Teleport Z coordinate
        "`orientation`": 0.0,          # Facing angle (radians)
        "`VerifiedBuild`": 0,           # 0 for custom entries
    },

    "lfg_dungeon_rewards": {
        "`dungeonId`": 0,
        "`maxLevel`": 0,
        "`firstQuestId`": 0,
        "`otherQuestId`": 0,
    },

    "npc_trainer": {
    "`ID`": 0,
    "`SpellID`": 0,
    "`MoneyCost`": 0,
    "`ReqSkillLine`": 0,
    "`ReqSkillRank`": 0,
    "`ReqLevel`": 1,
    "`ReqSpell`": 0,
    },

    "npc_vendor": {
        "`entry`": 0,            # NPC entry from creature_template
        "`slot`": 0,             # Display slot (0 = no specific order)
        "`item`": 0,             # Item ID from item_template
        "`maxcount`": 0,         # 0 = unlimited stock
        "`incrtime`": 0,         # Restock time in seconds (0 = no restock)
        "`ExtendedCost`": 0,     # Honor/arena cost reference
        "`VerifiedBuild`": '', # NULL for custom entries
    },

    "reference_loot_template": {
        "`Entry`": 0,
        "`Item`": 0,
        "`Reference`": 0,
        "`Chance`": 100,  # Note: Chance is typically a float (e.g., 100.0 for 100%)
        "`QuestRequired`": 0,
        "`LootMode`": 1,     # Default is usually 1 (all modes enabled)
        "`GroupId`": 0,
        "`MinCount`": 1,      # Default minimum drop count
        "`MaxCount`": 1,      # Default maximum drop count
        "`Comment`": "",      # Empty string by default
    },

    "playercreateinfo_item": {
        "`race`": 0,
        "`class`": 0,
        "`itemid`": 0,
        "`amount`": 1,  # Default is typically 1 for starting items
        "`Note`": "",  # Empty string by default
    },

    "page_text": {
        "`ID`": 0,                  # Unique page identifier
        "`Text`": "",               # Empty string by default (or "0" for uninitialized)
        "`NextPageID`": 0,          # 0 = no linked next page
        "`VerifiedBuild`": 0,       # 0 for custom content
    },

    "quest_template": {
    "`ID`": 0,
    "`QuestType`": 2,
    "`QuestLevel`": 1,
    "`MinLevel`": 0,
    "`QuestSortID`": 0,
    "`QuestInfoID`": 0,
    "`SuggestedGroupNum`": 0,
    "`RequiredFactionId1`": 0,
    "`RequiredFactionId2`": 0,
    "`RequiredFactionValue1`": 0,
    "`RequiredFactionValue2`": 0,
    "`RewardNextQuest`": 0,
    "`RewardXPDifficulty`": 0,
    "`RewardMoney`": 0,
    "`RewardMoneyDifficulty`": 0,
    "`RewardDisplaySpell`": 0,
    "`RewardSpell`": 0,
    "`RewardHonor`": 0,
    "`RewardKillHonor`": 0,
    "`StartItem`": 0,
    "`Flags`": 0,
    "`RequiredPlayerKills`": 0,
    "`RewardItem1`": 0,
    "`RewardAmount1`": 0,
    "`RewardItem2`": 0,
    "`RewardAmount2`": 0,
    "`RewardItem3`": 0,
    "`RewardAmount3`": 0,
    "`RewardItem4`": 0,
    "`RewardAmount4`": 0,
    "`ItemDrop1`": 0,
    "`ItemDropQuantity1`": 0,
    "`ItemDrop2`": 0,
    "`ItemDropQuantity2`": 0,
    "`ItemDrop3`": 0,
    "`ItemDropQuantity3`": 0,
    "`ItemDrop4`": 0,
    "`ItemDropQuantity4`": 0,
    "`RewardChoiceItemID1`": 0,
    "`RewardChoiceItemQuantity1`": 0,
    "`RewardChoiceItemID2`": 0,
    "`RewardChoiceItemQuantity2`": 0,
    "`RewardChoiceItemID3`": 0,
    "`RewardChoiceItemQuantity3`": 0,
    "`RewardChoiceItemID4`": 0,
    "`RewardChoiceItemQuantity4`": 0,
    "`RewardChoiceItemID5`": 0,
    "`RewardChoiceItemQuantity5`": 0,
    "`RewardChoiceItemID6`": 0,
    "`RewardChoiceItemQuantity6`": 0,
    "`POIContinent`": 0,
    "`POIx`": 0,
    "`POIy`": 0,
    "`POIPriority`": 0,
    "`RewardTitle`": 0,
    "`RewardTalents`": 0,
    "`RewardArenaPoints`": 0,
    "`RewardFactionID1`": 0,
    "`RewardFactionValue1`": 0,
    "`RewardFactionOverride1`": 0,
    "`RewardFactionID2`": 0,
    "`RewardFactionValue2`": 0,
    "`RewardFactionOverride2`": 0,
    "`RewardFactionID3`": 0,
    "`RewardFactionValue3`": 0,
    "`RewardFactionOverride3`": 0,
    "`RewardFactionID4`": 0,
    "`RewardFactionValue4`": 0,
    "`RewardFactionOverride4`": 0,
    "`RewardFactionID5`": 0,
    "`RewardFactionValue5`": 0,
    "`RewardFactionOverride5`": 0,
    "`TimeAllowed`": 0,
    "`AllowableRaces`": 0,
    "`LogTitle`": "",
    "`LogDescription`": "",
    "`QuestDescription`": "",
    "`AreaDescription`": "",
    "`QuestCompletionLog`": "",
    "`RequiredNpcOrGo1`": 0,
    "`RequiredNpcOrGo2`": 0,
    "`RequiredNpcOrGo3`": 0,
    "`RequiredNpcOrGo4`": 0,
    "`RequiredNpcOrGoCount1`": 0,
    "`RequiredNpcOrGoCount2`": 0,
    "`RequiredNpcOrGoCount3`": 0,
    "`RequiredNpcOrGoCount4`": 0,
    "`RequiredItemId1`": 0,
    "`RequiredItemId2`": 0,
    "`RequiredItemId3`": 0,
    "`RequiredItemId4`": 0,
    "`RequiredItemId5`": 0,
    "`RequiredItemId6`": 0,
    "`RequiredItemCount1`": 0,
    "`RequiredItemCount2`": 0,
    "`RequiredItemCount3`": 0,
    "`RequiredItemCount4`": 0,
    "`RequiredItemCount5`": 0,
    "`RequiredItemCount6`": 0,
    "`Unknown0`": 0,
    "`ObjectiveText1`": "",
    "`ObjectiveText2`": "",
    "`ObjectiveText3`": "",
    "`ObjectiveText4`": "",
    "`VerifiedBuild`": "",
    },

    "quest_template_addon": {
    "`ID`": 0,
    "`MaxLevel`": 0,
    "`AllowableClasses`": 0,
    "`SourceSpellID`": 0,
    "`PrevQuestID`": 0,
    "`NextQuestID`": 0,
    "`ExclusiveGroup`": 0,
    "`RewardMailTemplateID`": 0,
    "`RewardMailDelay`": 0,
    "`RequiredSkillID`": 0,
    "`RequiredSkillPoints`": 0,
    "`RequiredMinRepFaction`": 0,
    "`RequiredMaxRepFaction`": 0,
    "`RequiredMinRepValue`": 0,
    "`RequiredMaxRepValue`": 0,
    "`ProvidedItemCount`": 0,
    "`SpecialFlags`": 0,
    },

    "quest_offer_reward": {
        "`ID`": 0,
        "`Emote1`": 0,
        "`Emote2`": 0,
        "`Emote3`": 0,
        "`Emote4`": 0,
        "`EmoteDelay1`": 0,
        "`EmoteDelay2`": 0,
        "`EmoteDelay3`": 0,
        "`EmoteDelay4`": 0,
        "`RewardText`": "",
        "`VerifiedBuild`": 0,
    },

    "quest_poi": {
        "`QuestID`": 0,
        "`id`": 0,
        "`ObjectiveIndex`": 0,
        "`MapID`": 0,
        "`WorldMapAreaId`": 0,
        "`Floor`": 0,
        "`Priority`": 0,
        "`Flags`": 0,
        "`VerifiedBuild`": 0,
    },

    "quest_poi_points": {
        "`QuestID`": 0,
        "`Idx1`": 0,
        "`Idx2`": 0,
        "`X`": 0,
        "`Y`": 0,
        "`VerifiedBuild`": 0,
    },

    "quest_request_items": {
        "`ID`": 0,
        "`EmoteOnComplete`": 0,
        "`EmoteOnIncomplete`": 0,
        "`CompletionText`": "",
        "`VerifiedBuild`": 0,
    },

    "quest_offer_reward_entry": {
        "`ID`": 0,
        "`Emote1`": 0,
        "`Emote2`": 0,
        "`Emote3`": 0,
        "`Emote4`": 0,
        "`EmoteDelay1`": 0,
        "`EmoteDelay2`": 0,
        "`EmoteDelay3`": 0,
        "`EmoteDelay4`": 0,
        "`RewardText`": "",
        "`VerifiedBuild`": ""
    },

    "smart_scripts": {
    "`entryorguid`": 0,
    "`source_type`": 0,
    "`id`": 0,
    "`link`": 0,
    "`event_type`": 0,
    "`event_phase_mask`": 0,
    "`event_chance`": 100,
    "`event_flags`": 0,
    "`event_param1`": 0,
    "`event_param2`": 0,
    "`event_param3`": 0,
    "`event_param4`": 0,
    "`event_param5`": 0,
    "`event_param6`": 0,
    "`action_type`": 0,
    "`action_param1`": 0,
    "`action_param2`": 0,
    "`action_param3`": 0,
    "`action_param4`": 0,
    "`action_param5`": 0,
    "`action_param6`": 0,
    "`target_type`": 0,
    "`target_param1`": 0,
    "`target_param2`": 0,
    "`target_param3`": 0,
    "`target_param4`": 0,
    "`target_x`": 0,
    "`target_y`": 0,
    "`target_z`": 0,
    "`target_o`": 0,
    "`comment`": "",
    },

    "spell_dbc": {
        "`ID`": 0,
        "`Category`": 0,
        "`DispelType`": 0,
        "`Mechanic`": 0,
        "`Attributes`": 0,
        "`AttributesEx`": 0,
        "`AttributesEx2`": 0,
        "`AttributesEx3`": 0,
        "`AttributesEx4`": 0,
        "`AttributesEx5`": 0,
        "`AttributesEx6`": 0,
        "`AttributesEx7`": 0,
        "`ShapeshiftMask`": 0,
        "`unk_320_2`": 0,
        "`ShapeshiftExclude`": 0,
        "`unk_320_3`": 0,
        "`Targets`": 0,
        "`TargetCreatureType`": 0,
        "`RequiresSpellFocus`": 0,
        "`FacingCasterFlags`": 0,
        "`CasterAuraState`": 0,
        "`TargetAuraState`": 0,
        "`ExcludeCasterAuraState`": 0,
        "`ExcludeTargetAuraState`": 0,
        "`CasterAuraSpell`": 0,
        "`TargetAuraSpell`": 0,
        "`ExcludeCasterAuraSpell`": 0,
        "`ExcludeTargetAuraSpell`": 0,
        "`CastingTimeIndex`": 1,
        "`RecoveryTime`": 0,
        "`CategoryRecoveryTime`": 0,
        "`InterruptFlags`": 0,
        "`AuraInterruptFlags`": 0,
        "`ChannelInterruptFlags`": 0,
        "`ProcTypeMask`": 0,
        "`ProcChance`": 101,
        "`ProcCharges`": 0,
        "`MaxLevel`": 0,
        "`BaseLevel`": 0,
        "`SpellLevel`": 0,
        "`DurationIndex`": 0,
        "`PowerType`": 0,
        "`ManaCost`": 0,
        "`ManaCostPerLevel`": 0,
        "`ManaPerSecond`": 0,
        "`ManaPerSecondPerLevel`": 0,
        "`RangeIndex`": 13,
        "`Speed`": 0,
        "`ModalNextSpell`": 0,
        "`CumulativeAura`": 0,
        "`Totem_1`": 0,
        "`Totem_2`": 0,
        "`Reagent_1`": 0,
        "`Reagent_2`": 0,
        "`Reagent_3`": 0,
        "`Reagent_4`": 0,
        "`Reagent_5`": 0,
        "`Reagent_6`": 0,
        "`Reagent_7`": 0,
        "`Reagent_8`": 0,
        "`ReagentCount_1`": 0,
        "`ReagentCount_2`": 0,
        "`ReagentCount_3`": 0,
        "`ReagentCount_4`": 0,
        "`ReagentCount_5`": 0,
        "`ReagentCount_6`": 0,
        "`ReagentCount_7`": 0,
        "`ReagentCount_8`": 0,
        "`EquippedItemClass`": -1,
        "`EquippedItemSubclass`": 0,
        "`EquippedItemInvTypes`": 0,
        "`Effect_1`": 0,
        "`Effect_2`": 0,
        "`Effect_3`": 0,
        "`EffectDieSides_1`": 0,
        "`EffectDieSides_2`": 0,
        "`EffectDieSides_3`": 0,
        "`EffectRealPointsPerLevel_1`": 0,
        "`EffectRealPointsPerLevel_2`": 0,
        "`EffectRealPointsPerLevel_3`": 0,
        "`EffectBasePoints_1`": 0,
        "`EffectBasePoints_2`": 0,
        "`EffectBasePoints_3`": 0,
        "`EffectMechanic_1`": 0,
        "`EffectMechanic_2`": 0,
        "`EffectMechanic_3`": 0,
        "`ImplicitTargetA_1`": 1,
        "`ImplicitTargetA_2`": 0,
        "`ImplicitTargetA_3`": 0,
        "`ImplicitTargetB_1`": 0,
        "`ImplicitTargetB_2`": 0,
        "`ImplicitTargetB_3`": 0,
        "`EffectRadiusIndex_1`": 0,
        "`EffectRadiusIndex_2`": 0,
        "`EffectRadiusIndex_3`": 0,
        "`EffectAura_1`": 0,
        "`EffectAura_2`": 0,
        "`EffectAura_3`": 0,
        "`EffectAuraPeriod_1`": 0,
        "`EffectAuraPeriod_2`": 0,
        "`EffectAuraPeriod_3`": 0,
        "`EffectMultipleValue_1`": 0,
        "`EffectMultipleValue_2`": 0,
        "`EffectMultipleValue_3`": 0,
        "`EffectChainTargets_1`": 0,
        "`EffectChainTargets_2`": 0,
        "`EffectChainTargets_3`": 0,
        "`EffectItemType_1`": 0,
        "`EffectItemType_2`": 0,
        "`EffectItemType_3`": 0,
        "`EffectMiscValue_1`": 0,
        "`EffectMiscValue_2`": 0,
        "`EffectMiscValue_3`": 0,
        "`EffectMiscValueB_1`": 0,
        "`EffectMiscValueB_2`": 0,
        "`EffectMiscValueB_3`": 0,
        "`EffectTriggerSpell_1`": 0,
        "`EffectTriggerSpell_2`": 0,
        "`EffectTriggerSpell_3`": 0,
        "`EffectPointsPerCombo_1`": 0,
        "`EffectPointsPerCombo_2`": 0,
        "`EffectPointsPerCombo_3`": 0,
        "`EffectSpellClassMaskA_1`": 0,
        "`EffectSpellClassMaskA_2`": 0,
        "`EffectSpellClassMaskA_3`": 0,
        "`EffectSpellClassMaskB_1`": 0,
        "`EffectSpellClassMaskB_2`": 0,
        "`EffectSpellClassMaskB_3`": 0,
        "`EffectSpellClassMaskC_1`": 0,
        "`EffectSpellClassMaskC_2`": 0,
        "`EffectSpellClassMaskC_3`": 0,
        "`SpellVisualID_1`": 0,
        "`SpellVisualID_2`": 0,
        "`SpellIconID`": 0,
        "`ActiveIconID`": 0,
        "`SpellPriority`": 0,
        "`Name_Lang_enUS`": "",
        "`Name_Lang_enGB`": None,
        "`Name_Lang_koKR`": None,
        "`Name_Lang_frFR`": None,
        "`Name_Lang_deDE`": None,
        "`Name_Lang_enCN`": None,
        "`Name_Lang_zhCN`": None,
        "`Name_Lang_enTW`": None,
        "`Name_Lang_zhTW`": None,
        "`Name_Lang_esES`": None,
        "`Name_Lang_esMX`": None,
        "`Name_Lang_ruRU`": None,
        "`Name_Lang_ptPT`": None,
        "`Name_Lang_ptBR`": None,
        "`Name_Lang_itIT`": None,
        "`Name_Lang_Unk`": None,
        "`Name_Lang_Mask`": 0,
        "`NameSubtext_Lang_enUS`": None,
        "`NameSubtext_Lang_enGB`": None,
        "`NameSubtext_Lang_koKR`": None,
        "`NameSubtext_Lang_frFR`": None,
        "`NameSubtext_Lang_deDE`": None,
        "`NameSubtext_Lang_enCN`": None,
        "`NameSubtext_Lang_zhCN`": None,
        "`NameSubtext_Lang_enTW`": None,
        "`NameSubtext_Lang_zhTW`": None,
        "`NameSubtext_Lang_esES`": None,
        "`NameSubtext_Lang_esMX`": None,
        "`NameSubtext_Lang_ruRU`": None,
        "`NameSubtext_Lang_ptPT`": None,
        "`NameSubtext_Lang_ptBR`": None,
        "`NameSubtext_Lang_itIT`": None,
        "`NameSubtext_Lang_Unk`": None,
        "`NameSubtext_Lang_Mask`": 0,
        "`Description_Lang_enUS`": None,
        "`Description_Lang_enGB`": None,
        "`Description_Lang_koKR`": None,
        "`Description_Lang_frFR`": None,
        "`Description_Lang_deDE`": None,
        "`Description_Lang_enCN`": None,
        "`Description_Lang_zhCN`": None,
        "`Description_Lang_enTW`": None,
        "`Description_Lang_zhTW`": None,
        "`Description_Lang_esES`": None,
        "`Description_Lang_esMX`": None,
        "`Description_Lang_ruRU`": None,
        "`Description_Lang_ptPT`": None,
        "`Description_Lang_ptBR`": None,
        "`Description_Lang_itIT`": None,
        "`Description_Lang_Unk`": None,
        "`Description_Lang_Mask`": 0,
        "`AuraDescription_Lang_enUS`": None,
        "`AuraDescription_Lang_enGB`": None,
        "`AuraDescription_Lang_koKR`": None,
        "`AuraDescription_Lang_frFR`": None,
        "`AuraDescription_Lang_deDE`": None,
        "`AuraDescription_Lang_enCN`": None,
        "`AuraDescription_Lang_zhCN`": None,
        "`AuraDescription_Lang_enTW`": None,
        "`AuraDescription_Lang_zhTW`": None,
        "`AuraDescription_Lang_esES`": None,
        "`AuraDescription_Lang_esMX`": None,
        "`AuraDescription_Lang_ruRU`": None,
        "`AuraDescription_Lang_ptPT`": None,
        "`AuraDescription_Lang_ptBR`": None,
        "`AuraDescription_Lang_itIT`": None,
        "`AuraDescription_Lang_Unk`": None,
        "`AuraDescription_Lang_Mask`": 0,
        "`ManaCostPct`": 0,
        "`StartRecoveryCategory`": 0,
        "`StartRecoveryTime`": 0,
        "`MaxTargetLevel`": 0,
        "`SpellClassSet`": 0,
        "`SpellClassMask_1`": 0,
        "`SpellClassMask_2`": 0,
        "`SpellClassMask_3`": 0,
        "`MaxTargets`": 0,
        "`DefenseType`": 0,
        "`PreventionType`": 0,
        "`StanceBarOrder`": 0,
        "`EffectChainAmplitude_1`": 0,
        "`EffectChainAmplitude_2`": 0,
        "`EffectChainAmplitude_3`": 0,
        "`MinFactionID`": 0,
        "`MinReputation`": 0,
        "`RequiredAuraVision`": 0,
        "`RequiredTotemCategoryID_1`": 0,
        "`RequiredTotemCategoryID_2`": 0,
        "`RequiredAreasID`": 0,
        "`SchoolMask`": 0,
        "`RuneCostID`": 0,
        "`SpellMissileID`": 0,
        "`PowerDisplayID`": 0,
        "`EffectBonusMultiplier_1`": 0,
        "`EffectBonusMultiplier_2`": 0,
        "`EffectBonusMultiplier_3`": 0,
        "`SpellDescriptionVariableID`": 0,
        "`SpellDifficultyID`": 0,
    },

    "spell_target_position": {
        "`ID`": 0,                  # Spell ID from Spell.dbc
        "`EffectIndex`": 0,          # 0=Effect_1, 1=Effect_2, 2=Effect_3
        "`MapID`": 0,                # Target map ID
        "`PositionX`": 0.0,          # World X coordinate
        "`PositionY`": 0.0,          # World Y coordinate
        "`PositionZ`": 0.0,          # World Z coordinate
        "`Orientation`": 0.0,        # Facing angle (radians)
        "`VerifiedBuild`": 0,        # 0 for custom entries
    },

    "skinning_loot_template": {
        "`Entry`": 0,              # Creature entry from creature_template
        "`Item`": 0,               # Item ID from item_template
        "`Reference`": 0,          # Reference to other loot templates
        "`Chance`": 100.0,         # Drop chance percentage (float)
        "`QuestRequired`": 0,      # 0=Always, 1=Only for quest
        "`LootMode`": 1,           # Default loot mode
        "`GroupId`": 0,            # Group ID (0=independent)
        "`MinCount`": 1,           # Minimum quantity
        "`MaxCount`": 1,           # Maximum quantity
        "`Comment`": "",           # Description
    },

}

def extract_table_name(query):
    match = re.search(r"INSERT INTO\s+`?(\w+)`?", query, re.IGNORECASE)
    if match:
        return match.group(1).lower()  # Normalize to lowercase
    match = re.search(r"REPLACE INTO\s+`?(\w+)`?", query, re.IGNORECASE)
    if match:
        return match.group(1).lower()  # Normalize to lowercase
    return None

def parse_value(value):
    # Remove any trailing semicolons
    value = value.strip(';')
    
    # Remove any instances of double apostrophes (single quotes)
    value = value.replace("''", "")  # Remove double single quotes
    
    # Replace any single apostrophes with double apostrophes
    value = value.replace("'", "''")  # Escape single apostrophes with double apostrophes

    if isinstance(value, str):
        if value.upper() == "NULL":  # SQL NULL
            value = None
        elif value.startswith("'") and value.endswith("'"):  # Strip quotes from strings
            value = value[1:-1]

    return value

def parse_set_syntax(query, table_name, query_type):
    """
    Parses the SET syntax variant of INSERT/REPLACE queries.
    """
    set_match = re.search(r"SET\s+(.*?)(?:;|$)", query, re.DOTALL | re.IGNORECASE)
    if not set_match:
        raise ValueError("SET syntax not properly formatted")
    
    set_clause = set_match.group(1)
    field_value_pairs = {}
    comments = {}

    for line in set_clause.split(','):
        line = line.strip()
        if not line:
            continue
            
        # Match field, value, and comment
        match = re.match(r"(`\w+`|\w+)\s*=\s*(.*?)(?:\s*--\s*(.*))?$", line)
        if match:
            field = match.group(1).strip()
            if not field.startswith('`'):
                field = f'`{field}`'
            value = match.group(2).strip()
            comment = match.group(3).strip() if match.group(3) else None
            
            field_value_pairs[field] = parse_value(value)
            if comment:
                comments[field] = comment

    return {
        "table_name": table_name,
        "query_type": query_type,
        "fields": list(field_value_pairs.keys()),
        "values": list(field_value_pairs.values()),
        "field_value_pairs": field_value_pairs,
        "comments": comments,
    }

def find_matching_parenthesis(s, start):
    """Finds the closing parenthesis matching the one at start position."""
    depth = 1
    for i in range(start + 1, len(s)):
        if s[i] == "(":
            depth += 1
        elif s[i] == ")":
            depth -= 1
            if depth == 0:
                return i
    return -1

def parse_values_syntax(query, table_name, query_type):
    """
    Final version that correctly handles all comments including the final one.
    """
    fields = extract_fields_from_query(query)
    values_content = extract_values_content(query)
    
    values_sets = []
    comments = {}
    field_value_pairs = {}
    
    pos = 0
    while pos < len(values_content):
        tuple_start = values_content.find("(", pos)
        if tuple_start == -1:
            break
            
        tuple_end = find_matching_parenthesis(values_content, tuple_start)
        if tuple_end == -1:
            break
            
        # Parse the tuple content
        tuple_content = values_content[tuple_start+1:tuple_end]
        current_set = []
        current_value = []
        in_quotes = False
        
        for char in tuple_content:
            if char == "'":
                in_quotes = not in_quotes
                current_value.append(char)
            elif char == "," and not in_quotes:
                current_set.append("".join(current_value).strip())
                current_value = []
            else:
                current_value.append(char)
        
        if current_value:
            current_set.append("".join(current_value).strip())
        
        if len(current_set) == len(fields):
            row_idx = len(values_sets)
            values_sets.append(current_set)
            
            # Find comment after this tuple
            comment_start = values_content.find("--", tuple_end)
            if comment_start != -1:
                # Look for the end of this specific comment
                comment_end = len(values_content)
                
                # Check for line break or semicolon after comment
                for end_marker in ["\n", ";"]:
                    marker_pos = values_content.find(end_marker, comment_start)
                    if marker_pos != -1 and marker_pos < comment_end:
                        comment_end = marker_pos
                
                # Also stop at next tuple if it exists
                next_tuple = values_content.find("(", tuple_end)
                if next_tuple != -1 and next_tuple < comment_end:
                    comment_end = next_tuple
                
                # Extract and clean the comment
                comment = values_content[comment_start+2:comment_end].strip()
                comment = re.sub(r"[;,]\s*$", "", comment)  # Remove trailing delimiters
                comments[row_idx] = comment
        
        pos = tuple_end + 1
    
    # Process all collected value sets
    for row_idx, values in enumerate(values_sets):
        parsed_values = [parse_individual_value(val) for val in values]
        field_value_pairs[row_idx] = dict(zip(fields, parsed_values))
    
    if not values_sets:
        raise ValueError("No value sets found in VALUES syntax query")
    
    return {
        "query_type": query_type,
        "table_name": table_name,
        "fields": fields,
        "values": values_sets[0] if len(values_sets) == 1 else values_sets,
        "field_value_pairs": field_value_pairs,
        "comments": comments,
        "multiple_rows": len(values_sets) > 1,
        "row_count": len(values_sets)
    }

def extract_fields_from_query(query):
    """Extracts and formats the field list from the query."""
    fields_match = re.search(r"\((.*?)\)\s+VALUES", query, re.DOTALL | re.IGNORECASE)
    if not fields_match:
        raise ValueError("Fields list not found in VALUES syntax query")
    return [f'`{field.strip("` ")}`' for field in fields_match.group(1).split(",")]

def extract_values_content(query):
    """Extracts the content after VALUES clause."""
    values_match = re.search(r"VALUES\s*", query, re.IGNORECASE)
    if not values_match:
        raise ValueError("VALUES clause not found in query")
    return query[values_match.end():]

def parse_individual_value(val):
    """Parses and cleans an individual value."""
    if len(val) >= 2 and val[0] == "'" and val[-1] == "'":
        val = val[1:-1]
    return parse_value(val)  # Your existing parse_value function

def build_result(query_type, table_name, fields, values_sets, field_value_pairs, comments):
    """Constructs the final result dictionary."""
    return {
        "query_type": query_type,
        "table_name": table_name,
        "fields": fields,
        "values": values_sets[0] if len(values_sets) == 1 else values_sets,
        "field_value_pairs": field_value_pairs,
        "comments": comments,
        "multiple_rows": len(values_sets) > 1,
        "row_count": len(values_sets)
    }

def parse_query(query):
    """
    Main function to parse INSERT or REPLACE queries.
    Determines the query type and delegates to specific parsers.
    """
    # Normalize the query by removing extra whitespace and comments for easier parsing
    normalized_query = ' '.join(query.split()).replace(' ,', ',')
    
    # Extract basic components
    query_type = "INSERT" if "INSERT" in normalized_query.upper() else "REPLACE"
    table_name = extract_table_name(normalized_query)
    
    if not table_name:
        raise ValueError("Table name not found in the query")
    
    # More precise detection of query syntax
    # Look for SET or VALUES after the table name
    table_name_pos = normalized_query.upper().find(table_name.upper()) + len(table_name)
    query_remainder = normalized_query[table_name_pos:].strip()

    # Check for explicit SET syntax (must appear right after table name)
    if query_remainder.upper().startswith("SET"):
        print("Parsing as a SET query")
        return parse_set_syntax(normalized_query, table_name, query_type)
    # Check for explicit VALUES syntax (must appear after fields list)
    elif re.search(r"\)\s+VALUES\s*\(", normalized_query, re.IGNORECASE):
        print("Parsing as VALUES query")
        return parse_values_syntax(normalized_query, table_name, query_type)
    else:
        raise ValueError("Could not parse the query. Unsupported format.")

def strip_default_values(query):
    """
    Strips fields with default values with proper type handling for numeric values.
    Handles both flat and nested field_value_pairs structures.
    """
    table_name = query["table_name"]
    field_value_pairs = query.get("field_value_pairs", {})
    fields = query.get("fields", [])

    if table_name not in TABLE_STRUCTURES:
        print(f"Warning: Could not find table '{table_name}' when checking for default values")
        return query

    table_info = TABLE_STRUCTURES[table_name]
    cleaned_field_value_pairs = {}

    # Handle both flat and nested structures
    if not any(isinstance(k, int) for k in field_value_pairs.keys()):
        # Convert flat structure to nested with single row (index 0)
        rows_to_process = {0: field_value_pairs}
    else:
        rows_to_process = field_value_pairs

    for row_idx, row_data in rows_to_process.items():
        if not isinstance(row_data, dict):
            continue
            
        cleaned_row = {}
        for field, value in row_data.items():
            lookup_field = f"`{field.strip('`')}`"
            default_value = table_info.get(lookup_field)

            if default_value is None:
                cleaned_row[field] = value
                continue

            # Handle NULL values
            if str(value).upper() == 'NULL':
                if default_value is not None:
                    cleaned_row[field] = None  # Keep as NULL
                continue

            # Process the value for comparison
            processed_value = value
            
            # Remove surrounding quotes if present
            if isinstance(value, str):
                if len(value) >= 2 and value.startswith("'") and value.endswith("'"):
                    processed_value = value[1:-1]
                
                # Try to convert to appropriate numeric type based on default value
                try:
                    if isinstance(default_value, int):
                        processed_value = int(float(processed_value))  # Handle cases like '1.0'
                    elif isinstance(default_value, float):
                        processed_value = float(processed_value)
                except (ValueError, TypeError):
                    pass  # Keep as string if conversion fails

            # Compare with default value (using type-aware comparison)
            if (isinstance(default_value, (int, float)) and 
                isinstance(processed_value, (int, float))):
                # Numeric comparison
                if processed_value != default_value:
                    # Preserve the numeric type in output
                    cleaned_row[field] = processed_value
            else:
                # String comparison
                if str(processed_value) != str(default_value):
                    # For strings, keep the original formatting (quoted or not)
                    cleaned_row[field] = value

        if cleaned_row:
            cleaned_field_value_pairs[row_idx] = cleaned_row

    # Update the query structure
    updated_query = query.copy()
    
    # Handle single row case by returning to flat structure if that's what we started with
    if len(cleaned_field_value_pairs) == 1 and 0 in cleaned_field_value_pairs:
        if not any(isinstance(k, int) for k in query.get("field_value_pairs", {}).keys()):
            updated_query["field_value_pairs"] = cleaned_field_value_pairs[0]
        else:
            updated_query["field_value_pairs"] = cleaned_field_value_pairs
    else:
        updated_query["field_value_pairs"] = cleaned_field_value_pairs
    
    # Update values list if present
    if "values" in query:
        if len(cleaned_field_value_pairs) == 1:
            # Single row case
            row_data = next(iter(cleaned_field_value_pairs.values()))
            updated_values = []
            for field in fields:
                if field in row_data:
                    updated_values.append(row_data[field])
            updated_query["values"] = updated_values
        else:
            # Multiple rows case
            updated_values = []
            for row_idx in sorted(cleaned_field_value_pairs.keys()):
                row_data = cleaned_field_value_pairs[row_idx]
                row_values = []
                for field in fields:
                    if field in row_data:
                        row_values.append(row_data[field])
                updated_values.append(row_values)
            updated_query["values"] = updated_values
    
    return updated_query

def creature_template_update(primary_query):
    """
    Updates the `creature_template` query by removing modelid fields and generates
    a secondary query for the `creature_template_model` table.
    Preserves the nested structure of field_value_pairs.
    """
    # Get the field_value_pairs structure
    field_value_pairs = primary_query.get("field_value_pairs", {})
    fields = primary_query["fields"]
    comments = primary_query.get("comments", {})
    
    # Normalize to nested structure if it's flat
    if not any(isinstance(k, int) for k in field_value_pairs.keys()):
        field_value_pairs = {0: field_value_pairs}

    # Process each row
    updated_field_value_pairs = {}
    secondary_queries = []
    
    for row_idx, row_data in field_value_pairs.items():
        if not isinstance(row_data, dict):
            continue
            
        # Get the 'entry' field value from creature_template to use as CreatureID
        creature_id = row_data.get("`entry`")
        if not creature_id:
            continue

        # Identify modelid fields and their values
        modelid_fields = ["`modelid1`", "`modelid2`", "`modelid3`", "`modelid4`"]
        modelid_values = [row_data.get(field, '0') for field in modelid_fields 
                         if field in row_data and row_data.get(field, '0') != '0']

        # Create secondary queries for each modelid
        num_models = len(modelid_values)
        if num_models > 0:
            probability = 1 / num_models  # Set equal probability for each modelid
            for idx, modelid in enumerate(modelid_values, start=1):
                secondary_field_value_pairs = {
                    "`CreatureID`": creature_id,
                    "`Idx`": idx,
                    "`CreatureDisplayID`": modelid,
                    "`DisplayScale`": 1,
                    "`Probability`": probability,
                    "`VerifiedBuild`": ""
                }
                secondary_query = {
                    "table_name": "creature_template_model",
                    "fields": list(secondary_field_value_pairs.keys()),
                    "values": list(secondary_field_value_pairs.values()),
                    "field_value_pairs": secondary_field_value_pairs
                }
                secondary_queries.append(secondary_query)

        # Remove modelid fields from the row data
        updated_row = {k: v for k, v in row_data.items() 
                      if k not in modelid_fields}
        updated_field_value_pairs[row_idx] = updated_row

    # Update the fields list by removing modelid fields
    updated_fields = [f for f in fields if f not in ["`modelid1`", "`modelid2`", "`modelid3`", "`modelid4`"]]

    # Return the updated primary query and the list of secondary queries
    updated_primary_query = {
        "table_name": primary_query["table_name"],
        "query_type": primary_query.get("query_type", "INSERT"),
        "fields": updated_fields,
        "values": None,  # Will be updated by strip_default_values
        "field_value_pairs": updated_field_value_pairs,
        "comments": comments,
        "multiple_rows": len(updated_field_value_pairs) > 1,
        "row_count": len(updated_field_value_pairs)
    }

    return updated_primary_query, secondary_queries

def new_query(query):
    """
    Generates DELETE and INSERT statements that handles both flat and nested field_value_pairs structures.
    Properly formats numeric values without quotes.
    """
    table_name = query.get("table_name")
    query_type = query.get("query_type", "REPLACE").upper()
    field_value_pairs = query.get("field_value_pairs", {})
    comments = query.get("comments", {})
    fields = query.get("fields", [])

    if not table_name or not field_value_pairs:
        print("Error: Query is missing table_name or field_value_pairs.")
        return

    # Normalize field_value_pairs structure
    if not any(isinstance(k, int) for k in field_value_pairs.keys()):
        # Convert flat structure to nested structure with single row (index 0)
        field_value_pairs = {0: field_value_pairs}

    # Find primary key field (assuming first field is PK)
    primary_key_field = fields[0] if fields else None

    for row_idx, row_data in field_value_pairs.items():
        if not isinstance(row_data, dict):
            continue
            
        # Get the comment for this specific row if it exists
        row_comment = comments.get(row_idx, "")
        
        # Start building the DELETE statement
        delete_lines = []
        if row_comment:
            delete_lines.append(f"-- {row_comment}")
        
        # Only generate DELETE if we have a primary key value
        if primary_key_field and primary_key_field in row_data:
            pk_value = row_data[primary_key_field]
            # Format the PK value appropriately
            if pk_value is None:
                formatted_pk = "NULL"
            elif isinstance(pk_value, (int, float)):
                formatted_pk = str(pk_value)
            elif isinstance(pk_value, str):
                formatted_pk = f"'{pk_value}'" if not pk_value.startswith("'") else pk_value
            else:
                formatted_pk = str(pk_value)
            
            delete_lines.append(f"DELETE FROM `{table_name}` WHERE {primary_key_field} = {formatted_pk};")
            print("\n".join(delete_lines))
            print()  # Blank line between statements

        # Build the INSERT statement
        insert_lines = []
        if row_comment and not delete_lines:  # Only show comment once
            insert_lines.append(f"-- {row_comment}")
        insert_lines.append(f"INSERT INTO `{table_name}` SET")
        
        # Format each field-value pair
        formatted_pairs = []
        for i, (field, value) in enumerate(row_data.items()):
            # Format the value appropriately
            if value is None:
                formatted_value = "NULL"
            elif isinstance(value, (int, float)):
                formatted_value = str(value)
            elif isinstance(value, str):
                # Handle already-quoted strings
                if value.startswith("'") and value.endswith("'"):
                    formatted_value = value
                else:
                    formatted_value = f"'{value}'"
            else:
                formatted_value = str(value)

            # Format the line (comma except for last field)
            is_last_field = (i == len(row_data) - 1)
            line_end = ";" if is_last_field else ","
            formatted_line = f"    {field} = {formatted_value}{line_end}"
            formatted_pairs.append(formatted_line)

        insert_lines.extend(formatted_pairs)
        
        # Print the complete INSERT query for this row
        print("\n".join(insert_lines))
        print()  # Add blank line between queries

# Parse
parsed_query = parse_query(query)  # Parse the query using the previously defined function
secondary_queries = []
print("Parsed Query:")
print(parsed_query) 
print("")

# Creature_Template Fixes
table_name = parsed_query["table_name"]
if table_name == "creature_template":
    parsed_query, secondary_queries = creature_template_update(parsed_query)
    if secondary_queries:
        print("creature_template is using outdated structure")
        for i, secondary_query in enumerate(secondary_queries, start=1):
            field_value_pairs = secondary_query["field_value_pairs"]
            print(f"Secondary Query {i}: {field_value_pairs}")
        print("")  # Add an empty line for better readability
    else:
        print("creature_template is using modern structure")
        print("")

# Default Value Stripping
stripped_query = strip_default_values(parsed_query)
print("Stripped Query:")
print(stripped_query) 
print("")

# Primary Query Outputs
print("New Query:")
new_query(stripped_query)
print("")

# Secondary Query Outputs
if secondary_queries:
    need_delete = True
    for i, secondary_query in enumerate(secondary_queries, start=1):

        if need_delete:
            table_name = secondary_query["table_name"]
            field_value_pairs = secondary_query["field_value_pairs"]
            for field, value in field_value_pairs.items():
                if field == "`CreatureID`":
                    creature_id = value
            print(f"DELETE FROM `{table_name}` WHERE `CreatureID` = {creature_id};")
            delete = True
        
        new_query(secondary_query)





