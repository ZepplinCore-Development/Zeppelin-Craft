"""Shared encounter chest registry.

Single source of truth for boss encounters where the actual reward is a
gameobject chest (rather than, or in addition to, creature drops).
Consumed by:
- F-074 cache wiring (cli/lib/loot/satchel.py) — pulls F-074-scope chests
  and emits gameobject_loot_template rows + difficulty-gated conditions
- F-007 AtlasLoot generator (cli/lib/atlasloot/core.py) — pulls all
  chest entries and registers them as appropriate section types

Add new encounter chests to `data/encounter_chests.json` once and both
subsystems pick them up.
"""

import json
from pathlib import Path
from typing import Dict, List

_DATA_FILE = Path(__file__).parent / "data" / "encounter_chests.json"

_cache = None


def _load() -> Dict:
    global _cache
    if _cache is None:
        with open(_DATA_FILE) as f:
            _cache = json.load(f)
    return _cache


def all_chests() -> List[Dict]:
    """All chest entries, regardless of scope."""
    return _load()["chests"]


def for_f074_tier(tier: str) -> List[Dict]:
    """Chests in F-074's scope for the given tier (azeroth / outland / northrend).

    Only entries with f074_in_scope=true and matching tier are returned.
    These are the encounters where F-074 should add heroic/mythic cache
    references to the chest's gameobject_loot_template.
    """
    return [c for c in all_chests()
            if c.get("f074_in_scope") and c.get("tier") == tier]


def by_atlasloot_section_type(section_type: str) -> Dict[str, Dict]:
    """Chests of a given AtlasLoot section type, keyed by section name.

    section_type ∈ {single_boss_go, tbc_gameobject, vanilla_multi_source,
                    tbc_multi_source}
    """
    return {c["key"]: c for c in all_chests()
            if c.get("atlasloot_section_type") == section_type}


def f074_tiers() -> List[str]:
    """Distinct F-074 tiers represented in the registry."""
    tiers = set()
    for c in all_chests():
        if c.get("f074_in_scope"):
            tiers.add(c["tier"])
    return sorted(tiers)
