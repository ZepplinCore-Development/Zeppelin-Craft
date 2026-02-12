#!/usr/bin/env python3
"""
SQL Reformatter - Formats and optimizes SQL INSERT/REPLACE queries

Features:
- Strips default values based on table structure
- Converts creature_template modelid fields to creature_template_model format
- Formats output as DELETE + INSERT statements
- Preserves inline comments
- Supports both INSERT...SET and INSERT...VALUES syntax

Usage:
    # Format query from file
    python3 "SQL Reformatter.py" --file path/to/query.sql

    # Format query from command line
    python3 "SQL Reformatter.py" --query "INSERT INTO table SET field='value';"

    # Save output to file
    python3 "SQL Reformatter.py" --file query.sql --output formatted.sql

    # Refresh table structures from database
    python3 "SQL Reformatter.py" --refresh-schema
"""

import re
import argparse
import json
import os
import sys
from pathlib import Path

# Get script directory for file paths
SCRIPT_DIR = Path(__file__).parent
SCHEMA_CACHE_FILE = SCRIPT_DIR / "table_structures.json"
ENV_FILE = SCRIPT_DIR / ".env"

### TO DO ###
# Allow multiple entries in the INSERT VALUES Method
# Stop Multiple deletes with there are lots of secondary queries...
# Stop inserting NULL for empty strings
# Handle comments inside a query...

# Global variable to hold table structures (loaded from cache or DB)
TABLE_STRUCTURES = {}

def load_schema():
    """Load table structures from cached JSON file."""
    global TABLE_STRUCTURES

    if not SCHEMA_CACHE_FILE.exists():
        print(f"Error: Schema cache file not found at {SCHEMA_CACHE_FILE}", file=sys.stderr)
        print("Please run with --refresh-schema first to build the cache.", file=sys.stderr)
        sys.exit(1)

    try:
        with open(SCHEMA_CACHE_FILE, 'r') as f:
            TABLE_STRUCTURES = json.load(f)
        print(f"Loaded schema for {len(TABLE_STRUCTURES)} tables from cache", file=sys.stderr)
    except Exception as e:
        print(f"Error loading schema cache: {e}", file=sys.stderr)
        sys.exit(1)

def refresh_schema():
    """Query database and rebuild table structures cache."""
    try:
        import mysql.connector
        from dotenv import load_dotenv
    except ImportError:
        print("Error: Required packages not installed.", file=sys.stderr)
        print("Install with: pip3 install mysql-connector-python python-dotenv", file=sys.stderr)
        sys.exit(1)

    # Load .env file
    if not ENV_FILE.exists():
        print(f"Error: .env file not found at {ENV_FILE}", file=sys.stderr)
        print("Copy .env.example to .env and configure your database credentials.", file=sys.stderr)
        sys.exit(1)

    load_dotenv(ENV_FILE)

    # Define both database connections
    databases = [
        {
            'name': 'AzerothCore',
            'host': os.getenv('ACORE_HOST'),
            'port': int(os.getenv('ACORE_PORT', 3306)),
            'user': os.getenv('ACORE_USER'),
            'password': os.getenv('ACORE_PASSWORD'),
            'database': os.getenv('ACORE_DATABASE')
        },
        {
            'name': 'DBC',
            'host': os.getenv('DBC_HOST'),
            'port': int(os.getenv('DBC_PORT', 3306)),
            'user': os.getenv('DBC_USER'),
            'password': os.getenv('DBC_PASSWORD'),
            'database': os.getenv('DBC_DATABASE')
        }
    ]

    table_structures = {}

    # Query both databases
    for db_config in databases:
        print(f"\n[{db_config['name']}] Connecting to {db_config['user']}@{db_config['host']}:{db_config['port']}/{db_config['database']}...", file=sys.stderr)

        try:
            conn = mysql.connector.connect(
                host=db_config['host'],
                port=db_config['port'],
                user=db_config['user'],
                password=db_config['password'],
                database=db_config['database']
            )
            cursor = conn.cursor(dictionary=True)

            # Query all tables in the database
            cursor.execute("""
                SELECT DISTINCT TABLE_NAME
                FROM INFORMATION_SCHEMA.COLUMNS
                WHERE TABLE_SCHEMA = %s
                ORDER BY TABLE_NAME
            """, (db_config['database'],))

            tables = [row['TABLE_NAME'] for row in cursor.fetchall()]
            print(f"[{db_config['name']}] Found {len(tables)} tables, building structure cache...", file=sys.stderr)

            for table_name in tables:
                # Get column defaults for this table
                cursor.execute("""
                    SELECT
                        COLUMN_NAME,
                        COLUMN_DEFAULT,
                        DATA_TYPE,
                        IS_NULLABLE
                    FROM INFORMATION_SCHEMA.COLUMNS
                    WHERE TABLE_SCHEMA = %s AND TABLE_NAME = %s
                    ORDER BY ORDINAL_POSITION
                """, (db_config['database'], table_name))

                columns = {}
                for col in cursor.fetchall():
                    col_name = f"`{col['COLUMN_NAME']}`"
                    default_value = col['COLUMN_DEFAULT']

                    # Convert default value to appropriate Python type
                    if default_value is None:
                        if col['IS_NULLABLE'] == 'YES':
                            columns[col_name] = None
                        else:
                            # No default and not nullable - must be provided
                            continue
                    elif col['DATA_TYPE'] in ('int', 'tinyint', 'smallint', 'mediumint', 'bigint'):
                        columns[col_name] = int(default_value) if default_value else 0
                    elif col['DATA_TYPE'] in ('float', 'double', 'decimal'):
                        columns[col_name] = float(default_value) if default_value else 0.0
                    elif col['DATA_TYPE'] in ('varchar', 'text', 'char', 'mediumtext', 'longtext'):
                        columns[col_name] = str(default_value) if default_value else ""
                    else:
                        columns[col_name] = default_value

                table_structures[table_name] = columns

            cursor.close()
            conn.close()

        except mysql.connector.Error as e:
            print(f"[{db_config['name']}] Database error: {e}", file=sys.stderr)
            print(f"[{db_config['name']}] Skipping this database...", file=sys.stderr)
            continue

    # Save to JSON file
    try:
        with open(SCHEMA_CACHE_FILE, 'w') as f:
            json.dump(table_structures, f, indent=2)

        print(f"\n✓ Schema cache saved to {SCHEMA_CACHE_FILE}", file=sys.stderr)
        print(f"✓ Cached {len(table_structures)} tables total", file=sys.stderr)

    except Exception as e:
        print(f"Error saving schema cache: {e}", file=sys.stderr)
        sys.exit(1)

# Example usage (now only used if no arguments provided)
query = """

INSERT INTO script_waypoint (entry,pointid,location_x,location_y,location_z,waittime,point_comment) VALUES
	 (16295,0,7545.07,-7359.87,162.354,4000,'SAY_START'),
	 (16295,1,7550.05,-7362.24,162.236,0,''),
	 (16295,2,7566.98,-7364.32,161.739,0,''),
	 (16295,3,7578.83,-7361.68,161.739,0,''),
	 (16295,4,7590.97,-7359.05,162.258,0,''),
	 (16295,5,7598.35,-7362.82,162.257,4000,'SAY_PROGRESS_1'),
	 (16295,6,7605.86,-7380.42,161.937,0,''),
	 (16295,7,7605.3,-7387.38,157.254,0,''),
	 (16295,8,7606.13,-7393.89,156.942,0,''),
	 (16295,9,7615.21,-7400.19,157.143,0,''),
	 (16295,10,7618.96,-7402.65,158.202,0,''),
	 (16295,11,7636.85,-7401.76,162.145,0,'SAY_PROGRESS_2'),
	 (16295,12,7637.06,-7404.94,162.207,4000,''),
	 (16295,13,7636.91,-7412.59,162.366,0,''),
	 (16295,14,7637.61,-7425.59,162.631,0,''),
	 (16295,15,7637.82,-7459.06,163.303,0,''),
	 (16295,16,7638.86,-7470.9,162.517,0,''),
	 (16295,17,7641.4,-7488.22,157.381,0,''),
	 (16295,18,7634.46,-7505.45,154.682,0,'SAY_PROGRESS_3'),
	 (16295,19,7631.91,-7516.95,153.597,0,''),
	 (16295,20,7622.23,-7537.04,151.587,0,''),
	 (16295,21,7610.92,-7550.67,149.639,0,''),
	 (16295,22,7598.23,-7562.55,145.954,0,''),
	 (16295,23,7588.51,-7577.76,148.294,0,''),
	 (16295,24,7567.34,-7608.46,146.006,0,''),
	 (16295,25,7562.55,-7617.42,148.098,0,''),
	 (16295,26,7561.51,-7645.06,151.245,0,''),
	 (16295,27,7563.34,-7654.65,151.227,0,''),
	 (16295,28,7565.53,-7658.3,151.249,0,''),
	 (16295,30,7579.12,-7662.21,151.652,0,'quest complete'),
	 (16295,31,7603.77,-7667.0,153.998,0,''),
	 (16295,32,7603.77,-7667.0,153.998,4000,'SAY_END_1'),
	 (16295,33,7603.77,-7667.0,153.998,8000,'SAY_END_2'),
	 (16295,34,7603.77,-7667.0,153.998,0,''),
	 (16295,39,7571.16,-7659.12,151.245,0,'');



"""


# Table structures are now loaded from table_structures.json cache file
# Use --refresh-schema to rebuild the cache from the database


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

def _strip_inline_comments(set_clause):
    """
    Strips inline SQL comments (-- ...) from a SET clause while respecting
    quoted strings. Returns the clause with comments removed and a mapping
    of each field name to its inline comment text.

    This must be done BEFORE splitting on commas, because:
    1. Comments after commas (e.g. "5, -- Reagent") cause the comment text
       to be prepended to the next field's piece after a comma split.
    2. Comments containing commas (e.g. "-- type 24, mask 7") create
       spurious extra pieces when split on commas.
    """
    result = []
    comments = {}
    i = 0
    in_single_quote = False
    last_field = None

    while i < len(set_clause):
        char = set_clause[i]

        # Handle quoted strings - don't strip comments inside them
        if char == "'" and not in_single_quote:
            in_single_quote = True
            result.append(char)
            i += 1
        elif char == "'" and in_single_quote:
            # Check for escaped quote ''
            if i + 1 < len(set_clause) and set_clause[i + 1] == "'":
                result.append("''")
                i += 2
            else:
                in_single_quote = False
                result.append(char)
                i += 1
        elif char == '-' and not in_single_quote and i + 1 < len(set_clause) and set_clause[i + 1] == '-':
            # Found a -- comment outside of quotes. Extract comment text
            # until end of line (newline) or end of string.
            comment_start = i + 2
            comment_end = set_clause.find('\n', comment_start)
            if comment_end == -1:
                comment_text = set_clause[comment_start:].strip()
                i = len(set_clause)
            else:
                comment_text = set_clause[comment_start:comment_end].strip()
                # Keep the newline in the result (it's not part of the comment)
                result.append('\n')
                i = comment_end + 1

            # Associate comment with the most recently seen field
            if comment_text and last_field:
                comments[last_field] = comment_text
        else:
            result.append(char)
            i += 1

        # Track the most recently seen backtick-quoted field name for
        # comment association. We look at what we've accumulated so far.
        if not in_single_quote and char == '=' and len(result) >= 2:
            # Walk backwards through result to find the field name
            text_so_far = ''.join(result).rstrip()
            field_match = re.search(r'(`\w+`|\b\w+)\s*=$', text_so_far)
            if field_match:
                fname = field_match.group(1).strip()
                if not fname.startswith('`'):
                    fname = f'`{fname}`'
                last_field = fname

    return ''.join(result), comments


def parse_set_syntax(query, table_name, query_type):
    """
    Parses the SET syntax variant of INSERT/REPLACE queries.
    """
    set_match = re.search(r"SET\s+(.*?)(?:;|$)", query, re.DOTALL | re.IGNORECASE)
    if not set_match:
        raise ValueError("SET syntax not properly formatted")

    set_clause = set_match.group(1)

    # Strip inline comments BEFORE splitting on commas, to prevent comments
    # (which may contain commas or appear after commas) from breaking the split.
    stripped_clause, comments = _strip_inline_comments(set_clause)

    field_value_pairs = {}

    for line in stripped_clause.split(','):
        line = line.strip()
        if not line:
            continue

        # Match field and value (comments already stripped)
        match = re.match(r"(`\w+`|\w+)\s*=\s*(.+)$", line)
        if match:
            field = match.group(1).strip()
            if not field.startswith('`'):
                field = f'`{field}`'
            value = match.group(2).strip()

            field_value_pairs[field] = parse_value(value)

    return {
        "table_name": table_name,
        "query_type": query_type,
        "fields": list(field_value_pairs.keys()),
        "values": list(field_value_pairs.values()),
        "field_value_pairs": field_value_pairs,
        "comments": comments,
    }

def find_matching_parenthesis(s, start):
    """Finds the closing parenthesis matching the one at start position.
    Properly handles both single and double quoted strings."""
    depth = 1
    in_single_quote = False
    in_double_quote = False
    i = start + 1

    while i < len(s):
        char = s[i]

        # Handle escape sequences ('' for single, "" for double)
        if char == "'" and not in_double_quote:
            if i + 1 < len(s) and s[i + 1] == "'":
                i += 2  # Skip escaped single quote
                continue
            in_single_quote = not in_single_quote
        elif char == '"' and not in_single_quote:
            if i + 1 < len(s) and s[i + 1] == '"':
                i += 2  # Skip escaped double quote
                continue
            in_double_quote = not in_double_quote
        elif not in_single_quote and not in_double_quote:
            if char == "(":
                depth += 1
            elif char == ")":
                depth -= 1
                if depth == 0:
                    return i
        i += 1
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
        in_single_quote = False
        in_double_quote = False
        j = 0

        while j < len(tuple_content):
            char = tuple_content[j]

            # Handle escaped quotes
            if char == "'" and not in_double_quote:
                if j + 1 < len(tuple_content) and tuple_content[j + 1] == "'":
                    current_value.append("''")
                    j += 2
                    continue
                in_single_quote = not in_single_quote
                current_value.append(char)
            elif char == '"' and not in_single_quote:
                if j + 1 < len(tuple_content) and tuple_content[j + 1] == '"':
                    current_value.append('""')
                    j += 2
                    continue
                in_double_quote = not in_double_quote
                current_value.append(char)
            elif char == "," and not in_single_quote and not in_double_quote:
                current_set.append("".join(current_value).strip())
                current_value = []
            else:
                current_value.append(char)
            j += 1
        
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

def get_fields_from_schema(table_name):
    """Gets ordered field list from cached table schema."""
    if table_name not in TABLE_STRUCTURES:
        return None
    # Return all column names in order (schema preserves ORDINAL_POSITION order)
    return list(TABLE_STRUCTURES[table_name].keys())

def parse_values_no_fields(query, table_name, query_type):
    """
    Parses VALUES syntax without explicit field list by looking up schema.
    Example: INSERT INTO table VALUES (val1, val2, val3);
    """
    # Get field order from schema
    fields = get_fields_from_schema(table_name)
    if not fields:
        # Can't parse without schema, fall back to passthrough
        return {"passthrough": True, "original_query": query}

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
        in_single_quote = False
        in_double_quote = False
        j = 0

        while j < len(tuple_content):
            char = tuple_content[j]

            # Handle escaped quotes
            if char == "'" and not in_double_quote:
                if j + 1 < len(tuple_content) and tuple_content[j + 1] == "'":
                    current_value.append("''")
                    j += 2
                    continue
                in_single_quote = not in_single_quote
                current_value.append(char)
            elif char == '"' and not in_single_quote:
                if j + 1 < len(tuple_content) and tuple_content[j + 1] == '"':
                    current_value.append('""')
                    j += 2
                    continue
                in_double_quote = not in_double_quote
                current_value.append(char)
            elif char == "," and not in_single_quote and not in_double_quote:
                current_set.append("".join(current_value).strip())
                current_value = []
            else:
                current_value.append(char)
            j += 1

        if current_value:
            current_set.append("".join(current_value).strip())

        # Validate value count matches field count
        if len(current_set) != len(fields):
            # Value count mismatch - can't safely parse, use passthrough
            return {"passthrough": True, "original_query": query}

        row_idx = len(values_sets)
        values_sets.append(current_set)

        # Find comment after this tuple
        comment_start = values_content.find("--", tuple_end)
        if comment_start != -1:
            comment_end = len(values_content)
            for end_marker in ["\n", ";"]:
                marker_pos = values_content.find(end_marker, comment_start)
                if marker_pos != -1 and marker_pos < comment_end:
                    comment_end = marker_pos
            next_tuple = values_content.find("(", tuple_end)
            if next_tuple != -1 and next_tuple < comment_end:
                comment_end = next_tuple
            comment = values_content[comment_start+2:comment_end].strip()
            comment = re.sub(r"[;,]\s*$", "", comment)
            comments[row_idx] = comment

        pos = tuple_end + 1

    # Process all collected value sets
    for row_idx, values in enumerate(values_sets):
        parsed_values = [parse_individual_value(val) for val in values]
        field_value_pairs[row_idx] = dict(zip(fields, parsed_values))

    if not values_sets:
        return {"passthrough": True, "original_query": query}

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

def extract_values_content(query):
    """Extracts the content after VALUES clause."""
    values_match = re.search(r"VALUES\s*", query, re.IGNORECASE)
    if not values_match:
        raise ValueError("VALUES clause not found in query")
    return query[values_match.end():]


def strip_standalone_comments(query):
    """
    Removes standalone comment lines (lines that are ONLY comments) from a query.
    Preserves trailing comments on value/statement lines.

    This prevents normalization from breaking when comments appear between value rows:
    Before: VALUES\\n-- comment\\n(values...)
    After normalization without this: VALUES -- comment (values...)  <- broken
    After normalization with this: VALUES (values...)  <- works
    """
    lines = query.split('\n')
    filtered_lines = []

    for line in lines:
        stripped = line.strip()
        # Skip lines that are ONLY comments (no SQL content)
        if stripped.startswith('--') and not any(
            keyword in stripped.upper() for keyword in ['INSERT', 'DELETE', 'UPDATE', 'VALUES']
        ):
            continue
        filtered_lines.append(line)

    return '\n'.join(filtered_lines)

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
    # Strip standalone comment lines before normalization to prevent them from
    # breaking parsing (-- comments would eat the rest of a single-line normalized query)
    query_without_standalone_comments = strip_standalone_comments(query)

    # Normalize the query by removing extra whitespace for easier parsing
    normalized_query = ' '.join(query_without_standalone_comments.split()).replace(' ,', ',')

    # Check for INSERT...SELECT syntax - pass through unchanged (not reformattable)
    if re.search(r'\bSELECT\b', normalized_query, re.IGNORECASE):
        return {"passthrough": True, "original_query": query}
    
    # Extract basic components
    query_type = "INSERT" if "INSERT" in normalized_query.upper() else "REPLACE"
    table_name = extract_table_name(normalized_query)
    
    if not table_name:
        raise ValueError("Table name not found in the query")
    
    # More precise detection of query syntax
    # Look for SET or VALUES after the table name
    table_name_pos = normalized_query.upper().find(table_name.upper()) + len(table_name)
    query_remainder = normalized_query[table_name_pos:].strip()

    # Skip closing backtick if present after table name
    if query_remainder.startswith("`"):
        query_remainder = query_remainder[1:].strip()

    # Check for explicit SET syntax (must appear right after table name)
    if query_remainder.upper().startswith("SET"):
        # Pass the original query (with newlines) so inline comments can be
        # properly stripped before comma-splitting. The normalized single-line
        # form would cause -- comments to eat all subsequent SQL content.
        return parse_set_syntax(query_without_standalone_comments, table_name, query_type)
    # Check for explicit VALUES syntax (must appear after fields list)
    elif re.search(r"\)\s+VALUES\s*\(", normalized_query, re.IGNORECASE):
        return parse_values_syntax(normalized_query, table_name, query_type)
    # Check for VALUES syntax WITHOUT field list (e.g., INSERT INTO table VALUES (...))
    # Look up field order from schema to properly parse
    elif re.search(r"VALUES\s*\(", normalized_query, re.IGNORECASE):
        return parse_values_no_fields(normalized_query, table_name, query_type)
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

def extract_delete_table(delete_statement):
    """
    Extract table name from a DELETE statement.
    Returns table name or None if not found.
    """
    # Match: DELETE FROM table_name ...
    match = re.search(r'DELETE\s+FROM\s+`?(\w+)`?', delete_statement, re.IGNORECASE)
    if match:
        return match.group(1).lower()
    return None

def split_sql_statements(sql_text):
    """
    Split SQL text into individual statements, preserving comments.

    Returns list of tuples: (statement_type, content)
    statement_type can be: 'comment', 'blank', 'insert', 'replace', 'update', 'delete', 'other'
    """
    statements = []
    current_statement = []
    in_statement = False
    statement_type = None

    lines = sql_text.split('\n')

    for line in lines:
        stripped = line.strip()

        # Handle blank lines
        if not stripped:
            if in_statement:
                current_statement.append(line)
            else:
                statements.append(('blank', ''))
            continue

        # Handle comment lines
        if stripped.startswith('--'):
            if in_statement:
                current_statement.append(line)
            else:
                statements.append(('comment', line))
            continue

        # Check for statement start
        if not in_statement:
            upper_stripped = stripped.upper()
            if upper_stripped.startswith('INSERT'):
                statement_type = 'insert'
                in_statement = True
                current_statement = [line]
            elif upper_stripped.startswith('REPLACE'):
                statement_type = 'replace'
                in_statement = True
                current_statement = [line]
            elif upper_stripped.startswith('UPDATE'):
                statement_type = 'update'
                in_statement = True
                current_statement = [line]
            elif upper_stripped.startswith('DELETE'):
                statement_type = 'delete'
                in_statement = True
                current_statement = [line]
            else:
                # Other SQL statements (CREATE, ALTER, etc.)
                statement_type = 'other'
                in_statement = True
                current_statement = [line]
        else:
            # Continue building current statement
            current_statement.append(line)

        # Check for statement end (semicolon, possibly followed by comment)
        # Match: ends with ; OR has ; followed by whitespace and -- comment
        if in_statement and (stripped.endswith(';') or re.search(r';\s*(--.*)?$', stripped)):
            statements.append((statement_type, '\n'.join(current_statement)))
            current_statement = []
            in_statement = False
            statement_type = None

    # Handle any remaining statement without semicolon
    if current_statement:
        statements.append((statement_type, '\n'.join(current_statement)))

    return statements

def format_query(input_query, verbose=False, output_file=None):
    """
    Main query processing pipeline.

    Args:
        input_query: SQL query string to format
        verbose: Whether to print debug information
        output_file: File path to write output (None = stdout)

    Returns:
        Formatted SQL string
    """
    # Redirect output to capture or write to file
    if output_file:
        output_buffer = []
        original_print = print
        def captured_print(*args, **kwargs):
            # Capture print calls that don't go to stderr
            if kwargs.get('file') != sys.stderr:
                output_buffer.append(' '.join(str(arg) for arg in args))
        import builtins
        builtins.print = captured_print

    try:
        # Split input into individual statements
        statements = split_sql_statements(input_query)

        if verbose:
            print(f"Found {len(statements)} statements/blocks", file=sys.stderr)

        # Scan for existing DELETE statements to avoid redundant DELETE generation
        tables_with_deletes = set()
        for stmt_type, stmt_content in statements:
            if stmt_type == 'delete':
                table_name = extract_delete_table(stmt_content)
                if table_name:
                    tables_with_deletes.add(table_name)

        if verbose and tables_with_deletes:
            print(f"Found existing DELETE statements for tables: {', '.join(sorted(tables_with_deletes))}", file=sys.stderr)
            print(f"Will skip automatic DELETE generation for these tables", file=sys.stderr)

        for stmt_type, stmt_content in statements:
            if stmt_type in ('comment', 'blank'):
                # Pass through comments as-is; skip blank lines since
                # formatted output adds its own spacing between statements
                if stmt_type == 'comment':
                    print(stmt_content)
                # Skip 'blank' - don't print empty lines from input
                continue

            if stmt_type in ('update', 'delete', 'other'):
                # Pass through UPDATE, DELETE, and other statements unchanged
                if verbose:
                    print(f"Skipping {stmt_type.upper()} statement (pass-through)", file=sys.stderr)
                print(stmt_content)
                print()
                continue

            if stmt_type in ('insert', 'replace'):
                # Process INSERT/REPLACE statements
                if verbose:
                    print(f"Processing {stmt_type.upper()} statement", file=sys.stderr)

                # Parse the query
                parsed_query = parse_query(stmt_content)

                # Handle passthrough queries (e.g., VALUES without field list)
                if parsed_query.get("passthrough"):
                    if verbose:
                        print(f"Passthrough: VALUES syntax without field list (cannot safely reformat)", file=sys.stderr)
                    print(parsed_query["original_query"])
                    print()
                    continue

                secondary_queries = []

                # Handle creature_template special case
                table_name = parsed_query["table_name"]

                if table_name == "creature_template":
                    parsed_query, secondary_queries = creature_template_update(parsed_query)
                    if verbose:
                        if secondary_queries:
                            print("creature_template is using outdated structure", file=sys.stderr)
                            for i, secondary_query in enumerate(secondary_queries, start=1):
                                field_value_pairs = secondary_query["field_value_pairs"]
                                print(f"Secondary Query {i}: {field_value_pairs}", file=sys.stderr)
                            print("", file=sys.stderr)
                        else:
                            print("creature_template is using modern structure", file=sys.stderr)
                            print("", file=sys.stderr)

                # Strip default values
                stripped_query = strip_default_values(parsed_query)

                if verbose:
                    print("Stripped Query:", file=sys.stderr)
                    print(stripped_query, file=sys.stderr)
                    print("", file=sys.stderr)

                # Output primary query
                output_query(stripped_query, tables_with_deletes)

                # Output secondary queries
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
                            need_delete = False

                        output_query(secondary_query, tables_with_deletes)

        # Write to file if specified
        if output_file:
            with open(output_file, 'w') as f:
                f.write('\n'.join(output_buffer))
            print(f"✓ Output written to {output_file}", file=sys.stderr)

    finally:
        if output_file:
            builtins.print = original_print

def output_query(query, skip_delete_for_tables=None):
    """
    Generates DELETE and INSERT statements that handles both flat and nested field_value_pairs structures.
    Properly formats numeric values without quotes.

    Args:
        query: Parsed query dictionary
        skip_delete_for_tables: Set of table names that already have DELETE statements (skip auto-generation)
    """
    if skip_delete_for_tables is None:
        skip_delete_for_tables = set()

    table_name = query.get("table_name")
    query_type = query.get("query_type", "REPLACE").upper()
    field_value_pairs = query.get("field_value_pairs", {})
    comments = query.get("comments", {})
    fields = query.get("fields", [])

    if not table_name or not field_value_pairs:
        print("Error: Query is missing table_name or field_value_pairs.")
        return

    # Check if we should skip DELETE generation for this table
    skip_delete = table_name.lower() in skip_delete_for_tables

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

        # Only generate DELETE if we have a primary key value AND table doesn't already have a DELETE
        if not skip_delete and primary_key_field and primary_key_field in row_data:
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

def main():
    """Main entry point with argument parsing."""
    parser = argparse.ArgumentParser(
        description='SQL Reformatter - Format and optimize SQL INSERT/REPLACE queries',
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Format query from file
  python3 "SQL Reformatter.py" --file query.sql

  # Format query from command line
  python3 "SQL Reformatter.py" --query "INSERT INTO table SET field='value';"

  # Save output to file
  python3 "SQL Reformatter.py" --file query.sql --output formatted.sql

  # Refresh table structures from database
  python3 "SQL Reformatter.py" --refresh-schema

  # Enable verbose debug output
  python3 "SQL Reformatter.py" --file query.sql --verbose
        """
    )

    parser.add_argument('--query', '-q', type=str,
                        help='SQL query string to format')
    parser.add_argument('--file', '-f', type=str,
                        help='File containing SQL query to format')
    parser.add_argument('--output', '-o', type=str,
                        help='Output file (default: print to stdout)')
    parser.add_argument('--refresh-schema', action='store_true',
                        help='Refresh table structures from database')
    parser.add_argument('--verbose', '-v', action='store_true',
                        help='Enable verbose debug output')

    args = parser.parse_args()

    # Handle schema refresh
    if args.refresh_schema:
        refresh_schema()
        return

    # Get query from argument or file
    if args.query:
        input_query = args.query
    elif args.file:
        try:
            with open(args.file, 'r') as f:
                input_query = f.read()
        except FileNotFoundError:
            print(f"Error: File not found: {args.file}", file=sys.stderr)
            sys.exit(1)
        except Exception as e:
            print(f"Error reading file: {e}", file=sys.stderr)
            sys.exit(1)
    else:
        # No arguments provided - use example query
        print("No query specified. Use --help for usage information.", file=sys.stderr)
        print("Running with example query for demonstration...\n", file=sys.stderr)
        input_query = query

    # Load schema cache
    load_schema()

    # Process the query
    try:
        format_query(input_query, verbose=args.verbose, output_file=args.output)
    except Exception as e:
        print(f"Error processing query: {e}", file=sys.stderr)
        if args.verbose:
            import traceback
            traceback.print_exc()
        sys.exit(1)

if __name__ == "__main__":
    main()





