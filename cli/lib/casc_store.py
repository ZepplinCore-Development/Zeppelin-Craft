"""F-216: a local store of retail WoW files, downloaded from Blizzard's public CDN (TACT).

Replaces streaming each file from wago.tools: `zep model retail-casc` reads the current retail
build's tables from the patch server and CDN and downloads the files under STORE_DIRS (models and
textures) at full quality. After that, lib.retail.fetch / texture_file read them locally.

  versions   us.patch.battle.net:1119/wow/versions -> build config + CDN config
  encoding   content key (ckey, md5 of the file) -> encoded key (ekey, the CDN's name)
  root       FileDataID -> ckey (MFST, enUS / all-locale, not low-violence)
  indexes    <archive>.index: ekey -> (archive, offset, size); a missing ekey is a loose file
  BLTE       the encoded file: chunks N raw / Z zlib / E encrypted (Salsa20, TACT keys) / 4 lz4

Store (content-addressed, so one copy per content and a new build fetches only new content):
  logs/retail_cache/casc/data/<ck[:2]>/<ck>   the decoded file
  logs/retail_cache/casc/files.sqlite          fdid -> ckey for the current build (+ path, build)
  logs/retail_cache/casc/meta/<hash>           cached configs / encoding / root / indexes
"""
import hashlib
import sqlite3
import struct
import threading
import time
import urllib.request
import zlib
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Callable, Dict, Iterable, List, Optional, Set, Tuple

ROOT = Path('/workspace/project/logs/retail_cache/casc')
DATA, META, DB = ROOT / 'data', ROOT / 'meta', ROOT / 'files.sqlite'
PATCH = 'http://us.patch.battle.net:1119/wow'
STORE_DIRS = ('creature/', 'item/', 'character/', 'spells/', 'textures/')
KEYS_URL = 'https://raw.githubusercontent.com/wowdev/TACTKeys/master/WoW.txt'   # community TACT keys
KEYFILES = [ROOT / 'WoW.txt', Path('/workspace/project/Zeppelin-Tools/Wow Model Viewer/Support Files/tactkeys.txt')]
_UA = {'User-Agent': 'Zeppelin-F216-casc/1.0'}
LOCALE_ENUS, LOCALE_ALL = 0x2, 0xFFFFFFFF
CF_LOW_VIOLENCE, CF_NO_NAME_HASH = 0x80, 0x10000000


class Missing(Exception):
    pass


# ---- network ----------------------------------------------------------------------------
def _http(url: str, rng: Optional[Tuple[int, int]] = None, timeout: int = 120, tries: int = 4) -> bytes:
    h = dict(_UA)
    if rng:
        h['Range'] = f'bytes={rng[0]}-{rng[0] + rng[1] - 1}'
    err = None
    for k in range(tries):
        try:
            with urllib.request.urlopen(urllib.request.Request(url, headers=h), timeout=timeout) as r:
                return r.read()
        except urllib.error.HTTPError as ex:
            if ex.code == 404:
                raise Missing(url)
            err = ex
        except Exception as ex:                      # timeouts, resets: back off and retry
            err = ex
        time.sleep(1 + 2 * k)
    raise err


def _table(text: str) -> List[Dict[str, str]]:
    lines = [ln for ln in text.splitlines() if ln and not ln.startswith('#')]
    cols = [c.split('!')[0] for c in lines[0].split('|')]
    return [dict(zip(cols, ln.split('|'))) for ln in lines[1:]]


class CDN:
    def __init__(self, region: str = 'us'):
        ver = next(r for r in _table(_http(f'{PATCH}/versions').decode()) if r['Region'] == region)
        cdn = next(r for r in _table(_http(f'{PATCH}/cdns').decode()) if r['Name'] == region)
        self.build, self.version = ver['BuildId'], ver['VersionsName']
        self.hosts = cdn['Hosts'].split()
        self.path = cdn['Path']
        self.build_config = self.config(ver['BuildConfig'])
        self.cdn_config = self.config(ver['CDNConfig'])

    def url(self, kind: str, h: str, suffix: str = '') -> List[str]:
        return [f'http://{host}/{self.path}/{kind}/{h[:2]}/{h[2:4]}/{h}{suffix}' for host in self.hosts]

    def get(self, kind: str, h: str, suffix: str = '', rng=None, cache: bool = False) -> bytes:
        if cache:
            f = META / f'{h}{suffix}'
            if f.exists():
                return f.read_bytes()
        err = None
        for u in self.url(kind, h, suffix):
            try:
                b = _http(u, rng)
                break
            except Missing as ex:
                err = ex
            except Exception as ex:
                err = ex
        else:
            raise err
        if cache:
            META.mkdir(parents=True, exist_ok=True)
            tmp = META / f'.{h}{suffix}.{threading.get_ident()}'
            tmp.write_bytes(b)
            tmp.replace(META / f'{h}{suffix}')
        return b

    def config(self, h: str) -> Dict[str, List[str]]:
        out = {}
        for ln in self.get('config', h, cache=True).decode().splitlines():
            if ' = ' in ln and not ln.startswith('#'):
                k, v = ln.split(' = ', 1)
                out[k] = v.split()
        return out


# ---- BLTE -------------------------------------------------------------------------------
_keys: Optional[Dict[bytes, bytes]] = None


def refresh_keys(log: Callable = print) -> None:
    """Re-download the community key list (new builds add keys; files under an unknown key stay missing)."""
    global _keys
    try:
        b = _http(KEYS_URL, timeout=60)
        ROOT.mkdir(parents=True, exist_ok=True)
        (ROOT / 'WoW.txt').write_bytes(b)
        _keys = None
        log(f'  casc: {len(tact_keys()):,} TACT keys')
    except Exception as ex:
        log(f'  casc: key list not refreshed ({ex}); using {len(tact_keys()):,} stored keys')


def tact_keys() -> Dict[bytes, bytes]:
    """key name (8 bytes, as stored in BLTE) -> 16-byte key."""
    global _keys
    if _keys is None:
        _keys = {}
        for f in KEYFILES:
            if f.exists():
                for ln in f.read_text(errors='ignore').splitlines():
                    p = ln.split()
                    if len(p) >= 2 and len(p[0]) == 16 and len(p[1]) == 32:
                        try:
                            _keys[bytes.fromhex(p[0])[::-1]] = bytes.fromhex(p[1])
                        except ValueError:
                            pass
    return _keys


class Encrypted(Exception):
    pass


def _chunk(data: bytes, index: int) -> bytes:
    mode = data[:1]
    if mode == b'N':
        return data[1:]
    if mode == b'Z':
        return zlib.decompress(data[1:])
    if mode == b'4':
        import lz4.block                              # rare in WoW; only if installed
        return lz4.block.decompress(data[1:])
    if mode == b'F':
        return blte(data[1:])
    if mode == b'E':
        o = 1
        ks = data[o]; o += 1                          # [name size][name][iv size][iv][type 'S'][payload]
        name = data[o:o + ks]; o += ks
        ivs = data[o]; o += 1
        iv = bytearray(data[o:o + ivs]); o += ivs
        typ = data[o:o + 1]; o += 1
        key = tact_keys().get(name)
        if key is None:
            raise Encrypted(name[::-1].hex().upper())
        for i in range(4):
            iv[i] ^= (index >> (8 * i)) & 0xFF
        if typ != b'S':
            raise Encrypted('arc4')
        from Crypto.Cipher import Salsa20
        plain = Salsa20.new(key=key, nonce=bytes(iv).ljust(8, b'\0')[:8]).decrypt(data[o:])
        return _chunk(plain, index)
    raise ValueError(f'BLTE chunk mode {mode!r}')


def blte(data: bytes) -> bytes:
    if data[:4] != b'BLTE':
        raise ValueError('not BLTE')
    hsize = struct.unpack_from('>I', data, 4)[0]
    if hsize == 0:
        return _chunk(data[8:], 0)
    count = int.from_bytes(data[9:12], 'big')
    o, out, pos = 12, [], hsize
    for i in range(count):
        csize, _dsize = struct.unpack_from('>II', data, o)
        o += 24
        out.append(_chunk(data[pos:pos + csize], i))
        pos += csize
    return b''.join(out)


# ---- tables -----------------------------------------------------------------------------
def encoding(cdn: CDN, want_ckeys: Optional[Set[bytes]] = None) -> Dict[bytes, bytes]:
    """ckey -> first ekey (only the wanted ckeys when given)."""
    ek = cdn.build_config['encoding'][1]
    raw = blte(cdn.get('data', ek, cache=True))
    if raw[:2] != b'EN':
        raise ValueError('encoding magic')
    ck_sz, ek_sz = raw[3], raw[4]
    ce_page_kb = struct.unpack_from('>H', raw, 5)[0]
    ce_pages = struct.unpack_from('>I', raw, 9)[0]
    espec_sz = struct.unpack_from('>I', raw, 18)[0]
    o = 22 + espec_sz + ce_pages * (ck_sz + 16)
    out: Dict[bytes, bytes] = {}
    psize = ce_page_kb * 1024
    for p in range(ce_pages):
        q, end = o + p * psize, o + (p + 1) * psize
        while q < end:
            kc = raw[q]
            if kc == 0:
                break
            ck = raw[q + 6:q + 6 + ck_sz]
            if want_ckeys is None or ck in want_ckeys:
                out[ck] = raw[q + 6 + ck_sz:q + 6 + ck_sz + ek_sz]
            q += 6 + ck_sz + kc * ek_sz
    return out


def root(cdn: CDN) -> Dict[int, bytes]:
    """FileDataID -> ckey: the enUS (or all-locale) entry, not low-violence."""
    ck = bytes.fromhex(cdn.build_config['root'][0])
    ekey = encoding(cdn, {ck})[ck]
    raw = blte(cdn.get('data', ekey.hex(), cache=True))
    magic = raw[:4]
    if magic not in (b'TSFM', b'MFST'):
        raise ValueError(f'root magic {magic!r} (pre-8.2 roots are not supported)')
    hsize, version = struct.unpack_from('<II', raw, 4)
    if hsize > 1000:                                  # MFST v0: no header size / version fields
        hsize, version = 12, 0
    o = hsize
    out: Dict[int, bytes] = {}
    while o < len(raw):
        if version >= 2:
            n, locale, f1, f2 = struct.unpack_from('<IIII', raw, o)
            f3 = raw[o + 16]
            content = f1 | f2 | (f3 << 17)
            o += 17
        else:
            n, content, locale = struct.unpack_from('<III', raw, o)
            o += 12
        deltas = struct.unpack_from(f'<{n}i', raw, o)
        o += 4 * n
        cks = raw[o:o + 16 * n]
        o += 16 * n
        if not (content & CF_NO_NAME_HASH):
            o += 8 * n
        if not (locale & LOCALE_ENUS) or (content & CF_LOW_VIOLENCE):
            continue
        fd = -1
        for i in range(n):
            fd += deltas[i] + 1
            out.setdefault(fd, cks[16 * i:16 * i + 16])
    return out


def archive_index(cdn: CDN, want_ekeys: Set[bytes]) -> Dict[bytes, Tuple[str, int, int]]:
    """ekey -> (archive, offset, size) for the wanted ekeys, over every CDN archive index."""
    archives = cdn.cdn_config['archives']
    out: Dict[bytes, Tuple[str, int, int]] = {}
    lock = threading.Lock()

    def one(a: str):
        raw = cdn.get('data', a, '.index', cache=True)
        n = struct.unpack_from('<I', raw, len(raw) - 12)[0]
        ksz = raw[len(raw) - 14]                     # footer: ... keySize, checksumSize, numElements u32, checksum[8]
        esz = ksz + 8
        per = 4096 // esz
        found, seen, blk = {}, 0, 0
        while seen < n:
            base = blk * 4096
            for i in range(per):
                q = base + i * esz
                ek = raw[q:q + ksz]
                if not any(ek):
                    break
                seen += 1
                if ek in want_ekeys:
                    size, off = struct.unpack_from('>II', raw, q + ksz)
                    found[ek] = (a, off, size)
                if seen >= n:
                    break
            blk += 1
        with lock:
            out.update(found)

    with ThreadPoolExecutor(16) as ex:
        list(ex.map(one, archives))
    return out


# ---- the store --------------------------------------------------------------------------
def data_path(ck: bytes) -> Path:
    h = ck.hex()
    return DATA / h[:2] / h


def _db() -> sqlite3.Connection:
    ROOT.mkdir(parents=True, exist_ok=True)
    c = sqlite3.connect(str(DB), timeout=60)
    c.execute('CREATE TABLE IF NOT EXISTS files (fdid INTEGER PRIMARY KEY, ckey BLOB NOT NULL)')
    c.execute('CREATE TABLE IF NOT EXISTS meta (k TEXT PRIMARY KEY, v TEXT)')
    return c


_local = threading.local()


def path(fdid: int) -> Optional[Path]:
    """The stored file for a FileDataID of the current store build, or None (never a network call)."""
    c = getattr(_local, 'db', None)
    if c is None:
        if not DB.exists():
            return None
        c = _local.db = sqlite3.connect(f'file:{DB}?mode=ro', uri=True, timeout=60, check_same_thread=False)
    try:
        r = c.execute('SELECT ckey FROM files WHERE fdid = ?', (int(fdid),)).fetchone()
    except sqlite3.Error:
        return None
    if not r:
        return None
    p = data_path(bytes(r[0]))
    return p if p.exists() else None


def store_build() -> Optional[str]:
    if not DB.exists():
        return None
    r = _db().execute("SELECT v FROM meta WHERE k = 'build'").fetchone()
    return r[0] if r else None


def wanted(by_id: Dict[int, str], extra: Iterable[int] = ()) -> Set[int]:
    out = {fd for fd, p in by_id.items() if p.startswith(STORE_DIRS)}
    return out | {int(x) for x in extra}


def _write(ck: bytes, data: bytes) -> bool:
    if hashlib.md5(data).digest() != ck:
        return False
    p = data_path(ck)
    p.parent.mkdir(parents=True, exist_ok=True)
    tmp = p.with_name(f'.{p.name}.{threading.get_ident()}')
    tmp.write_bytes(data)
    tmp.replace(p)
    return True


def sync(fdids: Optional[Iterable[int]] = None, extra: Iterable[int] = (), workers: int = 16,
         log: Callable = print, max_gap: int = 1 << 18, max_span: int = 16 << 20) -> dict:
    """Bring the store up to the current retail build: map the wanted FileDataIDs to content keys,
    download every content not stored yet (byte ranges of the CDN archives, adjacent files merged
    into one request), verify each against its md5, and record fdid -> ckey."""
    from lib import retail
    t0 = time.time()
    cdn = CDN()
    log(f'  casc: retail {cdn.version} (store was {store_build() or "empty"})')
    refresh_keys(log)
    rt = root(cdn)
    if fdids is None:
        _, by_id = retail.listfile()
        fdids = wanted(by_id, extra)
    fdids = {fd for fd in fdids if fd in rt}
    need = {rt[fd] for fd in fdids}
    todo = {ck for ck in need if not data_path(ck).exists()}
    log(f'  casc: {len(fdids):,} files, {len(need):,} distinct contents, {len(todo):,} to download')
    enc = encoding(cdn, todo)
    loc = archive_index(cdn, set(enc.values()))
    by_ek = {ek: ck for ck, ek in enc.items()}
    loose = [ek for ek in by_ek if ek not in loc]
    log(f'  casc: {len(loc):,} in archives, {len(loose):,} loose, {len(todo) - len(enc):,} not in encoding '
        f'({time.time() - t0:.0f}s)')
    # merge neighbouring ranges of one archive into a single request
    spans: List[Tuple[str, int, int, List[Tuple[bytes, int, int]]]] = []
    by_arch: Dict[str, List[Tuple[int, int, bytes]]] = {}
    for ek, (a, off, size) in loc.items():
        by_arch.setdefault(a, []).append((off, size, ek))
    for a, lst in by_arch.items():
        lst.sort()
        cur = None
        for off, size, ek in lst:
            if cur and off - (cur[1] + cur[2]) <= max_gap and off + size - cur[1] <= max_span:
                cur[2] = off + size - cur[1]
                cur[3].append((ek, off, size))
            else:
                cur = [a, off, size, [(ek, off, size)]]
                spans.append(cur)
    stats = {'got': 0, 'bad': 0, 'encrypted': 0, 'missing': 0, 'bytes': 0}
    lock = threading.Lock()
    enc_keys: Dict[str, int] = {}

    def save(ek: bytes, blob: bytes):
        ck = by_ek[ek]
        try:
            data = blte(blob)
        except Encrypted as ex:
            with lock:
                stats['encrypted'] += 1
                enc_keys[str(ex)] = enc_keys.get(str(ex), 0) + 1
            return
        except Exception:
            with lock:
                stats['bad'] += 1
            return
        ok = _write(ck, data)
        with lock:
            stats['got' if ok else 'bad'] += 1
            stats['bytes'] += len(data) if ok else 0

    def span(s):
        a, off, size, parts = s
        try:
            blob = cdn.get('data', a, rng=(off, size))
        except Exception:
            with lock:
                stats['missing'] += len(parts)
            return
        for ek, o, sz in parts:
            save(ek, blob[o - off:o - off + sz])

    def loose_one(ek: bytes):
        try:
            save(ek, cdn.get('data', ek.hex()))
        except Exception:
            with lock:
                stats['missing'] += 1

    jobs = [(span, s) for s in spans] + [(loose_one, ek) for ek in loose]
    log(f'  casc: {len(jobs):,} requests ({len(spans):,} archive spans, {len(loose):,} loose files)')
    with ThreadPoolExecutor(workers) as ex:
        futs = [ex.submit(f, x) for f, x in jobs]
        for i, fu in enumerate(as_completed(futs), 1):
            fu.result()
            if i % 2000 == 0 or i == len(futs):
                el = time.time() - t0
                log(f'  casc: {i:,}/{len(futs):,} requests, {stats["got"]:,} files, '
                    f'{stats["bytes"] / 2**30:.1f} GB, {el / 60:.0f} min')
    # the index: every wanted fdid whose content is stored
    c = _db()
    with c:
        c.execute('DELETE FROM files')
        c.executemany('INSERT INTO files VALUES (?, ?)',
                      ((fd, rt[fd]) for fd in sorted(fdids) if data_path(rt[fd]).exists()))
        c.execute("INSERT OR REPLACE INTO meta VALUES ('build', ?)", (cdn.version,))
        c.execute("INSERT OR REPLACE INTO meta VALUES ('synced', ?)", (time.strftime('%Y-%m-%d %H:%M:%S'),))
    n = c.execute('SELECT COUNT(*) FROM files').fetchone()[0]
    stats.update(build=cdn.version, indexed=n, wanted=len(fdids),
                 encrypted_keys=sorted(enc_keys.items(), key=lambda kv: -kv[1])[:20])
    log(f'  casc: {n:,}/{len(fdids):,} indexed for {cdn.version}; {stats["encrypted"]:,} encrypted with unknown keys, '
        f'{stats["bad"]:,} bad, {stats["missing"]:,} missing ({(time.time() - t0) / 60:.0f} min)')
    return stats
