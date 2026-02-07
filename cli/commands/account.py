"""
Account management for Zeppelin-Craft CLI.

Commands:
    zep account create    Create a new game account
"""

import hashlib
import os

import click

from commands.sql import run_mysql_query_as_root


# SRP6 constants (from AzerothCore source)
_SRP6_N = 0x894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
_SRP6_g = 7


def _compute_srp6_verifier(username: str, password: str) -> tuple:
    """Compute SRP6 salt and verifier for AzerothCore authentication.

    Returns (salt_hex, verifier_hex) as uppercase hex strings.
    """
    # Generate 32 random bytes for salt
    salt = os.urandom(32)

    # h1 = SHA1(UPPER(username) : UPPER(password))
    auth_string = (username.upper() + ":" + password.upper()).encode('utf-8')
    h1 = hashlib.sha1(auth_string).digest()

    # h2 = SHA1(salt + h1)
    h2 = hashlib.sha1(salt + h1).digest()

    # Convert h2 to integer (little-endian, matching AC's BigNumber)
    h2_int = int.from_bytes(h2, byteorder='little')

    # verifier = pow(g, h2_int, N)
    verifier_int = pow(_SRP6_g, h2_int, _SRP6_N)

    # Convert verifier back to 32 bytes (little-endian)
    verifier = verifier_int.to_bytes(32, byteorder='little')

    return salt.hex().upper(), verifier.hex().upper()


@click.group()
def account():
    """Account management"""
    pass


@account.command('create')
@click.argument('username')
@click.argument('password')
def account_create(username, password):
    """Create a new game account.

    Examples:
        zep account create myuser mypass
    """
    # Check if username already exists
    check_query = f"SELECT id FROM account WHERE username = '{username}'"
    success, result = run_mysql_query_as_root(check_query, 'acore_auth')
    if not success:
        raise click.ClickException(f"Database error: {result}")

    if result and result.strip().count('\n') >= 1:
        raise click.ClickException(f"Account '{username}' already exists")

    # Compute SRP6 credentials
    salt_hex, verifier_hex = _compute_srp6_verifier(username, password)

    # Insert account
    insert_query = (
        f"INSERT INTO account (username, salt, verifier, expansion, joindate) "
        f"VALUES ('{username.upper()}', UNHEX('{salt_hex}'), UNHEX('{verifier_hex}'), 2, NOW())"
    )
    success, result = run_mysql_query_as_root(insert_query, 'acore_auth')
    if not success:
        raise click.ClickException(f"Failed to create account: {result}")

    # Get the new account ID
    success, result = run_mysql_query_as_root(
        f"SELECT id FROM account WHERE username = '{username.upper()}'",
        'acore_auth'
    )
    if success and result:
        lines = result.strip().split('\n')
        account_id = lines[1].strip() if len(lines) > 1 else '?'
    else:
        account_id = '?'

    click.echo(click.style(f"Account created: {username.upper()} (id: {account_id})", fg='green'))
