# Zeppelin Launcher - Modern Python Implementation

A modern Python replacement for the original batch script launcher, providing enhanced functionality, better error handling, and a professional user interface.

## Project Status

### Phase 1: Core Infrastructure ✅ COMPLETED
- [x] Basic project structure
- [x] Configuration management system with INI files
- [x] JSON-based version tracking (with legacy migration)
- [x] File download manager with progress tracking
- [x] Comprehensive logging system
- [x] Utility helper functions

### Phase 2: Basic GUI (In Progress)
- [ ] Main application window
- [ ] Basic file status display
- [ ] Progress dialog for downloads
- [ ] Launch game functionality
- [ ] Settings dialog

### Phase 3: Enhanced Features (Planned)
- [ ] File integrity validation
- [ ] Download resume capability
- [ ] Better error handling and user feedback
- [ ] Server status checking
- [ ] Backup system for critical files

### Phase 4: Polish & Distribution (Planned)
- [ ] PyInstaller build system
- [ ] Application icon and branding
- [ ] Comprehensive testing
- [ ] User documentation
- [ ] Migration script from old launcher

## Current Features

### Configuration Management
- INI-based configuration with defaults
- User configuration overrides
- Automatic configuration creation
- Server URL and timeout settings
- Client directory configuration

### Version Tracking
- JSON format for better data structure
- Automatic migration from legacy text format
- File hash validation support
- Size and timestamp tracking
- Atomic file operations

### Download System
- Parallel downloads with thread pool
- Progress tracking with ETA calculation
- Resume capability for interrupted downloads
- Error recovery with automatic retry
- File backup before replacement

### Logging
- Colored console output
- File logging with rotation
- Multiple log levels (DEBUG, INFO, WARNING, ERROR, CRITICAL)
- Specialized logging methods for different operations
- Log file cleanup functionality

## Quick Start

1. **Install Python 3.9+** and dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. **Test the core infrastructure**:
   ```bash
   cd src
   python main.py
   ```

3. **Check the logs**:
   - Console output for immediate feedback
   - `logs/launcher.log` for detailed logging

## Configuration

The launcher uses a two-tier configuration system:

### Default Configuration (`config/default_config.ini`)
Contains the base configuration that ships with the launcher.

### User Configuration (`config/launcher_config.ini`)
Created automatically on first run, contains user-specific settings that override defaults.

### Key Settings
- `server.base_url`: Server URL (currently: http://61.245.129.209:8111/)
- `client.wow_executable`: WoW executable name (Wow.exe)
- `client.data_directory`: Data directory (Data)
- `client.backup_files`: Whether to backup files before updates
- `ui.check_updates_on_start`: Check for updates when launcher starts

## Architecture

### Core Modules
- `core/config_manager.py`: Configuration loading and management
- `core/version_manager.py`: File version tracking and comparison
- `core/downloader.py`: File download management with progress
- `utils/logger.py`: Centralized logging system
- `utils/helpers.py`: Common utility functions

### Key Features
- **Thread-safe operations**: All downloads and UI operations use proper threading
- **Atomic file operations**: Prevent corruption during updates
- **Graceful error handling**: Comprehensive error recovery
- **Cross-platform compatibility**: Works on Windows, Linux, and macOS
- **Legacy compatibility**: Automatically migrates from old launcher format

## Migration from Old Launcher

The new launcher automatically detects and migrates data from the old batch script:

1. **Version Data**: Converts `client_versions.txt` to JSON format
2. **Backup Creation**: Creates backup of old version file
3. **Seamless Transition**: Preserves existing update status
4. **Enhanced Tracking**: Adds hash validation and size tracking

## Testing

The `main.py` script serves as both the application entry point and a test harness for the core infrastructure:

- Tests configuration loading
- Validates server connectivity
- Checks version tracking functionality
- Exercises download manager
- Verifies logging system

## Next Steps

With Phase 1 complete, the next major milestone is implementing the GUI components:

1. **Main Window**: Primary application interface
2. **Progress Dialog**: Download progress with cancel/pause
3. **Settings Dialog**: Configuration management UI
4. **File Status Display**: Current patch status overview

The core infrastructure provides a solid foundation for building the GUI components with all the necessary functionality already implemented and tested.

## Dependencies

- **Python 3.9+**: Modern Python with pathlib and typing support
- **requests**: HTTP client for downloads
- **tkinter**: Built-in GUI framework (no additional installation required)

## Compatibility

### Legacy Launcher
- Reads existing `client_versions.txt` files
- Uses same server URL and file structure
- Maintains compatibility with current server setup

### Server Compatibility
- Works with existing server file lists
- Uses same filename:version format
- Supports mandatory and optional file categories

---

*This project represents a complete modernization of the Zeppelin Launcher while maintaining full compatibility with the existing server infrastructure.*