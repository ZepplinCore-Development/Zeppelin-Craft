import re

### TO DO ###
# Allow multiple entries in the INSERT VALUES Method
# Stop Multiple deletes with there are lots of secondary queries...
# Stop inserting NULL for empty strings
# Handle comments inside a query...

# Example usage
query = """

INSERT INTO `creature` (id1,id2,id3,`map`,zoneId,areaId,spawnMask,phaseMask,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,wander_distance,currentwaypoint,curhealth,curmana,MovementType,npcflag,unit_flags,dynamicflags,ScriptName,VerifiedBuild,CreateObject,Comment) VALUES
(19778,0,0,530,0,0,1,1,0,-3781.55,-11541.8,-134.744,1.93941,120,0.0,0,811,852,0,0,0,0,'',0,0,NULL), -- Exodar
(19778,0,0,0,0,0,1,1,0,-8714.31,620.134,100.927,0.0639622,300,0.0,0,811,852,0,0,0,0,'',NULL,0,NULL); -- Stormwind








"""

# Define the table structure and default values
TABLE_STRUCTURES = {
    "achievement_criteria_data": {
        "`criteria_id`": 0,
        "`type`": 0,
        "`value1`": 0,
        "`value2`": 0,
        "`ScriptName`": "",
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

    "creature_template_model" : {
    "`CreatureID`": "",
    "`Idx`": 0,
    "`CreatureDisplayID`": "",
    "`DisplayScale`": 1,
    "`Probability`": 0,
    "`VerifiedBuild`": "",
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
    }


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

def parse_values_syntax(query, table_name, query_type):
    """
    Parses the (fields) VALUES (values) syntax variant of INSERT/REPLACE queries.
    Properly handles parentheses while excluding them from the captured values.
    """
    # Extract field list
    fields_match = re.search(r"\((.*?)\)\s+VALUES", query, re.DOTALL | re.IGNORECASE)
    if not fields_match:
        raise ValueError("Fields list not found in VALUES syntax query")
    
    fields = [f'`{field.strip("` ")}`' for field in fields_match.group(1).split(",")]
    num_fields = len(fields)

    # Find the VALUES clause
    values_match = re.search(r"VALUES\s*", query, re.IGNORECASE)
    if not values_match:
        raise ValueError("VALUES clause not found in query")
    
    values_content = query[values_match.end():]
    values_sets = []
    comments = {}
    field_value_pairs = {}
    
    # New parsing approach that properly handles parentheses
    current_set = []
    current_value = []
    in_quotes = False
    in_value = False
    paren_depth = 0
    
    i = 0
    while i < len(values_content):
        char = values_content[i]
        
        if char == "'":
            in_quotes = not in_quotes
            current_value.append(char)
            i += 1
        elif char == "(" and not in_quotes:
            if paren_depth == 0:  # Start of new value set
                current_set = []
                in_value = True
            else:
                current_value.append(char)
            paren_depth += 1
            i += 1
        elif char == ")" and not in_quotes:
            paren_depth -= 1
            if paren_depth == 0:  # End of current value set
                if current_value:  # Add the last value
                    current_set.append("".join(current_value).strip())
                    current_value = []
                if len(current_set) == num_fields:
                    values_sets.append(current_set)
                in_value = False
                
                # Look for comment after this tuple
                remaining_content = values_content[i+1:]
                if "--" in remaining_content:
                    comment_start = remaining_content.find("--")
                    comment_end = remaining_content.find("\n", comment_start)
                    comment = remaining_content[comment_start:comment_end].strip()
                    comments[len(values_sets)-1] = comment[2:].strip()
            else:
                current_value.append(char)
            i += 1
        elif char == "," and not in_quotes and in_value:
            if current_value:  # Add completed value
                current_set.append("".join(current_value).strip())
                current_value = []
            i += 1
        elif in_value:
            current_value.append(char)
            i += 1
        else:
            i += 1
    
    # Process all collected value sets
    for row_idx, values in enumerate(values_sets):
        parsed_values = []
        for val in values:
            # Remove surrounding quotes if present
            if len(val) >= 2 and val[0] == "'" and val[-1] == "'":
                val = val[1:-1]
            parsed_values.append(parse_value(val))
        
        if len(parsed_values) != num_fields:
            raise ValueError(f"Field count mismatch. Expected {num_fields}, got {len(parsed_values)}")
        
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
        return parse_set_syntax(normalized_query, table_name, query_type)
    # Check for explicit VALUES syntax (must appear after fields list)
    elif re.search(r"\)\s+VALUES\s*\(", normalized_query, re.IGNORECASE):
        return parse_values_syntax(normalized_query, table_name, query_type)
    else:
        raise ValueError("Could not parse the query. Unsupported format.")

def strip_default_values(query):
    """
    Strips fields with default values from the query while maintaining the same structure for input and output.
    Handles both single-row and multi-row queries with proper type conversion.
    """
    table_name = query["table_name"]
    field_value_pairs = query["field_value_pairs"]

    # Get the default values for the table
    if table_name not in TABLE_STRUCTURES:
        print(f"Warning: Could not find table '{table_name}' when checking for default values")
        return query  # Return the original query if no default values are found

    table_info = TABLE_STRUCTURES[table_name]
    cleaned_field_value_pairs = {}

    for row_idx, row_data in field_value_pairs.items():
        cleaned_row = {}
        for field, value in row_data.items():
            default_value = table_info.get(field)

            if default_value is None:
                # Keep the field if we don't have default value info
                cleaned_row[field] = value
                print("NO DEFAULT VALUE")
                continue

            # Convert string values to proper types before comparison
            try:
                if isinstance(default_value, int):
                    # Handle empty strings and NULL values
                    print("DEFAULT VALUE IS INT")
                    if value == '' or value is None:
                        converted_value = 0
                    else:
                        converted_value = int(float(value)) if '.' in str(value) else int(value)
                elif isinstance(default_value, float):
                    print("DEFAULT VALUE IS FLOAT")
                    converted_value = float(value) if value not in ('', None) else 0.0
                elif isinstance(default_value, str):
                    print("DEFAULT VALUE IS STRING")
                    # Remove surrounding quotes if present
                    if isinstance(value, str) and len(value) >= 2 and value[0] == "'" and value[-1] == "'":
                        converted_value = value[1:-1]
                    else:
                        converted_value = str(value)
                else:
                    converted_value = value
                    print("UNABLE TO MATCH DEFAULT VALUES TYPE")
            except (ValueError, TypeError):
                converted_value = value
                print("UNABLE TO MATCH DEFAULT VALUES TYPE")

            # Special handling for NULL values
            if str(value).upper() == 'NULL':
                if default_value is not None:
                    cleaned_row[field] = 'NULL'
                continue

            # If the value is not equal to the default value, keep it
            if converted_value != default_value:
                # Preserve the original value's type where possible
                if isinstance(default_value, int) and isinstance(converted_value, int):
                    cleaned_row[field] = converted_value
                elif isinstance(default_value, float) and isinstance(converted_value, float):
                    cleaned_row[field] = converted_value
                else:
                    cleaned_row[field] = value

        # Only add the row if it has any non-default values
        if cleaned_row:
            cleaned_field_value_pairs[row_idx] = cleaned_row

    # Return the updated query with cleaned field_value_pairs
    updated_query = query.copy()
    updated_query["field_value_pairs"] = cleaned_field_value_pairs
    
    # Update the values list to match the cleaned field_value_pairs
    if query.get("multiple_rows", False):
        updated_query["values"] = [list(row.values()) for row in cleaned_field_value_pairs.values()]
    elif cleaned_field_value_pairs:
        # For single row case
        updated_query["values"] = list(cleaned_field_value_pairs[0].values())
    
    return updated_query

def creature_template_update(primary_query):
    """
    Updates the `creature_template` query by removing modelid fields and generates
    a secondary query for the `creature_template_model` table. Ensures both queries
    include `field_value_pairs` in the same structure.
    """
    # Extract fields and values from the primary query
    fields = primary_query["fields"]
    values = primary_query["values"]
    comments = primary_query["comments"]
    field_value_pairs = dict(zip(fields, values))  # Create field-value pairs
    
    # Get the 'entry' field value from creature_template to use as CreatureID
    entry_index = fields.index("`entry`")
    creature_id = values[entry_index]

    # Identify modelid fields and their values
    modelid_fields = ["`modelid1`", "`modelid2`", "`modelid3`", "`modelid4`"]
    modelid_indexes = [fields.index(field) for field in modelid_fields if field in fields]
    modelid_values = [values[idx] for idx in modelid_indexes if values[idx] != '0']

    # Create secondary queries for each modelid
    secondary_queries = []
    num_models = len(modelid_values)
    if num_models > 0:
        probability = 1 / num_models  # Set equal probability for each modelid
        for idx, modelid in enumerate(modelid_values, start=1):
            # Create the secondary query for creature_template_model
            secondary_field_value_pairs = {
                "`CreatureID`": creature_id,
                "`idx`": idx,
                "`CreatureDisplayID`": modelid,
                "`probability`": probability
            }
            secondary_query = {
                "table_name": "creature_template_model",
                "fields": list(secondary_field_value_pairs.keys()),
                "values": list(secondary_field_value_pairs.values()),
                "field_value_pairs": secondary_field_value_pairs
            }
            secondary_queries.append(secondary_query)

    # Remove modelid fields from the primary query
    for idx in sorted(modelid_indexes, reverse=True):
        fields.pop(idx)
        values.pop(idx)
        del field_value_pairs[modelid_fields[modelid_indexes.index(idx)]]

    # Return the updated primary query and the list of secondary queries
    updated_primary_query = {
        "table_name": primary_query["table_name"],
        "fields": fields,
        "values": values,
        "field_value_pairs": field_value_pairs,
        "comments": comments,  # Optional: associate comments with fields
    }

    return updated_primary_query, secondary_queries

def new_query(query):
    """
    Generates DELETE and INSERT statements for each row instead of REPLACE.
    This provides better control when we're excluding default values.
    """
    table_name = query.get("table_name")
    query_type = query.get("query_type", "REPLACE").upper()
    field_value_pairs = query.get("field_value_pairs", {})
    comments = query.get("comments", {})
    fields = query.get("fields", [])

    if not table_name or not field_value_pairs:
        print("Error: Query is missing table_name or field_value_pairs.")
        return

    # Find primary key field (assuming first field is PK)
    primary_key_field = fields[0] if fields else None

    for row_idx, row_data in field_value_pairs.items():
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
        for i, field in enumerate(fields):
            if field not in row_data:
                continue  # Skip fields that were stripped as defaults
                
            value = row_data[field]
            
            # Format the value appropriately
            if value is None:
                formatted_value = "NULL"
            elif isinstance(value, str):
                formatted_value = f"'{value}'" if not value.startswith("'") else value
            else:
                formatted_value = str(value)

            # Format the line (comma except for last field)
            is_last_field = (i == len(fields) - 1 or 
                           field == list(row_data.keys())[-1])
            
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
print(stripped_query) 
print("")

# Primary Query Outputs
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





