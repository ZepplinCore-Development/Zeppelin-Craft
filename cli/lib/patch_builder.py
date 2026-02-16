"""
Client patch build orchestration for Zeppelin-Craft CLI.

Handles discovering zpaks by client_patch assignment, building MPQ archives,
and deploying them to the NGINX distribution path.

All patches use the same build pipeline:
1. Preprocessors populate parsed-assets (resource parser + named preprocessors)
2. Build packs parsed-assets into MPQ

Named preprocessors are defined per-zpak in zpak.json build.preprocessors.
"""

import json
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
    MPQCLI_PATH,
    SERVER_DBC_PATH,
)
from lib.dbc_utils import DBCConfig, run_sql
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
        shutil.copyfile(output_path, backup_path)
        size_mb = output_path.stat().st_size / (1024 * 1024)
        print(f"Backed up {output_path.name} ({size_mb:.0f} MB)")
        logger.info(f"Backed up {output_path} -> {backup_path}")
        return True
    except (OSError, shutil.Error) as e:
        print(f"  Warning: Failed to backup {output_path.name}: {e}")
        logger.error(f"Backup failed for {output_path}: {e}")
        return False


# =============================================================================
# Preprocessing Pipeline
# =============================================================================

def get_zpak_preprocessors(zpak: Dict[str, Any]) -> List[str]:
    """Get the list of named preprocessors for a zpak.

    Reads from build.preprocessors in zpak.json. Also supports legacy
    build.generator field for backward compatibility.

    Args:
        zpak: Zpak info dict with 'manifest'.

    Returns:
        List of preprocessor names.
    """
    build_config = zpak.get('manifest', {}).get('build', {})
    preprocessors = list(build_config.get('preprocessors', []))

    # Backward compat: build.generator → preprocessor entry
    generator = build_config.get('generator')
    if generator and generator not in preprocessors:
        preprocessors.append(generator)

    return preprocessors


def _run_preprocessors(zpaks: List[Dict[str, Any]],
                       dry_run: bool = False) -> bool:
    """Run the preprocessing pipeline on a list of zpaks.

    For each zpak:
    1. Copy source-assets to parsed-assets (base step for all zpaks)
    2. Run resource parser (resolves model dependencies from Asset Library)
    3. Run named preprocessors from build.preprocessors in zpak.json

    Args:
        zpaks: List of zpak info dicts.
        dry_run: Preview only, don't run.

    Returns:
        True if all preprocessing succeeded.
    """
    start = time.time()
    steps_run = []

    for zpak in zpaks:
        zpak_path = Path(zpak['path'])
        source_dir = zpak_path / 'mpq' / 'source-assets'
        has_source = source_dir.exists()
        named = get_zpak_preprocessors(zpak)

        if not has_source and not named:
            continue

        # Step 1+2: Run resource parser (handles copy + uppercase normalization)
        if has_source:
            if dry_run:
                _print_step_header('RESOURCE PARSER', zpak['name'])
                print(f"[DRY RUN] Would run resource-parser")
                steps_run.append('resource-parser')
            else:
                if not _run_resource_parser(zpak):
                    print(f"Resource parser failed for {zpak['name']}")
                    return False
                steps_run.append('resource-parser')

        # Step 3: Named preprocessors from zpak.json
        for name in named:
            _print_step_header(name.upper(), zpak['name'])
            if dry_run:
                print(f"[DRY RUN] Would run {name}")
                steps_run.append(name)
            elif not _run_named_preprocessor(name, zpak):
                print(f"{name} failed for {zpak['name']}")
                return False
            else:
                steps_run.append(name)

    # Summary
    elapsed = time.time() - start
    pipeline = ' > '.join(steps_run)
    print('\n' + '=' * 80)
    print(f"PREPROCESSING COMPLETE")
    print('=' * 80)
    print(f"\nPipeline: {pipeline}")
    print(f"Duration: {elapsed:.1f}s")

    return True


def _print_step_header(step_name: str, zpak_name: str):
    """Print a section header matching the resource parser style."""
    print('\n' + '=' * 80)
    print(f"{step_name} — {zpak_name}")
    print('=' * 80)


def _run_named_preprocessor(name: str, zpak: Dict[str, Any]) -> bool:
    """Dispatch a named preprocessor.

    Preprocessors operate on a zpak's parsed-assets directory and are
    defined in zpak.json build.preprocessors.

    Args:
        name: Preprocessor name (e.g. 'dbc-export', 'atlasloot-generator').
        zpak: Zpak info dict.

    Returns:
        True if preprocessor succeeded.
    """
    dispatch = {
        'item-dbc-sync': _preprocess_item_dbc_sync,
        'dbc-export': _preprocess_dbc_export,
        'dbc-reorder': _preprocess_dbc_reorder,
        'atlasloot-generator': _preprocess_atlasloot,
    }

    func = dispatch.get(name)
    if not func:
        print(f"Unknown preprocessor: {name}")
        return False
    return func(zpak)


def _preprocess_dbc_export(zpak: Dict[str, Any]) -> bool:
    """Export DBC database to binary files.

    Runs DBCTool export, copies .dbc files into the zpak's
    parsed-assets/DBFilesClient/, and updates the server data directory.
    """
    if not _run_dbc_export():
        return False

    # Copy exported DBC files into zpak's parsed-assets
    zpak_path = Path(zpak['path'])
    dbc_dest = zpak_path / 'mpq' / 'parsed-assets' / 'DBFILESCLIENT'
    dbc_dest.mkdir(parents=True, exist_ok=True)

    count = 0
    for dbc_file in DBC_EXPORT_DIR.glob('*.dbc'):
        shutil.copyfile(dbc_file, dbc_dest / dbc_file.name)
        count += 1

    # Also copy to server data/dbc/ so worldserver picks them up
    _copy_dbc_to_server(DBC_EXPORT_DIR, SERVER_DBC_DIR)
    print(f"Exported {count} DBC files, copied to server")
    return True


def _preprocess_dbc_reorder(zpak: Dict[str, Any]) -> bool:
    """Reorder CharSections.dbc in parsed-assets by race/gender grouping."""
    zpak_path = Path(zpak['path'])
    charsections = zpak_path / 'mpq' / 'parsed-assets' / 'DBFILESCLIENT' / 'CharSections.dbc'

    if not charsections.exists():
        logger.warning("CharSections.dbc not found in parsed-assets, skipping reorder")
        return True

    if not _run_charsections_reorder(charsections):
        print(f"Warning: CharSections reorder failed, continuing anyway")
    else:
        print(f"Reordered CharSections.dbc")
    return True


def _preprocess_item_dbc_sync(zpak: Dict[str, Any]) -> bool:
    """Sync custom items from acore_world.item_template into dbc.item.

    Generates [AUTO,F-044]_item.sql with DELETE+INSERT statements for all
    custom items (entry >= 56899), then executes it against the DBC database.
    This ensures item.dbc has correct display_id values for the client's
    crafting menu icons.
    """
    CUSTOM_ITEM_THRESHOLD = 56899
    zpak_path = Path(zpak['path'])
    output_file = zpak_path / 'dbc' / '[AUTO,F-044]_item.sql'

    # Query acore_world for custom items
    db_host = os.getenv('DB_HOST', '192.168.0.55')
    db_port = os.getenv('DB_PORT', '3306')
    db_user = os.getenv('DB_USER', 'acore')
    db_pass = os.getenv('DB_PASS', 'acore')

    fd, cnf_path = tempfile.mkstemp(suffix='.cnf')
    with os.fdopen(fd, 'w') as f:
        f.write("[client]\n")
        f.write(f"user={db_user}\n")
        f.write(f"password={db_pass}\n")
        f.write(f"host={db_host}\n")
        f.write(f"port={db_port}\n")

    try:
        query = (
            "SELECT entry, class, subclass, SoundOverrideSubclass, Material, "
            "displayid, InventoryType, sheath "
            f"FROM item_template WHERE entry >= {CUSTOM_ITEM_THRESHOLD} "
            "ORDER BY entry"
        )
        result = subprocess.run(
            ['mysql', f'--defaults-extra-file={cnf_path}', 'acore_world',
             '-N', '-B', '-e', query],
            capture_output=True, text=True,
        )
    finally:
        os.unlink(cnf_path)

    if result.returncode != 0:
        print(f"Failed to query item_template: {result.stderr.strip()}")
        return False

    # Parse results
    rows = []
    for line in result.stdout.strip().split('\n'):
        if not line:
            continue
        parts = line.split('\t')
        if len(parts) == 8:
            rows.append(tuple(parts))

    if not rows:
        print("No custom items found in item_template")
        return True

    # Generate SQL file
    lines = [
        "-- [AUTO,F-044] item.dbc sync from acore_world.item_template",
        "-- Auto-generated by item-dbc-sync preprocessor. DO NOT EDIT MANUALLY.",
        f"-- {len(rows)} custom items (entry >= {CUSTOM_ITEM_THRESHOLD})",
        "",
        f"DELETE FROM `item` WHERE `id` >= {CUSTOM_ITEM_THRESHOLD};",
        "",
    ]
    for entry, cls, subcls, sound_sub, material, display_id, inv_type, sheath_val in rows:
        lines.append(
            f"INSERT INTO `item` (`id`, `class`, `subclass`, `sound_override_subclass`, "
            f"`material`, `display_id`, `inventory_type`, `sheath`) "
            f"VALUES ({entry}, {cls}, {subcls}, {sound_sub}, {material}, "
            f"{display_id}, {inv_type}, {sheath_val});"
        )

    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text('\n'.join(lines) + '\n')

    # Execute against DBC database
    sql_content = output_file.read_text()
    craft_root = zpak_path.parent.parent
    env_path = craft_root / 'cli' / '.env'
    dbc_config = DBCConfig.from_env(env_path)
    success, output = run_sql(sql_content, dbc_config)
    if not success:
        print(f"Failed to apply item sync: {output.strip()}")
        return False

    print(f"Synced {len(rows)} custom items to item.dbc")
    return True


def _preprocess_atlasloot(zpak: Dict[str, Any]) -> bool:
    """Run AtlasLoot generator against parsed-assets."""
    return _run_atlasloot_generator(Path(zpak['path']))


# =============================================================================
# Patch Build (unified for all patches)
# =============================================================================

def build_patch(letter: str, zpaks: List[Dict[str, Any]],
                nginx_path: Path, register: Dict[str, Any],
                parse: bool = False,
                parse_only: bool = False,
                dry_run: bool = False) -> bool:
    """Build a client patch MPQ from zpak parsed-assets.

    Unified build function for all patches. The preprocessing pipeline
    (resource parser + named preprocessors) populates parsed-assets;
    this function packs them into an MPQ.

    Args:
        letter: Patch letter (e.g. "Z", "O", "H").
        zpaks: List of zpak info dicts for this patch.
        nginx_path: Path to NGINX root directory.
        register: Patch register dict (modified in place).
        parse: Run preprocessors before packing.
        parse_only: Run preprocessors only, skip packing.
        dry_run: Preview only, don't build.

    Returns:
        True if build succeeded.
    """
    patch_name = f'PATCH-{letter}.MPQ'
    output_path = get_patch_output_path(nginx_path, patch_name, register)

    # Step 1: Run preprocessors
    if parse or parse_only:
        if not _run_preprocessors(zpaks, dry_run=dry_run):
            return False

    if parse_only:
        if not dry_run:
            print(f"Parse complete for PATCH-{letter}")
        return True

    # Step 2: Collect zpaks with parsed-assets
    buildable = []
    for zpak in zpaks:
        parsed = get_zpak_parsed_assets(zpak['path'])
        if parsed:
            buildable.append((zpak, parsed))
        else:
            source_dir = Path(zpak['path']) / 'mpq' / 'source-assets'
            if source_dir.exists() and not parse:
                print(f"{zpak['name']}: parsed-assets empty "
                      f"(use --parse to run preprocessors first)")
            else:
                print(f"{zpak['name']}: no parsed-assets found, skipping")

    if dry_run:
        _print_step_header('PACK', patch_name)
        print(f"[DRY RUN] Would build {patch_name}")
        for zpak, parsed in buildable:
            file_count = sum(1 for _ in parsed.rglob('*') if _.is_file()
                            and _.name not in ('.gitkeep', '.gitignore'))
            print(f"  {zpak['name']}: {file_count} files")
        if not buildable:
            print(f"  No zpaks have packable assets")
        print(f"Output: {output_path}")
        return True

    if not buildable:
        print(f"{patch_name}: no zpaks have packable assets, skipping")
        return False

    start = time.time()

    # Backup existing MPQ before overwriting
    _backup_existing_mpq(output_path, nginx_path)

    # Step 3: Pack parsed-assets into MPQ
    zpak_names_list = [z['name'] for z, _ in buildable]
    _print_step_header('PACK', patch_name)

    if len(buildable) == 1:
        zpak, parsed = buildable[0]
        print(f"Packing {zpak['name']} into {patch_name}...")
        if not _pack_mpq(parsed, output_path):
            return False
    else:
        zpak, parsed = buildable[0]
        print(f"Packing {zpak['name']} into {patch_name}...")
        if not _pack_mpq(parsed, output_path):
            return False

        for zpak, parsed in buildable[1:]:
            print(f"Adding {zpak['name']}...")
            if not _add_to_mpq(parsed, output_path):
                return False

    # Step 4: Update register
    zpak_names = ', '.join(zpak_names_list)
    bump_build_number(register)

    # Bump DBC version if any zpak has dbc-export preprocessor
    if any('dbc-export' in get_zpak_preprocessors(z) for z in zpaks):
        bump_dbc_version(register)

    update_patch_entry(register, patch_name, output_path, zpak_name=zpak_names)

    elapsed = time.time() - start
    size_mb = output_path.stat().st_size / (1024 * 1024) if output_path.exists() else 0
    print(f"\n{patch_name}: {size_mb:.1f} MB ({elapsed:.1f}s)")

    return True


# =============================================================================
# Tool Wrappers
# =============================================================================




def _run_atlasloot_generator(zpak_path: Path) -> bool:
    """Run the AtlasLoot generator against parsed-assets.

    Invokes generate_atlasloot.py --all with --addon-dir pointed at
    the zpak's parsed-assets/Interface/AddOns directory.

    Args:
        zpak_path: Path to the atlasloot zpak directory.

    Returns:
        True if generation succeeded.
    """
    # Find the generator script relative to the craft root
    craft_root = zpak_path.parent.parent  # zpaks/<name> -> craft root
    generator_script = (craft_root / 'Scripts' / 'Patch Builder' /
                        'AtlasLoot Generator' / 'generate_atlasloot.py')

    if not generator_script.exists():
        print(f"    AtlasLoot generator not found at {generator_script}")
        return False

    # Generator defaults to source-assets (correct casing for Lua references).
    # Resource parser uppercases parsed-assets dirs which breaks Lua paths,
    # so we let the generator use its own default and copy results afterward.
    source_addon_dir = zpak_path / 'mpq' / 'source-assets' / 'Interface' / 'AddOns'
    if not source_addon_dir.exists():
        print(f"    AddOns directory not found in source-assets")
        return False

    print(f"    Running AtlasLoot generator...")
    try:
        result = subprocess.run(
            [sys.executable, str(generator_script), '--all'],
            cwd=str(generator_script.parent),
            capture_output=True,
            text=True,
        )

        if result.returncode == 0:
            print(f"    AtlasLoot tables updated successfully")
            if result.stdout:
                # Show summary lines (skip verbose output)
                for line in result.stdout.strip().split('\n'):
                    if line.startswith('[') or line.startswith('Summary'):
                        logger.info(f"  atlasloot: {line}")
            # Re-copy source-assets to parsed-assets so updated Lua files
            # end up in the MPQ (resource parser already ran, so this just
            # overwrites with the generator's updated versions)
            parsed_addon_dir = zpak_path / 'mpq' / 'parsed-assets' / 'INTERFACE' / 'ADDONS'
            if not parsed_addon_dir.exists():
                parsed_addon_dir = zpak_path / 'mpq' / 'parsed-assets' / 'Interface' / 'AddOns'
            if parsed_addon_dir.exists():
                shutil.rmtree(parsed_addon_dir)
            shutil.copytree(source_addon_dir, parsed_addon_dir)
            print(f"    Synced updated AddOns to parsed-assets")
            return True
        else:
            print(f"    AtlasLoot generator failed (code {result.returncode})")
            if result.stderr:
                for line in result.stderr.strip().split('\n')[:5]:
                    print(f"      {line}")
            if result.stdout:
                for line in result.stdout.strip().split('\n')[-5:]:
                    print(f"      {line}")
            return False
    except Exception as e:
        print(f"    AtlasLoot generator error: {e}")
        logger.error(f"AtlasLoot generator failed: {e}")
        return False


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

    try:
        if mode == 'model-scan':
            rp.run_model_scan(source_dir, output_dir)
        else:
            source_path = build_config.get('source_path')
            if source_path:
                source_path = zpak_path / source_path
            else:
                source_path = source_dir
            rp.run(source_path, output_dir)
        return True
    except Exception as e:
        print(f"Resource parser failed: {e}")
        logger.error(f"Resource parser failed for {zpak['name']}: {e}")
        return False


def _get_dbc_tables() -> set:
    """Query the DBC database for existing table names.

    Reads connection info from DBCTool's config.json and uses
    the mysql CLI to run SHOW TABLES.

    Returns:
        Set of lowercase table names, or empty set on failure.
    """
    config_path = DBCTOOL_PATH.parent / 'config.json'
    if not config_path.exists():
        logger.warning(f"DBCTool config.json not found at {config_path}")
        return set()

    with open(config_path) as f:
        config = json.load(f)

    db = config.get('dbc', {})
    result = subprocess.run(
        [
            'mysql', '-h', db.get('host', '127.0.0.1'),
            '-P', str(db.get('port', '3306')),
            '-u', db.get('user', 'root'),
            f"-p{db.get('password', '')}",
            db.get('name', 'dbc'),
            '-N', '-e', 'SHOW TABLES',
        ],
        capture_output=True,
        text=True,
    )
    if result.returncode != 0:
        logger.warning(f"Failed to query DBC tables: {result.stderr.strip()}")
        return set()

    return {line.strip().lower() for line in result.stdout.splitlines() if line.strip()}


def _run_dbc_export() -> bool:
    """Run DBCTool export to generate binary DBC files.

    Queries the DBC database for existing tables and temporarily hides
    meta files for tables that don't exist, so DBCTool only exports
    tables that were actually imported.

    Returns:
        True if export succeeded.
    """
    if not DBCTOOL_PATH.exists():
        print(f"    DBCTool not found at {DBCTOOL_PATH}")
        return False

    # Read DBCTool config to find meta directory
    config_path = DBCTOOL_PATH.parent / 'config.json'
    with open(config_path) as f:
        config = json.load(f)
    meta_dir = Path(config.get('paths', {}).get('meta', ''))
    if not meta_dir.exists():
        meta_dir = DBCTOOL_PATH.parent / 'meta'

    # Query which tables actually exist in the database
    existing_tables = _get_dbc_tables()
    if not existing_tables:
        logger.warning("Could not query DBC tables, running export without filtering")
    else:
        # Filter out internal tracking tables
        existing_tables.discard('dbc_checksum')

    # Temporarily hide meta files for tables that don't exist
    hidden = []
    if existing_tables:
        for meta_file in meta_dir.glob('*.meta.json'):
            try:
                with open(meta_file) as f:
                    meta = json.load(f)
                table_name = meta.get('tableName', '').lower()
                if table_name and table_name not in existing_tables:
                    hidden_path = meta_file.with_suffix('.meta.json.skip')
                    meta_file.rename(hidden_path)
                    hidden.append((hidden_path, meta_file))
            except (json.JSONDecodeError, OSError) as e:
                logger.warning(f"Could not read meta file {meta_file}: {e}")

        if hidden:
            logger.info(f"Hidden {len(hidden)} meta files for non-existent tables")

    try:
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

        return True
    finally:
        # Always restore hidden meta files
        for hidden_path, original_path in hidden:
            try:
                hidden_path.rename(original_path)
            except OSError as e:
                logger.error(f"Failed to restore meta file {original_path}: {e}")


def _run_charsections_reorder(dbc_path: Path) -> bool:
    """Reorder CharSections.dbc by race/gender grouping.

    Imports the existing dbc_reorder module from Scripts/Patch Builder/.

    Args:
        dbc_path: Path to CharSections.dbc file.

    Returns:
        True if reorder succeeded.
    """
    try:
        from lib.dbc_reorder import reorder_charsections
        return reorder_charsections(str(dbc_path), quiet=True)
    except ImportError as e:
        logger.error(f"Could not import dbc_reorder: {e}")
        print(f"    Could not import dbc_reorder from lib.dbc_reorder")
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
        shutil.copyfile(dbc_file, server_dir / dbc_file.name)
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
        # mpqcli -p takes the parent directory, not the full path
        internal_dir = str(internal_path.parent)

        cmd = [
            str(MPQCLI_PATH), 'add',
            str(file_path),
            str(mpq_path),
        ]
        if internal_dir != '.':
            cmd += ['-p', internal_dir]

        result = subprocess.run(cmd, capture_output=True, text=True)
        if result.returncode != 0:
            logger.error(f"mpqcli add failed for {internal_path}: {result.stderr}")
            return False

    return True
