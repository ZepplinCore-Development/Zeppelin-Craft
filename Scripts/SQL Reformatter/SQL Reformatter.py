import re

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
        "`subname`": None,
        "`IconName`": None,
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
        "`VerifiedBuild`": None
    },

    "creature_template_model" : {
    "`CreatureID`": None,
    "`Idx`": 0,
    "`CreatureDisplayID`": None,
    "`DisplayScale`": 1,
    "`Probability`": 0,
    "`VerifiedBuild`": None,
    },    

}

def validate_table_structure(table_name, fields):
    """
    Validates the fields from the query against the defined table structure.
    """
    if table_name not in TABLE_STRUCTURES:
        return f"Table '{table_name}' is not defined in TABLE_STRUCTURES."

    table_info = TABLE_STRUCTURES[table_name]
    expected_fields = set(table_info.keys())
    query_fields = set(fields)

    # Check for missing fields and extra fields
    missing_fields = expected_fields - query_fields
    extra_fields = query_fields - expected_fields

    results = {
        "missing_fields": missing_fields,
        "extra_fields": extra_fields,
        "default_values": {field: table_info.get(field) for field in missing_fields}
    }
    return results

def extract_table_name(query):
    match = re.search(r"INSERT INTO\s+`?(\w+)`?", query, re.IGNORECASE)
    if match:
        return match.group(1).lower()  # Normalize to lowercase
    return None

def parse_insert_query(query):
    table_name = extract_table_name(query)
    if not table_name:
        raise ValueError("Table name not found in the query")
    print(f"Table Name: {table_name}")
    print("")

    # Match the fields
    fields_match = re.search(r"\((.*?)\)\s+VALUES", query, re.DOTALL)
    if not fields_match:
        raise ValueError("fields not found in the query")
    fields = [field.strip(' "') for field in fields_match.group(1).split(',')]
    #print(f"fields: {fields}")
    #print("")

    # Match the values
    values_match = re.search(r"VALUES\s*\((.*?)\)\s*;", query, re.DOTALL)
    if not values_match:
        raise ValueError("Values not found in the query")
    values = [value.strip() for value in values_match.group(1).split(',')]
    #print(f"Values: {values}")
    #print("")

    # Ensure the lengths match
    if len(fields) != len(values):
        raise ValueError("Number of fields does not match the number of values")

    # Combine fields and values
    field_value_pairs = dict(zip(fields, values))
    print(f"field-Value Pairs: {field_value_pairs}")
    print("")

    return {
        "table_name": table_name,
        "fields": fields,
        "values": values,
        "field_value_pairs": field_value_pairs
    }

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

        # Handle special cases for SQL NULL and empty strings
        if isinstance(value, str):
            if value.upper() == "NULL":  # SQL NULL
                value = None
            elif value.startswith("'") and value.endswith("'"):  # Strip quotes from strings
                value = value[1:-1]

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
        "field_value_pairs": field_value_pairs
    }

    return updated_primary_query, secondary_queries

def new_insert_query(query):
    """
    Prints a new SQL INSERT query with strict formatting.
    Example format:
    INSERT INTO TABLE_NAME SET
        Field1 = Value1,
        Field2 = Value2,
        ...;
    """
    table_name = query.get("table_name")
    field_value_pairs = query.get("field_value_pairs")

    if not table_name or not field_value_pairs:
        print("Error: Query is missing table_name or field_value_pairs.")
        return

    # Start building the SQL query
    print(f"INSERT INTO {table_name} SET")

    # Format each field-value pair
    formatted_pairs = []
    for field, value in field_value_pairs.items():
        # Ensure proper formatting of values (e.g., quotes for strings)
        if isinstance(value, str):
            formatted_value = f"'{value}'"
        elif value is None:
            formatted_value = "NULL"
        else:
            formatted_value = value
        formatted_pairs.append(f"    {field} = {formatted_value}")

    # Join all pairs with commas and print
    print(",\n".join(formatted_pairs) + ";")

# Example usage
query = """
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `speed_swim`, `speed_flight`, `detection_range`, `scale`, `rank`, `dmgschool`, `DamageModifier`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES
(190011, 0, 0, 0, 0, 0, 20988, 0, 0, 0, 'Vitalik', 'Reagent Bank', NULL, 0, 6, 6, 0, 35, 1, 1, 1, 1, 1, 20, 1, 0, 0, 1, 2000, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 138412032, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 2, 'npc_reagent_banker_account', NULL);
"""

# Parse
parsed_query = parse_insert_query(query)  # Parse the query using the previously defined function

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
stripped_field_value_pairs = strip_default_values(parsed_query)

# Primary Query Outputs
new_insert_query(stripped_field_value_pairs)
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
            print(f"DELETE FROM {table_name} WHERE `CreatureID` = {creature_id};")
            delete = True
        
        new_insert_query(secondary_query)





