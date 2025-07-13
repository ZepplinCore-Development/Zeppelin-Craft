"""
Version Management System for Zeppelin Launcher
Handles file version tracking and comparison using JSON format.
"""

import json
import hashlib
from datetime import datetime, timezone
from pathlib import Path
from typing import Dict, Optional, List, Tuple
import os


class FileInfo:
    """Information about a tracked file."""
    
    def __init__(self, version: str = "0", hash_value: str = "", 
                 size: int = 0, last_checked: Optional[str] = None):
        self.version = version
        self.hash = hash_value
        self.size = size
        self.last_checked = last_checked or datetime.now(timezone.utc).isoformat()
    
    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization."""
        return {
            "version": self.version,
            "hash": self.hash,
            "size": self.size,
            "last_checked": self.last_checked
        }
    
    @classmethod
    def from_dict(cls, data: Dict) -> 'FileInfo':
        """Create FileInfo from dictionary."""
        return cls(
            version=data.get("version", "0"),
            hash_value=data.get("hash", ""),
            size=data.get("size", 0),
            last_checked=data.get("last_checked")
        )


class VersionManager:
    """Manages file version tracking and comparison."""
    
    def __init__(self, data_directory: Path):
        """
        Initialize the version manager.
        
        Args:
            data_directory: Directory where version files are stored
        """
        self.data_directory = Path(data_directory)
        self.version_file = self.data_directory / "client_versions.json"
        self.legacy_version_file = self.data_directory / "client_versions.txt"
        
        # Ensure data directory exists
        try:
            self.data_directory.mkdir(parents=True, exist_ok=True)
        except PermissionError:
            print(f"Warning: Cannot create data directory due to permissions: {self.data_directory}")
            print("Version tracking will be read-only (development mode)")
        
        self.version_data = {
            "format_version": "1.0",
            "last_updated": datetime.now(timezone.utc).isoformat(),
            "files": {}
        }
        
        self._load_versions()
    
    def _load_versions(self):
        """Load version data from file, migrating from legacy format if needed."""
        # Try to load from JSON file first
        if self.version_file.exists():
            try:
                with open(self.version_file, 'r') as f:
                    data = json.load(f)
                    self.version_data.update(data)
                    # Convert file data to FileInfo objects
                    files = {}
                    for filename, file_data in data.get("files", {}).items():
                        if isinstance(file_data, dict):
                            files[filename] = FileInfo.from_dict(file_data)
                        else:
                            # Legacy format - just version string
                            files[filename] = FileInfo(version=str(file_data))
                    self.version_data["files"] = files
                return
            except (json.JSONDecodeError, KeyError) as e:
                print(f"Warning: Corrupted JSON version file, attempting migration: {e}")
        
        # Try to migrate from legacy text format
        if self.legacy_version_file.exists():
            print("Migrating from legacy version format...")
            self._migrate_from_legacy()
        else:
            print("No existing version data found, starting fresh.")
    
    def _migrate_from_legacy(self):
        """Migrate from the old text-based version format."""
        try:
            with open(self.legacy_version_file, 'r') as f:
                for line in f:
                    line = line.strip()
                    if ':' in line:
                        filename, version = line.split(':', 1)
                        self.version_data["files"][filename] = FileInfo(version=version)
            
            # Save the migrated data
            self.save_versions()
            
            # Backup the old file
            backup_path = self.legacy_version_file.with_suffix('.txt.bak')
            self.legacy_version_file.rename(backup_path)
            print(f"Legacy version file backed up to: {backup_path}")
            
        except Exception as e:
            print(f"Failed to migrate legacy version file: {e}")
    
    def save_versions(self):
        """Save current version data to JSON file."""
        try:
            # Update last modified time
            self.version_data["last_updated"] = datetime.now(timezone.utc).isoformat()
            
            # Convert FileInfo objects to dictionaries
            save_data = self.version_data.copy()
            save_data["files"] = {
                filename: file_info.to_dict() 
                for filename, file_info in self.version_data["files"].items()
            }
            
            # Write to temporary file first, then rename for atomic operation
            temp_file = self.version_file.with_suffix('.json.tmp')
            with open(temp_file, 'w') as f:
                json.dump(save_data, f, indent=2)
            
            # Atomic rename
            temp_file.replace(self.version_file)
            
        except Exception as e:
            print(f"Failed to save version data: {e}")
            raise
    
    def get_file_info(self, filename: str) -> Optional[FileInfo]:
        """
        Get file information for a specific file.
        
        Args:
            filename: Name of the file
            
        Returns:
            FileInfo object or None if not tracked
        """
        return self.version_data["files"].get(filename)
    
    def get_file_version(self, filename: str) -> Optional[str]:
        """
        Get the version of a specific file.
        
        Args:
            filename: Name of the file
            
        Returns:
            Version string or None if not tracked
        """
        file_info = self.get_file_info(filename)
        return file_info.version if file_info else None
    
    def set_file_version(self, filename: str, version: str):
        """
        Set the version of a specific file.
        
        Args:
            filename: Name of the file
            version: Version string to set
        """
        self.update_file_info(filename, version)
    
    def update_file_info(self, filename: str, version: str, 
                        file_path: Optional[Path] = None):
        """
        Update file information.
        
        Args:
            filename: Name of the file
            version: New version string
            file_path: Path to file for hash calculation (optional)
        """
        file_info = FileInfo(version=version)
        
        # Calculate hash and size if file path provided
        if file_path and file_path.exists():
            file_info.hash = self._calculate_file_hash(file_path)
            file_info.size = file_path.stat().st_size
        
        self.version_data["files"][filename] = file_info
    
    def remove_file_info(self, filename: str):
        """Remove file from tracking."""
        if filename in self.version_data["files"]:
            del self.version_data["files"][filename]
    
    def compare_versions(self, filename: str, server_version: str) -> bool:
        """
        Compare local file version with server version.
        
        Args:
            filename: Name of the file
            server_version: Version from server
            
        Returns:
            True if update is needed (server version is different)
        """
        local_info = self.get_file_info(filename)
        if local_info is None:
            return True  # File not tracked, needs download
        
        return local_info.version != server_version
    
    def needs_update(self, server_file_dict: Dict[str, str]) -> Dict[str, str]:
        """
        Check which files need updating based on server file list.
        
        Args:
            server_file_dict: Dictionary mapping filename to version from server
            
        Returns:
            Dictionary mapping filename to version for files that need updating
        """
        updates_needed = {}
        
        for filename, server_version in server_file_dict.items():
            if self.compare_versions(filename, server_version):
                updates_needed[filename] = server_version
        
        return updates_needed
    
    def validate_file(self, file_path: Path, expected_hash: Optional[str] = None) -> bool:
        """
        Validate a file's integrity.
        
        Args:
            file_path: Path to the file to validate
            expected_hash: Expected hash value (optional)
            
        Returns:
            True if file is valid
        """
        if not file_path.exists():
            return False
        
        # If we have a stored hash, use it
        filename = file_path.name
        file_info = self.get_file_info(filename)
        
        if expected_hash:
            target_hash = expected_hash
        elif file_info and file_info.hash:
            target_hash = file_info.hash
        else:
            # No hash to compare against
            return True
        
        current_hash = self._calculate_file_hash(file_path)
        return current_hash == target_hash
    
    def _calculate_file_hash(self, file_path: Path) -> str:
        """Calculate SHA256 hash of a file."""
        sha256_hash = hashlib.sha256()
        
        try:
            with open(file_path, "rb") as f:
                # Read file in chunks to handle large files
                for chunk in iter(lambda: f.read(4096), b""):
                    sha256_hash.update(chunk)
            return sha256_hash.hexdigest()
        except Exception as e:
            print(f"Failed to calculate hash for {file_path}: {e}")
            return ""
    
    def get_all_tracked_files(self) -> Dict[str, FileInfo]:
        """Get all tracked files and their information."""
        return self.version_data["files"].copy()
    
    def cleanup_orphaned_entries(self, valid_files: List[str]):
        """
        Remove entries for files that are no longer valid.
        
        Args:
            valid_files: List of filenames that should be kept
        """
        current_files = list(self.version_data["files"].keys())
        for filename in current_files:
            if filename not in valid_files:
                self.remove_file_info(filename)
    
    def get_stats(self) -> Dict:
        """Get statistics about tracked files."""
        files = self.version_data["files"]
        total_size = sum(info.size for info in files.values() if info.size > 0)
        
        return {
            "total_files": len(files),
            "total_size_bytes": total_size,
            "total_size_mb": round(total_size / (1024 * 1024), 2),
            "last_updated": self.version_data.get("last_updated", "Never"),
            "files_with_hash": sum(1 for info in files.values() if info.hash)
        }


def parse_file_list(content: str) -> Dict[str, str]:
    """
    Parse server file list content.
    
    Args:
        content: Raw content from server file list
        
    Returns:
        Dictionary mapping filename to version
    """
    file_dict = {}
    
    for line in content.strip().split('\n'):
        line = line.strip()
        if line and ':' in line:
            parts = line.split(':', 1)
            if len(parts) == 2:
                filename, version = parts
                file_dict[filename.strip()] = version.strip()
    
    return file_dict