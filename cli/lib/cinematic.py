"""
Cinematic (pre-rendered movie) tooling for the 3.3.5a client.

The client plays cinematics named  <Movie.dbc movie_path>_<width>.avi  and is
extremely fussy about the container: an otherwise-valid AVI is silently ignored
rather than erroring. See I-279 for the reverse-engineering task that aims to
lift the resolution restriction; until that lands only the two stock widths
resolve at all.

The reference format was verified byte-for-byte against a file known to play
(zep-cinematics Goblin_1024.avi, I-276). ffmpeg's AVI muxer already emits every
field correctly except biCompression, which it writes as the fccHandler value
(DIVX) where the client wants DXGM. DXGM is a relabelled MPEG-4 -- the bitstream
is unchanged, only the tag differs -- so conversion is a normal mpeg4 encode
followed by a 4-byte patch.
"""

import shutil
import struct
import subprocess
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from lib.logging_config import get_logger

logger = get_logger('lib.cinematic')


# =============================================================================
# Reference format (I-279)
# =============================================================================

# Widths the stock 3.3.5a client will look for, and the exact frame size it
# expects for each. Cataclysm ships _1280 (1280x720) instead, which this client
# never even opens -- indistinguishable from a failed decode.
WOTLK_VARIANTS: Dict[int, Tuple[int, int]] = {
    1024: (1024, 576),
    800: (800, 448),
}

# The x64 client (F-224) plays any other frame size through its generic movie layout (F-200) and picks the file
# whose MovieFileData.resolution matches the screen width (else the nearest). HD widths emit 16:9 frames.
X64_VARIANTS: Dict[int, Tuple[int, int]] = {
    1280: (1280, 720),
    1920: (1920, 1080),
    2560: (2560, 1440),
}
CLIENT_VARIANTS: Dict[int, Tuple[int, int]] = {**WOTLK_VARIANTS, **X64_VARIANTS}

VIDEO_FOURCC = b'DXGM'      # biCompression -- what the client matches on
VIDEO_HANDLER = b'DIVX'     # strh fccHandler -- left as the codec's own tag
AUDIO_FORMAT_TAG = 0x0055   # MP3
AUDIO_SAMPLE_RATE = 48000
AUDIO_CHANNELS = 2
VIDEO_BIT_COUNT = 24
VIDEO_STRF_SIZE = 40        # BITMAPINFOHEADER, no MPEG-4 extradata
AUDIO_STRF_SIZE = 30        # MPEGLAYER3WAVEFORMAT
AVIH_FLAGS = 0x910          # HASINDEX | ISINTERLEAVED | TRUSTCKTYPE

# Default video bitrate per width. The stock goblin cinematic runs ~2 Mbps at
# 1024x576; these are a little above that to leave headroom for busier footage.
DEFAULT_BITRATE = {1024: '3M', 800: '2M', 1280: '5M', 1920: '8M', 2560: '14M'}
FALLBACK_BITRATE = '4M'


# =============================================================================
# ffmpeg discovery
# =============================================================================

def find_ffmpeg() -> Optional[str]:
    """Locate an ffmpeg binary. PATH first, then the imageio_ffmpeg bundle."""
    found = shutil.which('ffmpeg')
    if found:
        return found

    try:
        import imageio_ffmpeg
        exe = imageio_ffmpeg.get_ffmpeg_exe()
        if Path(exe).exists():
            return exe
    except Exception:
        pass

    return None


def require_ffmpeg() -> str:
    exe = find_ffmpeg()
    if not exe:
        raise RuntimeError(
            'ffmpeg not found. Install it, or `pip install imageio-ffmpeg` '
            'for a bundled static build.'
        )
    return exe


def _ffprobe_for(ffmpeg: str) -> Optional[str]:
    """ffprobe next to ffmpeg, if it shipped one (static bundles often do not)."""
    found = shutil.which('ffprobe')
    if found:
        return found
    sibling = Path(ffmpeg).parent / 'ffprobe'
    return str(sibling) if sibling.exists() else None


# =============================================================================
# AVI structure
# =============================================================================

def _walk(data: bytes, start: int, end: int, out: List[Tuple[bytes, int, int]]):
    """Collect (chunk_id, payload_offset, payload_size) for every leaf chunk."""
    i = start
    while i + 8 <= end:
        cid = data[i:i + 4]
        size, = struct.unpack('<I', data[i + 4:i + 8])
        if cid in (b'RIFF', b'LIST'):
            # Container: recurse past the 4-byte form type, do not also emit it.
            _walk(data, i + 12, min(i + 8 + size, end), out)
            i += 12 if cid == b'RIFF' else 8 + size + (size & 1)
        else:
            out.append((cid, i + 8, size))
            i += 8 + size + (size & 1)


def read_avi_info(path: Path) -> dict:
    """
    Parse the header chunks of an AVI.

    Only the leading header region is read for large files -- 'movi' is skipped
    and idx1 is located from the tail, so this stays cheap on a 20 MB cinematic.
    """
    path = Path(path)
    size = path.stat().st_size

    with open(path, 'rb') as fh:
        head = fh.read(min(size, 512 * 1024))
        if size > 512 * 1024:
            fh.seek(max(0, size - 8 * 1024 * 1024))
            tail = fh.read()
        else:
            tail = b''

    if head[:4] != b'RIFF' or head[8:12] != b'AVI ':
        raise ValueError(f'{path.name}: not a RIFF/AVI file')

    leaves: List[Tuple[bytes, int, int]] = []
    _walk(head, 0, len(head), leaves)

    info: dict = {'path': str(path), 'name': path.name,
                  'file_size': size, 'streams': []}

    for cid, off, sz in leaves:
        payload = head[off:off + sz]
        if cid == b'avih' and 'avih' not in info:
            f = struct.unpack('<10I', payload[:40])
            info['avih'] = {
                'usec_per_frame': f[0], 'flags': f[3], 'total_frames': f[4],
                'streams': f[6], 'suggested_buffer_size': f[7],
                'width': f[8], 'height': f[9],
                'fps': round(1_000_000 / f[0], 3) if f[0] else 0,
            }
        elif cid == b'strh':
            info['streams'].append({
                'fcc_type': payload[0:4].decode('latin1'),
                'fcc_handler': payload[4:8].decode('latin1'),
                'suggested_buffer_size': struct.unpack('<I', payload[36:40])[0],
            })
        elif cid == b'strf' and info['streams']:
            s = info['streams'][-1]
            if s.get('strf_size') is not None:
                continue
            s['strf_size'] = sz
            if s['fcc_type'] == 'vids':
                s['bi_size'] = struct.unpack('<I', payload[0:4])[0]
                s['bi_width'] = struct.unpack('<i', payload[4:8])[0]
                s['bi_height'] = struct.unpack('<i', payload[8:12])[0]
                s['bi_bit_count'] = struct.unpack('<H', payload[14:16])[0]
                s['bi_compression'] = payload[16:20].decode('latin1')
                s['_bi_compression_offset'] = off + 16
            else:
                s['format_tag'] = struct.unpack('<H', payload[0:2])[0]
                s['channels'] = struct.unpack('<H', payload[2:4])[0]
                s['sample_rate'] = struct.unpack('<I', payload[4:8])[0]

    info['has_idx1'] = (b'idx1' in head) or (b'idx1' in tail)
    return info


def video_stream(info: dict) -> Optional[dict]:
    for s in info['streams']:
        if s['fcc_type'] == 'vids':
            return s
    return None


def audio_stream(info: dict) -> Optional[dict]:
    for s in info['streams']:
        if s['fcc_type'] == 'auds':
            return s
    return None


def set_video_fourcc(path: Path, fourcc: bytes = VIDEO_FOURCC) -> bool:
    """
    Rewrite biCompression in place. Returns True if a write happened.

    Only the 4-byte tag changes; the encoded bitstream is untouched, which is
    what makes the DIVX->DXGM relabel safe.
    """
    if len(fourcc) != 4:
        raise ValueError('fourcc must be exactly 4 bytes')

    info = read_avi_info(path)
    vid = video_stream(info)
    if not vid:
        raise ValueError(f'{Path(path).name}: no video stream')

    if vid['bi_compression'].encode('latin1') == fourcc:
        return False

    with open(path, 'r+b') as fh:
        fh.seek(vid['_bi_compression_offset'])
        fh.write(fourcc)
    return True


# =============================================================================
# Validation
# =============================================================================

class Check:
    """One validated field. `fatal` marks things the client will not tolerate."""

    def __init__(self, field: str, expected, actual, ok: bool, fatal: bool = True,
                 note: str = ''):
        self.field = field
        self.expected = expected
        self.actual = actual
        self.ok = ok
        self.fatal = fatal
        self.note = note


def validate(info: dict, strict_resolution: bool = True) -> List[Check]:
    """Compare a parsed AVI against the reference format."""
    checks: List[Check] = []
    avih = info.get('avih')
    vid = video_stream(info)
    aud = audio_stream(info)

    if not avih:
        checks.append(Check('avih', 'present', 'MISSING', False))
        return checks

    if not vid:
        checks.append(Check('video stream', 'present', 'MISSING', False))
        return checks

    dims = (vid.get('bi_width'), vid.get('bi_height'))
    if strict_resolution:
        allowed = set(CLIENT_VARIANTS.values())
        checks.append(Check(
            'resolution', ' or '.join(f'{w}x{h}' for w, h in sorted(allowed)),
            f'{dims[0]}x{dims[1]}', dims in allowed,
            note='1024/800 = stock layouts; HD sizes need the x64 client (F-200)'))

    checks.append(Check('biCompression', VIDEO_FOURCC.decode(),
                        vid.get('bi_compression'),
                        vid.get('bi_compression') == VIDEO_FOURCC.decode()))
    checks.append(Check('strh fccHandler', VIDEO_HANDLER.decode(),
                        vid.get('fcc_handler'),
                        vid.get('fcc_handler') == VIDEO_HANDLER.decode(),
                        fatal=False, note='stock Blizzard files use "digm"'))
    checks.append(Check('biBitCount', VIDEO_BIT_COUNT, vid.get('bi_bit_count'),
                        vid.get('bi_bit_count') == VIDEO_BIT_COUNT))
    checks.append(Check('video strf size', VIDEO_STRF_SIZE, vid.get('strf_size'),
                        vid.get('strf_size') == VIDEO_STRF_SIZE,
                        note='40 = no MPEG-4 extradata appended'))
    # biSize must agree with the chunk size. ffmpeg appends MPEG-4 extradata
    # (strf 88 / biSize 87); truncating the chunk back to 40 without also
    # fixing biSize leaves an inconsistent BITMAPINFOHEADER that the client
    # rejects silently -- this went unnoticed across a whole test series.
    checks.append(Check('biSize', VIDEO_STRF_SIZE, vid.get('bi_size'),
                        vid.get('bi_size') == VIDEO_STRF_SIZE,
                        note='must equal the strf chunk size (40)'))

    checks.append(Check('avih dwFlags', hex(AVIH_FLAGS), hex(avih['flags']),
                        avih['flags'] == AVIH_FLAGS, fatal=False))
    checks.append(Check('avih dwSuggestedBufferSize', 1048576,
                        avih['suggested_buffer_size'],
                        avih['suggested_buffer_size'] == 1048576, fatal=False))
    checks.append(Check('avih dimensions', f'{dims[0]}x{dims[1]}',
                        f"{avih['width']}x{avih['height']}",
                        (avih['width'], avih['height']) == dims))
    checks.append(Check('idx1 index', 'present',
                        'present' if info['has_idx1'] else 'MISSING',
                        info['has_idx1']))

    if not aud:
        checks.append(Check('audio stream', 'present', 'MISSING', False,
                            note='client expects a muxed second stream'))
    else:
        checks.append(Check('audio wFormatTag', hex(AUDIO_FORMAT_TAG),
                            hex(aud.get('format_tag', 0)),
                            aud.get('format_tag') == AUDIO_FORMAT_TAG,
                            note='0x0055 = MP3'))
        checks.append(Check('audio sample rate', AUDIO_SAMPLE_RATE,
                            aud.get('sample_rate'),
                            aud.get('sample_rate') == AUDIO_SAMPLE_RATE))
        checks.append(Check('audio channels', AUDIO_CHANNELS, aud.get('channels'),
                            aud.get('channels') == AUDIO_CHANNELS))
        checks.append(Check('audio strf size', AUDIO_STRF_SIZE, aud.get('strf_size'),
                            aud.get('strf_size') == AUDIO_STRF_SIZE, fatal=False))

    return checks


# =============================================================================
# Conversion
# =============================================================================

def probe_source(path: Path) -> dict:
    """Read basic stream facts from any source ffmpeg can open."""
    ffmpeg = require_ffmpeg()
    ffprobe = _ffprobe_for(ffmpeg)
    result: dict = {'width': None, 'height': None, 'has_audio': False,
                    'duration': None, 'fps': None}

    if ffprobe:
        cmd = [ffprobe, '-v', 'error', '-show_entries',
               'stream=codec_type,width,height,r_frame_rate:format=duration',
               '-of', 'default=noprint_wrappers=1', str(path)]
        out = subprocess.run(cmd, capture_output=True, text=True).stdout
    else:
        # Static bundles often omit ffprobe; ffmpeg's own stderr carries the same
        # stream lines, so parse those instead of adding a hard dependency.
        out = subprocess.run([ffmpeg, '-hide_banner', '-i', str(path)],
                             capture_output=True, text=True).stderr

    for line in out.splitlines():
        line = line.strip()
        if 'Video:' in line and result['width'] is None:
            for token in line.split(','):
                token = token.strip().split(' ')[0]
                if 'x' in token:
                    a, _, b = token.partition('x')
                    if a.isdigit() and b.split()[0].isdigit():
                        result['width'], result['height'] = int(a), int(b.split()[0])
                        break
            if ' fps' in line:
                try:
                    result['fps'] = float(line.split(' fps')[0].split(',')[-1].strip())
                except ValueError:
                    pass
        elif 'Audio:' in line:
            result['has_audio'] = True
        elif line.startswith('width='):
            result['width'] = int(line.split('=')[1])
        elif line.startswith('height='):
            result['height'] = int(line.split('=')[1])
        elif line.startswith('duration='):
            try:
                result['duration'] = float(line.split('=')[1])
            except ValueError:
                pass
        elif line.startswith('codec_type=audio'):
            result['has_audio'] = True

    return result


def convert(source: Path, dest: Path, width: int, height: int,
            fps: Optional[float] = None, bitrate: Optional[str] = None,
            has_audio: bool = True, overwrite: bool = True) -> Path:
    """
    Encode `source` (any format ffmpeg reads, incl. MP4/H.264) into a WotLK AVI.

    Video is letterboxed rather than stretched, so a 16:9 source lands correctly
    in 1024x576 and gets thin bars in 800x448.
    """
    ffmpeg = require_ffmpeg()
    dest = Path(dest)
    dest.parent.mkdir(parents=True, exist_ok=True)

    vf = (f'scale={width}:{height}:force_original_aspect_ratio=decrease,'
          f'pad={width}:{height}:(ow-iw)/2:(oh-ih)/2:color=black,setsar=1')

    cmd = [ffmpeg, '-hide_banner', '-loglevel', 'error',
           '-y' if overwrite else '-n', '-i', str(source)]

    if not has_audio:
        # The client expects two streams; give it a silent one rather than a
        # single-stream file.
        cmd += ['-f', 'lavfi', '-i',
                f'anullsrc=channel_layout=stereo:sample_rate={AUDIO_SAMPLE_RATE}',
                '-shortest']

    cmd += ['-map', '0:v:0', '-map', '0:a:0' if has_audio else '1:a:0',
            '-c:v', 'mpeg4',
            '-vtag', VIDEO_HANDLER.decode(),
            '-pix_fmt', 'yuv420p',
            '-b:v', bitrate or DEFAULT_BITRATE.get(width, FALLBACK_BITRATE),
            '-vf', vf]

    if fps:
        cmd += ['-r', str(fps)]

    cmd += ['-c:a', 'libmp3lame',
            '-ar', str(AUDIO_SAMPLE_RATE),
            '-ac', str(AUDIO_CHANNELS),
            '-b:a', '128k',
            str(dest)]

    logger.debug('ffmpeg: %s', ' '.join(cmd))
    proc = subprocess.run(cmd, capture_output=True, text=True)
    if proc.returncode != 0:
        raise RuntimeError(f'ffmpeg failed for {source.name}:\n{proc.stderr.strip()}')

    # ffmpeg writes biCompression = the fccHandler tag; the client wants DXGM.
    set_video_fourcc(dest)
    return dest


def convert_all(source: Path, out_dir: Path, base_name: str,
                widths: Optional[List[int]] = None,
                fps: Optional[float] = None,
                bitrate: Optional[str] = None) -> List[Tuple[int, Path]]:
    """Produce every client-resolvable variant: <base_name>_<width>.avi."""
    widths = widths or sorted(WOTLK_VARIANTS.keys(), reverse=True)
    probe = probe_source(source)
    results = []

    for width in widths:
        if width not in CLIENT_VARIANTS:
            raise ValueError(
                f'width {width} is not one of the client-resolvable widths '
                f'{sorted(CLIENT_VARIANTS)} (F-200)')
        w, h = CLIENT_VARIANTS[width]
        dest = Path(out_dir) / f'{base_name}_{width}.avi'
        convert(source, dest, w, h, fps=fps, bitrate=bitrate,
                has_audio=probe['has_audio'])
        results.append((width, dest))

    return results
