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
from typing import Dict, List, Optional, Tuple, Any

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
            # Extract required arguments
            args = []
            if hasattr(cmd, 'params'):
                for param in cmd.params:
                    if isinstance(param, click.Argument) and param.required:
                        args.append(param.name)

            tree['commands'][name] = {
                'help': help_text,
                'path': full_path,
                'args': args,
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
        show_back: Whether to show [Back] option
        preview_command: Optional preview command for status bar

    Returns:
        Selected index (0-based), or None if quit/back
    """
    menu_options = list(options)
    num_real_options = len(menu_options)

    # Track indices for special options
    back_index = None
    quit_index = None

    if show_back:
        back_index = len(menu_options)
        menu_options.append("[Back]")
    else:
        quit_index = len(menu_options)
        menu_options.append("[Quit]")

    menu = TerminalMenu(
        menu_options,
        title=f"\n{title}\n",
        menu_cursor="> ",
        menu_cursor_style=("fg_cyan", "bold"),
        menu_highlight_style=("fg_cyan", "bold"),
        cycle_cursor=True,
        clear_screen=True,
        status_bar=preview_command or "Arrow keys: Navigate | Enter: Select | q: Quit",
        status_bar_style=("fg_gray",),
    )

    result = menu.show()

    if result is None:  # Escape or q pressed
        return None

    # Check for special options
    if result == back_index:
        return None
    if result == quit_index:
        return -1  # Signal to exit completely

    # Return index in original options list
    if result >= num_real_options:
        return None

    return result


def prompt_args(args: List[str], command_path: str) -> Optional[List[str]]:
    """Prompt user for required arguments.

    Args:
        args: List of argument names
        command_path: Full command path for display

    Returns:
        List of argument values, or None if cancelled
    """
    if not args:
        return []

    print(f"\n Command: zep {command_path}\n")

    values = []
    for arg in args:
        try:
            # Format arg name nicely
            display_name = arg.replace('_', ' ').title()
            value = input(f"  {display_name}: ").strip()
            if not value:
                print("\n  Cancelled (empty input)")
                return None
            values.append(value)
        except (KeyboardInterrupt, EOFError):
            print("\n  Cancelled")
            return None

    return values


def execute_command(command_path: str, args: List[str] = None) -> bool:
    """Execute a zep command.

    Args:
        command_path: Command path (e.g., "zpak list")
        args: Optional list of argument values

    Returns:
        True if should return to menu, False to exit
    """
    # Build full command
    cmd_parts = ["python3", str(CLI_DIR / "zep.py")] + command_path.split()
    if args:
        cmd_parts.extend(args)

    cmd_display = f"zep {command_path}"
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

        if result is None:  # Back
            return True
        if result == -1:  # Quit
            return False

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

            if args:
                # Need to prompt for arguments
                arg_values = prompt_args(args, selection_data['path'])
                if arg_values is None:
                    continue  # Cancelled, stay in menu
            else:
                arg_values = []

            continue_running = execute_command(selection_data['path'], arg_values)
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
