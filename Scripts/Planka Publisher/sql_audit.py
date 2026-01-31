#!/usr/bin/env python3
"""
SQL Audit Script - Phase 1 of Planka Publisher (F-039)

Scans SQL files for feature/issue ID tags in filenames.
Reports tagged files (grouped by feature) and orphaned files needing documentation.

Usage:
    python3 sql_audit.py                    # Full report
    python3 sql_audit.py --orphans-only     # Only show untagged files
    python3 sql_audit.py --summary          # Counts only
"""

import argparse
import re
from pathlib import Path
from collections import defaultdict


# Configuration
SQL_ROOT = Path(__file__).parent.parent.parent / "SQL" / "db_world"
TAG_PATTERN = re.compile(r'_\[([FI]-\d{3})\]\.sql$')


class Colors:
    """ANSI color codes"""
    RED = '\033[0;31m'
    GREEN = '\033[0;32m'
    YELLOW = '\033[1;33m'
    BLUE = '\033[0;34m'
    CYAN = '\033[0;36m'
    BOLD = '\033[1m'
    NC = '\033[0m'  # No Color


def scan_sql_files(root: Path) -> tuple[dict, list]:
    """
    Scan SQL files and categorize by tag status.

    Returns:
        tagged: dict mapping feature IDs to list of file paths
        orphaned: list of file paths without tags
    """
    tagged = defaultdict(list)
    orphaned = []

    for sql_file in root.rglob("*.sql"):
        # Skip generated/update files
        if "Updates" in str(sql_file) or "update_" in sql_file.name:
            continue

        match = TAG_PATTERN.search(sql_file.name)
        if match:
            feature_id = match.group(1)
            tagged[feature_id].append(sql_file)
        else:
            orphaned.append(sql_file)

    return dict(tagged), orphaned


def get_relative_path(file_path: Path, root: Path) -> str:
    """Get path relative to SQL root for cleaner display"""
    try:
        return str(file_path.relative_to(root))
    except ValueError:
        return str(file_path)


def print_tagged_report(tagged: dict, root: Path):
    """Print report of tagged files grouped by feature"""
    print(f"\n{Colors.GREEN}{Colors.BOLD}=== Tagged SQL Files ==={Colors.NC}")
    print(f"{Colors.GREEN}Files properly linked to Joplin features/issues{Colors.NC}\n")

    # Sort by feature ID
    for feature_id in sorted(tagged.keys()):
        files = tagged[feature_id]
        print(f"{Colors.CYAN}[{feature_id}]{Colors.NC} ({len(files)} file{'s' if len(files) != 1 else ''})")
        for f in sorted(files):
            rel_path = get_relative_path(f, root)
            print(f"  {rel_path}")
        print()


def print_orphaned_report(orphaned: list, root: Path):
    """Print report of orphaned files needing documentation"""
    print(f"\n{Colors.YELLOW}{Colors.BOLD}=== Orphaned SQL Files ==={Colors.NC}")
    print(f"{Colors.YELLOW}Files without feature/issue tags - need Joplin documentation{Colors.NC}\n")

    if not orphaned:
        print(f"  {Colors.GREEN}None! All SQL files are tagged.{Colors.NC}\n")
        return

    # Group by directory for easier reading
    by_dir = defaultdict(list)
    for f in orphaned:
        rel_path = get_relative_path(f, root)
        dir_path = str(Path(rel_path).parent)
        by_dir[dir_path].append(f.name)

    for dir_path in sorted(by_dir.keys()):
        files = by_dir[dir_path]
        print(f"{Colors.BLUE}{dir_path}/{Colors.NC}")
        for filename in sorted(files):
            print(f"  {Colors.YELLOW}{filename}{Colors.NC}")
        print()


def print_summary(tagged: dict, orphaned: list):
    """Print summary counts"""
    total_tagged = sum(len(files) for files in tagged.values())
    total_orphaned = len(orphaned)
    total = total_tagged + total_orphaned

    if total == 0:
        print("No SQL files found.")
        return

    coverage = (total_tagged / total) * 100 if total > 0 else 0

    print(f"\n{Colors.BOLD}=== Summary ==={Colors.NC}")
    print(f"  Tagged files:   {Colors.GREEN}{total_tagged}{Colors.NC}")
    print(f"  Orphaned files: {Colors.YELLOW}{total_orphaned}{Colors.NC}")
    print(f"  Total files:    {total}")
    print(f"  Coverage:       {Colors.GREEN if coverage > 80 else Colors.YELLOW}{coverage:.1f}%{Colors.NC}")
    print(f"  Features:       {len(tagged)}")
    print()


def main():
    parser = argparse.ArgumentParser(
        description="Audit SQL files for feature/issue ID tags",
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument(
        '--orphans-only', '-o',
        action='store_true',
        help='Only show orphaned (untagged) files'
    )
    parser.add_argument(
        '--summary', '-s',
        action='store_true',
        help='Only show summary counts'
    )
    parser.add_argument(
        '--path', '-p',
        type=Path,
        default=SQL_ROOT,
        help=f'SQL root directory (default: {SQL_ROOT})'
    )

    args = parser.parse_args()

    if not args.path.exists():
        print(f"{Colors.RED}Error: Path does not exist: {args.path}{Colors.NC}")
        return 1

    print(f"{Colors.BOLD}SQL Audit - Planka Publisher (F-039){Colors.NC}")
    print(f"Scanning: {args.path}")

    tagged, orphaned = scan_sql_files(args.path)

    if args.summary:
        print_summary(tagged, orphaned)
    elif args.orphans_only:
        print_orphaned_report(orphaned, args.path)
        print_summary(tagged, orphaned)
    else:
        print_tagged_report(tagged, args.path)
        print_orphaned_report(orphaned, args.path)
        print_summary(tagged, orphaned)

    # Exit code: number of orphaned files (0 = all documented)
    return min(len(orphaned), 255)


if __name__ == '__main__':
    exit(main())
