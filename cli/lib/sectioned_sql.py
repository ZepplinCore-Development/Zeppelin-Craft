"""Sectioned SQL file management — multi-feature files where each feature
contributes a marked section and regenerates it independently while
preserving the others.

Use case: F-074 creature clones + F-179 loot wiring share apply ordering.
F-074 must DELETE+INSERT base loot into clone lootids before F-179 can
UPDATE those rows to swap stock items for scaled versions. Putting both
in one sectioned file means:

  - The file's hash changes whenever EITHER section is regenerated, so
    `sql changed` re-applies the whole file fresh.
  - Apply ordering is enforced by section order INSIDE the file — F-074
    section first, F-179 section second.
  - No tracker hacks needed; each generator just rewrites its own section
    and preserves the others.

Markers (exact, no fuzzy matching):
    -- @@@ BEGIN_SECTION: <name> @@@
    ... section content (any number of SQL statements) ...
    -- @@@ END_SECTION: <name> @@@
"""
from pathlib import Path
from typing import Dict, List, Optional, Sequence

BEGIN_MARKER = "-- @@@ BEGIN_SECTION: {name} @@@"
END_MARKER = "-- @@@ END_SECTION: {name} @@@"


def write_section(file_path: Path, section_name: str, content: str,
                  section_order: Sequence[str], file_header: str = "") -> None:
    """Replace `section_name` with `content` in `file_path`, preserving
    every other section. Creates the file if missing, inserting the
    section in the order specified by `section_order` (sections without
    content yet are skipped).

    `content` should NOT include marker lines — they're wrapped here.
    """
    existing = read_sections(file_path)
    existing[section_name] = content.rstrip()

    parts: List[str] = []
    if file_header:
        parts.append(file_header.rstrip())
        parts.append("")
    for sec in section_order:
        if sec in existing:
            parts.append(BEGIN_MARKER.format(name=sec))
            parts.append(existing[sec])
            parts.append(END_MARKER.format(name=sec))
            parts.append("")

    file_path.parent.mkdir(parents=True, exist_ok=True)
    file_path.write_text("\n".join(parts).rstrip() + "\n")


def read_sections(file_path: Path) -> Dict[str, str]:
    """Parse `file_path` into {section_name: content}. Returns empty dict
    if the file doesn't exist. Content excludes the marker lines."""
    if not file_path.exists():
        return {}
    text = file_path.read_text()
    sections: Dict[str, str] = {}
    current: Optional[str] = None
    buf: List[str] = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("-- @@@ BEGIN_SECTION:"):
            name = s.split(":", 1)[1].replace("@@@", "").strip()
            current = name
            buf = []
        elif s.startswith("-- @@@ END_SECTION:") and current is not None:
            sections[current] = "\n".join(buf).rstrip()
            current = None
            buf = []
        elif current is not None:
            buf.append(line)
    return sections


def read_section(file_path: Path, section_name: str) -> Optional[str]:
    """Return one section's content, or None if absent."""
    return read_sections(file_path).get(section_name)
