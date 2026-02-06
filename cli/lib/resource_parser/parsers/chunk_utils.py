#!/usr/bin/env python3
"""
Shared utilities for parsing WoW binary file chunks.

WoW files (ADT, WMO, M2, etc.) use a chunk-based format:
- 4 bytes: Magic identifier (ASCII, may be reversed)
- 4 bytes: Chunk size (uint32, little-endian)
- N bytes: Chunk data
"""

import struct
from typing import Tuple, Optional, List


def read_chunk_header(
    data: bytes,
    offset: int,
    known_chunks: Optional[List[str]] = None
) -> Tuple[Optional[str], int]:
    """
    Read WoW chunk header (magic + size) with automatic byte order detection.

    Args:
        data: Binary data to read from
        offset: Offset in data where chunk header starts
        known_chunks: Optional list of expected chunk names (e.g., ['MVER', 'MCNK'])
                     If provided, will prefer reversed byte order if it matches

    Returns:
        Tuple of (magic, size) where:
        - magic: 4-character chunk identifier (or None if invalid)
        - size: Chunk data size in bytes

    Example:
        magic, size = read_chunk_header(data, 0, ['MVER', 'MCNK'])
        if magic == 'MCNK':
            chunk_data = data[offset+8:offset+8+size]
    """
    if offset + 8 > len(data):
        return None, 0

    # Read magic (4 bytes)
    magic_bytes = data[offset:offset+4]
    magic = magic_bytes.decode('ascii', errors='ignore')
    magic_reversed = magic_bytes[::-1].decode('ascii', errors='ignore')

    # Read size (4 bytes, little-endian uint32)
    size = struct.unpack('<I', data[offset+4:offset+8])[0]

    # If known_chunks provided, prefer reversed version if it matches
    if known_chunks and magic_reversed in known_chunks:
        return magic_reversed, size

    # Otherwise return normal byte order
    return magic, size


def scan_chunks(
    data: bytes,
    start_offset: int = 0,
    end_offset: Optional[int] = None,
    known_chunks: Optional[List[str]] = None
) -> List[Tuple[str, int, int]]:
    """
    Scan through data and return all chunk headers.

    Args:
        data: Binary data to scan
        start_offset: Offset to start scanning from
        end_offset: Offset to stop scanning (default: end of data)
        known_chunks: Optional list of expected chunk names for byte order detection

    Returns:
        List of tuples: (magic, offset, size) for each chunk found

    Example:
        for magic, offset, size in scan_chunks(data, known_chunks=['MCNK']):
            if magic == 'MCNK':
                process_mcnk(data, offset+8, size)
    """
    chunks = []
    offset = start_offset
    if end_offset is None:
        end_offset = len(data)

    while offset + 8 < end_offset:
        magic, size = read_chunk_header(data, offset, known_chunks)

        if magic is None or size <= 0 or size > 10000000:  # Sanity check
            break

        chunks.append((magic, offset, size))
        offset += 8 + size

    return chunks
