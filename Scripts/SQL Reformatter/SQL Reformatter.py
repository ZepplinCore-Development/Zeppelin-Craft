import re

### TO DO ###
# Allow multiple entries in the INSERT VALUES Method
# Stop Multiple deletes with there are lots of secondary queries...
# Stop inserting NULL for empty strings
# Handle comments inside a query...

# Example usage
query = """




INSERT INTO `item_template` (`entry`, `class`, `subclass`, `SoundOverrideSubclass`, `name`, `displayid`, `Quality`, `Flags`, `FlagsExtra`, `BuyCount`, `BuyPrice`, `SellPrice`, `InventoryType`, `AllowableClass`, `AllowableRace`, `ItemLevel`, `RequiredLevel`, `RequiredSkill`, `RequiredSkillRank`, `requiredspell`, `requiredhonorrank`, `RequiredCityRank`, `RequiredReputationFaction`, `RequiredReputationRank`, `maxcount`, `stackable`, `ContainerSlots`, `StatsCount`, `stat_type1`, `stat_value1`, `stat_type2`, `stat_value2`, `stat_type3`, `stat_value3`, `stat_type4`, `stat_value4`, `stat_type5`, `stat_value5`, `stat_type6`, `stat_value6`, `stat_type7`, `stat_value7`, `stat_type8`, `stat_value8`, `stat_type9`, `stat_value9`, `stat_type10`, `stat_value10`, `ScalingStatDistribution`, `ScalingStatValue`, `dmg_min1`, `dmg_max1`, `dmg_type1`, `dmg_min2`, `dmg_max2`, `dmg_type2`, `armor`, `holy_res`, `fire_res`, `nature_res`, `frost_res`, `shadow_res`, `arcane_res`, `delay`, `ammo_type`, `RangedModRange`, `spellid_1`, `spelltrigger_1`, `spellcharges_1`, `spellppmRate_1`, `spellcooldown_1`, `spellcategory_1`, `spellcategorycooldown_1`, `spellid_2`, `spelltrigger_2`, `spellcharges_2`, `spellppmRate_2`, `spellcooldown_2`, `spellcategory_2`, `spellcategorycooldown_2`, `spellid_3`, `spelltrigger_3`, `spellcharges_3`, `spellppmRate_3`, `spellcooldown_3`, `spellcategory_3`, `spellcategorycooldown_3`, `spellid_4`, `spelltrigger_4`, `spellcharges_4`, `spellppmRate_4`, `spellcooldown_4`, `spellcategory_4`, `spellcategorycooldown_4`, `spellid_5`, `spelltrigger_5`, `spellcharges_5`, `spellppmRate_5`, `spellcooldown_5`, `spellcategory_5`, `spellcategorycooldown_5`, `bonding`, `description`, `PageText`, `LanguageID`, `PageMaterial`, `startquest`, `lockid`, `Material`, `sheath`, `RandomProperty`, `RandomSuffix`, `block`, `itemset`, `MaxDurability`, `area`, `Map`, `BagFamily`, `TotemCategory`, `socketColor_1`, `socketContent_1`, `socketColor_2`, `socketContent_2`, `socketColor_3`, `socketContent_3`, `socketBonus`, `GemProperties`, `RequiredDisenchantSkill`, `ArmorDamageModifier`, `duration`, `ItemLimitCategory`, `HolidayId`, `ScriptName`, `DisenchantID`, `FoodType`, `minMoneyLoot`, `maxMoneyLoot`, `flagsCustom`, `VerifiedBuild`) VALUES
(901106, 4, 1, -1, 'Ogre Mantle', 4904, 3, 0, 0, 1, 6855, 1371, 3, -1, -1, 28, 22, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 5, 10, 6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 1, '', 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, '', 4, 0, 0, 0, 0, 12340);









"""

# Define the table structure and default values
TABLE_STRUCTURES = {
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

def parse_insert_query(query):
    """
    Parses an SQL INSERT query and extracts the table name, fields, values, and optionally comments.
    Supports both `SET` syntax and `(fields) VALUES` syntax.
    """
    # Extract table name
    table_name = extract_table_name(query)
    if not table_name:
        raise ValueError("Table name not found in the query")
    print(f"Table Name: {table_name}\n")

    # Check for SET syntax
    set_match = re.search(r"SET\s+(.*?)$", query, re.DOTALL)
    if set_match:
        # Parse the `field = value` pairs from the SET clause
        set_clause = set_match.group(1)
        field_value_pairs = {}
        comments = {}

        # Split the set clause into lines and process each line individually
        for line in set_clause.splitlines():
            # Match field, value, and comment
            match = re.match(r"(`\w+`)\s*=\s*(.*?)(?:\s*--\s*(.*))?$", line.strip())
            if match:
                field = match.group(1).strip()
                value = match.group(2).strip().rstrip(',')
                comment = match.group(3).strip() if match.group(3) else None
                value = parse_value(value)  # Process the value with our function

                # Add field and value to the dictionary
                field_value_pairs[field] = value

                # Store comments if they exist
                if comment:
                    comments[field] = comment

        return {
            "table_name": table_name,
            "fields": list(field_value_pairs.keys()),
            "values": list(field_value_pairs.values()),
            "field_value_pairs": field_value_pairs,
            "comments": comments,  # Optional: associate comments with fields
        }

    # Check for (fields) VALUES syntax
    fields_match = re.search(r"\((.*?)\)\s+VALUES", query, re.DOTALL)
    values_match = re.search(r"VALUES\s*\((.*?)\)\s*;", query, re.DOTALL)
    comments = {}

    if fields_match and values_match:
        # Extract fields enclosed in backticks
        fields = [field.strip("` ") for field in fields_match.group(1).split(",")]
        values = [value.strip() for value in values_match.group(1).split(",")]

        # Iterate over the values and update the list with parsed values
        for i in range(len(values)):
            values[i] = parse_value(values[i])  # Process and update the value in place

        # Ensure the lengths match
        if len(fields) != len(values):
            raise ValueError("Number of fields does not match the number of values")

        # Combine fields and values
        field_value_pairs = dict(zip([f"`{field}`" for field in fields], values))
        return {
            "table_name": table_name,
            "fields": list(field_value_pairs.keys()),
            "values": list(field_value_pairs.values()),
            "field_value_pairs": field_value_pairs,
            "comments": comments,  # Optional: associate comments with fields
        }

    # If neither syntax is matched, raise an error
    raise ValueError("Could not parse the query. Unsupported format.")

def strip_default_values(query):
    """
    Strips fields with default values from the query while maintaining the same structure for input and output.
    """
    table_name = query["table_name"]
    field_value_pairs = query["field_value_pairs"]

    # Get the default values for the table
    if table_name not in TABLE_STRUCTURES:
        print("Could not find the table when checking for default values")
        return query  # Return the original query if no default values are found

    table_info = TABLE_STRUCTURES[table_name]

    # Strip fields where the value matches the default value
    cleaned_field_value_pairs = {}
    for field, value in field_value_pairs.items():
        default_value = table_info.get(field)

        # Convert value to match the type of the default value
        if isinstance(default_value, int):
            try:
                value = int(value)
            except ValueError:
                pass  # Leave as string if conversion fails
        elif isinstance(default_value, float):
            try:
                value = float(value)
            except ValueError:
                pass  # Leave as string if conversion fails

        # If the value is not equal to the default value, keep it
        if value != default_value:
            cleaned_field_value_pairs[field] = value

    # Return the updated query with cleaned field_value_pairs
    updated_query = query.copy()
    updated_query["field_value_pairs"] = cleaned_field_value_pairs
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

def new_insert_query(query):
    """
    Prints a new SQL INSERT query with strict formatting, including comments.
    Example format:
    INSERT INTO TABLE_NAME SET
        Field1 = Value1, -- Comment1
        Field2 = Value2, -- Comment2
        ...;
    """
    table_name = query.get("table_name")
    field_value_pairs = query.get("field_value_pairs")
    comments = query.get("comments", {})

    if not table_name or not field_value_pairs:
        print("Error: Query is missing table_name or field_value_pairs.")
        return

    # Start building the SQL query
    print(f"INSERT INTO `{table_name}` SET")

    # Format each field-value pair with comments if available
    formatted_pairs = []
    for index, (field, value) in enumerate(field_value_pairs.items()):
        # Ensure proper formatting of values (e.g., quotes for strings)
        if isinstance(value, str) and not value.startswith("'"):
            formatted_value = f"'{value}'"
        elif value is None:
            formatted_value = "NULL"
        else:
            formatted_value = value

        # Add the comment for the field if it exists
        comment = f" -- {comments[field]}" if field in comments else ""

        # Check if it's the last field and format accordingly
        if index == len(field_value_pairs) - 1:
            formatted_pairs.append(f"    {field} = {formatted_value};{comment}")
        else:
            formatted_pairs.append(f"    {field} = {formatted_value},{comment}")

    # Join all pairs and print
    print("\n".join(formatted_pairs))



# Parse
parsed_query = parse_insert_query(query)  # Parse the query using the previously defined function
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
new_insert_query(stripped_query)
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
        
        new_insert_query(secondary_query)





