"""
Interactive shell for Zeppelin-Craft CLI.

Provides a REPL interface with arrow key navigation, history, and tab completion.
"""

import shlex
import sys
from pathlib import Path

import click

try:
    from prompt_toolkit import PromptSession
    from prompt_toolkit.history import FileHistory
    from prompt_toolkit.auto_suggest import AutoSuggestFromHistory
    from prompt_toolkit.completion import Completer, Completion, merge_completers
    from prompt_toolkit.styles import Style
    from prompt_toolkit.formatted_text import HTML
    PROMPT_TOOLKIT_AVAILABLE = True
except ImportError:
    PROMPT_TOOLKIT_AVAILABLE = False


# Style for the prompt
SHELL_STYLE = Style.from_dict({
    'prompt': '#00aa00 bold',
    'command': '#ffffff',
})


class ZepCompleter(Completer):
    """Tab completion for zep commands."""

    def __init__(self, cli_group):
        self.cli_group = cli_group
        self.commands = self._build_command_tree()

    def _build_command_tree(self):
        """Build a tree of available commands."""
        tree = {}

        def add_commands(group, prefix=''):
            if hasattr(group, 'commands'):
                for name, cmd in group.commands.items():
                    full_path = f"{prefix}{name}".strip()
                    tree[full_path] = {
                        'help': cmd.get_short_help_str() if hasattr(cmd, 'get_short_help_str') else '',
                        'is_group': hasattr(cmd, 'commands')
                    }
                    if hasattr(cmd, 'commands'):
                        add_commands(cmd, f"{full_path} ")

        add_commands(self.cli_group)
        return tree

    def get_completions(self, document, complete_event):
        text = document.text_before_cursor
        words = text.split()

        # Get the word being typed
        word_before_cursor = document.get_word_before_cursor()

        # Build the prefix (completed words)
        if text.endswith(' '):
            prefix = text.strip() + ' ' if text.strip() else ''
            completing = ''
        else:
            prefix = ' '.join(words[:-1]) + ' ' if len(words) > 1 else ''
            completing = words[-1] if words else ''

        # Find matching completions
        for cmd_path, info in sorted(self.commands.items()):
            if cmd_path.startswith(prefix.strip()):
                # Get the next word in the path after prefix
                remainder = cmd_path[len(prefix.strip()):].strip()
                next_word = remainder.split()[0] if remainder else ''

                if next_word and next_word.startswith(completing):
                    yield Completion(
                        next_word,
                        start_position=-len(completing),
                        display=next_word,
                        display_meta=info['help'][:40] if info['help'] else ''
                    )


def print_banner():
    """Print the welcome banner."""
    click.echo(click.style("""
╔═══════════════════════════════════════════════════════════╗
║           Zeppelin-Craft Interactive Shell                ║
║                                                           ║
║  ↑/↓ History  |  Tab: Complete  |  quit/Ctrl+D: Exit     ║
╚═══════════════════════════════════════════════════════════╝
""", fg='cyan'))


def print_help(cli_group):
    """Print help information."""
    click.echo("\nAvailable command groups:")
    click.echo("-" * 50)

    for name, cmd in sorted(cli_group.commands.items()):
        help_text = cmd.get_short_help_str() if hasattr(cmd, 'get_short_help_str') else ''
        is_group = '→' if hasattr(cmd, 'commands') else ' '
        click.echo(f"  {is_group} {name:<15} {help_text}")

    click.echo("\n  → indicates command group (has subcommands)")
    click.echo("\nType '<command> --help' for detailed help")
    click.echo("Type 'quit' or press Ctrl+D to exit\n")


def run_command(cli_group, ctx, line):
    """Execute a command line."""
    line = line.strip()

    if not line:
        return True

    # Built-in commands
    if line in ('quit', 'exit'):
        click.echo("Goodbye!")
        return False

    if line == 'help':
        print_help(cli_group)
        return True

    # Parse and execute Click command
    try:
        args = shlex.split(line)
    except ValueError as e:
        click.echo(f"Error parsing command: {e}", err=True)
        return True

    try:
        with cli_group.make_context('zep', args, parent=ctx,
                                    resilient_parsing=False) as sub_ctx:
            cli_group.invoke(sub_ctx)
    except click.ClickException as e:
        e.show()
    except click.exceptions.Exit:
        pass
    except SystemExit:
        pass
    except Exception as e:
        click.echo(f"Error: {e}", err=True)

    return True


def run_shell(cli_group, ctx):
    """Run the interactive shell."""
    print_banner()

    if not PROMPT_TOOLKIT_AVAILABLE:
        click.echo("Note: Install 'prompt_toolkit' for better experience (arrow keys, history)")
        click.echo("      pip install prompt_toolkit\n")
        # Fall back to simple input loop
        _run_simple_shell(cli_group, ctx)
        return

    # Set up prompt_toolkit session
    history_file = Path.home() / '.zep_history'
    session = PromptSession(
        history=FileHistory(str(history_file)),
        auto_suggest=AutoSuggestFromHistory(),
        completer=ZepCompleter(cli_group),
        complete_while_typing=False,
        style=SHELL_STYLE,
    )

    # Main loop
    while True:
        try:
            line = session.prompt(
                HTML('<prompt>zep&gt;</prompt> '),
                style=SHELL_STYLE,
            )
            if not run_command(cli_group, ctx, line):
                break
        except KeyboardInterrupt:
            click.echo("\nInterrupted. Type 'quit' to exit.")
            continue
        except EOFError:
            click.echo("\nGoodbye!")
            break


def _run_simple_shell(cli_group, ctx):
    """Simple fallback shell without prompt_toolkit."""
    while True:
        try:
            line = input(click.style('zep> ', fg='green'))
            if not run_command(cli_group, ctx, line):
                break
        except KeyboardInterrupt:
            click.echo("\nInterrupted. Type 'quit' to exit.")
            continue
        except EOFError:
            click.echo("\nGoodbye!")
            break
