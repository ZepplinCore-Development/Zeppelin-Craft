"""F-216: skins for a display that names none, on a model that needs them.

A pack that swaps in a model using creature-skin slots (texture types 11/12/13) must give every
display on it skin names; one it leaves blank draws empty (patch-hd-everything's battaxi: displays
1566 and 24377 get skins, 31725 Recon/Scout Bat none). memory: reference_hd_model_swap_blank_monster_skins.

fill() picks, in order:
  1. the STOCK look: the stock model's hardcoded textures (battaxi: batskin01, batskin02) when the
     option's sources ship files of those names - the same creature, now with the new mesh;
  2. the skins most of the sibling displays on the model name.
Used by the picker's panes and by zep model curate, so both agree.
"""
import struct
from collections import Counter
from typing import Callable, Dict, Iterable, List, Optional, Sequence, Tuple

TEX = ('texture_variation_1', 'texture_variation_2', 'texture_variation_3')


def texture_table(m2: bytes) -> List[Tuple[int, str]]:
    if m2[:4] != b'MD20' or len(m2) < 0x58:
        return []
    n, o = struct.unpack_from('<II', m2, 0x50)
    out = []
    for i in range(n):
        if o + 16 * i + 16 > len(m2):
            break                                         # a malformed file: its table runs past the end
        typ, _f, ln, no = struct.unpack_from('<4I', m2, o + 16 * i)
        name = m2[no:no + ln - 1].decode('latin1').replace('\\', '/').lower() if ln and no + ln <= len(m2) else ''
        out.append((typ, name))
    return out


def needed(table: Sequence[Tuple[int, str]]) -> List[int]:
    """Variation indices (0..2) the model reads: type 11 -> 0, 12 -> 1, 13 -> 2."""
    return sorted({t - 11 for t, _ in table if t in (11, 12, 13)})


def is_blank(names: Sequence[str], need: Iterable[int]) -> bool:
    need = list(need)
    return bool(need) and all(not str(names[i] if i < len(names) else '').strip() for i in need)


def fill(path: str, table: Sequence[Tuple[int, str]], stock_table: Sequence[Tuple[int, str]],
         has_file: Callable[[str], bool], siblings: Iterable[Sequence[str]]) -> Optional[Tuple[str, str, str]]:
    need = needed(table)
    if not need:
        return None
    folder = path.rsplit('/', 1)[0] + '/'
    hard = [n for t, n in stock_table if t == 0 and n.startswith(folder) and n.endswith('.blp')]
    if len(hard) >= len(need) and all(has_file(h) for h in hard[:len(need)]):
        out = ['', '', '']
        for i, h in zip(need, hard):
            out[i] = h.rsplit('/', 1)[-1][:-4]
        return tuple(out)
    common = Counter(tuple(str(s[i] or '') for i in range(3)) for s in siblings
                     if not is_blank(s, need)).most_common(1)
    return common[0][0] if common else None
