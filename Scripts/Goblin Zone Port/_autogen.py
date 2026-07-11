"""Shared DO-NOT-EDIT banner for the F-011 Goblin Zone extraction pipeline.

Every SQL/DBC file in this pipeline is machine-generated from Project
Neltharion source data. To guarantee each one carries a "do not edit"
header without every generator having to remember to print it, call
``_autogen.install()`` once near the top of a generator script:

    import _autogen; _autogen.install()

install() wraps builtins.open so that any ``*.sql`` file opened for writing
under a ``zpak`` path is prefixed with the banner below. Intermediate files
written elsewhere (scratch, *.json) are left untouched.

One-off manual fixes do NOT belong in these generated files (they would be
lost on the next run) -- put them in a separate ``zz_[I-xxx]_*.sql`` file,
which loads after the generated rows and overrides them.
"""
import builtins
import os

_real_open = builtins.open


def banner():
    return (
        "-- ============================================================\n"
        "-- AUTO-GENERATED FILE -- DO NOT EDIT BY HAND.\n"
        "-- Produced by the F-011 Goblin Zone extraction pipeline\n"
        "-- (Zeppelin-Craft/Scripts/Goblin Zone Port/). Any manual edit\n"
        "-- here is overwritten the next time the pipeline runs.\n"
        "--   * To change this output: edit the migration/translation script.\n"
        "--   * For a one-off manual fix: add a separate zz_[I-xxx]_*.sql file\n"
        "--     (it loads after these rows and overrides the ones it needs).\n"
        "-- ============================================================\n\n"
    )


def _should_stamp(path, mode):
    try:
        p = str(path).replace("\\", "/")
    except Exception:
        return False
    return "w" in mode and p.endswith(".sql") and "zpak" in p


def _stamping_open(path, mode="r", *args, **kwargs):
    f = _real_open(path, mode, *args, **kwargs)
    try:
        if _should_stamp(path, mode):
            f.write(banner())
    except Exception:
        pass
    return f


def install():
    """Idempotently route builtins.open through the banner-stamping wrapper."""
    if getattr(builtins.open, "_f011_autogen", False):
        return
    _stamping_open._f011_autogen = True
    builtins.open = _stamping_open
