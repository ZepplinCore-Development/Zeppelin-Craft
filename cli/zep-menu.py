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


def discover_zpaks(zpak_type: str = None) -> List[Dict[str, str]]:
    """Discover available zpaks.

    Args:
        zpak_type: Filter by type (e.g., 'acore-extension', 'mpq', 'hybrid')
                   None returns all zpaks

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

            # Filter by type if specified
            if zpak_type and manifest.get('type') != zpak_type:
                continue

            zpaks.append({
                'name': manifest.get('name', pkg_dir.name),
                'description': manifest.get('description', '')[:50]
            })

    return zpaks


def prompt_zpak_choice(command_name: str, zpak_type: str = None,
                       allow_all: bool = True) -> Optional[Tuple[str, bool]]:
    """Prompt user to select a zpak or 'all'.

    Args:
        command_name: Name of command for display
        zpak_type: Filter zpaks by type
        allow_all: Whether to show 'All packages' option

    Returns:
        Tuple of (zpak_name, is_all) or None if cancelled
        If is_all is True, zpak_name will be empty
    """
    zpaks = discover_zpaks(zpak_type)

    if not zpaks:
        print(f"\n  No {'acore-extension ' if zpak_type else ''}packages found.")
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
            # Extract required arguments AND required options
            args = []
            options = []
            if hasattr(cmd, 'params'):
                for param in cmd.params:
                    if isinstance(param, click.Argument) and param.required:
                        args.append(param.name)
                    elif isinstance(param, click.Option) and param.required:
                        # Get the option flag (prefer long form)
                        flag = param.opts[-1] if param.opts else param.name
                        options.append({
                            'name': param.name,
                            'flag': flag,
                            'help': param.help or ''
                        })

            tree['commands'][name] = {
                'help': help_text,
                'path': full_path,
                'args': args,
                'options': options,
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


def execute_command_with_flag(command_path: str, flag: str) -> bool:
    """Execute a zep command with a flag (no value).

    Args:
        command_path: Command path (e.g., "forge apply-patch")
        flag: Flag to add (e.g., "--all")

    Returns:
        True if should return to menu, False to exit
    """
    cmd_parts = ["python3", str(CLI_DIR / "zep.py")] + command_path.split() + [flag]
    cmd_display = f"zep {command_path} {flag}"

    print(f"\n{'='*60}")
    print(f" Executing: {cmd_display}")
    print(f"{'='*60}\n")

    subprocess.run(cmd_parts)

    print(f"\n{'='*60}")

    try:
        response = input("\n Press Enter to return to menu (q to quit): ").strip().lower()
        return response != 'q'
    except (KeyboardInterrupt, EOFError):
        return False


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
            cmd_parts.extend([flag, value])

    # Add positional arguments
    if args:
        cmd_parts.extend(args)

    cmd_display = f"zep {command_path}"
    if options:
        for flag, value in options:
            cmd_display += f" {flag} {value}"
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

            # Special handling for forge commands (need zpak selection)
            if command_path.startswith('forge '):
                choice = prompt_zpak_choice(
                    command_path.split()[-1],
                    zpak_type='acore-extension'
                )
                if choice is None:
                    continue  # Cancelled
                zpak_name, is_all = choice

                if is_all:
                    # forge status takes no arg for "all", others use --all flag
                    if command_path == 'forge status':
                        continue_running = execute_command(command_path)
                    else:
                        continue_running = execute_command_with_flag(command_path, '--all')
                else:
                    continue_running = execute_command(command_path, [zpak_name])

                if not continue_running:
                    return False
                continue

            # Special handling for dbc db clean (needs zpak selection)
            if command_path == 'dbc db clean':
                choice = prompt_zpak_choice('dbc db clean', allow_all=False)
                if choice is None:
                    continue  # Cancelled
                zpak_name, _ = choice

                continue_running = execute_command(command_path, [zpak_name])
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

            continue_running = execute_command(command_path, arg_values, option_values)
            if not continue_running:
                return False


def main():
    """Main entry point."""
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
