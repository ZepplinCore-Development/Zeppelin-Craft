#!/usr/bin/env python3
"""
Fork Sync Tool for Zeppelin Disposable Forks Architecture (F-037)

Manages syncing forked modules to upstream and applying Zeppelin patches.

Usage:
    python3 fork_sync.py --status                       # Show status of all modules vs upstream
    python3 fork_sync.py <module> --build-patch         # Build patch files from current repo state
    python3 fork_sync.py <module> --apply-patch         # Reset to upstream and apply existing patches
    python3 fork_sync.py <module> --build-apply-patch   # Build patches, reset, apply (full sync)

Commands:
    --status
        Show status of all modules compared to upstream.
        Displays: commits ahead/behind, patch files, sync state.

    --build-patch
        Build patch files from the current state of the repo.
        Use when tuning or cleaning up repos - saves your work as patches.
        Does NOT reset the repo or apply anything.

    --apply-patch
        Reset repo to upstream master and apply existing patch files.
        Use to revert back to your last set of patches if you don't like
        recent changes in the repo.

    --build-apply-patch  (most common)
        Full cycle: build patches from current state, reset to upstream,
        then apply those patches. Use to bring repos up to date with
        upstream while preserving all custom changes and fixes.
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


def get_patch_mode(module_name, config):
    """Get patch mode for a module: 'single' or 'granular'"""
    module_config = config["forks"][module_name]
    return module_config.get("patch_mode", "single")


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


def regenerate_patches(module_name, config):
    """Build patch files from current repo state (--build-patch)

    Use when tuning or cleaning up repos. Saves current commits as patches
    without modifying the repo itself.
    """
    module_path = get_module_path(module_name, config)
    patch_dir = get_patch_dir(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)
    patch_mode = get_patch_mode(module_name, config)

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
        if patch_mode == "single":
            # Single combined patch file
            patch_file = patch_dir / "zeppelin.patch"
            result = subprocess.run(
                ["git", "format-patch", f"upstream/{upstream_branch}..HEAD", "--stdout"],
                cwd=module_path,
                capture_output=True,
                text=True,
                check=True
            )
            with open(patch_file, 'w') as f:
                f.write(result.stdout)

            size = patch_file.stat().st_size / 1024
            return True, f"Regenerated zeppelin.patch ({size:.1f}K, {ahead} commits)"

        else:
            # Granular: individual patches with numeric prefixes
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


def refresh_module(module_name, config):
    """Build patches, reset to upstream, apply patches (--build-apply-patch)

    Full sync cycle: extracts current commits as patches, resets to latest
    upstream, then replays patches. Use to bring repos up to date with
    upstream while preserving all custom changes.
    """
    module_path = get_module_path(module_name, config)
    patch_dir = get_patch_dir(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)
    patch_mode = get_patch_mode(module_name, config)

    if not module_path or not module_path.exists():
        return False, f"Module path not found: {module_path}"

    # Check for uncommitted changes
    status = run_git(["status", "--porcelain"], module_path)
    if status:
        return False, "Uncommitted changes - commit or stash first"

    # Ensure upstream remote exists and fetch
    if not check_upstream_remote(module_path, upstream_url):
        return False, "Failed to add upstream remote"

    if not fetch_upstream(module_path):
        return False, "Failed to fetch upstream"

    # Step 1: Regenerate patches from current state
    ahead, _ = get_commit_counts(module_path, upstream_branch)

    if ahead == 0:
        return True, "Already in sync with upstream (no patches needed)"

    # Create patch directory and clear old patches
    patch_dir.mkdir(parents=True, exist_ok=True)
    for old_patch in patch_dir.glob("*.patch"):
        old_patch.unlink()

    try:
        if patch_mode == "single":
            # Single combined patch
            patch_file = patch_dir / "zeppelin.patch"
            result = subprocess.run(
                ["git", "format-patch", f"upstream/{upstream_branch}..HEAD", "--stdout"],
                cwd=module_path,
                capture_output=True,
                text=True,
                check=True
            )
            with open(patch_file, 'w') as f:
                f.write(result.stdout)
        else:
            # Granular patches per commit
            subprocess.run(
                ["git", "format-patch", f"upstream/{upstream_branch}..HEAD", "-o", str(patch_dir), "-N"],
                cwd=module_path,
                capture_output=True,
                text=True,
                check=True
            )
    except Exception as e:
        return False, f"Failed to regenerate patches: {str(e)}"

    patch_files = get_patch_files(module_name)
    if not patch_files:
        return False, "No patches generated"

    # Step 2: Reset to upstream on a proper branch (not detached HEAD)
    try:
        # Checkout master/main branch first (create if doesn't exist)
        branches = run_git(["branch", "--list", "master", "main"], module_path) or ""
        if "master" in branches:
            run_git(["checkout", "master"], module_path, check=False)
        elif "main" in branches:
            run_git(["checkout", "main"], module_path, check=False)
        else:
            # Create master branch at upstream
            run_git(["checkout", "-B", "master", f"upstream/{upstream_branch}"], module_path, check=False)

        # Now reset to upstream
        run_git(["reset", "--hard", f"upstream/{upstream_branch}"], module_path, capture=False)
    except Exception as e:
        return False, f"Failed to reset: {str(e)}"

    # Step 3: Replay patches as commits
    applied = 0
    for patch_file in patch_files:
        try:
            # Use git am to apply patch as commit (preserves author/message)
            result = subprocess.run(
                ["git", "am", "--3way", str(patch_file)],
                cwd=module_path,
                capture_output=True,
                text=True
            )

            if result.returncode != 0:
                # Abort and try git apply fallback
                run_git(["am", "--abort"], module_path, check=False)

                result = subprocess.run(
                    ["git", "apply", "--3way", str(patch_file)],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )

                if result.returncode != 0:
                    error = result.stderr.strip().split('\n')[0] if result.stderr else "Unknown"
                    return False, f"Failed at {patch_file.name}: {error} ({applied}/{len(patch_files)} applied)"

                # Commit manually
                run_git(["add", "-A"], module_path, check=False)
                commit_msg = patch_file.stem.replace("-", " ").replace("_", " ")
                subprocess.run(
                    ["git", "commit", "-m", f"Apply {commit_msg}"],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )

            applied += 1

        except Exception as e:
            return False, f"Error at {patch_file.name}: {str(e)} ({applied}/{len(patch_files)} applied)"

    total_size = sum(p.stat().st_size for p in patch_files) / 1024
    return True, f"Refreshed: {applied} patches ({total_size:.1f}K) replayed on latest upstream"


def sync_only(module_name, config):
    """Reset to upstream and apply existing patches (--apply-patch)

    Use to revert repo back to your last set of patches. Does NOT regenerate
    patches first - applies whatever patches exist in the Patches directory.
    """
    module_path = get_module_path(module_name, config)
    patch_files = get_patch_files(module_name)
    upstream_url, upstream_branch = get_upstream_info(module_name, config)

    if not module_path or not module_path.exists():
        return False, f"Module path not found: {module_path}"

    if not patch_files:
        return True, "No patches to apply"

    # Ensure upstream remote exists and fetch
    if not check_upstream_remote(module_path, upstream_url):
        return False, "Failed to add upstream remote"

    if not fetch_upstream(module_path):
        return False, "Failed to fetch upstream"

    # Reset to upstream on a proper branch
    try:
        branches = run_git(["branch", "--list", "master", "main"], module_path) or ""
        if "master" in branches:
            run_git(["checkout", "master"], module_path, check=False)
        elif "main" in branches:
            run_git(["checkout", "main"], module_path, check=False)
        else:
            run_git(["checkout", "-B", "master", f"upstream/{upstream_branch}"], module_path, check=False)

        run_git(["reset", "--hard", f"upstream/{upstream_branch}"], module_path, capture=False)
    except Exception as e:
        return False, f"Failed to reset: {str(e)}"

    # Apply existing patches
    applied = 0
    for patch_file in patch_files:
        try:
            result = subprocess.run(
                ["git", "am", "--3way", str(patch_file)],
                cwd=module_path,
                capture_output=True,
                text=True
            )

            if result.returncode != 0:
                run_git(["am", "--abort"], module_path, check=False)

                result = subprocess.run(
                    ["git", "apply", "--3way", str(patch_file)],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )

                if result.returncode != 0:
                    error = result.stderr.strip().split('\n')[0] if result.stderr else "Unknown"
                    return False, f"Failed at {patch_file.name}: {error} ({applied}/{len(patch_files)} applied)"

                run_git(["add", "-A"], module_path, check=False)
                commit_msg = patch_file.stem.replace("-", " ").replace("_", " ")
                subprocess.run(
                    ["git", "commit", "-m", f"Apply {commit_msg}"],
                    cwd=module_path,
                    capture_output=True,
                    text=True
                )

            applied += 1

        except Exception as e:
            return False, f"Error at {patch_file.name}: {str(e)} ({applied}/{len(patch_files)} applied)"

    return True, f"Applied {applied} patches to upstream"


def show_status(config):
    """Show status of all modules"""
    print(f"\n{Colors.BOLD}=== Module Status ==={Colors.RESET}\n")

    # Column widths
    name_width = max(len(name) for name in config["forks"]) + 2

    for module_name in sorted(config["forks"].keys()):
        module_path = get_module_path(module_name, config)
        patch_files = get_patch_files(module_name)
        upstream_url, upstream_branch = get_upstream_info(module_name, config)
        patch_mode = get_patch_mode(module_name, config)

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
            if patch_mode == "single":
                parts.append(f"zeppelin.patch ({total_size:.1f}K)")
            else:
                parts.append(f"{len(patch_files)} patches ({total_size:.1f}K)")
        else:
            parts.append("no patches")

        # Show mode indicator for granular
        if patch_mode == "granular":
            parts.append(f"{Colors.BLUE}[granular]{Colors.RESET}")

        status = " | ".join(parts)
        print(f"{module_name:<{name_width}} {status}")

    print()


def main():
    parser = argparse.ArgumentParser(
        description="Fork Sync Tool for Zeppelin Disposable Forks Architecture",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  %(prog)s --status                              Show status of all modules vs upstream
  %(prog)s mod-accountbound --build-patch        Build patches from current repo state
  %(prog)s mod-accountbound --apply-patch        Reset to upstream and apply existing patches
  %(prog)s mod-accountbound --build-apply-patch  Full cycle: build, reset, apply
  %(prog)s --all --build-apply-patch             Sync all modules with upstream
        """
    )

    parser.add_argument("module", nargs="?", help="Module name (or --all)")
    parser.add_argument("--all", action="store_true", help="Process all modules")
    parser.add_argument("--status", action="store_true", help="Show status of all modules vs upstream")
    parser.add_argument("--build-patch", action="store_true", help="Build patch files from current repo state")
    parser.add_argument("--apply-patch", action="store_true", help="Reset to upstream and apply existing patches")
    parser.add_argument("--build-apply-patch", action="store_true", help="Full cycle: build patches, reset to upstream, apply patches")

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

    if not any([args.build_patch, args.apply_patch, args.build_apply_patch]):
        parser.error("Specify an action: --build-patch, --apply-patch, or --build-apply-patch")

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
        if args.build_patch:
            success, message = regenerate_patches(module, config)
        elif args.apply_patch:
            success, message = sync_only(module, config)
        elif args.build_apply_patch:
            success, message = refresh_module(module, config)

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
