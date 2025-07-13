"""
File Download Manager for Zeppelin Launcher
Handles downloading files with progress tracking, resume capability, and error handling.
"""

import requests
import threading
import time
from pathlib import Path
from typing import Callable, Optional, Dict, Any
from concurrent.futures import ThreadPoolExecutor, Future
import shutil


class DownloadProgress:
    """Tracks download progress information."""
    
    def __init__(self, filename: str, total_size: int = 0):
        self.filename = filename
        self.total_size = total_size
        self.downloaded = 0
        self.speed = 0.0
        self.eta = 0
        self.start_time = time.time()
        self.last_update = time.time()
        self.is_complete = False
        self.error = None
    
    def update(self, bytes_downloaded: int):
        """Update progress with new downloaded bytes."""
        current_time = time.time()
        self.downloaded += bytes_downloaded
        
        # Calculate speed (bytes per second)
        time_diff = current_time - self.last_update
        if time_diff > 0:
            self.speed = bytes_downloaded / time_diff
        
        # Calculate ETA
        if self.speed > 0 and self.total_size > 0:
            remaining_bytes = self.total_size - self.downloaded
            self.eta = remaining_bytes / self.speed
        
        self.last_update = current_time
    
    @property
    def progress_percent(self) -> float:
        """Get progress as percentage (0-100)."""
        if self.total_size == 0:
            return 0.0
        return min(100.0, (self.downloaded / self.total_size) * 100)
    
    @property
    def speed_mb_s(self) -> float:
        """Get download speed in MB/s."""
        return self.speed / (1024 * 1024)
    
    @property
    def eta_formatted(self) -> str:
        """Get ETA as formatted string."""
        if self.eta <= 0:
            return "Unknown"
        
        hours = int(self.eta // 3600)
        minutes = int((self.eta % 3600) // 60)
        seconds = int(self.eta % 60)
        
        if hours > 0:
            return f"{hours:02d}:{minutes:02d}:{seconds:02d}"
        else:
            return f"{minutes:02d}:{seconds:02d}"


class DownloadManager:
    """Manages file downloads with progress tracking and error handling."""
    
    def __init__(self, max_concurrent_downloads: int = 3, 
                 chunk_size: int = 8192, timeout: int = 30):
        """
        Initialize the download manager.
        
        Args:
            max_concurrent_downloads: Maximum number of simultaneous downloads
            chunk_size: Size of download chunks in bytes
            timeout: Network timeout in seconds
        """
        self.max_concurrent_downloads = max_concurrent_downloads
        self.chunk_size = chunk_size
        self.timeout = timeout
        
        self.active_downloads: Dict[str, DownloadProgress] = {}
        self.executor = ThreadPoolExecutor(max_workers=max_concurrent_downloads)
        self.session = requests.Session()
        
        # Set session defaults
        self.session.headers.update({
            'User-Agent': 'ZeppelinLauncher/1.0'
        })
        
        # Callbacks
        self.progress_callback: Optional[Callable[[DownloadProgress], None]] = None
        self.completion_callback: Optional[Callable[[str, bool, Optional[str]], None]] = None
    
    def set_progress_callback(self, callback: Callable[[DownloadProgress], None]):
        """Set callback for progress updates."""
        self.progress_callback = callback
    
    def set_completion_callback(self, callback: Callable[[str, bool, Optional[str]], None]):
        """Set callback for download completion (filename, success, error_message)."""
        self.completion_callback = callback
    
    def download_file(self, url: str, destination: Path, 
                     resume: bool = True) -> Future:
        """
        Download a file asynchronously.
        
        Args:
            url: URL to download from
            destination: Local file path to save to
            resume: Whether to resume partial downloads
            
        Returns:
            Future object for the download task
        """
        filename = destination.name
        
        # Check if already downloading
        if filename in self.active_downloads:
            raise ValueError(f"File {filename} is already being downloaded")
        
        # Create progress tracker
        progress = DownloadProgress(filename)
        self.active_downloads[filename] = progress
        
        # Submit download task
        future = self.executor.submit(self._download_worker, url, destination, resume)
        
        return future
    
    def _download_worker(self, url: str, destination: Path, resume: bool) -> bool:
        """Worker function for downloading a file."""
        filename = destination.name
        progress = self.active_downloads[filename]
        
        try:
            # Ensure destination directory exists
            destination.parent.mkdir(parents=True, exist_ok=True)
            
            # Check for partial download
            resume_header = {}
            if resume and destination.exists():
                existing_size = destination.stat().st_size
                resume_header['Range'] = f'bytes={existing_size}-'
                progress.downloaded = existing_size
            
            # Make request
            response = self.session.get(url, headers=resume_header, 
                                      stream=True, timeout=self.timeout)
            response.raise_for_status()
            
            # Get total size
            if 'content-length' in response.headers:
                content_length = int(response.headers['content-length'])
                if resume and 'content-range' in response.headers:
                    # For resumed downloads, content-length is remaining bytes
                    progress.total_size = progress.downloaded + content_length
                else:
                    progress.total_size = content_length
            
            # Open file for writing
            mode = 'ab' if resume and destination.exists() else 'wb'
            
            with open(destination, mode) as f:
                for chunk in response.iter_content(chunk_size=self.chunk_size):
                    if chunk:  # Filter out keep-alive chunks
                        f.write(chunk)
                        progress.update(len(chunk))
                        
                        # Call progress callback
                        if self.progress_callback:
                            self.progress_callback(progress)
            
            progress.is_complete = True
            
            # Call completion callback
            if self.completion_callback:
                self.completion_callback(filename, True, None)
            
            return True
            
        except Exception as e:
            error_msg = f"Download failed: {str(e)}"
            progress.error = error_msg
            
            # Call completion callback with error
            if self.completion_callback:
                self.completion_callback(filename, False, error_msg)
            
            return False
        
        finally:
            # Remove from active downloads
            if filename in self.active_downloads:
                del self.active_downloads[filename]
    
    def download_file_list(self, url: str, timeout: Optional[int] = None) -> Optional[str]:
        """
        Download a file list (like mandatory_file_list.txt) synchronously.
        
        Args:
            url: URL to download from
            timeout: Request timeout (uses instance default if None)
            
        Returns:
            File content as string, or None if failed
        """
        try:
            response = self.session.get(url, timeout=timeout or self.timeout)
            response.raise_for_status()
            return response.text
        except Exception as e:
            print(f"Failed to download file list from {url}: {e}")
            return None
    
    def get_download_progress(self, filename: str) -> Optional[DownloadProgress]:
        """Get progress information for a specific download."""
        return self.active_downloads.get(filename)
    
    def get_all_progress(self) -> Dict[str, DownloadProgress]:
        """Get progress information for all active downloads."""
        return self.active_downloads.copy()
    
    def is_downloading(self, filename: str) -> bool:
        """Check if a file is currently being downloaded."""
        return filename in self.active_downloads
    
    def cancel_download(self, filename: str) -> bool:
        """
        Cancel an active download.
        
        Args:
            filename: Name of file to cancel
            
        Returns:
            True if download was cancelled
        """
        # Note: requests doesn't have built-in cancellation,
        # so we just remove from tracking. The download will complete
        # but won't trigger callbacks.
        if filename in self.active_downloads:
            del self.active_downloads[filename]
            return True
        return False
    
    def cancel_all_downloads(self):
        """Cancel all active downloads."""
        self.active_downloads.clear()
    
    def validate_file_size(self, file_path: Path, expected_size: int) -> bool:
        """
        Validate that a downloaded file has the expected size.
        
        Args:
            file_path: Path to the file
            expected_size: Expected file size in bytes
            
        Returns:
            True if file size matches
        """
        try:
            if not file_path.exists():
                return False
            actual_size = file_path.stat().st_size
            return actual_size == expected_size
        except Exception:
            return False
    
    def create_backup(self, file_path: Path) -> Optional[Path]:
        """
        Create a backup of an existing file.
        
        Args:
            file_path: Path to the file to backup
            
        Returns:
            Path to backup file, or None if failed
        """
        if not file_path.exists():
            return None
        
        try:
            backup_path = file_path.with_suffix(file_path.suffix + '.bak')
            
            # If backup already exists, add number suffix
            counter = 1
            while backup_path.exists():
                backup_path = file_path.with_suffix(f'{file_path.suffix}.bak.{counter}')
                counter += 1
            
            shutil.copy2(file_path, backup_path)
            return backup_path
            
        except Exception as e:
            print(f"Failed to create backup of {file_path}: {e}")
            return None
    
    def cleanup(self):
        """Clean up resources."""
        self.cancel_all_downloads()
        self.executor.shutdown(wait=True)
        self.session.close()
    
    def __enter__(self):
        """Context manager entry."""
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Context manager exit."""
        self.cleanup()


# Utility functions
def format_file_size(size_bytes: int) -> str:
    """Format file size in human readable format."""
    if size_bytes == 0:
        return "0 B"
    
    size_names = ["B", "KB", "MB", "GB", "TB"]
    i = 0
    size = float(size_bytes)
    
    while size >= 1024.0 and i < len(size_names) - 1:
        size /= 1024.0
        i += 1
    
    return f"{size:.1f} {size_names[i]}"


def validate_url(url: str) -> bool:
    """Basic URL validation."""
    return url.startswith(('http://', 'https://')) and '.' in url