"""
Logging configuration for zep CLI.

Provides centralized logging that captures all output to a log file
for debugging purposes. Log is overwritten each session.

Usage:
    from lib.logging_config import get_logger, setup_logging

    # Call once at CLI startup
    setup_logging()

    # Get logger in any module
    logger = get_logger(__name__)
    logger.debug("Detailed info")
    logger.info("General info")
    logger.warning("Warning message")
    logger.error("Error message")
"""

import logging
import sys
from datetime import datetime
from pathlib import Path

# Log file location
CLI_DIR = Path(__file__).parent.parent
LOG_DIR = CLI_DIR / 'logs'
LOG_FILE = LOG_DIR / 'zep.log'

# Module-level logger cache
_loggers = {}
_initialized = False


def setup_logging() -> None:
    """Initialize logging for the CLI session.

    Creates log directory if needed and configures file logging.
    Overwrites log file each session.
    """
    global _initialized

    if _initialized:
        return

    # Create logs directory
    LOG_DIR.mkdir(parents=True, exist_ok=True)

    # Create formatter with timestamp
    formatter = logging.Formatter(
        '%(asctime)s [%(levelname)s] %(name)s: %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S'
    )

    # File handler - overwrite each session (mode='w')
    file_handler = logging.FileHandler(LOG_FILE, mode='w', encoding='utf-8')
    file_handler.setLevel(logging.DEBUG)
    file_handler.setFormatter(formatter)

    # Configure root logger
    root_logger = logging.getLogger('zep')
    root_logger.setLevel(logging.DEBUG)
    root_logger.addHandler(file_handler)

    # Log session start
    root_logger.info(f"=== ZEP CLI Session Started ===")
    root_logger.info(f"Log file: {LOG_FILE}")
    root_logger.info(f"Python: {sys.version}")
    root_logger.info(f"Working dir: {Path.cwd()}")

    _initialized = True


def get_logger(name: str) -> logging.Logger:
    """Get a logger for the specified module.

    Args:
        name: Module name (typically __name__)

    Returns:
        Logger instance
    """
    if name not in _loggers:
        # Ensure logging is initialized
        setup_logging()

        # Create child logger under 'zep' namespace
        if name.startswith('cli.') or name.startswith('lib.'):
            logger_name = f"zep.{name}"
        else:
            logger_name = f"zep.{name}"

        _loggers[name] = logging.getLogger(logger_name)

    return _loggers[name]


def log_command(command: str, args: dict = None) -> None:
    """Log a CLI command invocation.

    Args:
        command: Command name (e.g., 'dbc rebuild')
        args: Command arguments
    """
    logger = get_logger('cli')
    logger.info(f"Command: {command}")
    if args:
        for key, value in args.items():
            if key != 'ctx':  # Skip context object
                logger.debug(f"  {key}: {value}")


def log_subprocess(cmd: list, returncode: int, stdout: str = None, stderr: str = None) -> None:
    """Log subprocess execution details.

    Args:
        cmd: Command list
        returncode: Process return code
        stdout: Standard output
        stderr: Standard error
    """
    logger = get_logger('subprocess')

    cmd_str = ' '.join(str(c) for c in cmd)
    logger.debug(f"Subprocess: {cmd_str}")
    logger.debug(f"Return code: {returncode}")

    if stdout:
        for line in stdout.strip().split('\n')[:50]:  # Limit to 50 lines
            logger.debug(f"  stdout: {line}")
        if stdout.count('\n') > 50:
            logger.debug(f"  ... ({stdout.count(chr(10)) - 50} more lines)")

    if stderr:
        for line in stderr.strip().split('\n')[:50]:
            logger.debug(f"  stderr: {line}")
        if stderr.count('\n') > 50:
            logger.debug(f"  ... ({stderr.count(chr(10)) - 50} more lines)")


def log_sql(sql: str, database: str, success: bool, output: str = None) -> None:
    """Log SQL execution.

    Args:
        sql: SQL statement (truncated if long)
        database: Target database name
        success: Whether execution succeeded
        output: Query output or error message
    """
    logger = get_logger('sql')

    # Truncate long SQL for log readability
    sql_preview = sql[:200] + '...' if len(sql) > 200 else sql
    sql_preview = sql_preview.replace('\n', ' ')

    status = "OK" if success else "FAILED"
    logger.debug(f"SQL [{database}] {status}: {sql_preview}")

    if output and not success:
        logger.error(f"SQL Error: {output[:500]}")
