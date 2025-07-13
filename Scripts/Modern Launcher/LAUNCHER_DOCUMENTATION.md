# Zeppelin Modern Launcher

## Overview
The Zeppelin Modern Launcher is a Python-based client launcher designed to automatically update game files and launch the World of Warcraft 3.3.5a client with proper server configuration. It provides a streamlined experience for connecting to the Zeppelin private server.

## Key Features

### 1. Automatic File Updates
- Downloads and maintains mandatory game files from the server
- Supports optional file updates for enhanced content
- Version tracking to ensure only outdated files are downloaded
- Progress callbacks for user feedback during downloads

### 2. Realmlist Management
- **Automatic realmlist.wtf updates on every launch**
- Extracts server IP from configured server URL
- Creates the file at `WoW/Data/enUS/realmlist.wtf`
- Writes `set realmlist {server_address}` format
- **No persistence checking** - updates every time the game is launched

### 3. Game Launch Integration
- Automatically detects WoW installation paths
- Launches the game executable with proper working directory
- Cross-platform support (Windows, Linux via Wine)

### 4. Connection Testing
- Validates server connectivity before operations
- Tests mandatory file list accessibility
- Provides clear error reporting for connection issues

## Architecture

### Core Components

#### ZeppelinLauncher (`src/core/launcher.py`)
Main orchestrator class that coordinates all launcher operations:
- `test_connection()` - Validates server connectivity
- `get_mandatory_files()` - Retrieves required file list from server
- `get_optional_files()` - Retrieves optional file list from server
- `download_file()` - Downloads individual files with progress tracking
- `launch_game()` - Handles game launch and realmlist updates
- `check_for_updates()` - Compares local vs server file versions
- `update_all_files()` - Batch updates all outdated files

#### Configuration Manager (`src/core/config_manager.py`)
Handles launcher configuration including:
- Server URLs for file downloads
- WoW executable name and paths
- Timeout settings
- Data directory locations

#### Version Manager (`src/core/version_manager.py`)
Tracks file versions locally:
- Maintains version database for downloaded files
- Compares local vs server versions
- Parses server file list format

#### Download Manager (`src/core/downloader.py`)
Handles all network operations:
- File downloads with progress tracking
- Connection timeout management
- Error handling and retry logic

### Supporting Components

#### GUI Interface (`src/gui/main_window.py`)
Provides user-friendly interface for:
- Displaying update progress
- Server connection status
- Launch controls

#### Standalone Launcher (`src/standalone_launcher.py`)
Alternative command-line interface for:
- Headless server environments
- Automated deployment scenarios
- Testing and debugging

#### Utilities (`src/utils/`)
- `logger.py` - Centralized logging system
- `helpers.py` - Common utility functions like WoW path detection

## Realmlist Behavior Details

### Update Process
1. Called every time `launch_game()` is executed
2. Extracts server address from `config.server_url`
3. Strips protocol (http/https) and port information
4. Creates directory structure if missing: `WoW/Data/enUS/`
5. Writes realmlist.wtf with format: `set realmlist {server_address}`

### No Persistence Checking
- **Always overwrites** the realmlist.wtf file
- No flags or timestamps to track previous updates
- Ensures realmlist is always current with launcher configuration
- Prevents issues with manual realmlist modifications

### Error Handling
- Creates parent directories if they don't exist
- Logs warnings on failure but doesn't block game launch
- Graceful degradation if realmlist update fails

## Configuration

### Default Configuration (`config/default_config.ini`)
```ini
[server]
server_url = http://your-server.com/
mandatory_list_url = http://your-server.com/mandatory_list.txt
optional_list_url = http://your-server.com/optional_list.txt

[client]
wow_executable = Wow.exe
data_directory = data

[network]
timeout = 30
```

### File List Format
Server file lists use simple format:
```
filename1.mpq version1
filename2.mpq version2
```

## Deployment

### Build Process
- Uses PyInstaller for standalone executable creation
- Includes all dependencies and assets
- Produces single-file executable for distribution

### Distribution
- Standalone executable requires no Python installation
- Config files can be bundled or external
- Supports Windows and Linux deployment

## Usage Patterns

### Normal Operation
1. Launcher starts and tests server connection
2. Checks for mandatory file updates
3. Downloads any outdated files
4. Updates realmlist.wtf with server information
5. Launches WoW client

### Error Scenarios
- **No server connection**: Reports error, allows offline launch
- **Download failures**: Logs errors, continues with available files
- **Missing WoW**: Prompts user to locate installation
- **Realmlist failure**: Warns but continues with launch

## Integration with Zeppelin Server

### File Hosting
- Server hosts mandatory and optional file lists
- Files served from `/mandatory/` and `/optional/` endpoints
- Version tracking enables incremental updates

### Server Configuration
- Launcher extracts connection info from server URL
- Supports both development and production server environments
- Configurable timeout and retry settings

## Future Enhancements

### Potential Improvements
- GUI progress bars and status indicators
- Automatic WoW installation detection
- Patch verification and integrity checking
- Background update checking
- User preference persistence
- Multi-language support

### Maintenance Considerations
- Regular testing with server file list changes
- Cross-platform compatibility verification
- Performance optimization for large file downloads
- Error reporting and diagnostics improvement

This launcher provides a robust, automated solution for maintaining client files and ensuring proper server connectivity for the Zeppelin WoW private server environment.