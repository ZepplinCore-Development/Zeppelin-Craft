"""
Client patch build orchestration for Zeppelin-Craft CLI.

Handles discovering zpaks by client_patch assignment, building MPQ archives,
and deploying them to the NGINX distribution path.

PATCH-Z has special handling (DBC export + CharSections reorder).
All other patches pack directly from zpak parsed-assets directories.
"""

import os
import shutil
import subprocess
import sys
import tempfile
import time
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

from lib.env import (
    DBCTOOL_PATH,
    DBC_EXPORT_PATH,
    DBC_REORDER_PATH,
    MPQCLI_PATH,
    SERVER_DBC_PATH,
)
from lib.logging_config import get_logger
from lib.manifest import load_manifest
from lib.patch_register import (
    bump_build_number,
    bump_dbc_version,
    get_patch_output_path,
    update_patch_entry,
)

logger = get_logger('lib.patch_builder')

# Aliases for internal use
DBC_EXPORT_DIR = DBC_EXPORT_PATH
SERVER_DBC_DIR = SERVER_DBC_PATH
DBC_REORDER_DIR = DBC_REORDER_PATH

# Backup directory
BACKUP_DIR_NAME = 'backup'


# =============================================================================
# Patch Discovery
# =============================================================================

def discover_patches(craft_root: Path) -> Dict[str, List[Dict[str, Any]]]:
    """Scan all zpaks and group by client_patch assignment.

    Args:
        craft_root: Path to Zeppelin-Craft root.

    Returns:
        Dict mapping patch letters to lists of zpak info dicts.
        Example: {"Z": [{"name": "zepcraft-legacy", "path": ..., "manifest": ...}]}
    """
    patches = {}

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
            if not manifest.get('enabled', True):
                continue

            client_patch = manifest.get('client_patch')
            if not client_patch:
                continue

            # Extract letter from "PATCH-X" format
            letter = client_patch.replace('PATCH-', '')

            zpak_info = {
                'name': manifest.get('name', pkg_dir.name),
                'path': pkg_dir,
                'manifest': manifest,
                'client_patch': client_patch,
            }

            patches.setdefault(letter, []).append(zpak_info)

    logger.info(f"Discovered {sum(len(v) for v in patches.values())} zpaks "
                f"across {len(patches)} patch letters")
    return patches


def get_zpak_parsed_assets(zpak_path: Path) -> Optional[Path]:
    """Get the parsed-assets directory for a zpak if it has actual files.

    Args:
        zpak_path: Path to the zpak directory.

    Returns:
        Path to parsed-assets dir if it contains real files, None otherwise.
    """
    parsed = zpak_path / 'mpq' / 'parsed-assets'
    if not parsed.exists():
        return None

    # Check for actual files (not just .gitkeep/.gitignore)
    has_files = any(
        f.is_file() and f.name not in ('.gitkeep', '.gitignore')
        for f in parsed.rglob('*')
    )
    return parsed if has_files else None


def get_zpak_build_info(manifest: Dict[str, Any]) -> Dict[str, Any]:
    """Extract build configuration from a zpak manifest.

    Args:
        manifest: Zpak manifest dict.

    Returns:
        Dict with preprocessor, generator, and other build config.
    """
    return manifest.get('build', {})


# =============================================================================
# Pre-build Backup
# =============================================================================

def _backup_existing_mpq(output_path: Path, nginx_path: Path) -> bool:
    """Backup an existing MPQ file before overwriting.

    Copies to nginx_path/backup/ if the file exists.

    Args:
        output_path: Path to the MPQ file that will be overwritten.
        nginx_path: NGINX root directory (backup goes under here).

    Returns:
        True if backup succeeded or no backup needed.
    """
    if not output_path.exists():
        return True

    backup_dir = nginx_path / BACKUP_DIR_NAME
    backup_dir.mkdir(parents=True, exist_ok=True)
    backup_path = backup_dir / output_path.name

    try:
        shutil.copy2(output_path, backup_path)
        size_mb = output_path.stat().st_size / (1024 * 1024)
        print(f"  Backed up {output_path.name} ({size_mb:.0f} MB)")
        logger.info(f"Backed up {output_path} -> {backup_path}")
        return True
    except (OSError, shutil.Error) as e:
        print(f"  Warning: Failed to backup {output_path.name}: {e}")
        logger.error(f"Backup failed for {output_path}: {e}")
        return False


# =============================================================================
# PATCH-Z Build (DBC Export)
# =============================================================================

def build_patch_z(craft_root: Path, nginx_path: Path,
                  register: Dict[str, Any],
                  quick: bool = False,
                  dry_run: bool = False) -> bool:
    """Build PATCH-Z.MPQ (DBC files).

    Special flow:
    1. Export DBC database to binary .dbc files (unless --quick)
    2. Reorder CharSections.dbc
    3. Copy .dbc files to server data/dbc/
    4. Pack into PATCH-Z.MPQ (with DBFilesClient/ internal path)
    5. Deploy to NGINX
    6. Update register

    Args:
        craft_root: Path to Zeppelin-Craft root.
        nginx_path: Path to NGINX root directory.
        register: Patch register dict (modified in place).
        quick: Skip DBC export, use existing files.
        dry_run: Preview only, don't build.

    Returns:
        True if build succeeded.
    """
    patch_name = 'PATCH-Z.MPQ'
    output_path = get_patch_output_path(nginx_path, patch_name, register)

    if dry_run:
        print(f"  [DRY RUN] Would build {patch_name}")
        print(f"    DBC export: {'skip (quick mode)' if quick else DBC_EXPORT_DIR}")
        print(f"    Output: {output_path}")
        return True

    start = time.time()

    # Backup existing MPQ before overwriting
    _backup_existing_mpq(output_path, nginx_path)

    # Step 1: DBC export
    if not quick:
        print("  Exporting DBC database to binary files...")
        if not _run_dbc_export():
            return False
    else:
        print("  Quick mode: using existing DBC exports")
        if not DBC_EXPORT_DIR.exists() or not any(DBC_EXPORT_DIR.glob('*.dbc')):
            print("    No existing DBC files found. Run without --quick first.")
            return False

    # Step 2: Reorder CharSections.dbc
    charsections = DBC_EXPORT_DIR / 'CharSections.dbc'
    if charsections.exists():
        print("  Reordering CharSections.dbc...")
        if not _run_charsections_reorder(charsections):
            print("    Warning: CharSections reorder failed, continuing anyway")
    else:
        logger.warning("CharSections.dbc not found in export directory")

    # Step 3: Copy to server data/dbc/
    print(f"  Copying DBC files to {SERVER_DBC_DIR}...")
    _copy_dbc_to_server(DBC_EXPORT_DIR, SERVER_DBC_DIR)

    # Step 4+5: Pack and deploy
    # Create a temp staging dir with DBFilesClient/ structure (MPQ internal path)
    with tempfile.TemporaryDirectory(prefix='zep-patch-z-') as staging:
        staging_path = Path(staging)
        dbc_client_dir = staging_path / 'DBFilesClient'
        dbc_client_dir.mkdir()

        # Copy exported DBC files into staging
        dbc_count = 0
        for dbc_file in DBC_EXPORT_DIR.glob('*.dbc'):
            shutil.copy2(dbc_file, dbc_client_dir / dbc_file.name)
            dbc_count += 1

        if dbc_count == 0:
            print("    No .dbc files found in export directory")
            return False

        print(f"  Packing {dbc_count} DBC files into {patch_name}...")
        if not _pack_mpq(staging_path, output_path):
            return False

    # Step 6: Update register
    bump_build_number(register)
    bump_dbc_version(register)
    update_patch_entry(register, patch_name, output_path, zpak_name='zepcraft-legacy')

    elapsed = time.time() - start
    size_mb = output_path.stat().st_size / (1024 * 1024) if output_path.exists() else 0
    print(f"  Built {patch_name}: {size_mb:.1f} MB in {elapsed:.1f}s")

    return True


# =============================================================================
# Generic Patch Build
# =============================================================================

def build_generic_patch(letter: str, zpaks: List[Dict[str, Any]],
                        nginx_path: Path, register: Dict[str, Any],
                        parse: bool = False,
                        parse_only: bool = False,
                        dry_run: bool = False) -> bool:
    """Build a non-Z patch MPQ from zpak parsed-assets.

    Packs directly from zpak parsed-assets directories using mpqcli.
    For single-zpak patches (most cases), packs directly from the source.
    For multi-zpak patches, creates each in sequence using mpqcli add.

    Args:
        letter: Patch letter (e.g. "O", "H").
        zpaks: List of zpak info dicts for this patch.
        nginx_path: Path to NGINX root directory.
        register: Patch register dict (modified in place).
        parse: Run preprocessor before packing.
        parse_only: Run preprocessor only, skip packing.
        dry_run: Preview only, don't build.

    Returns:
        True if build succeeded.
    """
    patch_name = f'PATCH-{letter}.MPQ'
    output_path = get_patch_output_path(nginx_path, patch_name, register)

    # Run resource parser if requested — any zpak with source-assets gets parsed
    if parse or parse_only:
        for zpak in zpaks:
            source_dir = Path(zpak['path']) / 'mpq' / 'source-assets'
            if source_dir.exists():
                print(f"  Running resource-parser for {zpak['name']}...")
                if dry_run:
                    print(f"    [DRY RUN] Would run resource-parser")
                elif not _run_resource_parser(zpak):
                    print(f"    Resource parser failed for {zpak['name']}")
                    return False
            else:
                print(f"    {zpak['name']}: no source-assets directory, skipping parse")

    # Parse only: stop after preprocessing
    if parse_only:
        if not dry_run:
            print(f"  Parse complete for PATCH-{letter}")
        return True

    # Collect zpaks with actual assets
    buildable = []
    for zpak in zpaks:
        parsed = get_zpak_parsed_assets(zpak['path'])
        if parsed:
            buildable.append((zpak, parsed))
        else:
            source_dir = Path(zpak['path']) / 'mpq' / 'source-assets'
            if source_dir.exists() and not parse:
                print(f"    {zpak['name']}: parsed-assets empty "
                      f"(use --parse to run resource-parser first)")
            else:
                print(f"    {zpak['name']}: no parsed-assets found, skipping")

    if dry_run:
        print(f"  [DRY RUN] Would build {patch_name}")
        for zpak, parsed in buildable:
            file_count = sum(1 for _ in parsed.rglob('*') if _.is_file()
                            and _.name not in ('.gitkeep', '.gitignore'))
            print(f"    {zpak['name']}: {file_count} files from {parsed}")
        if not buildable:
            print(f"    No zpaks have packable assets")
        print(f"    Output: {output_path}")
        return True

    if not buildable:
        print(f"  {patch_name}: no zpaks have packable assets, skipping")
        return False

    start = time.time()

    # Backup existing MPQ before overwriting
    _backup_existing_mpq(output_path, nginx_path)

    # Pack directly from source directories
    if len(buildable) == 1:
        # Single zpak: pack directly from its parsed-assets
        zpak, parsed = buildable[0]
        print(f"  Packing {zpak['name']} into {patch_name}...")
        if not _pack_mpq(parsed, output_path):
            return False
    else:
        # Multiple zpaks: create from first, then add from rest
        zpak, parsed = buildable[0]
        print(f"  Packing {zpak['name']} into {patch_name}...")
        if not _pack_mpq(parsed, output_path):
            return False

        for zpak, parsed in buildable[1:]:
            print(f"  Adding {zpak['name']} to {patch_name}...")
            if not _add_to_mpq(parsed, output_path):
                return False

    # Update register
    zpak_names = ', '.join(z['name'] for z, _ in buildable)
    bump_build_number(register)
    update_patch_entry(register, patch_name, output_path, zpak_name=zpak_names)

    elapsed = time.time() - start
    size_mb = output_path.stat().st_size / (1024 * 1024) if output_path.exists() else 0
    print(f"  Built {patch_name}: {size_mb:.1f} MB in {elapsed:.1f}s")

    return True


# =============================================================================
# Tool Wrappers
# =============================================================================

def _run_resource_parser(zpak: Dict[str, Any]) -> bool:
    """Run resource parser on a zpak's source-assets directory.

    Copies source-assets to parsed-assets and resolves missing
    dependencies (textures, skins, animations) from the Asset Library.

    Mode is determined by zpak manifest build.preprocessor_mode
    (default: model-scan). Full mode runs the ADT workflow.

    Args:
        zpak: Zpak info dict with 'name', 'path', 'manifest'.

    Returns:
        True if parsing succeeded.
    """
    from lib.resource_parser import ResourceParser
    from lib.env import ASSET_LIBRARY_PATH

    manifest = zpak.get('manifest', {})
    build_config = manifest.get('build', {})
    mode = build_config.get('preprocessor_mode', 'model-scan')

    zpak_path = Path(zpak['path'])
    source_dir = zpak_path / 'mpq' / 'source-assets'
    output_dir = zpak_path / 'mpq' / 'parsed-assets'

    rp = ResourceParser(mode=mode, assets_source=ASSET_LIBRARY_PATH)

    logger.info(f"Running resource parser for {zpak['name']} (mode={mode})")
    print(f"    This may take several minutes...")

    try:
        if mode == 'model-scan':
            print(f"    Mode: model-scan")
            rp.run_model_scan(source_dir, output_dir)
        else:
            patch_o = build_config.get('patch_o_source')
            if patch_o:
                patch_o = zpak_path / patch_o
            else:
                patch_o = source_dir
            print(f"    Mode: full (ADT workflow)")
            rp.run(patch_o, output_dir)

        print(f"    Resource parser completed for {zpak['name']}")
        return True
    except Exception as e:
        print(f"    Resource parser failed: {e}")
        logger.error(f"Resource parser failed for {zpak['name']}: {e}")
        return False


def _run_dbc_export() -> bool:
    """Run DBCTool export to generate binary DBC files.

    Returns:
        True if export succeeded.
    """
    if not DBCTOOL_PATH.exists():
        print(f"    DBCTool not found at {DBCTOOL_PATH}")
        return False

    cmd = [str(DBCTOOL_PATH), 'export']
    logger.info(f"Running DBCTool export: {' '.join(cmd)}")

    result = subprocess.run(
        cmd,
        cwd=DBCTOOL_PATH.parent,
        capture_output=True,
        text=True,
    )

    if result.returncode != 0:
        print(f"    DBCTool export failed (code {result.returncode})")
        if result.stderr:
            for line in result.stderr.strip().split('\n')[:5]:
                print(f"      {line}")
        logger.error(f"DBCTool export failed: {result.stderr}")
        return False

    # Count exported files
    dbc_count = len(list(DBC_EXPORT_DIR.glob('*.dbc'))) if DBC_EXPORT_DIR.exists() else 0
    print(f"    Exported {dbc_count} DBC files")
    return True


def _run_charsections_reorder(dbc_path: Path) -> bool:
    """Reorder CharSections.dbc by race/gender grouping.

    Imports the existing dbc_reorder module from Scripts/Patch Builder/.

    Args:
        dbc_path: Path to CharSections.dbc file.

    Returns:
        True if reorder succeeded.
    """
    try:
        # Import the reorder module from its location
        if str(DBC_REORDER_DIR) not in sys.path:
            sys.path.insert(0, str(DBC_REORDER_DIR))
        from dbc_reorder import reorder_charsections
        return reorder_charsections(str(dbc_path))
    except ImportError as e:
        logger.error(f"Could not import dbc_reorder: {e}")
        print(f"    Could not import dbc_reorder from {DBC_REORDER_DIR}")
        return False
    except Exception as e:
        logger.error(f"CharSections reorder failed: {e}")
        return False


def _copy_dbc_to_server(export_dir: Path, server_dir: Path) -> int:
    """Copy exported DBC files to the server data directory.

    Args:
        export_dir: Source directory with .dbc files.
        server_dir: Destination server data/dbc/ directory.

    Returns:
        Number of files copied.
    """
    server_dir.mkdir(parents=True, exist_ok=True)
    count = 0
    for dbc_file in export_dir.glob('*.dbc'):
        shutil.copy2(dbc_file, server_dir / dbc_file.name)
        count += 1
    logger.info(f"Copied {count} DBC files to {server_dir}")
    return count


def _pack_mpq(source_dir: Path, output_path: Path) -> bool:
    """Pack a directory into an MPQ archive using mpqcli.

    Packs to a temporary file first, then replaces the target
    (mpqcli won't overwrite existing files).

    Args:
        source_dir: Directory to pack (becomes MPQ root).
        output_path: Path for the output MPQ file.

    Returns:
        True if packing succeeded.
    """
    if not MPQCLI_PATH.exists():
        print(f"    mpqcli not found at {MPQCLI_PATH}")
        return False

    # Ensure output directory exists
    output_path.parent.mkdir(parents=True, exist_ok=True)

    # Pack to temp file (mpqcli refuses to overwrite)
    tmp_fd, tmp_path = tempfile.mkstemp(suffix='.MPQ', dir=output_path.parent)
    os.close(tmp_fd)
    os.unlink(tmp_path)  # Remove so mpqcli can create it fresh

    cmd = [
        str(MPQCLI_PATH), 'create',
        str(source_dir),
        '-o', tmp_path,
        '-v', '2',
    ]

    logger.info(f"Packing MPQ: {' '.join(cmd)}")
    result = subprocess.run(cmd, capture_output=True, text=True)

    if result.returncode != 0:
        print(f"    mpqcli create failed (code {result.returncode})")
        if result.stderr:
            for line in result.stderr.strip().split('\n')[:5]:
                print(f"      {line}")
        logger.error(f"mpqcli failed: {result.stderr}")
        # Clean up temp file
        if Path(tmp_path).exists():
            os.unlink(tmp_path)
        return False

    # Replace target with temp file
    shutil.move(tmp_path, output_path)
    return True


def _add_to_mpq(source_dir: Path, mpq_path: Path) -> bool:
    """Add files from a directory to an existing MPQ archive.

    Walks the source directory and adds each file with its relative path.

    Args:
        source_dir: Directory with files to add.
        mpq_path: Path to the existing MPQ file.

    Returns:
        True if all additions succeeded.
    """
    if not MPQCLI_PATH.exists():
        print(f"    mpqcli not found at {MPQCLI_PATH}")
        return False

    for file_path in source_dir.rglob('*'):
        if not file_path.is_file():
            continue
        if file_path.name in ('.gitkeep', '.gitignore'):
            continue

        # Internal MPQ path is relative to source_dir
        internal_path = file_path.relative_to(source_dir)

        cmd = [
            str(MPQCLI_PATH), 'add',
            str(mpq_path),
            str(file_path),
            '-f', str(internal_path),
        ]

        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            logger.error(f"mpqcli add failed for {internal_path}: {result.stderr}")
            return False

    return True
