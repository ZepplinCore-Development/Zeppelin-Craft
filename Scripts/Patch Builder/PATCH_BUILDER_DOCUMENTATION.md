# Patch Builder Script Documentation

## Overview

The Patch Builder script (`Patch Builder.py`) is a comprehensive automation tool designed for World of Warcraft private server management. It serves as a complete pipeline for updating DBC (Database Client) files, comparing database schemas, generating SQL patches, and creating MPQ (Mo'PaQ archives) files for client distribution.

## Core Functionality

### 1. Database Schema Comparison and Backup System
- **Purpose**: Maintains backup copies of DBC database tables and generates differential SQL updates
- **Process**: Compares live DBC database against backup copies to identify changes
- **Output**: Individual SQL update files for each modified table

### 2. Item Template Integration
- **Function**: `update_item_dbc()` (Lines 305-344)
- **Purpose**: Synchronizes custom items from `acore_world.item_template` into the DBC database
- **Scope**: Processes items with entry IDs >= 56899 (custom item range)

### 3. Client Patch Generation
- **Tools Integration**: WoW Spell Editor and MPQ Editor
- **Output**: PATCH-Z.MPQ (DBC files) and PATCH-X.MPQ (creature models)
- **Distribution**: Updates version files for client launcher compatibility

## Key Functions

### Database Connection Management
```python
def connect_to_db(db_name)  # Lines 30-41
```
- Establishes MySQL connections with configured credentials
- Returns connection object or None on failure

### Backup Database Creation
```python
def create_dbc_backup()  # Lines 44-58
def create_tables_in_db_backup()  # Lines 83-122
```
- Creates `original_dbc` database if it doesn't exist
- Clones structure and data from live DBC database
- Ensures backup integrity for comparison operations

### Data Comparison Engine
```python
def compare_and_generate_updates()  # Lines 208-302
```
- Fetches all rows from both live and backup databases
- Identifies differences using primary key matching
- Generates UPDATE and INSERT/DELETE SQL statements
- Handles composite primary keys and special cases

### Primary Key Detection
```python
def get_primary_key_column(connection, table_name)  # Lines 137-165
```
- Automatically detects primary key columns
- Handles composite keys (hardcoded for specific tables like `itemsubclass`)
- Falls back to first column if no primary key exists

### Value Comparison
```python
def values_are_equivalent(value1, value2)  # Lines 195-205
```
- Handles type-safe comparison between database values
- Converts between numeric types and strings appropriately

## Features

### 1. Automated DBC Processing
- Exports DBC files from WoW Spell Editor using headless mode
- Copies exported files to server data directory
- Updates MPQ archives with new DBC content

### 2. Intelligent SQL Generation
- **UPDATE Queries**: Only updates changed fields with comments showing previous values
- **INSERT Queries**: Only includes non-default, non-null values
- **DELETE/INSERT Pairs**: For new records not in backup database

### 3. MPQ Archive Management
- Processes DBC files into PATCH-Z.MPQ
- Handles creature models in PATCH-X.MPQ
- Updates version tracking for client launcher

### 4. File System Integration
- Creates necessary directory structures
- Manages temporary files and cleanup
- Integrates with external tool executables

## Configuration

### Database Settings
Database configuration is now loaded from environment variables via `.env` file:
```python
db_config = {
    "host": os.getenv("DB_HOST", "localhost"),
    "user": os.getenv("DB_USER", "root"),
    "password": os.getenv("DB_PASSWORD", "")
}
```

### Database Names
Database names are now configurable via environment variables:
- `backup_dbc = os.getenv("BACKUP_DBC_NAME", "original_dbc")` - Backup database for comparison
- `live_dbc = os.getenv("LIVE_DBC_NAME", "dbc")` - Live DBC database  
- `world_db = os.getenv("WORLD_DB_NAME", "acore_world")` - AzerothCore world database

### Directory Paths
All paths are now configurable via environment variables:
- Update Output: `os.getenv("UPDATE_DIR", "Updates")` (supports relative paths)
- Base Directory: `os.getenv("BASE_DIRECTORY", r'Y:\wow-server')`
- Spell Editor: `os.getenv("SPELL_EDITOR_DIR", ...)`
- MPQ Editor: `os.getenv("MPQ_EDITOR_DIR", ...)`
- Server Data: `os.getenv("SERVER_DATA_DIR", ...)`
- File List: `os.getenv("FILE_LIST_PATH", ...)`

## Workflow

1. **Item Synchronization**: Updates DBC database with custom items from world database
2. **Backup Creation**: Ensures backup database exists and is populated
3. **Schema Comparison**: Compares all tables between live and backup databases
4. **SQL Generation**: Creates individual update files for each modified table
5. **DBC Export**: Runs WoW Spell Editor in headless mode to export DBC files
6. **File Distribution**: Copies exported files to server directory
7. **MPQ Creation**: Updates PATCH-Z.MPQ and PATCH-X.MPQ archives
8. **Version Management**: Updates client launcher version file

## Generated Output

### SQL Update Files
- Located in: `Updates/` directory
- Format: `update_[tablename].sql`
- Contains: Differential SQL statements with change comments

### MPQ Archives
- **PATCH-Z.MPQ**: DBC files for client
- **PATCH-X.MPQ**: Custom creature models
- Version tracking for launcher updates

## Issues and Recommendations

### Security Concerns
1. **~~Hardcoded Credentials~~** ✅ **RESOLVED**: Now uses environment variables via `.env` file
   - **Previous Risk**: High - Credentials were visible in source code
   - **Resolution**: Database credentials loaded from `.env` file with proper `.gitignore` protection

2. **~~SQL Injection Potential~~** ✅ **RESOLVED**: Dynamic query construction
   - **Previous Risk**: Medium - Table/column names from database could be malicious
   - **Resolution**: Added comprehensive identifier validation and parameterized queries

### Code Quality Issues

1. **~~Hardcoded Paths~~** ✅ **RESOLVED**: Now configurable via environment variables
   - **Previous Impact**: Script not portable between environments
   - **Resolution**: All paths now loaded from `.env` file with sensible defaults

2. **Error Handling** (Multiple locations): Inconsistent exception handling
   - **Issues**: Some database errors not properly caught
   - **Recommendation**: Implement comprehensive try-catch blocks

3. **Resource Management** (Lines 119-121, 299-302): Database connections
   - **Issue**: Potential connection leaks in error scenarios
   - **Recommendation**: Use context managers or ensure cleanup in finally blocks

4. **Mixed Responsibilities**: Single script handles database operations, file management, and external tool execution
   - **Recommendation**: Split into separate modules for better maintainability

### Performance Concerns

1. **Large Data Processing** (Lines 216-217): Fetches all table data into memory
   - **Risk**: Memory exhaustion with large tables
   - **Recommendation**: Implement pagination or streaming comparison

2. **Batch Operations** (Lines 313-330): Single large INSERT statement
   - **Issue**: Could fail entirely if one record is problematic
   - **Recommendation**: Implement batch processing with error recovery

3. **External Tool Dependencies** (Lines 365, 375-376): Synchronous execution
   - **Issue**: Script blocks on external tool execution
   - **Recommendation**: Add timeout handling and error checking

### Maintenance Issues

1. **~~Magic Numbers~~** ✅ **RESOLVED**: Item entry threshold now configurable
   - **Previous Issue**: Hardcoded item entry threshold (56899)
   - **Resolution**: Now configurable via `CUSTOM_ITEM_THRESHOLD` environment variable

2. **Blacklisted Tables** (Line 23): Hardcoded exclusion list
   - **Recommendation**: Move to configuration file

3. **Composite Key Handling** (Lines 138-141): Hardcoded table definitions
   - **Recommendation**: Auto-detect or use configuration-driven approach

4. **TODO Comments** (Lines 7-10): Unresolved development tasks
   - **Recommendation**: Address packaging and documentation improvements

### Reliability Concerns

1. **External Tool Failures**: No validation of tool execution success
2. **File Operation Safety**: Limited validation of file operations
3. **Database State Validation**: No verification of backup database integrity
4. **Network Dependencies**: Hardcoded network paths may fail

## Recommendations for Improvement

### Short-term Fixes
1. ✅ **COMPLETED**: Move credentials to environment variables  
2. ✅ **COMPLETED**: Add comprehensive SQL injection prevention and validation
3. ✅ **COMPLETED**: Fix function definition order issues
4. Add comprehensive error handling  
5. Implement proper resource cleanup
6. Add validation for external tool execution

### Long-term Enhancements
1. Split into modular components
2. ✅ **PARTIALLY COMPLETED**: Implement configuration file system (environment variables implemented)
3. Add logging and monitoring
4. Create unit tests for core functions
5. Add data validation and integrity checks
6. Implement rollback capabilities for failed operations

### Security Improvements
1. ✅ **COMPLETED**: Secure sensitive configuration data (moved to `.env` with `.gitignore` protection)
2. Implement input validation for all database operations
3. Add audit logging for all changes
4. Restrict database user permissions to minimum required

## Dependencies

### Python Modules
- `mysql.connector` - Database connectivity  
- `python-dotenv` - Environment variable loading from `.env` files
- `numbers` - Numeric type checking
- `os` - File system operations
- `subprocess` - External tool execution
- `shutil` - File operations

### External Tools
- **WoW Spell Editor**: DBC file generation
- **MPQ Editor**: Archive file creation
- **MySQL Server**: Database backend

### File Dependencies
- MPQ script files in `Scripts/MPQ Scripts/`
- Version file list for client launcher
- Directory structure for tool locations

## Recent Security Improvements

✅ **Security Update Completed**: The script has been updated to address critical security concerns:

- **Environment Variable Configuration**: All sensitive credentials moved to `.env` file
- **Git Protection**: Added `.gitignore` to prevent credential commits  
- **Configurable Paths**: All hardcoded paths now configurable via environment variables
- **SQL Injection Prevention**: Added comprehensive input validation and parameterized queries
- **Identifier Validation**: All database, table, and column names validated against SQL injection
- **Dependency Management**: Added `requirements.txt` and setup instructions
- **Template Configuration**: Created `.env.example` for safe configuration sharing

### New Security Features Added

1. **Input Validation Functions**:
   - `validate_identifier()`: Validates database/table/column names against SQL injection
   - `validate_numeric_threshold()`: Ensures numeric inputs are within safe ranges
   - `escape_identifier()`: Safely escapes MySQL identifiers with backticks

2. **Parameterized Queries**: 
   - Replaced direct string interpolation with parameterized queries for numeric values
   - All user-controllable inputs now validated before use in SQL queries

3. **Comprehensive Validation**:
   - Database names validated at startup
   - Table names validated before use in queries
   - Column names validated in UPDATE and INSERT operations
   - Primary key columns validated in WHERE clauses

4. **Error Handling**: 
   - Invalid identifiers are skipped with informative error messages
   - Script continues operation even if some identifiers are invalid
   - Function definition order corrected to prevent NameError issues

## Testing Status

✅ **Script Successfully Tested**: The Patch Builder script has been tested and confirmed working with all security improvements in place. Function definition ordering issues have been resolved.

## Setup Requirements

Before running the updated script:

1. Install dependencies: `pip install -r requirements.txt`
2. Copy `.env.example` to `.env` and configure with your settings
3. Review `SETUP_INSTRUCTIONS.md` for detailed setup guide

This script represents a functional but complex automation system that has been significantly improved for security. Additional refactoring for maintainability and reliability would provide further benefits.