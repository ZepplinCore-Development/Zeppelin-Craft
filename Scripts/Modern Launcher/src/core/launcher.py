"""
Core launcher functionality for the Zeppelin Launcher.
"""

import subprocess
import sys
from pathlib import Path
from typing import Dict, Optional

# Add parent directory to path for imports
src_dir = Path(__file__).parent.parent
sys.path.insert(0, str(src_dir))

from core.config_manager import get_config
from core.version_manager import VersionManager, parse_file_list
from core.downloader import DownloadManager
from utils.logger import get_logger
from utils.helpers import find_wow_installation


class ZeppelinLauncher:
    """Main launcher class that coordinates all launcher operations."""
    
    def __init__(self):
        self.logger = get_logger()
        self.config = get_config()
        self.download_manager = DownloadManager(timeout=self.config.timeout)
        
        # Initialize version manager with data directory
        data_dir = Path.cwd() / self.config.data_directory
        self.version_manager = VersionManager(data_dir)
        
    def test_connection(self) -> bool:
        """Test connection to the server.
        
        Returns:
            bool: True if connection successful, False otherwise
            
        Raises:
            Exception: If connection fails
        """
        try:
            file_list_content = self.download_manager.download_file_list(
                self.config.mandatory_list_url
            )
            return file_list_content is not None
        except Exception as e:
            self.logger.error(f"Connection test failed: {e}")
            raise
            
    def get_mandatory_files(self) -> Dict[str, str]:
        """Get the list of mandatory files from the server.
        
        Returns:
            Dict[str, str]: Dictionary mapping filename to version
            
        Raises:
            Exception: If unable to fetch file list
        """
        try:
            file_list_content = self.download_manager.download_file_list(
                self.config.mandatory_list_url
            )
            
            if not file_list_content:
                raise Exception("Failed to download mandatory file list")
                
            return parse_file_list(file_list_content)
            
        except Exception as e:
            self.logger.error(f"Failed to get mandatory files: {e}")
            raise
            
    def get_optional_files(self) -> Dict[str, str]:
        """Get the list of optional files from the server.
        
        Returns:
            Dict[str, str]: Dictionary mapping filename to version
            
        Raises:
            Exception: If unable to fetch file list
        """
        try:
            file_list_content = self.download_manager.download_file_list(
                self.config.optional_list_url
            )
            
            if not file_list_content:
                # Optional files might not exist, return empty dict
                return {}
                
            return parse_file_list(file_list_content)
            
        except Exception as e:
            self.logger.warning(f"Failed to get optional files: {e}")
            return {}
            
    def download_file(self, filename: str, progress_callback=None) -> bool:
        """Download a single file from the server.
        
        Args:
            filename: Name of the file to download
            progress_callback: Optional callback for progress updates
            
        Returns:
            bool: True if download successful, False otherwise
        """
        try:
            file_url = f"{self.config.server_url}mandatory/{filename}"
            
            # Determine local path
            local_path = Path.cwd() / filename
            
            # Download the file
            success = self.download_manager.download_file(
                file_url, 
                local_path, 
                progress_callback=progress_callback
            )
            
            if success:
                self.logger.info(f"Successfully downloaded {filename}")
            else:
                self.logger.error(f"Failed to download {filename}")
                
            return success
            
        except Exception as e:
            self.logger.error(f"Error downloading {filename}: {e}")
            return False
            
    def launch_game(self) -> bool:
        """Launch the WoW game executable.
        
        Returns:
            bool: True if launch successful, False otherwise
        """
        try:
            # Try to find WoW installation
            wow_path = find_wow_installation()
            
            if not wow_path:
                # Try current directory
                wow_exe = Path.cwd() / self.config.wow_executable
                if not wow_exe.exists():
                    self.logger.error(f"Could not find {self.config.wow_executable}")
                    return False
                wow_path = wow_exe.parent
                
            # Update realmlist if configured
            self._update_realmlist(wow_path)
            
            # Launch the game
            wow_exe = wow_path / self.config.wow_executable
            
            if not wow_exe.exists():
                self.logger.error(f"WoW executable not found: {wow_exe}")
                return False
                
            self.logger.info(f"Launching game: {wow_exe}")
            
            if sys.platform == "win32":
                # Windows
                subprocess.Popen([str(wow_exe)], cwd=str(wow_path))
            else:
                # Linux/Mac (via Wine potentially)
                subprocess.Popen([str(wow_exe)], cwd=str(wow_path))
                
            return True
            
        except Exception as e:
            self.logger.error(f"Failed to launch game: {e}")
            return False
            
    def _update_realmlist(self, wow_path: Path) -> None:
        """Update the realmlist.wtf file with server information.
        
        Args:
            wow_path: Path to the WoW installation directory
        """
        try:
            realmlist_path = wow_path / "Data" / "enUS" / "realmlist.wtf"
            
            # Create directory if it doesn't exist
            realmlist_path.parent.mkdir(parents=True, exist_ok=True)
            
            # Extract server address from URL
            server_url = self.config.server_url.rstrip('/')
            # Remove http:// or https:// and port if present
            server_address = server_url.replace('http://', '').replace('https://', '')
            if ':' in server_address:
                server_address = server_address.split(':')[0]
                
            # Write realmlist
            realmlist_content = f"set realmlist {server_address}\n"
            
            with open(realmlist_path, 'w') as f:
                f.write(realmlist_content)
                
            self.logger.info(f"Updated realmlist: {server_address}")
            
        except Exception as e:
            self.logger.warning(f"Failed to update realmlist: {e}")
            
    def check_for_updates(self) -> Dict[str, str]:
        """Check which files need updating.
        
        Returns:
            Dict[str, str]: Dictionary of files that need updates (filename -> version)
        """
        try:
            mandatory_files = self.get_mandatory_files()
            updates_needed = {}
            
            for filename, server_version in mandatory_files.items():
                local_version = self.version_manager.get_file_version(filename)
                if local_version != server_version:
                    updates_needed[filename] = server_version
                    
            return updates_needed
            
        except Exception as e:
            self.logger.error(f"Failed to check for updates: {e}")
            return {}
            
    def update_all_files(self, progress_callback=None) -> bool:
        """Update all files that need updating.
        
        Args:
            progress_callback: Optional callback for progress updates
            
        Returns:
            bool: True if all updates successful, False otherwise
        """
        try:
            updates_needed = self.check_for_updates()
            
            if not updates_needed:
                self.logger.info("No updates needed")
                return True
                
            total_files = len(updates_needed)
            successful_updates = 0
            
            for i, (filename, version) in enumerate(updates_needed.items()):
                if progress_callback:
                    progress_callback(i, total_files, f"Updating {filename}")
                    
                if self.download_file(filename):
                    self.version_manager.set_file_version(filename, version)
                    successful_updates += 1
                else:
                    self.logger.error(f"Failed to update {filename}")
                    
            if progress_callback:
                progress_callback(total_files, total_files, "Update complete")
                
            success = successful_updates == total_files
            if success:
                self.logger.info(f"Successfully updated {successful_updates} files")
            else:
                self.logger.error(f"Updated {successful_updates}/{total_files} files")
                
            return success
            
        except Exception as e:
            self.logger.error(f"Failed to update files: {e}")
            return False