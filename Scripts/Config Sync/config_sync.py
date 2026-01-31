#!/usr/bin/env python3
"""
Config Sync Tool for Zeppelin Server (F-038)

Compares .conf and .conf.dist files to identify new and deprecated options.
Provides interactive mode for adding new options with context.

Usage:
    python3 config_sync.py                     # Dry-run: show differences
    python3 config_sync.py --sync              # Interactive: prompt for each change
    python3 config_sync.py --auto              # Auto: use defaults, remove deprecated
    python3 config_sync.py --file worldserver  # Process single file pair
"""

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple


# Default paths
SCRIPT_DIR = Path(__file__).parent
ZEPPELIN_CRAFT = SCRIPT_DIR.parent.parent
DEFAULT_CONFIG_DIR = ZEPPELIN_CRAFT / "Configs"

# Files to skip (different format)
SKIP_FILES = {"wowchat.conf"}


class Colors:
    """ANSI color codes for terminal output"""
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    MAGENTA = '\033[95m'
    RESET = '\033[0m'
    BOLD = '\033[1m'
    DIM = '\033[2m'


@dataclass
class ConfigOption:
    """Represents a single configuration option"""
    name: str
    value: str
    line_number: int
    comment_block: str = ""
    section: str = ""


@dataclass
class ConfigFile:
    """Represents a parsed config file"""
    path: Path
    options: Dict[str, ConfigOption] = field(default_factory=dict)
    sections: List[str] = field(default_factory=list)
    raw_lines: List[str] = field(default_factory=list)


@dataclass
class ComparisonResult:
    """Results of comparing two config files"""
    new_options: List[ConfigOption] = field(default_factory=list)
    deprecated_options: List[ConfigOption] = field(default_factory=list)


def parse_option_line(line: str) -> Optional[Tuple[str, str]]:
    """
    Parse a line like 'OptionName = value' or 'OptionName=value'
    Returns (name, value) or None if not an option line.
    """
    stripped = line.strip()

    # Skip comments and empty lines
    if not stripped or stripped.startswith('#'):
        return None

    # Skip section headers
    if stripped.startswith('[') and stripped.endswith(']'):
        return None

    # Match Key = value pattern (with optional spaces)
    match = re.match(r'^([A-Za-z0-9_.]+)\s*=\s*(.*)$', stripped)
    if match:
        return match.group(1), match.group(2).strip()

    return None


def extract_comment_block(lines: List[str], option_line_idx: int) -> str:
    """
    Extract the comment block preceding an option.
    Goes backwards from the option line until we hit a non-comment line.
    """
    comment_lines = []
    idx = option_line_idx - 1

    while idx >= 0:
        line = lines[idx].rstrip()

        # Stop at empty line that's not part of a comment block
        if not line:
            # Check if previous line is also empty or not a comment
            if idx > 0 and (not lines[idx-1].strip() or not lines[idx-1].strip().startswith('#')):
                break
            # Empty line within comment block, include it
            comment_lines.insert(0, line)
        elif line.strip().startswith('#'):
            comment_lines.insert(0, line)
        else:
            # Hit a non-comment, non-empty line (previous option)
            break

        idx -= 1

    # Remove leading empty lines
    while comment_lines and not comment_lines[0].strip():
        comment_lines.pop(0)

    return '\n'.join(comment_lines)


def extract_option_docs(comment_block: str, option_name: str) -> str:
    """
    Extract documentation for a specific option from a multi-option comment block.
    Returns just the Description and Default for that option.
    """
    if not comment_block:
        return ""

    lines = comment_block.split('\n')
    result = []
    in_option_section = False
    found_option = False

    for i, line in enumerate(lines):
        stripped = line.lstrip('#').strip()

        # Check if this line mentions our option name
        if option_name in stripped and not in_option_section:
            in_option_section = True
            found_option = True
            result.append(line)
            continue

        if in_option_section:
            # Check if we hit another option definition (new option name pattern)
            # Options are typically indented like "    OptionName" or "OptionName"
            if stripped and not stripped.startswith(('Description:', 'Default:', 'Important:', 'Example:', 'Format:')):
                # Check if this looks like a new option name (no spaces, has dots or caps)
                if re.match(r'^[A-Z][A-Za-z0-9_.]+$', stripped.split()[0] if stripped.split() else ''):
                    # New option section, stop
                    break

            result.append(line)

            # If we've collected Description and Default, we can stop
            if 'Default:' in stripped:
                # Include a few more lines for multi-line defaults
                for j in range(i + 1, min(i + 5, len(lines))):
                    next_line = lines[j].lstrip('#').strip()
                    if next_line and not next_line.startswith(('Description:', 'Important:', 'Example:')):
                        if re.match(r'^\d+\s*-|^"', next_line) or next_line.startswith(' '):
                            result.append(lines[j])
                        else:
                            break
                    else:
                        break
                break

    if found_option and result:
        return '\n'.join(result)

    # Fallback: try to find just Description/Default anywhere
    desc_lines = []
    for line in lines:
        stripped = line.lstrip('#').strip()
        if stripped.startswith('Description:') or stripped.startswith('Default:'):
            desc_lines.append(line)
        elif desc_lines and stripped and not stripped.startswith(('#', 'Example:', 'Important:')):
            # Continuation of previous field
            if stripped[0].islower() or stripped.startswith(' '):
                desc_lines.append(line)

    if desc_lines:
        return '\n'.join(desc_lines[:10])  # Limit to 10 lines

    # Final fallback: return truncated original (max 15 lines)
    if len(lines) > 15:
        return '\n'.join(lines[:15]) + '\n#        ...(truncated)'

    return comment_block


def parse_config(path: Path) -> ConfigFile:
    """
    Parse an AzerothCore config file.
    Returns ConfigFile with options dict keyed by option name.
    """
    config = ConfigFile(path=path)

    if not path.exists():
        return config

    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        config.raw_lines = f.readlines()

    current_section = ""

    for idx, line in enumerate(config.raw_lines):
        stripped = line.strip()

        # Track section headers
        if stripped.startswith('[') and stripped.endswith(']'):
            current_section = stripped[1:-1]
            if current_section not in config.sections:
                config.sections.append(current_section)
            continue

        # Parse option lines
        parsed = parse_option_line(line)
        if parsed:
            name, value = parsed
            comment_block = extract_comment_block(config.raw_lines, idx)

            config.options[name] = ConfigOption(
                name=name,
                value=value,
                line_number=idx + 1,  # 1-indexed
                comment_block=comment_block,
                section=current_section
            )

    return config


def compare_configs(conf: ConfigFile, dist: ConfigFile) -> ComparisonResult:
    """
    Compare .conf against .conf.dist to find differences.
    """
    result = ComparisonResult()

    # Find new options (in dist but not in conf)
    for name, option in dist.options.items():
        if name not in conf.options:
            result.new_options.append(option)

    # Find deprecated options (in conf but not in dist)
    for name, option in conf.options.items():
        if name not in dist.options:
            result.deprecated_options.append(option)

    return result


def format_comment_block(comment: str, indent: str = "  ") -> str:
    """Format comment block for display with indentation"""
    if not comment:
        return f"{indent}{Colors.DIM}(no description available){Colors.RESET}"

    lines = comment.split('\n')
    formatted = []

    for line in lines:
        # Remove the leading # and format
        content = line.lstrip('#').rstrip()
        if content:
            formatted.append(f"{indent}{Colors.DIM}{content}{Colors.RESET}")

    return '\n'.join(formatted) if formatted else f"{indent}{Colors.DIM}(no description){Colors.RESET}"


def prompt_new_option(option: ConfigOption) -> Tuple[Optional[str], bool]:
    """
    Prompt user for a new option value.
    Returns: (value to use, is_custom) - value is None to skip, is_custom indicates if non-default.
    """
    print(f"\n{Colors.CYAN}NEW OPTION:{Colors.RESET} {Colors.BOLD}{option.name}{Colors.RESET}")
    print("-" * 60)

    # Extract just the relevant documentation for this specific option
    docs = extract_option_docs(option.comment_block, option.name)
    print(format_comment_block(docs))
    print()
    print(f"  Default value: {Colors.GREEN}{option.value}{Colors.RESET}")
    print()

    while True:
        response = input(f"Add this option? [{Colors.GREEN}y{Colors.RESET}=default/{Colors.RED}n{Colors.RESET}=skip/{Colors.YELLOW}c{Colors.RESET}=custom]: ").strip().lower()

        if response in ('y', 'yes', ''):
            return option.value, False  # Default value, not custom
        elif response in ('n', 'no'):
            return None, False
        elif response in ('c', 'custom'):
            custom = input(f"Enter custom value: ").strip()
            return custom, True  # Custom value
        else:
            print(f"{Colors.YELLOW}Please enter y, n, or c{Colors.RESET}")


def prompt_deprecated_option(option: ConfigOption) -> bool:
    """
    Prompt user about a deprecated option.
    Returns: True to remove, False to keep.
    """
    print(f"\n{Colors.RED}DEPRECATED:{Colors.RESET} {Colors.BOLD}{option.name}{Colors.RESET}")
    print("-" * 60)
    print(f"  This option no longer exists in .conf.dist")
    print(f"  Your current value: {Colors.YELLOW}{option.value}{Colors.RESET}")
    print()

    while True:
        response = input(f"Remove this option? [{Colors.GREEN}y{Colors.RESET}=remove/{Colors.RED}n{Colors.RESET}=keep]: ").strip().lower()

        if response in ('y', 'yes', ''):
            return True
        elif response in ('n', 'no'):
            return False
        else:
            print(f"{Colors.YELLOW}Please enter y or n{Colors.RESET}")


def apply_changes(conf_path: Path, additions: List[Tuple[str, str]],
                  removals: List[str]) -> bool:
    """
    Apply changes to the config file.
    - additions: list of (option_name, value) to add at end of file
    - removals: list of option names to remove
    """
    if not additions and not removals:
        return True

    try:
        with open(conf_path, 'r', encoding='utf-8', errors='replace') as f:
            lines = f.readlines()

        # Remove deprecated options
        if removals:
            new_lines = []
            removal_set = set(removals)
            skip_until_next_option = False

            for line in lines:
                parsed = parse_option_line(line)
                if parsed:
                    name, _ = parsed
                    if name in removal_set:
                        skip_until_next_option = False
                        continue  # Skip this line

                new_lines.append(line)

            lines = new_lines

        # Add new options at end of file
        if additions:
            # Ensure file ends with newline
            if lines and not lines[-1].endswith('\n'):
                lines[-1] += '\n'

            # Add separator comment
            lines.append('\n')
            lines.append('#\n')
            lines.append('# Options added by config_sync\n')
            lines.append('#\n')

            for name, value in additions:
                lines.append(f'{name} = {value}\n')

        # Write back
        with open(conf_path, 'w', encoding='utf-8') as f:
            f.writelines(lines)

        return True

    except Exception as e:
        print(f"{Colors.RED}Error writing {conf_path}: {e}{Colors.RESET}")
        return False


def find_config_pairs(config_dir: Path, include_modules: bool = True) -> List[Tuple[Path, Path]]:
    """
    Find all .conf / .conf.dist pairs in the config directory.
    Returns list of (conf_path, dist_path) tuples.
    """
    pairs = []

    # Root level configs
    for dist_file in config_dir.glob("*.conf.dist"):
        conf_name = dist_file.name.replace('.conf.dist', '.conf')

        # Skip files with different formats
        if conf_name in SKIP_FILES:
            continue

        conf_file = config_dir / conf_name
        pairs.append((conf_file, dist_file))

    # Module configs
    if include_modules:
        modules_dir = config_dir / "modules"
        if modules_dir.exists():
            for dist_file in modules_dir.glob("*.conf.dist"):
                conf_name = dist_file.name.replace('.conf.dist', '.conf')
                conf_file = modules_dir / conf_name
                pairs.append((conf_file, dist_file))

    return sorted(pairs, key=lambda x: x[0].name)


def process_file_pair(conf_path: Path, dist_path: Path,
                      mode: str = 'dry-run') -> Tuple[int, int, int, int]:
    """
    Process a single config file pair.
    Returns (new_count, deprecated_count, added_count, removed_count)
    """
    conf = parse_config(conf_path)
    dist = parse_config(dist_path)

    result = compare_configs(conf, dist)

    new_count = len(result.new_options)
    deprecated_count = len(result.deprecated_options)
    added_count = 0
    removed_count = 0

    if mode == 'dry-run':
        # Just report, don't modify
        return new_count, deprecated_count, 0, 0

    additions = []  # (name, value, is_custom) tuples
    removals = []

    # Handle new options
    for option in result.new_options:
        if mode == 'sync':
            value, is_custom = prompt_new_option(option)
            if value is not None:
                additions.append((option.name, value, is_custom))
                added_count += 1
        elif mode == 'auto':
            additions.append((option.name, option.value, False))
            added_count += 1

    # Handle deprecated options
    for option in result.deprecated_options:
        if mode == 'sync':
            if prompt_deprecated_option(option):
                removals.append(option.name)
                removed_count += 1
        elif mode == 'auto':
            removals.append(option.name)
            removed_count += 1

    # Apply changes
    creating_from_dist = not conf_path.exists()
    success = False

    if creating_from_dist and (additions or removals):
        # Copy from dist first - this gives us all default values
        import shutil
        try:
            shutil.copy(dist_path, conf_path)
            print(f"  {Colors.YELLOW}Created {conf_path.name} from .dist{Colors.RESET}")

            # Only add options with CUSTOM values (defaults are already in the copied file)
            custom_additions = [(name, value) for name, value, is_custom in additions if is_custom]
            success = apply_changes(conf_path, custom_additions, removals)

            # Show what happened
            if success:
                default_count = added_count - len(custom_additions)
                if default_count > 0:
                    print(f"  {Colors.DIM}({default_count} default values already in .dist, {len(custom_additions)} custom values added){Colors.RESET}")
        except Exception as e:
            print(f"{Colors.RED}Error creating {conf_path}: {e}{Colors.RESET}")
            success = False
    elif additions or removals:
        # Existing conf file - add all requested options
        all_additions = [(name, value) for name, value, _ in additions]
        success = apply_changes(conf_path, all_additions, removals)

    # Only count changes if write succeeded
    if not success:
        added_count = 0
        removed_count = 0

    return new_count, deprecated_count, added_count, removed_count


def print_dry_run_report(conf_path: Path, dist_path: Path,
                         conf: ConfigFile, result: ComparisonResult):
    """Print detailed dry-run report for a file pair"""

    if not result.new_options and not result.deprecated_options:
        print(f"  {Colors.GREEN}No changes needed{Colors.RESET}")
        return

    if result.new_options:
        print(f"\n  {Colors.CYAN}NEW OPTIONS ({len(result.new_options)}):{Colors.RESET}")
        for opt in result.new_options:
            print(f"    {Colors.GREEN}+{Colors.RESET} {opt.name}")
            # Show brief description if available
            if opt.comment_block:
                desc_match = re.search(r'Description:\s*(.+?)(?:\n|$)', opt.comment_block)
                if desc_match:
                    desc = desc_match.group(1).strip()[:60]
                    print(f"      {Colors.DIM}{desc}...{Colors.RESET}")
            print(f"      Default: {Colors.DIM}{opt.value}{Colors.RESET}")

    if result.deprecated_options:
        print(f"\n  {Colors.RED}DEPRECATED OPTIONS ({len(result.deprecated_options)}):{Colors.RESET}")
        for opt in result.deprecated_options:
            print(f"    {Colors.RED}-{Colors.RESET} {opt.name}")
            print(f"      Your value: {Colors.DIM}{opt.value}{Colors.RESET}")


def main():
    parser = argparse.ArgumentParser(
        description="Config Sync Tool - Compare .conf and .conf.dist files",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s                          # Dry-run: show all differences
  %(prog)s --sync                   # Interactive: prompt for each change
  %(prog)s --auto                   # Auto: use defaults, remove deprecated
  %(prog)s --file worldserver       # Process only worldserver.conf
  %(prog)s --no-modules             # Skip modules/ subdirectory
        """
    )

    parser.add_argument(
        '--sync', '-s',
        action='store_true',
        help='Interactive mode: prompt for each new/deprecated option'
    )

    parser.add_argument(
        '--auto', '-a',
        action='store_true',
        help='Auto mode: add new with defaults, remove deprecated'
    )

    parser.add_argument(
        '--config-dir', '-c',
        type=Path,
        default=DEFAULT_CONFIG_DIR,
        help=f'Config directory (default: {DEFAULT_CONFIG_DIR})'
    )

    parser.add_argument(
        '--file', '-f',
        type=str,
        help='Process only this file (e.g., "worldserver" or "worldserver.conf")'
    )

    parser.add_argument(
        '--no-modules',
        action='store_true',
        help='Skip modules/ subdirectory'
    )

    args = parser.parse_args()

    # Determine mode
    if args.sync and args.auto:
        parser.error("Cannot use both --sync and --auto")

    if args.sync:
        mode = 'sync'
    elif args.auto:
        mode = 'auto'
    else:
        mode = 'dry-run'

    # Validate config directory
    if not args.config_dir.exists():
        print(f"{Colors.RED}Error: Config directory not found: {args.config_dir}{Colors.RESET}")
        sys.exit(1)

    # Find config pairs
    pairs = find_config_pairs(args.config_dir, include_modules=not args.no_modules)

    # Filter by specific file if requested
    if args.file:
        file_name = args.file
        if not file_name.endswith('.conf'):
            file_name += '.conf'

        pairs = [(c, d) for c, d in pairs if c.name == file_name]

        if not pairs:
            print(f"{Colors.RED}Error: No config pair found for '{args.file}'{Colors.RESET}")
            sys.exit(1)

    if not pairs:
        print(f"{Colors.YELLOW}No config file pairs found in {args.config_dir}{Colors.RESET}")
        sys.exit(0)

    # Header
    print(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"{Colors.BOLD}CONFIG SYNC - {mode.upper()} MODE{Colors.RESET}")
    print(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"Directory: {args.config_dir}")

    # Track totals
    total_new = 0
    total_deprecated = 0
    total_added = 0
    total_removed = 0
    files_with_changes = 0

    # Process each pair
    for conf_path, dist_path in pairs:
        # Parse for reporting
        conf = parse_config(conf_path)
        dist = parse_config(dist_path)
        result = compare_configs(conf, dist)

        has_changes = result.new_options or result.deprecated_options

        # File header
        print(f"\n{Colors.BOLD}{'-' * 70}{Colors.RESET}")
        relative_path = conf_path.relative_to(args.config_dir) if conf_path.exists() else dist_path.relative_to(args.config_dir)
        conf_exists = "exists" if conf_path.exists() else f"{Colors.YELLOW}MISSING{Colors.RESET}"
        print(f"{Colors.BOLD}{relative_path}{Colors.RESET} ({conf_exists})")

        if mode == 'dry-run':
            print_dry_run_report(conf_path, dist_path, conf, result)
            total_new += len(result.new_options)
            total_deprecated += len(result.deprecated_options)
            if has_changes:
                files_with_changes += 1
        else:
            if not has_changes:
                print(f"  {Colors.GREEN}No changes needed{Colors.RESET}")
            else:
                new_count, dep_count, added, removed = process_file_pair(
                    conf_path, dist_path, mode
                )
                total_new += new_count
                total_deprecated += dep_count
                total_added += added
                total_removed += removed
                if added or removed:
                    files_with_changes += 1
                    print(f"\n  {Colors.GREEN}Applied: +{added} added, -{removed} removed{Colors.RESET}")

    # Summary
    print(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    print(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"Files scanned:       {len(pairs)}")
    print(f"Files with changes:  {files_with_changes}")
    print(f"New options:         {total_new}")
    print(f"Deprecated options:  {total_deprecated}")

    if mode != 'dry-run':
        print(f"Options added:       {total_added}")
        print(f"Options removed:     {total_removed}")
    else:
        if total_new or total_deprecated:
            print(f"\n{Colors.YELLOW}Run with --sync for interactive mode or --auto to apply changes{Colors.RESET}")

    print()


if __name__ == "__main__":
    main()
