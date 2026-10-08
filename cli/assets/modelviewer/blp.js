// BLP2 -> ImageData, for the texture viewer's flat 2D view (F-216).
// Handles the encodings 3.3.5 ships: palette (with 0/1/4/8-bit alpha), DXT1/3/5, ARGB8888.
// decodeBlp(arrayBuffer, mip = 0) -> {width, height, data: Uint8ClampedArray RGBA, info}
(function (root) {
  function rgb565(c) {
    return [((c >> 11) & 31) * 255 / 31 | 0, ((c >> 5) & 63) * 255 / 63 | 0, (c & 31) * 255 / 31 | 0];
  }

  function dxtColors(dv, o, out, oneBitAlpha) {
    const c0 = dv.getUint16(o, true), c1 = dv.getUint16(o + 2, true);
    const a = rgb565(c0), b = rgb565(c1);
    const cols = [a.concat(255), b.concat(255)];
    if (c0 > c1 || !oneBitAlpha) {
      cols.push([0, 1, 2].map(i => (2 * a[i] + b[i]) / 3 | 0).concat(255));
      cols.push([0, 1, 2].map(i => (a[i] + 2 * b[i]) / 3 | 0).concat(255));
    } else {
      cols.push([0, 1, 2].map(i => (a[i] + b[i]) / 2 | 0).concat(255));
      cols.push([0, 0, 0, 0]);
    }
    const bits = dv.getUint32(o + 4, true);
    for (let i = 0; i < 16; i++) out[i] = cols[(bits >> (2 * i)) & 3];
  }

  function decodeDxt(dv, off, w, h, type) {
    const px = new Uint8ClampedArray(w * h * 4);
    const bw = Math.max(1, (w + 3) >> 2), bh = Math.max(1, (h + 3) >> 2);
    const step = type === 1 ? 8 : 16;
    const block = new Array(16), alpha = new Array(16);
    for (let by = 0; by < bh; by++) for (let bx = 0; bx < bw; bx++) {
      const o = off + (by * bw + bx) * step;
      if (type === 3) {                           // DXT3: explicit 4-bit alpha
        for (let i = 0; i < 16; i++) alpha[i] = ((dv.getUint8(o + (i >> 1)) >> ((i & 1) * 4)) & 15) * 17;
      } else if (type === 5) {                    // DXT5: interpolated alpha
        const a0 = dv.getUint8(o), a1 = dv.getUint8(o + 1);
        const pal = [a0, a1];
        if (a0 > a1) for (let i = 1; i < 7; i++) pal.push(((7 - i) * a0 + i * a1) / 7 | 0);
        else { for (let i = 1; i < 5; i++) pal.push(((5 - i) * a0 + i * a1) / 5 | 0); pal.push(0, 255); }
        let bits = 0n;
        for (let i = 0; i < 6; i++) bits |= BigInt(dv.getUint8(o + 2 + i)) << BigInt(8 * i);
        for (let i = 0; i < 16; i++) alpha[i] = pal[Number((bits >> BigInt(3 * i)) & 7n)];
      }
      dxtColors(dv, type === 1 ? o : o + 8, block, type === 1);
      for (let i = 0; i < 16; i++) {
        const x = bx * 4 + (i & 3), y = by * 4 + (i >> 2);
        if (x >= w || y >= h) continue;
        const p = (y * w + x) * 4, c = block[i];
        px[p] = c[0]; px[p + 1] = c[1]; px[p + 2] = c[2];
        px[p + 3] = type === 1 ? c[3] : alpha[i];
      }
    }
    return px;
  }

  function decodeBlp(buf, mip = 0) {
    const dv = new DataView(buf);
    if (dv.getUint32(0, true) !== 0x32504c42) throw new Error('not a BLP2 file');
    const enc = dv.getUint8(8), adepth = dv.getUint8(9), atype = dv.getUint8(10);
    let w = dv.getUint32(12, true), h = dv.getUint32(16, true);
    const offs = [], lens = [];
    for (let i = 0; i < 16; i++) { offs.push(dv.getUint32(20 + 4 * i, true)); lens.push(dv.getUint32(84 + 4 * i, true)); }
    let m = Math.min(mip, 15);
    while (m > 0 && (!offs[m] || !lens[m] || offs[m] + lens[m] > buf.byteLength)) m--;
    w = Math.max(1, w >> m); h = Math.max(1, h >> m);
    const off = offs[m];
    let data;
    const fmt = enc === 1 ? `palette, ${adepth}-bit alpha` : enc === 2 ? ['DXT1', 'DXT3', , , , , , 'DXT5'][atype] || `DXT?${atype}` : 'ARGB8888';
    if (enc === 2) {
      data = decodeDxt(dv, off, w, h, atype === 0 ? 1 : atype === 1 ? 3 : 5);
    } else if (enc === 1) {
      data = new Uint8ClampedArray(w * h * 4);
      const pal = 148, n = w * h;
      for (let i = 0; i < n; i++) {
        const c = dv.getUint8(off + i);
        data[4 * i] = dv.getUint8(pal + 4 * c + 2); data[4 * i + 1] = dv.getUint8(pal + 4 * c + 1);
        data[4 * i + 2] = dv.getUint8(pal + 4 * c); data[4 * i + 3] = 255;
        if (adepth === 8) data[4 * i + 3] = dv.getUint8(off + n + i);
        else if (adepth === 1) data[4 * i + 3] = (dv.getUint8(off + n + (i >> 3)) >> (i & 7)) & 1 ? 255 : 0;
        else if (adepth === 4) data[4 * i + 3] = ((dv.getUint8(off + n + (i >> 1)) >> ((i & 1) * 4)) & 15) * 17;
      }
    } else {                                      // ARGB8888 stored BGRA
      data = new Uint8ClampedArray(w * h * 4);
      for (let i = 0; i < w * h; i++) {
        data[4 * i] = dv.getUint8(off + 4 * i + 2); data[4 * i + 1] = dv.getUint8(off + 4 * i + 1);
        data[4 * i + 2] = dv.getUint8(off + 4 * i); data[4 * i + 3] = dv.getUint8(off + 4 * i + 3);
      }
    }
    return { width: w, height: h, data, info: { format: fmt, alphaDepth: adepth, mip: m,
      fullWidth: dv.getUint32(12, true), fullHeight: dv.getUint32(16, true) } };
  }
  root.decodeBlp = decodeBlp;
})(typeof window !== 'undefined' ? window : globalThis);
