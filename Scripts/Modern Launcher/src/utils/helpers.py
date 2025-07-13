"""
Utility helper functions for Zeppelin Launcher
Common utility functions used across the application.
"""

import os
import sys
import platform
import subprocess
from pathlib import Path
from typing import Optional, Tuple, List
import hashlib
import json


def get_platform_info() -> dict:
    """Get information about the current platform."""
    return {
        "system": platform.system(),
        "release": platform.release(),
        "version": platform.version(),
        "machine": platform.machine(),
        "processor": platform.processor(),
        "python_version": platform.python_version(),
        "python_implementation": platform.python_implementation()
    }


def is_windows() -> bool:
    """Check if running on Windows."""
    return platform.system().lower() == "windows"


def is_admin() -> bool:
    """Check if running with administrator privileges."""
    try:
        if is_windows():
            import ctypes
            return ctypes.windll.shell32.IsUserAnAdmin()
        else:
            return os.geteuid() == 0
    except:
        return False


def find_wow_installation(search_paths: Optional[List[Path]] = None) -> Optional[Path]:
    """
    Find WoW installation directory by looking for Wow.exe.
    
    Args:
        search_paths: Additional paths to search
        
    Returns:
        Path to WoW directory or None if not found
    """
    default_paths = []
    
    if is_windows():
        default_paths.extend([
            Path("C:/Program Files (x86)/World of Warcraft"),
            Path("C:/Program Files/World of Warcraft"),
            Path("C:/Games/World of Warcraft"),
            Path("D:/Games/World of Warcraft"),
            Path("E:/Games/World of Warcraft"),
        ])
    else:
        # Linux/Mac paths (Wine, etc.)
        home = Path.home()
        default_paths.extend([
            home / ".wine/drive_c/Program Files (x86)/World of Warcraft",
            home / "Games/World of Warcraft",
            home / "wow",
        ])
    
    # Add custom search paths
    if search_paths:
        default_paths.extend(search_paths)
    
    # Add current directory
    default_paths.append(Path.cwd())
    
    for path in default_paths:
        if path.exists() and (path / "Wow.exe").exists():
            return path
    
    return None


def launch_wow(wow_path: Path, args: Optional[List[str]] = None) -> bool:
    """
    Launch World of Warcraft.
    
    Args:
        wow_path: Path to WoW directory
        args: Additional command line arguments
        
    Returns:
        True if launch was successful
    """
    wow_exe = wow_path / "Wow.exe"
    
    if not wow_exe.exists():
        return False
    
    try:
        cmd = [str(wow_exe)]
        if args:
            cmd.extend(args)
        
        if is_windows():
            # On Windows, use startfile to launch in background
            subprocess.Popen(cmd, cwd=str(wow_path))
        else:
            # On Linux/Mac, might need Wine
            subprocess.Popen(cmd, cwd=str(wow_path))
        
        return True
    except Exception:
        return False


def validate_file_integrity(file_path: Path, expected_hash: str, 
                          hash_algorithm: str = "sha256") -> bool:
    """
    Validate file integrity using hash comparison.
    
    Args:
        file_path: Path to file to validate
        expected_hash: Expected hash value
        hash_algorithm: Hash algorithm to use (md5, sha1, sha256, etc.)
        
    Returns:
        True if file hash matches expected hash
    """
    if not file_path.exists():
        return False
    
    try:
        hasher = hashlib.new(hash_algorithm)
        
        with open(file_path, 'rb') as f:
            for chunk in iter(lambda: f.read(4096), b""):
                hasher.update(chunk)
        
        actual_hash = hasher.hexdigest()
        return actual_hash.lower() == expected_hash.lower()
        
    except Exception:
        return False


def safe_file_replace(source: Path, destination: Path, 
                     backup_suffix: str = ".bak") -> bool:
    """
    Safely replace a file with backup.
    
    Args:
        source: Source file to move
        destination: Destination file to replace
        backup_suffix: Suffix for backup file
        
    Returns:
        True if replacement was successful
    """
    try:
        # Create backup if destination exists
        if destination.exists():
            backup_path = destination.with_suffix(destination.suffix + backup_suffix)
            destination.rename(backup_path)
        
        # Move source to destination
        source.rename(destination)
        
        return True
    except Exception:
        return False


def format_bytes(size: int) -> str:
    """Format byte size in human readable format."""
    if size == 0:
        return "0 B"
    
    units = ["B", "KB", "MB", "GB", "TB", "PB"]
    unit_index = 0
    size_float = float(size)
    
    while size_float >= 1024.0 and unit_index < len(units) - 1:
        size_float /= 1024.0
        unit_index += 1
    
    if unit_index == 0:
        return f"{int(size_float)} {units[unit_index]}"
    else:
        return f"{size_float:.1f} {units[unit_index]}"


def format_duration(seconds: float) -> str:
    """Format duration in human readable format."""
    if seconds < 0:
        return "Unknown"
    
    hours = int(seconds // 3600)
    minutes = int((seconds % 3600) // 60)
    secs = int(seconds % 60)
    
    if hours > 0:
        return f"{hours:02d}:{minutes:02d}:{secs:02d}"
    elif minutes > 0:
        return f"{minutes:02d}:{secs:02d}"
    else:
        return f"{secs}s"


def create_directory_if_not_exists(directory: Path) -> bool:
    """
    Create directory if it doesn't exist.
    
    Args:
        directory: Directory path to create
        
    Returns:
        True if directory exists or was created successfully
    """
    try:
        directory.mkdir(parents=True, exist_ok=True)
        return True
    except Exception:
        return False


def get_available_disk_space(path: Path) -> int:
    """
    Get available disk space for a given path.
    
    Args:
        path: Path to check disk space for
        
    Returns:
        Available space in bytes
    """
    try:
        if is_windows():
            import ctypes
            free_bytes = ctypes.c_ulonglong(0)
            ctypes.windll.kernel32.GetDiskFreeSpaceExW(
                ctypes.c_wchar_p(str(path)),
                ctypes.pointer(free_bytes),
                None,
                None
            )
            return free_bytes.value
        else:
            statvfs = os.statvfs(str(path))
            return statvfs.f_frsize * statvfs.f_available
    except Exception:
        return 0


def check_network_connectivity(url: str = "http://www.google.com", 
                             timeout: int = 5) -> bool:
    """
    Check if network connectivity is available.
    
    Args:
        url: URL to test connectivity against
        timeout: Timeout in seconds
        
    Returns:
        True if network is available
    """
    try:
        import requests
        response = requests.get(url, timeout=timeout)
        return response.status_code == 200
    except Exception:
        return False


def parse_version_string(version: str) -> Tuple[int, ...]:
    """
    Parse version string into tuple of integers for comparison.
    
    Args:
        version: Version string like "1.2.3"
        
    Returns:
        Tuple of integers (1, 2, 3)
    """
    try:
        parts = version.split('.')
        return tuple(int(part) for part in parts)
    except Exception:
        return (0,)


def compare_versions(version1: str, version2: str) -> int:
    """
    Compare two version strings.
    
    Args:
        version1: First version string
        version2: Second version string
        
    Returns:
        -1 if version1 < version2, 0 if equal, 1 if version1 > version2
    """
    v1_parts = parse_version_string(version1)
    v2_parts = parse_version_string(version2)
    
    # Pad with zeros to make same length
    max_len = max(len(v1_parts), len(v2_parts))
    v1_parts = v1_parts + (0,) * (max_len - len(v1_parts))
    v2_parts = v2_parts + (0,) * (max_len - len(v2_parts))
    
    if v1_parts < v2_parts:
        return -1
    elif v1_parts > v2_parts:
        return 1
    else:
        return 0


def load_json_file(file_path: Path) -> Optional[dict]:
    """
    Load JSON file safely.
    
    Args:
        file_path: Path to JSON file
        
    Returns:
        Parsed JSON data or None if failed
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            return json.load(f)
    except Exception:
        return None


def save_json_file(file_path: Path, data: dict, indent: int = 2) -> bool:
    """
    Save data to JSON file safely.
    
    Args:
        file_path: Path to save JSON file
        data: Data to save
        indent: JSON indentation
        
    Returns:
        True if saved successfully
    """
    try:
        # Ensure directory exists
        file_path.parent.mkdir(parents=True, exist_ok=True)
        
        # Write to temporary file first, then rename for atomic operation
        temp_path = file_path.with_suffix('.tmp')
        
        with open(temp_path, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=indent, ensure_ascii=False)
        
        # Atomic rename
        temp_path.replace(file_path)
        return True
        
    except Exception:
        return False


def get_executable_path() -> Path:
    """Get path to the current executable or script."""
    if getattr(sys, 'frozen', False):
        # Running as compiled executable
        return Path(sys.executable)
    else:
        # Running as script
        return Path(sys.argv[0]).resolve()


def get_application_directory() -> Path:
    """Get the directory containing the application."""
    exe_path = get_executable_path()
    return exe_path.parent