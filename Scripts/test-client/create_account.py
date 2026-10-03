"""Create the harness's NON-GM test account and write $WOWTEST_DIR/account.txt (0600).

    python3 create_account.py [USERNAME=ZEPTEST]

Non-GM on purpose: GMs see every phase, which would mask wrong-phase bugs. The password is random
and lives only in account.txt (not tracked). Refuses if the username already exists.
"""
import hashlib
import os
import secrets
import subprocess
import sys
import tempfile

CRAFT = '/workspace/project/Zeppelin-Craft'
# AzerothCore SRP6 constants (src/common/Cryptography/Authentication/SRP6.cpp)
N = int('894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7', 16)
G = 7


def zep(*args):
    return subprocess.run(['python3', '-m', 'cli.zep', 'world', 'sql', *args, '-d', 'auth'],
                          cwd=CRAFT, capture_output=True, text=True, check=True).stdout


user = (sys.argv[1] if len(sys.argv) > 1 else 'ZEPTEST').upper()
out = os.path.join(os.environ.get('WOWTEST_DIR', os.path.expanduser('~/wowtest')), 'account.txt')
if f'\n{user}' in '\n' + zep('query', f"SELECT username FROM account WHERE username='{user}'"):
    sys.exit(f'{user} already exists - reuse it (credentials in {out}) or pick another name')

password = secrets.token_hex(6).upper()
salt = os.urandom(32)
h1 = hashlib.sha1(f'{user}:{password}'.encode()).digest()
x = int.from_bytes(hashlib.sha1(salt + h1).digest(), 'little')
verifier = pow(G, x, N).to_bytes(32, 'little')

with tempfile.NamedTemporaryFile('w', suffix='.sql', delete=False) as f:
    f.write(f"INSERT INTO account (username, salt, verifier, email, reg_mail, expansion) "
            f"VALUES ('{user}', 0x{salt.hex()}, 0x{verifier.hex()}, '', '', 2);\n")
try:
    zep('modify', '-f', f.name)
finally:
    os.unlink(f.name)

os.makedirs(os.path.dirname(out), exist_ok=True)
with open(out, 'w') as f:
    f.write(f'{user}\n{password}\n')
os.chmod(out, 0o600)
print(f'created {user}; credentials in {out}')
