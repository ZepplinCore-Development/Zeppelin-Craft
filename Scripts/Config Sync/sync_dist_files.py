#!/usr/bin/env python3
"""
Sync .conf.dist files from Zeppelin-Core source to Zeppelin-Craft/Configs (F-038)

Run this after:
- Pulling AzerothCore updates
- Syncing module updates
- Before running config_sync.py

Usage:
    python3 sync_dist_files.py           # Dry-run: show what would be copied
    python3 sync_dist_files.py --sync    # Copy files
"""

import argparse
import shutil
from pathlib import Path
from datetime import datetime


class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    CYAN = '\033[96m'
    RESET = '\033[0m'
    BOLD = '\033[1m'
    DIM = '\033[2m'


# Paths
SCRIPT_DIR = Path(__file__).parent
ZEPPELIN_CRAFT = SCRIPT_DIR.parent.parent
ZEPPELIN_CORE = ZEPPELIN_CRAFT.parent / "Zeppelin-Core"
CONFIG_DIR = ZEPPELIN_CRAFT / "Configs"

# Source locations for .conf.dist files
DIST_SOURCES = {
    # Core configs
    "authserver.conf.dist": ZEPPELIN_CORE / "src/server/apps/authserver/authserver.conf.dist",
    "worldserver.conf.dist": ZEPPELIN_CORE / "src/server/apps/worldserver/worldserver.conf.dist",
    "dbimport.conf.dist": ZEPPELIN_CORE / "src/tools/dbimport/dbimport.conf.dist",

    # Module configs (destination relative to CONFIG_DIR/modules/)
    "modules/AutoBalance.conf.dist": ZEPPELIN_CORE / "modules/mod-autobalance/conf/AutoBalance.conf.dist",
    "modules/dungeonrespawn.conf.dist": ZEPPELIN_CORE / "modules/DungeonRespawn/conf/dungeonrespawn.conf.dist",
    "modules/individualProgression.conf.dist": ZEPPELIN_CORE / "modules/mod-individual-progression/conf/individualProgression.conf.dist",
    "modules/mod_accountbound.conf.dist": ZEPPELIN_CORE / "modules/mod-accountbound/conf/mod_accountbound.conf.dist",
    "modules/mod_ahbot.conf.dist": ZEPPELIN_CORE / "modules/mod-ah-bot-plus/conf/mod_ahbot.conf.dist",
    "modules/mod_ale.conf.dist": ZEPPELIN_CORE / "modules/mod-ale/conf/mod_ale.conf.dist",
    "modules/mod_eluna.conf.dist": ZEPPELIN_CORE / "modules/mod-eluna/conf/mod_eluna.conf.dist",
    "modules/mod_starterguild.conf.dist": ZEPPELIN_CORE / "modules/mod-starter-guild/conf/mod_starterguild.conf.dist",
    "modules/mod_worgoblin.conf.dist": ZEPPELIN_CORE / "modules/mod-worgoblin/conf/mod_worgoblin.conf.dist",
    "modules/RacialTraitSwap.conf.dist": ZEPPELIN_CORE / "modules/mod-racial-trait-swap/conf/RacialTraitSwap.conf.dist",
    "modules/RaidTeleporter.conf.dist": ZEPPELIN_CORE / "modules/RaidTeleporter/conf/RaidTeleporter.conf.dist",
    "modules/reagent_bank_account.conf.dist": ZEPPELIN_CORE / "modules/mod-reagent-bank-account/conf/reagent_bank_account.conf.dist",
    "modules/reusablepotion.conf.dist": ZEPPELIN_CORE / "modules/ReusablePotion/conf/reusablepotion.conf.dist",
    "modules/SoloLfg.conf.dist": ZEPPELIN_CORE / "modules/mod-solo-lfg/conf/SoloLfg.conf.dist",
}


def get_file_info(path: Path) -> tuple[int, str]:
    """Get line count and modification time of a file"""
    if not path.exists():
        return 0, "missing"

    with open(path, 'r', encoding='utf-8', errors='replace') as f:
        lines = len(f.readlines())

    mtime = datetime.fromtimestamp(path.stat().st_mtime)
    return lines, mtime.strftime("%Y-%m-%d %H:%M")


def compare_files(src: Path, dst: Path) -> tuple[bool, str]:
    """Compare two files, return (needs_update, reason)"""
    if not src.exists():
        return False, "source missing"

    if not dst.exists():
        return True, "destination missing"

    # Compare content
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


def main():
    parser = argparse.ArgumentParser(
        description="Sync .conf.dist files from Zeppelin-Core to Zeppelin-Craft/Configs"
    )
    parser.add_argument(
        '--sync', '-s',
        action='store_true',
        help='Actually copy files (default is dry-run)'
    )
    args = parser.parse_args()

    print(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"{Colors.BOLD}DIST FILE SYNC - {'SYNC' if args.sync else 'DRY-RUN'} MODE{Colors.RESET}")
    print(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"Source:      {ZEPPELIN_CORE}")
    print(f"Destination: {CONFIG_DIR}")

    # Verify paths
    if not ZEPPELIN_CORE.exists():
        print(f"\n{Colors.RED}Error: Zeppelin-Core not found at {ZEPPELIN_CORE}{Colors.RESET}")
        return 1

    if not CONFIG_DIR.exists():
        print(f"\n{Colors.RED}Error: Config directory not found at {CONFIG_DIR}{Colors.RESET}")
        return 1

    # Track stats
    needs_update = []
    up_to_date = []
    missing_source = []
    errors = []

    print(f"\n{Colors.BOLD}Checking files...{Colors.RESET}\n")

    for rel_path, src_path in sorted(DIST_SOURCES.items()):
        dst_path = CONFIG_DIR / rel_path

        update_needed, reason = compare_files(src_path, dst_path)

        if not src_path.exists():
            missing_source.append((rel_path, src_path))
            print(f"  {Colors.YELLOW}?{Colors.RESET} {rel_path}")
            print(f"    {Colors.DIM}Source not found: {src_path}{Colors.RESET}")
        elif update_needed:
            needs_update.append((rel_path, src_path, dst_path, reason))
            src_lines, src_date = get_file_info(src_path)
            dst_lines, dst_date = get_file_info(dst_path)
            print(f"  {Colors.CYAN}→{Colors.RESET} {rel_path}")
            print(f"    {Colors.DIM}Source: {src_lines} lines ({src_date}){Colors.RESET}")
            print(f"    {Colors.DIM}Dest:   {dst_lines} lines ({dst_date}) - {reason}{Colors.RESET}")
        else:
            up_to_date.append(rel_path)
            print(f"  {Colors.GREEN}✓{Colors.RESET} {rel_path} {Colors.DIM}(up to date){Colors.RESET}")

    # Summary
    print(f"\n{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"{Colors.BOLD}SUMMARY{Colors.RESET}")
    print(f"{Colors.BOLD}{'=' * 70}{Colors.RESET}")
    print(f"Up to date:     {len(up_to_date)}")
    print(f"Needs update:   {Colors.CYAN}{len(needs_update)}{Colors.RESET}")
    print(f"Missing source: {len(missing_source)}")

    if not needs_update:
        print(f"\n{Colors.GREEN}All .conf.dist files are up to date!{Colors.RESET}\n")
        return 0

    # Sync if requested
    if args.sync and needs_update:
        print(f"\n{Colors.BOLD}Syncing files...{Colors.RESET}\n")

        for rel_path, src_path, dst_path, reason in needs_update:
            try:
                # Ensure destination directory exists
                dst_path.parent.mkdir(parents=True, exist_ok=True)

                # Copy file
                shutil.copy2(src_path, dst_path)
                print(f"  {Colors.GREEN}✓{Colors.RESET} Copied: {rel_path}")
            except Exception as e:
                errors.append((rel_path, str(e)))
                print(f"  {Colors.RED}✗{Colors.RESET} Error copying {rel_path}: {e}")

        if errors:
            print(f"\n{Colors.RED}Completed with {len(errors)} error(s){Colors.RESET}")
            return 1
        else:
            print(f"\n{Colors.GREEN}Successfully synced {len(needs_update)} file(s){Colors.RESET}")
            print(f"\n{Colors.YELLOW}Next step: Run config_sync.py to merge new options into .conf files{Colors.RESET}")
            print(f"  python3 config_sync.py --sync\n")
    else:
        print(f"\n{Colors.YELLOW}Run with --sync to copy files{Colors.RESET}\n")

    return 0


if __name__ == "__main__":
    exit(main())
