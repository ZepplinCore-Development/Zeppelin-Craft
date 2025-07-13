"""
Zeppelin Launcher - Main Application Entry Point
Modern Python replacement for the batch script launcher.
"""

import sys
import argparse
from pathlib import Path

# Add src directory to path for imports
src_dir = Path(__file__).parent
sys.path.insert(0, str(src_dir))

from core.config_manager import initialize_config, get_config
from core.version_manager import VersionManager, parse_file_list
from core.downloader import DownloadManager
from utils.logger import initialize_logger, get_logger
from utils.helpers import get_platform_info, find_wow_installation
from gui.main_window import MainWindow


def run_console_mode():
    """Run the original console-based test mode."""
    try:
        # Initialize logging
        logger = initialize_logger(
            log_directory=Path.cwd() / "logs",
            log_level="INFO"
        )
        logger.log_startup("1.0.0-dev")
        
        # Log platform information
        platform_info = get_platform_info()
        logger.info(f"Platform: {platform_info['system']} {platform_info['release']}")
        logger.info(f"Python: {platform_info['python_version']}")
        
        # Initialize configuration
        config = initialize_config()
        logger.log_config_loaded(config.user_config_path)
        
        # Log configuration summary
        logger.info(f"Server: {config.server_name} ({config.server_url})")
        logger.info(f"WoW Executable: {config.wow_executable}")
        logger.info(f"Data Directory: {config.data_directory}")
        
        # Try to find WoW installation
        wow_path = find_wow_installation()
        if wow_path:
            logger.info(f"Found WoW installation: {wow_path}")
        else:
            logger.warning("WoW installation not found in standard locations")
        
        # Initialize version manager
        data_dir = Path.cwd() / config.data_directory
        version_manager = VersionManager(data_dir)
        
        # Log version manager stats
        stats = version_manager.get_stats()
        logger.info(f"Version tracking: {stats['total_files']} files, {stats['total_size_mb']} MB")
        
        # Test download manager initialization
        download_manager = DownloadManager(timeout=config.timeout)
        logger.info("Download manager initialized")
        
        # Test downloading file list
        logger.info("Testing server connectivity...")
        file_list_content = download_manager.download_file_list(config.mandatory_list_url)
        
        if file_list_content:
            logger.info("Successfully connected to server")
            file_list = parse_file_list(file_list_content)
            logger.info(f"Server has {len(file_list)} mandatory files")
            
            # Check for updates needed
            updates_needed = version_manager.needs_update(file_list)
            if updates_needed:
                logger.info(f"{len(updates_needed)} files need updating:")
                for filename, version in updates_needed[:5]:  # Show first 5
                    logger.info(f"  - {filename} (v{version})")
                if len(updates_needed) > 5:
                    logger.info(f"  ... and {len(updates_needed) - 5} more")
            else:
                logger.info("All files are up to date!")
        else:
            logger.error("Failed to connect to server")
        
        logger.info("Core infrastructure test completed successfully")
        
    except Exception as e:
        if 'logger' in locals():
            logger.exception(f"Application error: {e}")
        else:
            print(f"Fatal error: {e}")
        sys.exit(1)


def run_gui_mode():
    """Run the GUI version of the launcher."""
    try:
        # Initialize logging (simplified for GUI)
        logger = initialize_logger(
            log_directory=Path.cwd() / "logs",
            log_level="INFO"
        )
        logger.log_startup("1.0.0-dev")
        
        # Initialize configuration
        config = initialize_config()
        logger.log_config_loaded(config.user_config_path)
        
        # Create and run the GUI
        app = MainWindow()
        app.run()
        
    except Exception as e:
        print(f"GUI Error: {e}")
        sys.exit(1)


def main():
    """Main application entry point."""
    parser = argparse.ArgumentParser(description="Zeppelin Launcher")
    parser.add_argument(
        "--console", 
        action="store_true", 
        help="Run in console mode (for testing)"
    )
    
    args = parser.parse_args()
    
    if args.console:
        run_console_mode()
    else:
        run_gui_mode()


if __name__ == "__main__":
    main()