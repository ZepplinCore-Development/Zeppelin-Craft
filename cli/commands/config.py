"""
Config commands for Zeppelin-Craft CLI (F-038).

Manages server configuration files - syncing .conf.dist from modules
and merging new options into .conf files.

Commands:
    zep config status              Show what needs updating
    zep config sync-dist           Sync .conf.dist files from modules
    zep config sync [--file name]  Interactive merge of new options
    zep config auto [--file name]  Auto-merge with defaults
"""

import re
import shutil
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple

import click

# CLI library path
CLI_DIR = Path(__file__).parent.parent
CRAFT_ROOT = CLI_DIR.parent
ZEPPELIN_CORE = CRAFT_ROOT.parent / "Zeppelin-Core"
CONFIG_DIR = CRAFT_ROOT / "Configs"


class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    MAGENTA = '\033[95m'
    RESET = '\033[0m'
    BOLD = '\033[1m'
    DIM = '\033[2m'


# =============================================================================
# DIST FILE SOURCES - Maps destination to source location
# =============================================================================

# Core configs live under src/ with varied paths — keep explicit.
CORE_DIST_SOURCES = {
    "authserver.conf.dist": ZEPPELIN_CORE / "src/server/apps/authserver/authserver.conf.dist",
    "worldserver.conf.dist": ZEPPELIN_CORE / "src/server/apps/worldserver/worldserver.conf.dist",
    "dbimport.conf.dist": ZEPPELIN_CORE / "src/tools/dbimport/dbimport.conf.dist",
}


def discover_dist_sources() -> Dict[str, Path]:
    """Build dest→source map: core dists + auto-discovered modules + deployed orphans."""
    sources: Dict[str, Path] = dict(CORE_DIST_SOURCES)

    # Modules: glob every conf.dist shipped by a module in Zeppelin-Core.
    for src in (ZEPPELIN_CORE / "modules").glob("*/conf/*.conf.dist"):
        sources[f"modules/{src.name}"] = src

    # Surface deployed dists that have no matching source so they don't drift silently.
    modules_dir = CONFIG_DIR / "modules"
    if modules_dir.is_dir():
        for dst in modules_dir.glob("*.conf.dist"):
            rel = f"modules/{dst.name}"
            if rel not in sources:
                # Point at the conventional source path so the missing-source message is meaningful.
                base = dst.name[:-len(".conf.dist")].replace("_", "-")
                sources[rel] = ZEPPELIN_CORE / "modules" / base / "conf" / dst.name

    return sources

# Files to skip (different format)
SKIP_FILES = {"wowchat.conf"}


# =============================================================================
# DATA CLASSES
# =============================================================================

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


# =============================================================================
# DIST FILE SYNC FUNCTIONS
# =============================================================================

def get_file_info(path: Path) -> Tuple[int, str]:
    """Get line count and modification time of a file"""
    if not path.exists():
        return 0, "missing"

    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        lines = len(f.readlines())

    mtime = datetime.fromtimestamp(path.stat().st_mtime)
    return lines, mtime.strftime("%Y-%m-%d %H:%M")


def compare_dist_files(src: Path, dst: Path) -> Tuple[bool, str]:
    """Compare two dist files, return (needs_update, reason)"""
    if not src.exists():
        return False, "source missing"

    if not dst.exists():
        return True, "destination missing"

    try:
        with open(src, 'r', encoding='utf-8', errors='replace') as f:
            src_content = f.read()
        with open(dst, 'r', encoding='utf-8', errors='replace') as f:
            dst_content = f.read()

        if src_content != dst_content:
            src_lines, _ = get_file_info(src)
            dst_lines, _ = get_file_info(dst)
            diff = src_lines - dst_lines
            if diff > 0:
                return True, f"+{diff} lines"
            elif diff < 0:
                return True, f"{diff} lines"
            else:
                return True, "content differs"

        return False, "up to date"
    except Exception as e:
        return False, f"error: {e}"


def sync_dist_files(do_sync: bool = False) -> Tuple[int, int, int]:
    """
    Sync .conf.dist files from Zeppelin-Core to Configs.

    Returns: (synced_count, up_to_date_count, missing_source_count)
    """
    needs_update = []
    up_to_date = []
    missing_source = []

    click.echo(f"\n{Colors.BOLD}Checking .conf.dist files...{Colors.RESET}\n")

    for rel_path, src_path in sorted(discover_dist_sources().items()):
        dst_path = CONFIG_DIR / rel_path

        update_needed, reason = compare_dist_files(src_path, dst_path)

        if not src_path.exists():
            missing_source.append((rel_path, src_path))
            click.echo(f"  {Colors.YELLOW}?{Colors.RESET} {rel_path}")
            click.echo(f"    {Colors.DIM}Source not found: {src_path}{Colors.RESET}")
        elif update_needed:
            needs_update.append((rel_path, src_path, dst_path, reason))
            src_lines, src_date = get_file_info(src_path)
            dst_lines, dst_date = get_file_info(dst_path)
            click.echo(f"  {Colors.CYAN}→{Colors.RESET} {rel_path}")
            click.echo(f"    {Colors.DIM}Source: {src_lines} lines ({src_date}){Colors.RESET}")
            click.echo(f"    {Colors.DIM}Dest:   {dst_lines} lines ({dst_date}) - {reason}{Colors.RESET}")
        else:
            up_to_date.append(rel_path)
            click.echo(f"  {Colors.GREEN}✓{Colors.RESET} {rel_path} {Colors.DIM}(up to date){Colors.RESET}")

    # Sync if requested
    synced = 0
    if do_sync and needs_update:
        click.echo(f"\n{Colors.BOLD}Syncing files...{Colors.RESET}\n")

        for rel_path, src_path, dst_path, reason in needs_update:
            try:
                dst_path.parent.mkdir(parents=True, exist_ok=True)
                shutil.copy2(src_path, dst_path)
                click.echo(f"  {Colors.GREEN}✓{Colors.RESET} Copied: {rel_path}")
                synced += 1
            except Exception as e:
                click.echo(f"  {Colors.RED}✗{Colors.RESET} Error copying {rel_path}: {e}")

    return synced if do_sync else len(needs_update), len(up_to_date), len(missing_source)


# =============================================================================
# CONFIG PARSING FUNCTIONS
# =============================================================================

def parse_option_line(line: str) -> Optional[Tuple[str, str]]:
    """Parse a line like 'OptionName = value' or 'OptionName=value'"""
    stripped = line.strip()

    if not stripped or stripped.startswith('#'):
        return None

    if stripped.startswith('[') and stripped.endswith(']'):
        return None

    match = re.match(r'^([A-Za-z0-9_.]+)\s*=\s*(.*)$', stripped)
    if match:
        return match.group(1), match.group(2).strip()

    return None


def extract_comment_block(lines: List[str], option_line_idx: int) -> str:
    """Extract the comment block preceding an option."""
    comment_lines = []
    idx = option_line_idx - 1

    while idx >= 0:
        line = lines[idx].rstrip()

        if not line:
            if idx > 0 and (not lines[idx-1].strip() or not lines[idx-1].strip().startswith('#')):
                break
            comment_lines.insert(0, line)
        elif line.strip().startswith('#'):
            comment_lines.insert(0, line)
        else:
            break

        idx -= 1

    while comment_lines and not comment_lines[0].strip():
        comment_lines.pop(0)

    return '\n'.join(comment_lines)


def extract_option_docs(comment_block: str, option_name: str) -> str:
    """Extract documentation for a specific option from a comment block."""
    if not comment_block:
        return ""

    lines = comment_block.split('\n')
    result = []
    in_option_section = False
    found_option = False

    for i, line in enumerate(lines):
        stripped = line.lstrip('#').strip()

        if option_name in stripped and not in_option_section:
            in_option_section = True
            found_option = True
            result.append(line)
            continue

        if in_option_section:
            if stripped and not stripped.startswith(('Description:', 'Default:', 'Important:', 'Example:', 'Format:')):
                if re.match(r'^[A-Z][A-Za-z0-9_.]+$', stripped.split()[0] if stripped.split() else ''):
                    break

            result.append(line)

            if 'Default:' in stripped:
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

    # Fallback
    desc_lines = []
    for line in lines:
        stripped = line.lstrip('#').strip()
        if stripped.startswith('Description:') or stripped.startswith('Default:'):
            desc_lines.append(line)
        elif desc_lines and stripped and not stripped.startswith(('#', 'Example:', 'Important:')):
            if stripped[0].islower() or stripped.startswith(' '):
                desc_lines.append(line)

    if desc_lines:
        return '\n'.join(desc_lines[:10])

    if len(lines) > 15:
        return '\n'.join(lines[:15]) + '\n#        ...(truncated)'

    return comment_block


def parse_config(path: Path) -> ConfigFile:
    """Parse an AzerothCore config file."""
    config = ConfigFile(path=path)

    if not path.exists():
        return config

    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        config.raw_lines = f.readlines()

    current_section = ""

    for idx, line in enumerate(config.raw_lines):
        stripped = line.strip()

        if stripped.startswith('[') and stripped.endswith(']'):
            current_section = stripped[1:-1]
            if current_section not in config.sections:
                config.sections.append(current_section)
            continue

        parsed = parse_option_line(line)
        if parsed:
            name, value = parsed
            comment_block = extract_comment_block(config.raw_lines, idx)

            config.options[name] = ConfigOption(
                name=name,
                value=value,
                line_number=idx + 1,
                comment_block=comment_block,
                section=current_section
            )

    return config


def compare_configs(conf: ConfigFile, dist: ConfigFile) -> ComparisonResult:
    """Compare .conf against .conf.dist to find differences."""
    result = ComparisonResult()

    for name, option in dist.options.items():
        if name not in conf.options:
            result.new_options.append(option)

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
        content = line.lstrip('#').rstrip()
        if content:
            formatted.append(f"{indent}{Colors.DIM}{content}{Colors.RESET}")

    return '\n'.join(formatted) if formatted else f"{indent}{Colors.DIM}(no description){Colors.RESET}"


def find_config_pairs(include_modules: bool = True) -> List[Tuple[Path, Path]]:
    """Find all .conf / .conf.dist pairs in the config directory."""
    pairs = []

    for dist_file in CONFIG_DIR.glob("*.conf.dist"):
        conf_name = dist_file.name.replace('.conf.dist', '.conf')

        if conf_name in SKIP_FILES:
            continue

        conf_file = CONFIG_DIR / conf_name
        pairs.append((conf_file, dist_file))

    if include_modules:
        modules_dir = CONFIG_DIR / "modules"
        if modules_dir.exists():
            for dist_file in modules_dir.glob("*.conf.dist"):
                conf_name = dist_file.name.replace('.conf.dist', '.conf')
                conf_file = modules_dir / conf_name
                pairs.append((conf_file, dist_file))

    return sorted(pairs, key=lambda x: x[0].name)


def apply_changes(conf_path: Path, additions: List[Tuple[str, str]],
                  removals: List[str]) -> bool:
    """Apply changes to the config file."""
    if not additions and not removals:
        return True

    try:
        with open(conf_path, 'r', encoding='utf-8', errors='replace') as f:
            lines = f.readlines()

        if removals:
            new_lines = []
            removal_set = set(removals)

            for line in lines:
                parsed = parse_option_line(line)
                if parsed:
                    name, _ = parsed
                    if name in removal_set:
                        continue

                new_lines.append(line)

            lines = new_lines

        if additions:
            if lines and not lines[-1].endswith('\n'):
                lines[-1] += '\n'

            lines.append('\n')
            lines.append('#\n')
            lines.append('# Options added by zep config sync\n')
            lines.append('#\n')

            for name, value in additions:
                lines.append(f'{name} = {value}\n')

        with open(conf_path, 'w', encoding='utf-8') as f:
            f.writelines(lines)

        return True

    except Exception as e:
        click.echo(f"{Colors.RED}Error writing {conf_path}: {e}{Colors.RESET}")
        return False


def prompt_new_option(option: ConfigOption) -> Tuple[Optional[str], bool]:
    """Prompt user for a new option value."""
    click.echo(f"\n{Colors.CYAN}NEW OPTION:{Colors.RESET} {Colors.BOLD}{option.name}{Colors.RESET}")
    click.echo("-" * 60)

    docs = extract_option_docs(option.comment_block, option.name)
    click.echo(format_comment_block(docs))
    click.echo()
    click.echo(f"  Default value: {Colors.GREEN}{option.value}{Colors.RESET}")
    click.echo()

    while True:
        response = input(f"Add this option? [{Colors.GREEN}y{Colors.RESET}=default/{Colors.RED}n{Colors.RESET}=skip/{Colors.YELLOW}c{Colors.RESET}=custom]: ").strip().lower()

        if response in ('y', 'yes', ''):
            return option.value, False
        elif response in ('n', 'no'):
            return None, False
        elif response in ('c', 'custom'):
            custom = input(f"Enter custom value: ").strip()
            return custom, True
        else:
            click.echo(f"{Colors.YELLOW}Please enter y, n, or c{Colors.RESET}")


def prompt_deprecated_option(option: ConfigOption) -> bool:
    """Prompt user about a deprecated option."""
    click.echo(f"\n{Colors.RED}DEPRECATED:{Colors.RESET} {Colors.BOLD}{option.name}{Colors.RESET}")
    click.echo("-" * 60)
    click.echo(f"  This option no longer exists in .conf.dist")
    click.echo(f"  Your current value: {Colors.YELLOW}{option.value}{Colors.RESET}")
    click.echo()

    while True:
        response = input(f"Remove this option? [{Colors.GREEN}y{Colors.RESET}=remove/{Colors.RED}n{Colors.RESET}=keep]: ").strip().lower()

        if response in ('y', 'yes', ''):
            return True
        elif response in ('n', 'no'):
            return False
        else:
            click.echo(f"{Colors.YELLOW}Please enter y or n{Colors.RESET}")


def process_config_pair(conf_path: Path, dist_path: Path, mode: str = 'dry-run') -> Tuple[int, int, int, int]:
    """Process a single config file pair."""
    conf = parse_config(conf_path)
    dist = parse_config(dist_path)

    result = compare_configs(conf, dist)

    new_count = len(result.new_options)
    deprecated_count = len(result.deprecated_options)
    added_count = 0
    removed_count = 0

    if mode == 'dry-run':
        return new_count, deprecated_count, 0, 0

    additions = []
    removals = []

    for option in result.new_options:
        if mode == 'sync':
            value, is_custom = prompt_new_option(option)
            if value is not None:
                additions.append((option.name, value, is_custom))
                added_count += 1
        elif mode == 'auto':
            additions.append((option.name, option.value, False))
            added_count += 1

    for option in result.deprecated_options:
        if mode == 'sync':
            if prompt_deprecated_option(option):
                removals.append(option.name)
                removed_count += 1
        elif mode == 'auto':
            removals.append(option.name)
            removed_count += 1

    creating_from_dist = not conf_path.exists()
    success = False

    if creating_from_dist and (additions or removals):
        try:
            shutil.copy(dist_path, conf_path)
            click.echo(f"  {Colors.YELLOW}Created {conf_path.name} from .dist{Colors.RESET}")

            custom_additions = [(name, value) for name, value, is_custom in additions if is_custom]
            success = apply_changes(conf_path, custom_additions, removals)

            if success:
                default_count = added_count - len(custom_additions)
                if default_count > 0:
                    click.echo(f"  {Colors.DIM}({default_count} default values already in .dist, {len(custom_additions)} custom values added){Colors.RESET}")
        except Exception as e:
            click.echo(f"{Colors.RED}Error creating {conf_path}: {e}{Colors.RESET}")
            success = False
    elif additions or removals:
        all_additions = [(name, value) for name, value, _ in additions]
        success = apply_changes(conf_path, all_additions, removals)

    if not success:
        added_count = 0
        removed_count = 0

    return new_count, deprecated_count, added_count, removed_count


# =============================================================================
# CLI COMMANDS
# =============================================================================

@click.group()
def config():
    """Config file management (F-038)"""
    pass


@config.command('status')
@click.option('--file', '-f', 'file_name', help='Check specific config file')
@click.pass_context
def config_status(ctx, file_name: Optional[str]):
    """Show what config files need updating.

    Checks both .conf.dist sync status and .conf option differences.
    """
    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}CONFIG STATUS{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")

    # Part 1: Check dist file sync
    click.echo(f"\n{Colors.BOLD}[1/2] .conf.dist file sync{Colors.RESET}")
    needs_sync, up_to_date, missing = sync_dist_files(do_sync=False)

    # Part 2: Check config option differences
    click.echo(f"\n{Colors.BOLD}[2/2] .conf option differences{Colors.RESET}")

    pairs = find_config_pairs()

    if file_name:
        if not file_name.endswith('.conf'):
            file_name += '.conf'
        pairs = [(c, d) for c, d in pairs if c.name == file_name]
        if not pairs:
            click.echo(f"{Colors.RED}Error: Config file '{file_name}' not found{Colors.RESET}")
            return

    total_new = 0
    total_deprecated = 0
    files_with_changes = 0

    click.echo()
    for conf_path, dist_path in pairs:
        if not dist_path.exists():
            continue

        conf = parse_config(conf_path)
        dist = parse_config(dist_path)
        result = compare_configs(conf, dist)

        has_changes = result.new_options or result.deprecated_options

        try:
            rel_path = conf_path.relative_to(CONFIG_DIR)
        except ValueError:
            rel_path = conf_path.name

        if has_changes:
            new_str = f"+{len(result.new_options)}" if result.new_options else ""
            dep_str = f"-{len(result.deprecated_options)}" if result.deprecated_options else ""
            changes = f"{new_str} {dep_str}".strip()
            click.echo(f"  {Colors.CYAN}→{Colors.RESET} {rel_path} ({changes})")
            total_new += len(result.new_options)
            total_deprecated += len(result.deprecated_options)
            files_with_changes += 1
        else:
            click.echo(f"  {Colors.GREEN}✓{Colors.RESET} {rel_path}")

    # Summary
    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Dist files needing sync: {needs_sync}")
    click.echo(f"Config files with changes: {files_with_changes}")
    click.echo(f"  New options: {total_new}")
    click.echo(f"  Deprecated options: {total_deprecated}")

    if needs_sync > 0 or files_with_changes > 0:
        click.echo(f"\n{Colors.YELLOW}Run 'zep config sync-dist' then 'zep config sync' to update{Colors.RESET}")
    else:
        click.echo(f"\n{Colors.GREEN}All configs are up to date!{Colors.RESET}")
    click.echo()


@config.command('sync-dist')
@click.option('--dry-run', '-n', is_flag=True, help='Show what would be copied')
@click.pass_context
def config_sync_dist(ctx, dry_run: bool):
    """Sync .conf.dist files from Zeppelin-Core modules.

    Copies updated .conf.dist files from module source directories
    to Zeppelin-Craft/Configs.
    """
    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}DIST FILE SYNC - {'DRY-RUN' if dry_run else 'SYNC'} MODE{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Source:      {ZEPPELIN_CORE}")
    click.echo(f"Destination: {CONFIG_DIR}")

    synced, up_to_date, missing = sync_dist_files(do_sync=not dry_run)

    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Up to date:     {up_to_date}")

    if dry_run:
        click.echo(f"Needs update:   {Colors.CYAN}{synced}{Colors.RESET}")
    else:
        click.echo(f"Synced:         {Colors.GREEN}{synced}{Colors.RESET}")

    click.echo(f"Missing source: {missing}")

    if dry_run and synced > 0:
        click.echo(f"\n{Colors.YELLOW}Run without --dry-run to copy files{Colors.RESET}")
    elif not dry_run and synced > 0:
        click.echo(f"\n{Colors.GREEN}Successfully synced {synced} file(s){Colors.RESET}")
        click.echo(f"\n{Colors.YELLOW}Next: Run 'zep config sync' to merge new options{Colors.RESET}")
    click.echo()


@config.command('sync')
@click.option('--file', '-f', 'file_name', help='Process specific config file')
@click.pass_context
def config_sync(ctx, file_name: Optional[str]):
    """Interactive merge of new options into .conf files.

    Prompts for each new/deprecated option allowing you to:
    - Accept default values
    - Enter custom values
    - Skip options
    - Remove deprecated options
    """
    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}CONFIG SYNC - INTERACTIVE MODE{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Directory: {CONFIG_DIR}")

    pairs = find_config_pairs()

    if file_name:
        if not file_name.endswith('.conf'):
            file_name += '.conf'
        pairs = [(c, d) for c, d in pairs if c.name == file_name]
        if not pairs:
            click.echo(f"{Colors.RED}Error: Config file '{file_name}' not found{Colors.RESET}")
            sys.exit(1)

    total_added = 0
    total_removed = 0
    files_changed = 0

    for conf_path, dist_path in pairs:
        if not dist_path.exists():
            continue

        conf = parse_config(conf_path)
        dist = parse_config(dist_path)
        result = compare_configs(conf, dist)

        has_changes = result.new_options or result.deprecated_options

        click.echo(f"\n{Colors.BOLD}{'-' * 70}{Colors.RESET}")
        try:
            rel_path = conf_path.relative_to(CONFIG_DIR)
        except ValueError:
            rel_path = conf_path.name
        conf_exists = "exists" if conf_path.exists() else f"{Colors.YELLOW}MISSING{Colors.RESET}"
        click.echo(f"{Colors.BOLD}{rel_path}{Colors.RESET} ({conf_exists})")

        if not has_changes:
            click.echo(f"  {Colors.GREEN}No changes needed{Colors.RESET}")
            continue

        click.echo(f"  {len(result.new_options)} new, {len(result.deprecated_options)} deprecated")

        new_count, dep_count, added, removed = process_config_pair(conf_path, dist_path, 'sync')

        total_added += added
        total_removed += removed
        if added or removed:
            files_changed += 1
            click.echo(f"\n  {Colors.GREEN}Applied: +{added} added, -{removed} removed{Colors.RESET}")

    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Files changed:   {files_changed}")
    click.echo(f"Options added:   {total_added}")
    click.echo(f"Options removed: {total_removed}")
    click.echo()


@config.command('auto')
@click.option('--file', '-f', 'file_name', help='Process specific config file')
@click.pass_context
def config_auto(ctx, file_name: Optional[str]):
    """Auto-merge all changes with default values.

    Non-interactive mode that:
    - Adds all new options with their default values
    - Removes all deprecated options
    """
    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}CONFIG SYNC - AUTO MODE{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Directory: {CONFIG_DIR}")

    pairs = find_config_pairs()

    if file_name:
        if not file_name.endswith('.conf'):
            file_name += '.conf'
        pairs = [(c, d) for c, d in pairs if c.name == file_name]
        if not pairs:
            click.echo(f"{Colors.RED}Error: Config file '{file_name}' not found{Colors.RESET}")
            sys.exit(1)

    total_added = 0
    total_removed = 0
    files_changed = 0

    for conf_path, dist_path in pairs:
        if not dist_path.exists():
            continue

        conf = parse_config(conf_path)
        dist = parse_config(dist_path)
        result = compare_configs(conf, dist)

        has_changes = result.new_options or result.deprecated_options

        try:
            rel_path = conf_path.relative_to(CONFIG_DIR)
        except ValueError:
            rel_path = conf_path.name

        if not has_changes:
            click.echo(f"  {Colors.GREEN}✓{Colors.RESET} {rel_path}")
            continue

        new_count, dep_count, added, removed = process_config_pair(conf_path, dist_path, 'auto')

        total_added += added
        total_removed += removed
        if added or removed:
            files_changed += 1
            click.echo(f"  {Colors.CYAN}→{Colors.RESET} {rel_path}: +{added} added, -{removed} removed")
        else:
            click.echo(f"  {Colors.GREEN}✓{Colors.RESET} {rel_path}")

    click.echo(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    click.echo(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    click.echo(f"Files changed:   {files_changed}")
    click.echo(f"Options added:   {total_added}")
    click.echo(f"Options removed: {total_removed}")
    click.echo()
