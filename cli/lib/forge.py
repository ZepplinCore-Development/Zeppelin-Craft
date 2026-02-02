"""
Git utilities for forge commands.

Provides low-level git operations for managing AzerothCore module forks
and patch synchronization.
"""

import os
import re
import subprocess
from pathlib import Path
from typing import List, Optional, Tuple


class Colors:
    """ANSI color codes for terminal output."""
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    RESET = '\033[0m'
    BOLD = '\033[1m'


def run_git(
    args: List[str],
    cwd: Path,
    capture: bool = True,
    check: bool = True
) -> Optional[str]:
    """Run a git command and return output.

    Args:
        args: Git arguments (without 'git' prefix)
        cwd: Working directory for the command
        capture: Whether to capture stdout
        check: Whether to raise on non-zero exit

    Returns:
        Stripped stdout if capture=True, None otherwise
    """
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
    except subprocess.CalledProcessError:
        if capture:
            return None
        raise


def ensure_upstream(module_path: Path, upstream_url: str) -> bool:
    """Ensure upstream remote exists and is fetched.

    Args:
        module_path: Path to the git repository
        upstream_url: URL of the upstream repository

    Returns:
        True if upstream is ready, False on failure
    """
    # Check if upstream remote exists
    remotes = run_git(["remote", "-v"], module_path)
    if remotes and "upstream" in remotes:
        pass  # Already exists
    else:
        # Add upstream remote
        try:
            run_git(["remote", "add", "upstream", upstream_url], module_path, capture=False)
        except Exception:
            return False

    # Fetch from upstream
    try:
        run_git(["fetch", "upstream"], module_path, capture=False, check=True)
        return True
    except Exception:
        return False


def get_divergence(module_path: Path, upstream_branch: str) -> Tuple[Optional[int], Optional[int]]:
    """Get commits ahead/behind upstream.

    Args:
        module_path: Path to the git repository
        upstream_branch: Name of the upstream branch

    Returns:
        Tuple of (ahead, behind) counts, or (None, None) on error
    """
    try:
        ahead = run_git(["rev-list", "--count", f"upstream/{upstream_branch}..HEAD"], module_path)
        behind = run_git(["rev-list", "--count", f"HEAD..upstream/{upstream_branch}"], module_path)
        return int(ahead or 0), int(behind or 0)
    except Exception:
        return None, None


def has_uncommitted_changes(module_path: Path) -> bool:
    """Check if repository has uncommitted changes.

    Args:
        module_path: Path to the git repository

    Returns:
        True if there are uncommitted changes
    """
    status = run_git(["status", "--porcelain"], module_path)
    return bool(status)


def reset_to_upstream(module_path: Path, upstream_branch: str) -> bool:
    """Reset repository to upstream branch.

    Ensures we're on a proper branch (not detached HEAD) before reset.

    Args:
        module_path: Path to the git repository
        upstream_branch: Name of the upstream branch

    Returns:
        True if reset succeeded
    """
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

        # Reset to upstream
        run_git(["reset", "--hard", f"upstream/{upstream_branch}"], module_path, capture=False)
        return True
    except Exception:
        return False


def apply_patches(
    module_path: Path,
    patch_files: List[Path]
) -> Tuple[int, Optional[str]]:
    """Apply patch files to repository.

    Tries git am first, falls back to git apply if needed.

    Args:
        module_path: Path to the git repository
        patch_files: List of patch files to apply in order

    Returns:
        Tuple of (patches_applied, error_message or None)
    """
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
                    error = result.stderr.strip().split('\n')[0] if result.stderr else "Unknown error"
                    return applied, f"Failed at {patch_file.name}: {error}"

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
            return applied, f"Error at {patch_file.name}: {str(e)}"

    return applied, None


def count_commits_in_patch(patch_file: Path) -> int:
    """Count the number of commits in a combined patch file.

    Args:
        patch_file: Path to a patch file (from git format-patch --stdout)

    Returns:
        Number of commits found in the patch
    """
    try:
        content = patch_file.read_text()
        # Each commit starts with "From <40-char-hash>"
        return len(re.findall(r'^From [a-f0-9]{40}', content, re.MULTILINE))
    except Exception:
        return 0


def get_patch_commit_count(patch_dir: Path, patch_mode: str) -> int:
    """Get the total number of commits represented by patches.

    Args:
        patch_dir: Directory containing patch files
        patch_mode: "single" or "granular"

    Returns:
        Total commit count across all patches
    """
    patches = sorted(patch_dir.glob("*.patch")) if patch_dir.exists() else []
    if not patches:
        return 0

    if patch_mode == "granular":
        return len(patches)
    else:  # single
        return count_commits_in_patch(patches[0])


def generate_patches(
    module_path: Path,
    patch_dir: Path,
    upstream_branch: str,
    patch_mode: str = "single"
) -> Tuple[bool, str]:
    """Generate patch files from current repo state.

    Args:
        module_path: Path to the git repository
        patch_dir: Directory to store patches
        upstream_branch: Name of the upstream branch
        patch_mode: "single" for combined patch, "granular" for individual

    Returns:
        Tuple of (success, message)
    """
    try:
        # Check if there are any differences
        ahead_output = run_git(["rev-list", "--count", f"upstream/{upstream_branch}..HEAD"], module_path)
        ahead = int(ahead_output or 0)

        if ahead == 0:
            # No changes, remove existing patches
            existing = list(patch_dir.glob("*.patch"))
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
            return True, f"Generated zeppelin.patch ({size:.1f}K, {ahead} commits)"

        else:
            # Granular: individual patches with numeric prefixes
            subprocess.run(
                ["git", "format-patch", f"upstream/{upstream_branch}..HEAD", "-o", str(patch_dir), "-N"],
                cwd=module_path,
                capture_output=True,
                text=True,
                check=True
            )

            # Count generated patches
            new_patches = list(patch_dir.glob("*.patch"))
            total_size = sum(p.stat().st_size for p in new_patches)

            return True, f"Generated {len(new_patches)} patches ({total_size / 1024:.1f}K total)"

    except Exception as e:
        return False, f"Failed: {str(e)}"
