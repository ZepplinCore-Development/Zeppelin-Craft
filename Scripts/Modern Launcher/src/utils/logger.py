"""
Logging configuration for Zeppelin Launcher
Provides centralized logging with file rotation and different log levels.
"""

import logging
import logging.handlers
import sys
from pathlib import Path
from typing import Optional
from datetime import datetime


class ColoredFormatter(logging.Formatter):
    """Custom formatter that adds colors to console output."""
    
    # ANSI color codes
    COLORS = {
        'DEBUG': '\033[36m',     # Cyan
        'INFO': '\033[32m',      # Green
        'WARNING': '\033[33m',   # Yellow
        'ERROR': '\033[31m',     # Red
        'CRITICAL': '\033[35m',  # Magenta
        'RESET': '\033[0m'       # Reset
    }
    
    def format(self, record):
        """Format log record with colors for console output."""
        # Add color if outputting to console
        if hasattr(record, 'levelname') and record.levelname in self.COLORS:
            levelname_color = self.COLORS[record.levelname] + record.levelname + self.COLORS['RESET']
            record.levelname = levelname_color
        
        return super().format(record)


class LauncherLogger:
    """Centralized logger for the Zeppelin Launcher."""
    
    def __init__(self, log_directory: Optional[Path] = None, 
                 log_level: str = "INFO", max_size_mb: int = 10, 
                 backup_count: int = 3):
        """
        Initialize the logger.
        
        Args:
            log_directory: Directory to store log files
            log_level: Logging level (DEBUG, INFO, WARNING, ERROR, CRITICAL)
            max_size_mb: Maximum size of log file in MB before rotation
            backup_count: Number of backup files to keep
        """
        self.log_directory = log_directory or Path.cwd()
        self.log_level = getattr(logging, log_level.upper(), logging.INFO)
        self.max_size_bytes = max_size_mb * 1024 * 1024
        self.backup_count = backup_count
        
        # Ensure log directory exists
        self.log_directory.mkdir(parents=True, exist_ok=True)
        
        # Create logger
        self.logger = logging.getLogger('ZeppelinLauncher')
        self.logger.setLevel(self.log_level)
        
        # Remove any existing handlers
        for handler in self.logger.handlers[:]:
            self.logger.removeHandler(handler)
        
        self._setup_handlers()
    
    def _setup_handlers(self):
        """Set up file and console handlers."""
        # File handler with rotation
        log_file = self.log_directory / "launcher.log"
        file_handler = logging.handlers.RotatingFileHandler(
            log_file, 
            maxBytes=self.max_size_bytes,
            backupCount=self.backup_count,
            encoding='utf-8'
        )
        
        file_formatter = logging.Formatter(
            '%(asctime)s - %(name)s - %(levelname)s - %(filename)s:%(lineno)d - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        file_handler.setFormatter(file_formatter)
        file_handler.setLevel(self.log_level)
        
        # Console handler
        console_handler = logging.StreamHandler(sys.stdout)
        console_formatter = ColoredFormatter(
            '%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%H:%M:%S'
        )
        console_handler.setFormatter(console_formatter)
        console_handler.setLevel(self.log_level)
        
        # Add handlers to logger
        self.logger.addHandler(file_handler)
        self.logger.addHandler(console_handler)
    
    def debug(self, message: str, *args, **kwargs):
        """Log debug message."""
        self.logger.debug(message, *args, **kwargs)
    
    def info(self, message: str, *args, **kwargs):
        """Log info message."""
        self.logger.info(message, *args, **kwargs)
    
    def warning(self, message: str, *args, **kwargs):
        """Log warning message."""
        self.logger.warning(message, *args, **kwargs)
    
    def error(self, message: str, *args, **kwargs):
        """Log error message."""
        self.logger.error(message, *args, **kwargs)
    
    def critical(self, message: str, *args, **kwargs):
        """Log critical message."""
        self.logger.critical(message, *args, **kwargs)
    
    def exception(self, message: str, *args, **kwargs):
        """Log exception with traceback."""
        self.logger.exception(message, *args, **kwargs)
    
    def log_startup(self, version: str = "1.0"):
        """Log application startup information."""
        self.info("=" * 60)
        self.info(f"Zeppelin Launcher v{version} starting up")
        self.info(f"Start time: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
        self.info(f"Log directory: {self.log_directory}")
        self.info(f"Log level: {logging.getLevelName(self.log_level)}")
        self.info("=" * 60)
    
    def log_shutdown(self):
        """Log application shutdown."""
        self.info("Zeppelin Launcher shutting down")
        self.info("=" * 60)
    
    def log_download_start(self, filename: str, url: str):
        """Log download start."""
        self.info(f"Starting download: {filename} from {url}")
    
    def log_download_complete(self, filename: str, size_bytes: int, duration_seconds: float):
        """Log download completion."""
        size_mb = size_bytes / (1024 * 1024)
        speed_mbps = size_mb / duration_seconds if duration_seconds > 0 else 0
        self.info(f"Download complete: {filename} ({size_mb:.2f} MB in {duration_seconds:.1f}s, {speed_mbps:.2f} MB/s)")
    
    def log_download_error(self, filename: str, error: str):
        """Log download error."""
        self.error(f"Download failed: {filename} - {error}")
    
    def log_version_check(self, filename: str, local_version: str, server_version: str, needs_update: bool):
        """Log version check result."""
        status = "needs update" if needs_update else "up to date"
        self.debug(f"Version check: {filename} - local: {local_version}, server: {server_version} - {status}")
    
    def log_config_loaded(self, config_file: Path):
        """Log configuration loading."""
        self.info(f"Configuration loaded from: {config_file}")
    
    def log_config_error(self, error: str):
        """Log configuration error."""
        self.error(f"Configuration error: {error}")
    
    def set_level(self, level: str):
        """Change logging level at runtime."""
        new_level = getattr(logging, level.upper(), self.log_level)
        self.logger.setLevel(new_level)
        self.log_level = new_level
        
        # Update handler levels
        for handler in self.logger.handlers:
            handler.setLevel(new_level)
        
        self.info(f"Log level changed to: {logging.getLevelName(new_level)}")
    
    def get_log_file_path(self) -> Path:
        """Get the path to the current log file."""
        return self.log_directory / "launcher.log"
    
    def get_log_files(self) -> list[Path]:
        """Get list of all log files (current and rotated)."""
        log_files = []
        log_pattern = "launcher.log*"
        
        for log_file in self.log_directory.glob(log_pattern):
            if log_file.is_file():
                log_files.append(log_file)
        
        return sorted(log_files, key=lambda x: x.stat().st_mtime, reverse=True)
    
    def cleanup_old_logs(self, days_to_keep: int = 30):
        """Remove log files older than specified days."""
        import time
        
        cutoff_time = time.time() - (days_to_keep * 24 * 60 * 60)
        cleaned_count = 0
        
        for log_file in self.get_log_files():
            if log_file.stat().st_mtime < cutoff_time:
                try:
                    log_file.unlink()
                    cleaned_count += 1
                    self.debug(f"Removed old log file: {log_file}")
                except Exception as e:
                    self.warning(f"Failed to remove old log file {log_file}: {e}")
        
        if cleaned_count > 0:
            self.info(f"Cleaned up {cleaned_count} old log files")


# Global logger instance
_logger: Optional[LauncherLogger] = None


def get_logger() -> LauncherLogger:
    """Get the global logger instance."""
    global _logger
    if _logger is None:
        _logger = LauncherLogger()
    return _logger


def initialize_logger(log_directory: Optional[Path] = None, 
                     log_level: str = "INFO", 
                     max_size_mb: int = 10, 
                     backup_count: int = 3) -> LauncherLogger:
    """
    Initialize the global logger instance.
    
    Args:
        log_directory: Directory to store log files
        log_level: Logging level
        max_size_mb: Maximum log file size in MB
        backup_count: Number of backup files to keep
        
    Returns:
        LauncherLogger instance
    """
    global _logger
    _logger = LauncherLogger(log_directory, log_level, max_size_mb, backup_count)
    return _logger


def shutdown_logger():
    """Shutdown the logger and cleanup resources."""
    global _logger
    if _logger:
        _logger.log_shutdown()
        # Close all handlers
        for handler in _logger.logger.handlers[:]:
            handler.close()
            _logger.logger.removeHandler(handler)
        _logger = None


# Convenience functions for global logger
def debug(message: str, *args, **kwargs):
    """Log debug message using global logger."""
    get_logger().debug(message, *args, **kwargs)


def info(message: str, *args, **kwargs):
    """Log info message using global logger."""
    get_logger().info(message, *args, **kwargs)


def warning(message: str, *args, **kwargs):
    """Log warning message using global logger."""
    get_logger().warning(message, *args, **kwargs)


def error(message: str, *args, **kwargs):
    """Log error message using global logger."""
    get_logger().error(message, *args, **kwargs)


def critical(message: str, *args, **kwargs):
    """Log critical message using global logger."""
    get_logger().critical(message, *args, **kwargs)


def exception(message: str, *args, **kwargs):
    """Log exception using global logger."""
    get_logger().exception(message, *args, **kwargs)