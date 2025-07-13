"""
Configuration Management System for Zeppelin Launcher
Handles loading, saving, and validating configuration settings.
"""

import configparser
import os
from pathlib import Path
from typing import Any, Optional
import shutil


class ConfigManager:
    """Manages application configuration with defaults and validation."""
    
    def __init__(self, config_dir: Optional[Path] = None):
        """
        Initialize the configuration manager.
        
        Args:
            config_dir: Directory containing config files. Defaults to ../config
        """
        if config_dir is None:
            # Get the directory relative to this file
            self.config_dir = Path(__file__).parent.parent.parent / "config"
        else:
            self.config_dir = Path(config_dir)
            
        self.user_config_path = self.config_dir / "launcher_config.ini"
        self.default_config_path = self.config_dir / "default_config.ini"
        
        self.config = configparser.ConfigParser()
        self._load_config()
    
    def _load_config(self):
        """Load configuration from files, creating user config if needed."""
        # Always load defaults first
        if self.default_config_path.exists():
            self.config.read(self.default_config_path)
        else:
            raise FileNotFoundError(f"Default config not found: {self.default_config_path}")
        
        # Create user config from defaults if it doesn't exist
        if not self.user_config_path.exists():
            self._create_user_config()
        
        # Load user config, which will override defaults
        self.config.read(self.user_config_path)
    
    def _create_user_config(self):
        """Create user configuration file from defaults."""
        try:
            self.config_dir.mkdir(parents=True, exist_ok=True)
            shutil.copy2(self.default_config_path, self.user_config_path)
        except PermissionError as e:
            # For development: if we can't write to config dir, just skip user config creation
            print(f"Warning: Cannot create user config due to permissions: {e}")
            print(f"Running with default config only (development mode)")
        except Exception as e:
            raise RuntimeError(f"Failed to create user config: {e}")
    
    def get(self, section: str, key: str, fallback: Any = None) -> str:
        """
        Get a configuration value.
        
        Args:
            section: Configuration section
            key: Configuration key
            fallback: Value to return if key not found
            
        Returns:
            Configuration value as string
        """
        try:
            return self.config.get(section, key, fallback=fallback)
        except (configparser.NoSectionError, configparser.NoOptionError):
            return fallback
    
    def get_int(self, section: str, key: str, fallback: int = 0) -> int:
        """Get configuration value as integer."""
        try:
            return self.config.getint(section, key, fallback=fallback)
        except (configparser.NoSectionError, configparser.NoOptionError, ValueError):
            return fallback
    
    def get_bool(self, section: str, key: str, fallback: bool = False) -> bool:
        """Get configuration value as boolean."""
        try:
            return self.config.getboolean(section, key, fallback=fallback)
        except (configparser.NoSectionError, configparser.NoOptionError, ValueError):
            return fallback
    
    def get_float(self, section: str, key: str, fallback: float = 0.0) -> float:
        """Get configuration value as float."""
        try:
            return self.config.getfloat(section, key, fallback=fallback)
        except (configparser.NoSectionError, configparser.NoOptionError, ValueError):
            return fallback
    
    def set(self, section: str, key: str, value: str):
        """
        Set a configuration value.
        
        Args:
            section: Configuration section
            key: Configuration key
            value: Value to set
        """
        if not self.config.has_section(section):
            self.config.add_section(section)
        self.config.set(section, key, str(value))
    
    def save(self):
        """Save current configuration to user config file."""
        try:
            with open(self.user_config_path, 'w') as f:
                self.config.write(f)
        except PermissionError as e:
            print(f"Warning: Cannot save user config due to permissions: {e}")
            print("Configuration changes will not persist (development mode)")
        except Exception as e:
            raise RuntimeError(f"Failed to save config: {e}")
    
    def reset_to_defaults(self):
        """Reset configuration to defaults."""
        if self.user_config_path.exists():
            self.user_config_path.unlink()
        self._load_config()
    
    # Convenience methods for common configuration values
    @property
    def server_url(self) -> str:
        """Get the server base URL."""
        return self.get('server', 'base_url', 'http://localhost:8111/')
    
    @property
    def server_name(self) -> str:
        """Get the server name."""
        return self.get('server', 'name', 'Unknown Server')
    
    @property
    def timeout(self) -> int:
        """Get the network timeout in seconds."""
        return self.get_int('server', 'timeout', 30)
    
    @property
    def wow_executable(self) -> str:
        """Get the WoW executable name."""
        return self.get('client', 'wow_executable', 'Wow.exe')
    
    @property
    def data_directory(self) -> str:
        """Get the data directory name."""
        return self.get('client', 'data_directory', 'Data')
    
    @property
    def temp_directory(self) -> str:
        """Get the temporary directory name."""
        return self.get('client', 'temp_directory', 'Data/temp')
    
    @property
    def backup_files(self) -> bool:
        """Check if file backup is enabled."""
        return self.get_bool('client', 'backup_files', True)
    
    @property
    def validate_downloads(self) -> bool:
        """Check if download validation is enabled."""
        return self.get_bool('client', 'validate_downloads', True)
    
    @property
    def mandatory_list_url(self) -> str:
        """Get the full URL for mandatory file list."""
        base = self.server_url.rstrip('/')
        path = self.get('server', 'mandatory_list_path', 'mandatory/mandatory_file_list.txt')
        return f"{base}/{path}"
    
    @property
    def optional_list_url(self) -> str:
        """Get the full URL for optional file list."""
        base = self.server_url.rstrip('/')
        path = self.get('server', 'optional_list_path', 'optional/optional_file_list.txt')
        return f"{base}/{path}"
    
    def get_file_url(self, filename: str, is_optional: bool = False) -> str:
        """
        Get the full URL for downloading a specific file.
        
        Args:
            filename: Name of the file to download
            is_optional: Whether this is an optional file
            
        Returns:
            Full download URL
        """
        base = self.server_url.rstrip('/')
        folder = 'optional' if is_optional else 'mandatory'
        return f"{base}/{folder}/{filename}"


# Global config instance - will be initialized by main application
config: Optional[ConfigManager] = None


def get_config() -> ConfigManager:
    """Get the global configuration instance."""
    global config
    if config is None:
        config = ConfigManager()
    return config


def initialize_config(config_dir: Optional[Path] = None) -> ConfigManager:
    """Initialize the global configuration instance."""
    global config
    config = ConfigManager(config_dir)
    return config