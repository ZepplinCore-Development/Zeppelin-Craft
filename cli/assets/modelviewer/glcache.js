// F-216 picker panes (I-401): WebGL hooks shared by pane.html and glkeep.html.
//
// Program cache. Every link waits for the driver (~200-300 ms each on Windows Firefox,
// ANGLE -> D3D), and the engine links one program per M2 material variant, often the same one
// twice: BONEINFLUENCES is a #define the shader never reads, and retail panes rebuild their
// whole set once the model's skin arrives. Identical sources link once per context; later
// programs alias the first. A context lent by glkeep.html outlives its pane, so its programs
// serve every later card too.
//
// Per context (set by the pane): gl.__diag = its ?diag counters, gl.__nocache = ?noprogcache.
// Lent contexts also record every GL object they create (gl.__objs) so glkeep.html can free
// them when the pane goes.
(function () {
  window.mvGlHooks = function (P) {
    if (P.__mvHooked) return;
    P.__mvHooked = true;
    const alias = new WeakMap(), now = () => performance.now();
    const real = (p) => (p && alias.get(p)) || p;
    const cacheOf = (gl) => gl.__pc || (gl.__pc = { byKey: new Map(), keep: new Set() });
    const timed = (n, k, cnt) => { const o = P[n]; if (!o) return;
      P[n] = function (...a) { const d = this.__diag; if (!d) return o.apply(this, a);
        const t = now(); try { return o.apply(this, a); } finally { d[k] += now() - t; if (cnt) d[cnt]++; } }; };
    ['compileShader', 'getShaderParameter', 'getProgramParameter', 'getShaderInfoLog', 'getProgramInfoLog'].forEach(n => timed(n, 'shader'));
    ['texImage2D', 'texSubImage2D', 'compressedTexImage2D', 'compressedTexSubImage2D', 'bufferData', 'bufferSubData', 'generateMipmap'].forEach(n => timed(n, 'upload'));
    timed('linkProgram', 'shader', 'links');   // the cache below calls this only for real links
    const timedLink = P.linkProgram;

    const kinds = { createBuffer: 'Buffer', createTexture: 'Texture', createFramebuffer: 'Framebuffer', createRenderbuffer: 'Renderbuffer',
      createVertexArray: 'VertexArray', createSampler: 'Sampler', createQuery: 'Query', createTransformFeedback: 'TransformFeedback',
      createShader: 'Shader', createProgram: 'Program', fenceSync: 'Sync' };
    for (const [n, kind] of Object.entries(kinds)) { const o = P[n]; if (!o) continue;
      P[n] = function (...a) { const v = o.apply(this, a); if (this.__objs && v) this.__objs.push([kind, v]); return v; }; }

    const o = {};
    for (const n of ['shaderSource', 'attachShader', 'deleteProgram', 'bindAttribLocation', 'transformFeedbackVaryings']) o[n] = P[n];
    const rec = (p) => p.__rec || (p.__rec = { sh: [], extra: [] });
    P.shaderSource = function (s, src) {
      if (!this.__nocache && src.split('BONEINFLUENCES').length === 2) src = src.replace(/#define BONEINFLUENCES \d+/, '#define BONEINFLUENCES 4');
      s.__src = src; return o.shaderSource.call(this, s, src);
    };
    P.attachShader = function (p, s) { rec(p).sh.push(s); return o.attachShader.call(this, p, s); };
    P.bindAttribLocation = function (p, i, name) { rec(p).extra.push('a' + i + name); return o.bindAttribLocation.call(this, p, i, name); };
    P.transformFeedbackVaryings = function (p, v, m) { rec(p).extra.push('t' + m + v.join()); return o.transformFeedbackVaryings.call(this, p, v, m); };
    P.linkProgram = function (p) {
      if (this.__nocache) return timedLink.call(this, p);
      const c = cacheOf(this), r = rec(p), key = r.sh.map(s => s.__src).sort().join('\0') + '\0' + r.extra.join();
      const hit = c.byKey.get(key);
      if (hit && hit !== p) { alias.set(p, hit); if (this.__diag) this.__diag.shared++; return; }
      c.byKey.set(key, p); c.keep.add(p);
      timedLink.call(this, p);
      if (this.__diag) this.__diag.lastLink = Date.now();
    };
    // cached programs stay alive for the context's life; the engine may drop one and ask again
    P.deleteProgram = function (p) { if (!alias.has(p) && !(this.__pc && this.__pc.keep.has(p))) return o.deleteProgram.call(this, p); };
    for (const n of ['useProgram', 'getProgramParameter', 'getProgramInfoLog', 'getActiveUniform', 'getActiveAttrib', 'getUniformLocation',
      'getAttribLocation', 'getUniform', 'getUniformBlockIndex', 'uniformBlockBinding', 'getActiveUniformBlockParameter', 'getActiveUniformBlockName',
      'getUniformIndices', 'getActiveUniforms', 'getFragDataLocation', 'getTransformFeedbackVarying', 'validateProgram']) {
      const f = P[n]; if (f) P[n] = function (p, ...a) { return f.call(this, real(p), ...a); };
    }
  };

  // A lent context going back to the keeper: free what its pane made (cached programs stay)
  // and put the state back to a fresh context's, so the next pane's engine starts clean.
  window.mvGlReset = function (gl) {
    const keep = gl.__pc ? gl.__pc.keep : new Set();
    for (const [kind, v] of gl.__objs || []) {
      if (kind === 'Program' && keep.has(v)) continue;
      try { gl['delete' + kind](v); } catch (e) {}
    }
    gl.__objs = [];
    const G = gl;
    G.bindFramebuffer(G.FRAMEBUFFER, null); G.bindRenderbuffer(G.RENDERBUFFER, null);
    G.useProgram(null); G.bindVertexArray(null); G.bindTransformFeedback(G.TRANSFORM_FEEDBACK, null);
    const units = G.getParameter(G.MAX_COMBINED_TEXTURE_IMAGE_UNITS);
    for (let u = 0; u < units; u++) {
      G.activeTexture(G.TEXTURE0 + u);
      for (const t of [G.TEXTURE_2D, G.TEXTURE_CUBE_MAP, G.TEXTURE_3D, G.TEXTURE_2D_ARRAY]) G.bindTexture(t, null);
      G.bindSampler(u, null);
    }
    G.activeTexture(G.TEXTURE0);
    for (const t of [G.ARRAY_BUFFER, G.ELEMENT_ARRAY_BUFFER, G.COPY_READ_BUFFER, G.COPY_WRITE_BUFFER, G.PIXEL_PACK_BUFFER,
      G.PIXEL_UNPACK_BUFFER, G.TRANSFORM_FEEDBACK_BUFFER, G.UNIFORM_BUFFER]) G.bindBuffer(t, null);
    for (let i = 0, n = G.getParameter(G.MAX_UNIFORM_BUFFER_BINDINGS); i < n; i++) G.bindBufferBase(G.UNIFORM_BUFFER, i, null);
    for (let i = 0, n = G.getParameter(G.MAX_VERTEX_ATTRIBS); i < n; i++) { G.disableVertexAttribArray(i); G.vertexAttribDivisor(i, 0); G.vertexAttrib4f(i, 0, 0, 0, 1); }
    for (const cap of [G.BLEND, G.CULL_FACE, G.DEPTH_TEST, G.POLYGON_OFFSET_FILL, G.SAMPLE_ALPHA_TO_COVERAGE, G.SAMPLE_COVERAGE,
      G.SCISSOR_TEST, G.STENCIL_TEST, G.RASTERIZER_DISCARD]) G.disable(cap);
    G.enable(G.DITHER);
    G.blendFunc(G.ONE, G.ZERO); G.blendEquation(G.FUNC_ADD); G.blendColor(0, 0, 0, 0);
    G.depthFunc(G.LESS); G.depthMask(true); G.depthRange(0, 1); G.colorMask(true, true, true, true);
    G.clearColor(0, 0, 0, 0); G.clearDepth(1); G.clearStencil(0);
    G.cullFace(G.BACK); G.frontFace(G.CCW); G.lineWidth(1); G.polygonOffset(0, 0); G.sampleCoverage(1, false);
    G.stencilFunc(G.ALWAYS, 0, 0xFFFFFFFF); G.stencilMask(0xFFFFFFFF); G.stencilOp(G.KEEP, G.KEEP, G.KEEP);
    G.hint(G.GENERATE_MIPMAP_HINT, G.DONT_CARE);
    G.pixelStorei(G.PACK_ALIGNMENT, 4); G.pixelStorei(G.UNPACK_ALIGNMENT, 4);
    G.pixelStorei(G.UNPACK_FLIP_Y_WEBGL, false); G.pixelStorei(G.UNPACK_PREMULTIPLY_ALPHA_WEBGL, false);
    G.pixelStorei(G.UNPACK_COLORSPACE_CONVERSION_WEBGL, G.BROWSER_DEFAULT_WEBGL);
    for (const p of [G.PACK_ROW_LENGTH, G.PACK_SKIP_PIXELS, G.PACK_SKIP_ROWS, G.UNPACK_ROW_LENGTH, G.UNPACK_IMAGE_HEIGHT,
      G.UNPACK_SKIP_PIXELS, G.UNPACK_SKIP_ROWS, G.UNPACK_SKIP_IMAGES]) G.pixelStorei(p, 0);
    G.drawBuffers([G.BACK]); G.readBuffer(G.BACK);
    G.viewport(0, 0, G.drawingBufferWidth, G.drawingBufferHeight); G.scissor(0, 0, G.drawingBufferWidth, G.drawingBufferHeight);
    G.clear(G.COLOR_BUFFER_BIT | G.DEPTH_BUFFER_BIT | G.STENCIL_BUFFER_BIT);
    for (let i = 0; i < 32 && G.getError() !== G.NO_ERROR; i++) {}
  };
})();
