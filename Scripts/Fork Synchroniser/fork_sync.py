#!/usr/bin/env python3
"""
Fork Sync Tool for Zeppelin Disposable Forks Architecture (F-037)

Manages syncing forked modules to upstream and applying Zeppelin patches.

Usage:
    python3 fork_sync.py <module> --check       # Check if patches apply cleanly
    python3 fork_sync.py <module> --sync        # Reset to upstream and apply patches
    python3 fork_sync.py <module> --regenerate  # Regenerate patches from current state
    python3 fork_sync.py --all --check          # Check all modules
    python3 fork_sync.py --all --sync           # Sync all modules
    python3 fork_sync.py --status               # Show status of all modules
"""

import argparse
import json
import os
import subprocess
import sys
from pathlib import Path

# Paths
SCRIPT_DIR = Path(__file__).parent
ZEPPELIN_CRAFT = SCRIPT_DIR.parent.parent  # Scripts/Fork Synchroniser -> Zeppelin-Craft
ZEPPELIN_CORE = ZEPPELIN_CRAFT.parent / "Zeppelin-Core"
CONFIG_PATH = ZEPPELIN_CRAFT / "Patches" / "fork_config.json"
PATCHES_DIR = ZEPPELIN_CRAFT / "Patches"


class Colors:
    """ANSI color codes for terminal output"""
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    RESET = '\033[0m'
    BOLD = '\033[1m'


def load_config():
    """Load fork configuration from JSON file"""
    if not CONFIG_PATH.exists():
        print(f"{Colors.RED}Error: Config not found at {CONFIG_PATH}{Colors.RESET}")
        sys.exit(1)

    with open(CONFIG_PATH) as f:
        return json.load(f)


def run_git(args, cwd, capture=True, check=True):
    """Run a git command and return output"""
    try:
        # Suppress detached HEAD advice
        env = os.environ.copy()
        env["GIT_ADVICE"] = "0"

        result = subprocess.run(
            ["git", "-c", "advice.detachedHead=false"] + args,
            cwd=cwd,
            capture_output=capture,
            text=True,
            check=check,
            env=env
        )
        return result.stdout.strip() if capture else None
    except subprocess.CalledProcessError as e:
        if capture:
            return None
        raise


def get_module_path(module_name, config):
    """Get the full path to a module"""
    if module_name not in config["forks"]:
        return None

    module_config = config["forks"][module_name]
    return ZEPPELIN_CORE / module_config["path"]


def get_patch_dir(module_name):
    """Get the path to a module's patch directory"""
    return PATCHES_DIR / module_name


def get_patch_files(module_name):
    """Get list of patch files for a module, sorted alphabetically"""
    patch_dir = get_patch_dir(module_name)
    if not patch_dir.exists():
        return []

    # Get all .patch files, sorted alphabetically (numeric prefixes ensure order)
    patches = sorted(patch_dir.glob("*.patch"))
    return patches


def get_upstream_info(module_name, config):
    """Get upstream remote and branch for a module"""
    module_config = config["forks"][module_name]
    return module_config.get("upstream"), module_config.get("upstream_branch", "master")


def check_upstream_remote(module_path, upstream_url):
    """Check if upstream remote exists, add if not"""
    remotes = run_git(["remote", "-v"], module_path)
    if remotes and "upstream" in remotes:
        return True

    # Add upstream remote
    try:
        run_git(["remote", "add", "upstream", upstream_url], module_path, capture=False)
        return True
    except:
        return False


def fetch_upstream(module_path):
    """Fetch from upstream remote"""
    try:
        run_git(["fetch", "upstream"], module_path, capture=False, check=True)
        return True
    except:
        return False


def get_commit_counts(module_path, upstream_branch):
    """Get commits ahead/behind upstream"""
    try:
        ahead = run_git(["rev-list", "--count", f"upstream/{upstream_branch}..HEAD"], module_path)
        behind = run_git(["rev-list", "--count", f"HEAD..upstream/{upstream_branch}"], module_path)
        return int(ahead or 0), int(behind or 0)
    except:
        return None, None


def check_patch(module_name, config):
    """Check if patches would apply cleanly to upstream"""
    module_path = get_module_path(module_name, config)
    patch_files = get_patch_files(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)

    if not module_path or not module_path.exists():
        return False, f"Module path not found: {module_path}"

    if not patch_files:
        return True, "No patches to apply"

    # Ensure upstream remote exists
    if not check_upstream_remote(module_path, upstream_url):
        return False, "Failed to add upstream remote"

    # Fetch upstream
    if not fetch_upstream(module_path):
        return False, "Failed to fetch upstream"

    # Get commit counts for status info
    _, behind = get_commit_counts(module_path, upstream_branch)

    # To check if patches apply to upstream, we need to test against upstream state
    try:
        # Save current HEAD
        current_head = run_git(["rev-parse", "HEAD"], module_path)

        # Check for uncommitted changes
        status = run_git(["status", "--porcelain"], module_path)
        has_changes = bool(status)

        if has_changes:
            run_git(["stash", "push", "-m", "fork_sync check"], module_path)

        # Temporarily reset to upstream
        run_git(["checkout", f"upstream/{upstream_branch}"], module_path, capture=True, check=True)

        # Try applying each patch in order
        failed_patch = None
        error_msg = ""

        for patch_file in patch_files:
            result = subprocess.run(
                ["git", "apply", "--check", str(patch_file)],
                cwd=module_path,
                capture_output=True,
                text=True
            )

            if result.returncode != 0:
                # Try with 3-way merge
                result3 = subprocess.run(
                    ["git", "apply", "--check", "--3way", str(patch_file)],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )
                if result3.returncode != 0:
                    failed_patch = patch_file.name
                    error_lines = result.stderr.strip().split('\n')
                    error_msg = error_lines[0] if error_lines else "Unknown error"
                    break

            # Actually apply the patch (needed for subsequent patches)
            subprocess.run(
                ["git", "apply", str(patch_file)],
                cwd=module_path,
                capture_output=True,
                text=True
            )

        # Restore original state
        run_git(["checkout", current_head], module_path, capture=True, check=True)

        if has_changes:
            run_git(["stash", "pop"], module_path, check=False)

        if failed_patch:
            return False, f"CONFLICT in {failed_patch}: {error_msg}"
        else:
            status = f"Clean ({len(patch_files)} patches, upstream +{behind})" if behind else f"Clean ({len(patch_files)} patches)"
            return True, status

    except Exception as e:
        # Try to restore state on error
        try:
            run_git(["checkout", current_head], module_path, check=False)
        except:
            pass
        return False, f"Error: {str(e)}"


def sync_module(module_name, config, dry_run=False):
    """Reset module to upstream and apply patches"""
    module_path = get_module_path(module_name, config)
    patch_files = get_patch_files(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)

    if not module_path or not module_path.exists():
        return False, f"Module path not found: {module_path}"

    # Ensure upstream remote exists and fetch
    if not check_upstream_remote(module_path, upstream_url):
        return False, "Failed to add upstream remote"

    if not fetch_upstream(module_path):
        return False, "Failed to fetch upstream"

    if dry_run:
        return check_patch(module_name, config)

    # Check for uncommitted changes
    status = run_git(["status", "--porcelain"], module_path)
    if status:
        return False, "Uncommitted changes - commit or stash first"

    # Reset to upstream
    try:
        run_git(["reset", "--hard", f"upstream/{upstream_branch}"], module_path, capture=False)
    except Exception as e:
        return False, f"Failed to reset: {str(e)}"

    # Apply patches if any exist
    if not patch_files:
        return True, "Synced (no patches to apply)"

    applied = []
    failed_patch = None
    error_msg = ""

    for patch_file in patch_files:
        try:
            # Try git am first (preserves commit metadata)
            result = subprocess.run(
                ["git", "am", "--3way", str(patch_file)],
                cwd=module_path,
                capture_output=True,
                text=True
            )

            if result.returncode != 0:
                # Abort failed am
                run_git(["am", "--abort"], module_path, check=False)

                # Try git apply as fallback
                result = subprocess.run(
                    ["git", "apply", "--3way", str(patch_file)],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )

                if result.returncode != 0:
                    failed_patch = patch_file.name
                    error_msg = result.stderr.strip().split('\n')[0] if result.stderr else "Unknown error"
                    break

                # Commit the applied changes
                run_git(["add", "-A"], module_path)
                commit_msg = f"Apply {patch_file.name}"
                run_git(["commit", "-m", commit_msg], module_path)

            applied.append(patch_file.name)

        except Exception as e:
            failed_patch = patch_file.name
            error_msg = str(e)
            break

    if failed_patch:
        return False, f"Failed at {failed_patch}: {error_msg} ({len(applied)}/{len(patch_files)} applied)"
    else:
        return True, f"Synced and applied {len(applied)} patches"


def regenerate_patches(module_name, config):
    """Regenerate patches from current module state"""
    module_path = get_module_path(module_name, config)
    patch_dir = get_patch_dir(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)

    if not module_path or not module_path.exists():
        return False, f"Module path not found: {module_path}"

    # Ensure upstream remote exists and fetch
    if not check_upstream_remote(module_path, upstream_url):
        return False, "Failed to add upstream remote"

    if not fetch_upstream(module_path):
        return False, "Failed to fetch upstream"

    # Check if there are any differences
    ahead, _ = get_commit_counts(module_path, upstream_branch)

    if ahead == 0:
        # No changes, remove patches if exist
        existing = get_patch_files(module_name)
        for p in existing:
            p.unlink()
        if existing:
            return True, "No changes - patches removed"
        return True, "No changes - no patches needed"

    # Create patch directory
    patch_dir.mkdir(parents=True, exist_ok=True)

    # Remove old patches
    for old_patch in patch_dir.glob("*.patch"):
        old_patch.unlink()

    try:
        # Generate individual patches with numeric prefixes
        result = subprocess.run(
            ["git", "format-patch", f"upstream/{upstream_branch}..HEAD", "-o", str(patch_dir), "-N"],
            cwd=module_path,
            capture_output=True,
            text=True,
            check=True
        )

        # Count generated patches
        new_patches = list(patch_dir.glob("*.patch"))
        total_size = sum(p.stat().st_size for p in new_patches)

        return True, f"Regenerated {len(new_patches)} patches ({total_size / 1024:.1f}K total)"
    except Exception as e:
        return False, f"Failed: {str(e)}"


def show_status(config):
    """Show status of all modules"""
    print(f"\n{Colors.BOLD}=== Module Status ==={Colors.RESET}\n")

    # Column widths
    name_width = max(len(name) for name in config["forks"]) + 2

    for module_name in sorted(config["forks"].keys()):
        module_path = get_module_path(module_name, config)
        patch_files = get_patch_files(module_name)
        upstream_url, upstream_branch = get_upstream_info(module_name, config)

        # Check if module exists
        if not module_path.exists():
            print(f"{module_name:<{name_width}} {Colors.RED}NOT FOUND{Colors.RESET}")
            continue

        # Check upstream
        check_upstream_remote(module_path, upstream_url)
        fetch_upstream(module_path)

        ahead, behind = get_commit_counts(module_path, upstream_branch)

        # Build status string
        parts = []

        if ahead is not None:
            if ahead > 0:
                parts.append(f"{Colors.CYAN}+{ahead} ours{Colors.RESET}")
            if behind > 0:
                parts.append(f"{Colors.YELLOW}-{behind} behind{Colors.RESET}")
            if ahead == 0 and behind == 0:
                parts.append(f"{Colors.GREEN}in sync{Colors.RESET}")

        if patch_files:
            total_size = sum(p.stat().st_size for p in patch_files) / 1024
            parts.append(f"{len(patch_files)} patches ({total_size:.1f}K)")
        else:
            parts.append("no patches")

        status = " | ".join(parts)
        print(f"{module_name:<{name_width}} {status}")

    print()


def main():
    parser = argparse.ArgumentParser(
        description="Fork Sync Tool for Zeppelin Disposable Forks Architecture",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s mod-accountbound --check       Check if patches apply
  %(prog)s mod-accountbound --sync        Sync to upstream + apply patches
  %(prog)s mod-accountbound --regenerate  Rebuild patches from current state
  %(prog)s --all --check                  Check all modules
  %(prog)s --status                       Show status of all modules
        """
    )

    parser.add_argument("module", nargs="?", help="Module name (or --all)")
    parser.add_argument("--all", action="store_true", help="Process all modules")
    parser.add_argument("--check", action="store_true", help="Check if patches apply cleanly")
    parser.add_argument("--sync", action="store_true", help="Reset to upstream and apply patches")
    parser.add_argument("--regenerate", action="store_true", help="Regenerate patches from current state")
    parser.add_argument("--status", action="store_true", help="Show status of all modules")

    args = parser.parse_args()

    # Load config
    config = load_config()

    # Status mode
    if args.status:
        show_status(config)
        return

    # Validate arguments
    if not args.module and not args.all:
        parser.error("Specify a module name or --all")

    if not any([args.check, args.sync, args.regenerate]):
        parser.error("Specify an action: --check, --sync, or --regenerate")

    # Get modules to process
    if args.all:
        modules = list(config["forks"].keys())
    else:
        if args.module not in config["forks"]:
            print(f"{Colors.RED}Error: Unknown module '{args.module}'{Colors.RESET}")
            print(f"Available modules: {', '.join(config['forks'].keys())}")
            sys.exit(1)
        modules = [args.module]

    # Process modules
    print(f"\n{Colors.BOLD}=== Processing {len(modules)} module(s) ==={Colors.RESET}\n")

    results = {"success": 0, "failed": 0}

    for module in sorted(modules):
        if args.check:
            success, message = check_patch(module, config)
        elif args.sync:
            success, message = sync_module(module, config)
        elif args.regenerate:
            success, message = regenerate_patches(module, config)

        icon = f"{Colors.GREEN}✓{Colors.RESET}" if success else f"{Colors.RED}✗{Colors.RESET}"
        print(f"{icon} {module}: {message}")

        if success:
            results["success"] += 1
        else:
            results["failed"] += 1

    # Summary
    print(f"\n{Colors.BOLD}Summary:{Colors.RESET} {results['success']} succeeded, {results['failed']} failed\n")

    sys.exit(0 if results["failed"] == 0 else 1)


if __name__ == "__main__":
    main()
