#!/usr/bin/env python3
"""
Zeppelin CLI Tree Menu

Visual tree navigation for zep commands. Navigate with arrow keys,
drill down through command groups, execute when reaching a leaf command.

Usage:
    python3 zep-menu.py
"""

import os
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

# Add cli directory to path
CLI_DIR = Path(__file__).parent
sys.path.insert(0, str(CLI_DIR))

try:
    from simple_term_menu import TerminalMenu
except ImportError:
    print("Error: simple-term-menu not installed")
    print("Install with: pip install simple-term-menu")
    sys.exit(1)

import click

# Import the CLI to introspect its commands
from zep import cli
from lib.manifest import load_manifest


def discover_zpaks(zpak_filter: str = None) -> List[Dict[str, str]]:
    """Discover available zpaks.

    Args:
        zpak_filter: Filter mode:
            - None: all zpaks
            - 'acore-extension', 'mpq', etc.: filter by zpak type
            - 'mpq_capable': zpaks with type 'mpq' or 'hybrid'
            - 'has_dbc_source': zpaks with DBC binary source files
            - 'has_dbc': zpaks with a dbc/ directory

    Returns:
        List of dicts with 'name' and 'description'
    """
    craft_root = CLI_DIR.parent
    zpaks = []

    for base in [craft_root / 'zpaks', craft_root / 'external']:
        if not base.exists():
            continue
        for pkg_dir in sorted(base.iterdir()):
            if not pkg_dir.is_dir():
                continue
            manifest_path = pkg_dir / 'zpak.json'
            if not manifest_path.exists():
                continue

            manifest = load_manifest(manifest_path)
            if not manifest:
                continue

            # Apply filter
            if zpak_filter == 'has_dbc_source':
                # Zpaks with binary DBC files to import
                dbc_source = manifest.get('dbc_source')
                if dbc_source:
                    source_path = Path(dbc_source)
                    if not source_path.is_absolute():
                        source_path = (pkg_dir / source_path).resolve()
                else:
                    source_path = pkg_dir / 'mpq' / 'source-assets' / 'DBFilesClient'
                if not source_path.exists() or not manifest.get('feature_id'):
                    continue
            elif zpak_filter == 'has_dbc':
                # Zpaks with a dbc/ SQL directory
                if not (pkg_dir / 'dbc').exists():
                    continue
            elif zpak_filter == 'mpq_capable':
                # Zpaks that can be packed as MPQ
                if manifest.get('type') not in ['mpq', 'hybrid']:
                    continue
            elif zpak_filter:
                # Filter by zpak type
                if manifest.get('type') != zpak_filter:
                    continue

            zpaks.append({
                'name': manifest.get('name', pkg_dir.name),
                'description': manifest.get('description', '')[:50]
            })

    return zpaks


def prompt_zpak_choice(command_name: str, zpak_filter: str = None,
                       allow_all: bool = True) -> Optional[Tuple[str, bool]]:
    """Prompt user to select a zpak or 'all'.

    Args:
        command_name: Name of command for display
        zpak_filter: Filter for discover_zpaks()
        allow_all: Whether to show 'All packages' option

    Returns:
        Tuple of (zpak_name, is_all) or None if cancelled
        If is_all is True, zpak_name will be empty
    """
    zpaks = discover_zpaks(zpak_filter)

    if not zpaks:
        print(f"\n  No matching packages found.")
        input("  Press Enter to continue...")
        return None

    # Build menu options
    options = []
    if allow_all:
        options.append("[All packages]")

    for zpak in zpaks:
        options.append(f"{zpak['name']:<25} {zpak['description']}")

    options.append("[Cancel]")

    menu = TerminalMenu(
        options,
        title=f"\n  Select package for: {command_name}\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
    )

    result = menu.show()

    if result is None or options[result] == "[Cancel]":
        return None

    if allow_all and result == 0:
        return ("", True)  # All packages

    # Adjust index if we have 'all' option
    zpak_index = result - 1 if allow_all else result
    return (zpaks[zpak_index]['name'], False)


def build_menu_tree(group: click.Group, parent_path: str = "") -> Dict[str, Any]:
    """Build a nested menu tree from Click command group.

    Args:
        group: Click command group to introspect
        parent_path: Path prefix for full command building

    Returns:
        Dict with 'commands' (leaf) and 'groups' (nested) entries
    """
    tree = {
        'commands': {},  # Leaf commands
        'groups': {},    # Nested command groups
    }

    if not hasattr(group, 'commands'):
        return tree

    for name, cmd in group.commands.items():
        # Skip shell command (that's what we're replacing)
        if name == 'shell':
            continue

        help_text = cmd.get_short_help_str() if hasattr(cmd, 'get_short_help_str') else ''
        full_path = f"{parent_path} {name}".strip()

        if hasattr(cmd, 'commands'):
            # It's a group - recurse
            tree['groups'][name] = {
                'help': help_text,
                'path': full_path,
                'children': build_menu_tree(cmd, full_path)
            }
        else:
            # It's a leaf command
            # Extract required arguments, required options, and optional flags
            args = []
            options = []
            flags = []
            if hasattr(cmd, 'params'):
                for param in cmd.params:
                    if isinstance(param, click.Argument) and param.required:
                        args.append(param.name)
                    elif isinstance(param, click.Option) and param.required:
                        # Get the option flag (prefer long form)
                        long_opts = [o for o in param.opts if o.startswith('--')]
                        flag = long_opts[0] if long_opts else (param.opts[0] if param.opts else param.name)
                        options.append({
                            'name': param.name,
                            'flag': flag,
                            'help': param.help or ''
                        })
                    elif isinstance(param, click.Option) and param.is_flag and not param.required:
                        # Optional boolean flags (--all, --force, --dry-run, etc.)
                        # Prefer long-form (--flag) over short-form (-f)
                        long_opts = [o for o in param.opts if o.startswith('--')]
                        flag = long_opts[0] if long_opts else (param.opts[0] if param.opts else param.name)
                        if flag != '--help':
                            flags.append({
                                'name': param.name,
                                'flag': flag,
                                'help': param.help or ''
                            })

            # Detect zpak selection: optional --name option → zpak picker
            # Commands declare zpak_filter attribute for filtered discovery
            has_zpak = False
            has_all_flag = any(f['flag'] == '--all' for f in flags)
            zpak_filter = getattr(cmd, 'zpak_filter', None)
            for param in (cmd.params if hasattr(cmd, 'params') else []):
                if (isinstance(param, click.Option) and param.name == 'name'
                        and not param.required):
                    has_zpak = True
                    break

            tree['commands'][name] = {
                'help': help_text,
                'path': full_path,
                'args': args,
                'options': options,
                'flags': flags,
                'has_zpak': has_zpak,
                'has_all': has_all_flag,
                'zpak_filter': zpak_filter,
                'menu_passthrough': getattr(cmd, 'menu_passthrough', False),
                'cmd': cmd
            }

    return tree


def format_menu_entry(name: str, help_text: str, is_group: bool = False,
                      max_name_len: int = 20) -> str:
    """Format a menu entry with aligned help text."""
    # Use arrow suffix for groups to indicate "has submenu"
    suffix = " >" if is_group else ""
    padded_name = name.ljust(max_name_len)
    return f"{padded_name}  {help_text}{suffix}"


def show_menu(title: str, options: List[str], show_back: bool = True,
              preview_command: str = None) -> Optional[int]:
    """Display a menu and return selected index.

    Args:
        title: Menu title
        options: List of menu option strings
        show_back: Whether to show [Back] option (ignored, q always works)
        preview_command: Optional preview command for status bar

    Returns:
        Selected index (0-based), or None if quit/back (q pressed)
    """
    menu_options = list(options)

    menu = TerminalMenu(
        menu_options,
        title=f"\n{title}\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
        status_bar=preview_command or "Arrow keys: Navigate | Enter: Select | q: Back",
        status_bar_style=("fg_gray",),
    )

    result = menu.show()

    if result is None:  # Escape or q pressed
        return None

    return result


def prompt_args(args: List[str], options: List[Dict], command_path: str) -> Optional[Tuple[List[str], List[Tuple[str, str]]]]:
    """Prompt user for required arguments and options.

    Args:
        args: List of argument names
        options: List of option dicts with 'name', 'flag', 'help'
        command_path: Full command path for display

    Returns:
        Tuple of (arg_values, option_tuples) or None if cancelled
        option_tuples are (flag, value) pairs
    """
    if not args and not options:
        return [], []

    print(f"\n Command: zep {command_path}\n")

    # Collect argument values
    arg_values = []
    for arg in args:
        try:
            display_name = arg.replace('_', ' ').title()
            value = input(f"  {display_name}: ").strip()
            if not value:
                print("\n  Cancelled (empty input)")
                return None
            arg_values.append(value)
        except (KeyboardInterrupt, EOFError):
            print("\n  Cancelled")
            return None

    # Collect required option values
    option_values = []
    for opt in options:
        try:
            display_name = opt['name'].replace('_', ' ').title()
            hint = f" ({opt['help']})" if opt['help'] else ""
            value = input(f"  {display_name}{hint}: ").strip()
            if not value:
                print("\n  Cancelled (empty input)")
                return None
            option_values.append((opt['flag'], value))
        except (KeyboardInterrupt, EOFError):
            print("\n  Cancelled")
            return None

    return arg_values, option_values


def prompt_flags(flags: List[Dict], command_path: str) -> Optional[List[str]]:
    """Prompt user to toggle optional boolean flags.

    Args:
        flags: List of flag dicts with 'name', 'flag', 'help'
        command_path: Full command path for display

    Returns:
        List of selected flag strings, or None if cancelled
    """
    if not flags:
        return []

    # Build multi-select menu options
    options = []
    for f in flags:
        label = f['flag']
        if f['help']:
            label += f"  ({f['help']})"
        options.append(label)

    options.append("[Continue without flags]")

    menu = TerminalMenu(
        options,
        title=f"\n  zep {command_path}\n  Select options (Space to toggle, Enter to confirm):\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
        multi_select=True,
        show_multi_select_hint=True,
        multi_select_select_on_accept=False,
        status_bar="Space: Toggle | Enter: Confirm | q: Cancel",
        status_bar_style=("fg_gray",),
    )

    result = menu.show()

    if result is None:
        return None

    # result is a tuple of selected indices in multi-select mode
    if isinstance(result, int):
        result = (result,)

    selected = []
    for idx in result:
        if idx < len(flags):  # Not the "Continue" option
            selected.append(flags[idx]['flag'])

    return selected


def execute_command(command_path: str, args: List[str] = None,
                    options: List[Tuple[str, str]] = None) -> bool:
    """Execute a zep command.

    Args:
        command_path: Command path (e.g., "zpak list")
        args: Optional list of argument values
        options: Optional list of (flag, value) tuples for options

    Returns:
        True if should return to menu, False to exit
    """
    # Build full command
    cmd_parts = ["python3", str(CLI_DIR / "zep.py")] + command_path.split()

    # Add options first (before positional args)
    if options:
        for flag, value in options:
            cmd_parts.append(flag)
            if value is not None:
                cmd_parts.append(value)

    # Add positional arguments
    if args:
        cmd_parts.extend(args)

    cmd_display = f"zep {command_path}"
    if options:
        for flag, value in options:
            cmd_display += f" {flag}" if value is None else f" {flag} {value}"
    if args:
        cmd_display += " " + " ".join(args)

    print(f"\n{'='*60}")
    print(f" Executing: {cmd_display}")
    print(f"{'='*60}\n")

    # Execute
    result = subprocess.run(cmd_parts)

    print(f"\n{'='*60}")

    # Ask to return to menu
    try:
        response = input("\n Press Enter to return to menu (q to quit): ").strip().lower()
        return response != 'q'
    except (KeyboardInterrupt, EOFError):
        return False


def run_menu(tree: Dict[str, Any], path: List[str] = None,
             is_root: bool = True) -> bool:
    """Navigate the menu tree.

    Args:
        tree: Menu tree dict from build_menu_tree()
        path: Current navigation path
        is_root: Whether this is the root menu

    Returns:
        True to continue, False to exit completely
    """
    if path is None:
        path = []

    while True:
        # Build current level's options
        options = []
        option_map = []  # Maps index to (type, name, data)

        # Calculate max name length for alignment
        all_names = list(tree['groups'].keys()) + list(tree['commands'].keys())
        max_name_len = max(len(n) for n in all_names) if all_names else 15

        # Add groups first (they have submenus)
        for name, data in sorted(tree['groups'].items()):
            entry = format_menu_entry(name, data['help'], is_group=True,
                                      max_name_len=max_name_len)
            options.append(entry)
            option_map.append(('group', name, data))

        # Add commands
        for name, data in sorted(tree['commands'].items()):
            entry = format_menu_entry(name, data['help'], is_group=False,
                                      max_name_len=max_name_len)
            options.append(entry)
            option_map.append(('command', name, data))

        if not options:
            print("No commands available at this level")
            return True

        # Build title
        if path:
            title = f"zep {' > '.join(path)}"
        else:
            title = "Zeppelin CLI"

        # Show menu
        result = show_menu(title, options, show_back=not is_root)

        if result is None:  # q/Escape pressed
            if is_root:
                return False  # Exit at root level
            return True  # Go back at submenus

        # Handle selection
        selection_type, selection_name, selection_data = option_map[result]

        if selection_type == 'group':
            # Drill into subgroup
            continue_running = run_menu(
                selection_data['children'],
                path + [selection_name],
                is_root=False
            )
            if not continue_running:
                return False

        elif selection_type == 'command':
            # Execute command
            args = selection_data.get('args', [])
            options = selection_data.get('options', [])
            command_path = selection_data['path']
            has_zpak = selection_data.get('has_zpak', False)

            # Zpak selection: show filtered zpak list for commands with --name
            if has_zpak:
                has_all = selection_data.get('has_all', False)
                zpak_filter = selection_data.get('zpak_filter')
                choice = prompt_zpak_choice(command_path,
                                            zpak_filter=zpak_filter,
                                            allow_all=has_all)
                if choice is None:
                    continue  # Cancelled
                zpak_name, is_all = choice

                cmd_options = []
                if is_all:
                    cmd_options.append(('--all', None))
                else:
                    cmd_options.append(('--name', zpak_name))

                # Also prompt for remaining flags (excluding --all which is handled)
                cmd_flags = [f for f in selection_data.get('flags', [])
                             if f['flag'] != '--all']
                if cmd_flags:
                    selected_flags = prompt_flags(cmd_flags, command_path)
                    if selected_flags is None:
                        continue
                    for flag in selected_flags:
                        cmd_options.append((flag, None))

                continue_running = execute_command(command_path, options=cmd_options)
                if not continue_running:
                    return False
                continue

            # Commands with own interactive menus: prompt args, skip flag prompt
            if selection_data.get('menu_passthrough', False):
                if args or options:
                    result = prompt_args(args, options, command_path)
                    if result is None:
                        continue
                    arg_values, option_values = result
                    cmd_options = [(k, v) for k, v in option_values]
                    continue_running = execute_command(
                        command_path, arg_values, cmd_options)
                else:
                    continue_running = execute_command(command_path)
                if not continue_running:
                    return False
                continue

            # Standard command handling
            if args or options:
                # Need to prompt for arguments/options
                result = prompt_args(args, options, command_path)
                if result is None:
                    continue  # Cancelled, stay in menu
                arg_values, option_values = result
            else:
                arg_values = []
                option_values = []

            # Prompt for optional boolean flags if command has any
            cmd_flags = selection_data.get('flags', [])
            if cmd_flags:
                selected_flags = prompt_flags(cmd_flags, command_path)
                if selected_flags is None:
                    continue  # Cancelled, stay in menu
                for flag in selected_flags:
                    option_values.append((flag, None))

            continue_running = execute_command(command_path, arg_values, option_values)
            if not continue_running:
                return False


def _ensure_tool_permissions():
    """Ensure toolchain binaries are executable (lost on UNRAID reboot)."""
    from lib.env import MPQCLI_PATH, DBCTOOL_PATH
    for tool in [MPQCLI_PATH, DBCTOOL_PATH]:
        if tool.exists() and not os.access(tool, os.X_OK):
            tool.chmod(tool.stat().st_mode | 0o755)


def main():
    """Main entry point."""
    _ensure_tool_permissions()

    # Build command tree from Click CLI
    tree = build_menu_tree(cli)

    # Run interactive menu
    try:
        run_menu(tree)
    except KeyboardInterrupt:
        pass

    print("\nGoodbye!")


if __name__ == '__main__':
    main()
