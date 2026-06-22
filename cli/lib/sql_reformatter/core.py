"""
SQL Reformatter - Formats and optimizes SQL INSERT/REPLACE queries

Migrated from Scripts/SQL Reformatter/SQL Reformatter.py into the CLI package.

Features:
- Strips default values based on table structure
- Converts creature_template modelid fields to creature_template_model format
- Formats output as DELETE + INSERT statements
- Preserves inline comments
- Supports both INSERT...SET and INSERT...VALUES syntax
"""

import re
import json
import os
import sys
from pathlib import Path

# Get module directory for file paths
SCRIPT_DIR = Path(__file__).parent
SCHEMA_CACHE_FILE = SCRIPT_DIR / "table_structures.json"

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
    """Query database and rebuild table structures cache.

    Uses credentials from cli/.env (already loaded by the CLI framework).
    """
    try:
        import mysql.connector
    except ImportError:
        print("Error: mysql-connector-python not installed.", file=sys.stderr)
        print("Install with: pip3 install mysql-connector-python", file=sys.stderr)
        sys.exit(1)

    # Use credentials from cli/.env (loaded by cli/lib/env.py at CLI startup)
    databases = [
        {
            'name': 'AzerothCore',
            'host': os.getenv('DB_HOST', '192.168.0.55'),
            'port': int(os.getenv('DB_PORT', 3306)),
            'user': os.getenv('DB_USER', 'acore'),
            'password': os.getenv('DB_PASS', 'acore'),
            'database': 'acore_world'
        },
        {
            'name': 'DBC',
            'host': os.getenv('DBC_HOST', '192.168.0.55'),
            'port': int(os.getenv('DBC_PORT', 3306)),
            'user': os.getenv('DBC_USER', 'spell-editor'),
            'password': os.getenv('DBC_PASS', ''),
            'database': os.getenv('DBC_NAME', 'dbc')
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


# Table structures are loaded from table_structures.json cache file
# Use 'zep sql tool refresh-schema' to rebuild the cache from the database


def extract_table_name(query):
    match = re.search(r"INSERT INTO\s+`?(\w+)`?", query, re.IGNORECASE)
    if match:
        return match.group(1).lower()  # Normalize to lowercase
    match = re.search(r"REPLACE INTO\s+`?(\w+)`?", query, re.IGNORECASE)
    if match:
        return match.group(1).lower()  # Normalize to lowercase
    return None

def parse_value(value):
    # Remove any trailing semicolons / surrounding whitespace
    value = value.strip().strip(';').strip()

    # SQL NULL
    if value.upper() == "NULL":
        return None

    # The token is already a valid SQL literal: a number, or a quoted string
    # whose inner apostrophes are escaped as '' by the parser. Pass it through
    # untouched so escaped apostrophes are preserved (e.g. 'Sha''tar').
    #
    # NOTE: do NOT "normalize" by stripping/re-doubling apostrophes here —
    # value.replace("''", "") deletes escaped apostrophes outright, turning
    # 'O''Brien' into 'OBrien' (silent data corruption).
    return value


def split_sql_values(s):
    """Split a comma-separated SQL value list on TOP-LEVEL commas only,
    respecting single/double quoted strings with '' / "" / backslash escapes.

    Returns the raw value tokens with their quoting preserved (not stripped,
    not trimmed). Commas inside quoted strings are kept intact — this is what
    prevents values like 'Your table, I suspect' from being truncated.
    """
    parts = []
    buf = []
    in_single = False
    in_double = False
    i = 0
    n = len(s)
    while i < n:
        c = s[i]
        # Backslash escape inside a quoted string: keep both chars literally
        if (in_single or in_double) and c == '\\' and i + 1 < n:
            buf.append(c)
            buf.append(s[i + 1])
            i += 2
            continue
        if c == "'" and not in_double:
            # '' is an escaped apostrophe (or empty string) — keep literally,
            # do not toggle quote state.
            if i + 1 < n and s[i + 1] == "'":
                buf.append("''")
                i += 2
                continue
            in_single = not in_single
            buf.append(c)
            i += 1
            continue
        if c == '"' and not in_single:
            if i + 1 < n and s[i + 1] == '"':
                buf.append('""')
                i += 2
                continue
            in_double = not in_double
            buf.append(c)
            i += 1
            continue
        if c == ',' and not in_single and not in_double:
            parts.append("".join(buf))
            buf = []
            i += 1
            continue
        buf.append(c)
        i += 1
    parts.append("".join(buf))
    return parts

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

        # Backslash escape inside a quoted string: keep both chars literally
        if in_single_quote and char == '\\' and i + 1 < len(set_clause):
            result.append(char)
            result.append(set_clause[i + 1])
            i += 2
            continue

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
    # Capture the WHOLE SET clause. We must NOT stop at the first ';' — a value
    # can legitimately contain one (e.g. the WoW token '$Gbrother:sister;'), and
    # a non-greedy match to ';' truncated the value and dropped later fields.
    set_match = re.search(r"SET\s+(.*)$", query, re.DOTALL | re.IGNORECASE)
    if not set_match:
        raise ValueError("SET syntax not properly formatted")

    # Strip only the trailing statement terminator (the ';' the splitter kept at
    # the very end), never a ';' that sits inside a quoted value.
    set_clause = set_match.group(1).rstrip()
    if set_clause.endswith(';'):
        set_clause = set_clause[:-1]

    # Strip inline comments BEFORE splitting on commas, to prevent comments
    # (which may contain commas or appear after commas) from breaking the split.
    stripped_clause, comments = _strip_inline_comments(set_clause)

    field_value_pairs = {}

    for line in split_sql_values(stripped_clause):
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

        # Backslash escape inside a quoted string: skip both chars
        if (in_single_quote or in_double_quote) and char == '\\' and i + 1 < len(s):
            i += 2
            continue

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
        current_set = [v.strip() for v in split_sql_values(tuple_content)]

        # A tuple whose value count != the field count is noise — typically a
        # "(...)" that appears inside an inline comment, e.g.
        #   (121, 103300, ...),    -- Fire Warding I (Artisan)
        # where "(Artisan)" gets picked up as a stray tuple. Skip it; the real
        # value tuples match the field count and are collected. (split_sql_values
        # now handles '', "" and backslash escapes, so genuine rows always match.)
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
        # Couldn't extract any value tuples — typically the value is a
        # function call / expression (e.g. CONCAT('...', @var, '...')) or some
        # construct we don't model. Emit the statement unchanged instead of
        # failing the whole file.
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
        current_set = [v.strip() for v in split_sql_values(tuple_content)]

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
    """Parses an individual VALUES-list token, preserving its quoting.

    We must NOT strip the surrounding quotes here: keeping them lets the output
    stage tell a quoted string ('foo') from a raw SQL token (a number, NULL, or
    a session variable like @quest). Stripping quotes made @variables
    indistinguishable from strings and they got wrongly re-quoted ('@quest')."""
    return parse_value(val)

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

                # Parse the query. If anything about it can't be safely parsed
                # (unusual SET clause, function-call values, etc.), emit it
                # UNCHANGED rather than aborting the whole file or dropping it.
                try:
                    parsed_query = parse_query(stmt_content)
                except Exception as e:
                    if verbose:
                        print(f"Passthrough (unparseable: {e})", file=sys.stderr)
                    print(stmt_content)
                    print()
                    continue

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
                # Already-quoted string PKs keep their quotes; raw tokens
                # (@var) stay raw. Don't add quotes.
                formatted_pk = pk_value
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
                # Genuine string values keep their surrounding quotes (set by
                # parse_value), so a string WITHOUT quotes here is a raw SQL
                # token: a number, NULL, or a session variable like @quest.
                # Emit it verbatim so @variables aren't wrongly quoted ('@quest').
                formatted_value = value
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



