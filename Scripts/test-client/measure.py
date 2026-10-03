"""Colour sanity numbers for a capture:  measure.py <png> [x,y,w,h]

Prints channel means, mean saturation (after a 3px blur) and the mean/max luminance jump between
adjacent columns. A real colour frame has differing channel means and saturation ~0.3-0.6; I-380's
garbled captures read identical means, ~0.02 saturation and a high column delta.
"""
import colorsys
import sys

from PIL import Image, ImageFilter

im = Image.open(sys.argv[1]).convert('RGB')
if len(sys.argv) > 2:
    cx, cy, cw, ch = map(int, sys.argv[2].split(','))
    im = im.crop((cx, cy, cx + cw, cy + ch))
px = list(im.filter(ImageFilter.GaussianBlur(3)).getdata())
means = [sum(p[c] for p in px) / len(px) for c in range(3)]
sat = [colorsys.rgb_to_hsv(*(c / 255 for c in p))[1] for p in px[::7]]
lum = im.convert('L')
w, h = lum.size
col = [sum(lum.getpixel((x, y)) for y in range(0, h, 4)) / len(range(0, h, 4)) for x in range(w)]
delta = [abs(col[i + 1] - col[i]) for i in range(w - 1)]
print(f"{sys.argv[1].split('/')[-1]}: RGB means {means[0]:.1f} {means[1]:.1f} {means[2]:.1f}  "
      f"mean sat {sum(sat) / len(sat):.3f}  col-delta mean {sum(delta) / len(delta):.2f} max {max(delta):.1f}")
