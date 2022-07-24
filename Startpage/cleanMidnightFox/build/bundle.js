var app = (function () {
  "use strict";
  function t() {}
  function e(t) {
    return t();
  }
  function n() {
    return Object.create(null);
  }
  function o(t) {
    t.forEach(e);
  }
  function l(t) {
    return "function" == typeof t;
  }
  function s(t, e) {
    return t != t
      ? e == e
      : t !== e || (t && "object" == typeof t) || "function" == typeof t;
  }
  let a, i;
  function r(t, e) {
    return a || (a = document.createElement("a")), (a.href = e), t === a.href;
  }
  function c(t, e) {
    t.appendChild(e);
  }
  function u(t, e, n) {
    t.insertBefore(e, n || null);
  }
  function d(t) {
    t.parentNode.removeChild(t);
  }
  function f(t, e) {
    for (let n = 0; n < t.length; n += 1) t[n] && t[n].d(e);
  }
  function m(t) {
    return document.createElement(t);
  }
  function h(t) {
    return document.createTextNode(t);
  }
  function g() {
    return h(" ");
  }
  function p(t, e, n, o) {
    return t.addEventListener(e, n, o), () => t.removeEventListener(e, n, o);
  }
  function v(t, e, n) {
    null == n
      ? t.removeAttribute(e)
      : t.getAttribute(e) !== n && t.setAttribute(e, n);
  }
  function w(t, e) {
    (e = "" + e), t.wholeText !== e && (t.data = e);
  }
  function $(t, e) {
    t.value = null == e ? "" : e;
  }
  function y(t, e) {
    for (let n = 0; n < t.options.length; n += 1) {
      const o = t.options[n];
      if (o.__value === e) return void (o.selected = !0);
    }
    t.selectedIndex = -1;
  }
  function b(t) {
    i = t;
  }
  const x = [],
    _ = [],
    k = [],
    C = [],
    S = Promise.resolve();
  let E = !1;
  function M(t) {
    k.push(t);
  }
  const I = new Set();
  let O = 0;
  function A() {
    const t = i;
    do {
      for (; O < x.length; ) {
        const t = x[O];
        O++, b(t), H(t.$$);
      }
      for (b(null), x.length = 0, O = 0; _.length; ) _.pop()();
      for (let t = 0; t < k.length; t += 1) {
        const e = k[t];
        I.has(e) || (I.add(e), e());
      }
      k.length = 0;
    } while (x.length);
    for (; C.length; ) C.pop()();
    (E = !1), I.clear(), b(t);
  }
  function H(t) {
    if (null !== t.fragment) {
      t.update(), o(t.before_update);
      const e = t.dirty;
      (t.dirty = [-1]),
        t.fragment && t.fragment.p(t.ctx, e),
        t.after_update.forEach(M);
    }
  }
  const K = new Set();
  function N(t, e) {
    -1 === t.$$.dirty[0] &&
      (x.push(t), E || ((E = !0), S.then(A)), t.$$.dirty.fill(0)),
      (t.$$.dirty[(e / 31) | 0] |= 1 << e % 31);
  }
  function j(s, a, r, c, u, f, m, h = [-1]) {
    const g = i;
    b(s);
    const p = (s.$$ = {
      fragment: null,
      ctx: null,
      props: f,
      update: t,
      not_equal: u,
      bound: n(),
      on_mount: [],
      on_destroy: [],
      on_disconnect: [],
      before_update: [],
      after_update: [],
      context: new Map(a.context || (g ? g.$$.context : [])),
      callbacks: n(),
      dirty: h,
      skip_bound: !1,
      root: a.target || g.$$.root,
    });
    m && m(p.root);
    let v = !1;
    if (
      ((p.ctx = r
        ? r(s, a.props || {}, (t, e, ...n) => {
            const o = n.length ? n[0] : e;
            return (
              p.ctx &&
                u(p.ctx[t], (p.ctx[t] = o)) &&
                (!p.skip_bound && p.bound[t] && p.bound[t](o), v && N(s, t)),
              e
            );
          })
        : []),
      p.update(),
      (v = !0),
      o(p.before_update),
      (p.fragment = !!c && c(p.ctx)),
      a.target)
    ) {
      if (a.hydrate) {
        const t = (function (t) {
          return Array.from(t.childNodes);
        })(a.target);
        p.fragment && p.fragment.l(t), t.forEach(d);
      } else p.fragment && p.fragment.c();
      a.intro && (w = s.$$.fragment) && w.i && (K.delete(w), w.i($)),
        (function (t, n, s, a) {
          const {
            fragment: i,
            on_mount: r,
            on_destroy: c,
            after_update: u,
          } = t.$$;
          i && i.m(n, s),
            a ||
              M(() => {
                const n = r.map(e).filter(l);
                c ? c.push(...n) : o(n), (t.$$.on_mount = []);
              }),
            u.forEach(M);
        })(s, a.target, a.anchor, a.customElement),
        A();
    }
    var w, $;
    b(g);
  }
  function z(t, e, n) {
    const o = t.slice();
    return (o[21] = e[n]), o;
  }
  function D(t, e, n) {
    const o = t.slice();
    return (o[21] = e[n]), o;
  }
  function L(t, e, n) {
    const o = t.slice();
    return (o[21] = e[n]), o;
  }
  function T(t) {
    let e, n, l, s, a, i, r, f, h, w, b, x, _, k, C, S, E, I, O, A, H, K;
    return {
      c() {
        (e = m("div")),
          (n = m("h2")),
          (n.textContent = "Settings"),
          (l = g()),
          (s = m("div")),
          (s.textContent = "Name"),
          (a = g()),
          (i = m("input")),
          (r = g()),
          (f = m("div")),
          (f.textContent = "Location"),
          (h = g()),
          (w = m("input")),
          (b = g()),
          (x = m("div")),
          (x.textContent = "Openweathermap API key"),
          (_ = g()),
          (k = m("input")),
          (C = g()),
          (S = m("div")),
          (S.textContent = "Units"),
          (E = g()),
          (I = m("select")),
          (O = m("option")),
          (O.textContent = "metric"),
          (A = m("option")),
          (A.textContent = "imperial"),
          v(n, "id", "settings-header"),
          v(n, "class", "svelte-wdado1"),
          v(s, "class", "label svelte-wdado1"),
          v(i, "type", "text"),
          v(i, "class", "svelte-wdado1"),
          v(f, "class", "label svelte-wdado1"),
          v(w, "type", "text"),
          v(w, "class", "svelte-wdado1"),
          v(x, "class", "label svelte-wdado1"),
          v(k, "type", "text"),
          v(k, "class", "svelte-wdado1"),
          v(S, "class", "label svelte-wdado1"),
          (O.__value = "metric"),
          (O.value = O.__value),
          (A.__value = "imperial"),
          (A.value = A.__value),
          v(I, "class", "svelte-wdado1"),
          void 0 === t[10].units && M(() => t[17].call(I)),
          v(e, "id", "settings"),
          v(e, "class", "svelte-wdado1");
      },
      m(o, d) {
        u(o, e, d),
          c(e, n),
          c(e, l),
          c(e, s),
          c(e, a),
          c(e, i),
          $(i, t[10].name),
          c(e, r),
          c(e, f),
          c(e, h),
          c(e, w),
          $(w, t[10].location),
          c(e, b),
          c(e, x),
          c(e, _),
          c(e, k),
          $(k, t[10].apiKey),
          c(e, C),
          c(e, S),
          c(e, E),
          c(e, I),
          c(I, O),
          c(I, A),
          y(I, t[10].units),
          H ||
            ((K = [
              p(i, "input", t[14]),
              p(w, "input", t[15]),
              p(k, "input", t[16]),
              p(I, "change", t[17]),
            ]),
            (H = !0));
      },
      p(t, e) {
        1024 & e && i.value !== t[10].name && $(i, t[10].name),
          1024 & e && w.value !== t[10].location && $(w, t[10].location),
          1024 & e && k.value !== t[10].apiKey && $(k, t[10].apiKey),
          1024 & e && y(I, t[10].units);
      },
      d(t) {
        t && d(e), (H = !1), o(K);
      },
    };
  }
  function q(t) {
    let e,
      n,
      o,
      l,
      s,
      a,
      i,
      r,
      $,
      y,
      b,
      x,
      _,
      k,
      C,
      S,
      E,
      M,
      I,
      O,
      A,
      H,
      K,
      N = t[10].name ? ", " + t[10].name : "",
      j = t[3] && P(t),
      T = t[10].links[0],
      q = [];
    for (let e = 0; e < T.length; e += 1) q[e] = J(L(t, T, e));
    let R = t[10].links[1],
      U = [];
    for (let e = 0; e < R.length; e += 1) U[e] = B(D(t, R, e));
    let Y = t[10].links[2],
      F = [];
    for (let e = 0; e < Y.length; e += 1) F[e] = G(z(t, Y, e));
    return {
      c() {
        (e = m("div")),
          (n = m("div")),
          (o = m("h1")),
          (l = h("Good ")),
          (s = h(t[6])),
          (a = h(N)),
          (i = h(".")),
          (r = g()),
          ($ = m("h2")),
          (y = h("Today is ")),
          (b = h(t[7])),
          (x = h(".")),
          (_ = g()),
          (k = m("div")),
          j && j.c(),
          (C = g()),
          (S = m("div")),
          (E = m("div"));
        for (let t = 0; t < q.length; t += 1) q[t].c();
        (M = g()), (I = m("div"));
        for (let t = 0; t < U.length; t += 1) U[t].c();
        (O = g()), (A = m("div"));
        for (let t = 0; t < F.length; t += 1) F[t].c();
        v(o, "id", "greeting"),
          v(o, "class", "svelte-wdado1"),
          v($, "id", "date"),
          v($, "class", "svelte-wdado1"),
          v(n, "id", "heading"),
          v(k, "id", "weather-container"),
          v(k, "class", "svelte-wdado1"),
          v(e, "id", "heading-container"),
          v(e, "class", "svelte-wdado1"),
          v(E, "class", "link-column svelte-wdado1"),
          v(E, "id", "link-column-1"),
          v(I, "class", "link-column svelte-wdado1"),
          v(I, "id", "link-column-2"),
          v(A, "class", "link-column svelte-wdado1"),
          v(A, "id", "link-column-3"),
          v(S, "id", "links"),
          v(S, "class", "svelte-wdado1");
      },
      m(d, f) {
        u(d, e, f),
          c(e, n),
          c(n, o),
          c(o, l),
          c(o, s),
          c(o, a),
          c(o, i),
          c(n, r),
          c(n, $),
          c($, y),
          c($, b),
          c($, x),
          c(e, _),
          c(e, k),
          j && j.m(k, null),
          u(d, C, f),
          u(d, S, f),
          c(S, E);
        for (let t = 0; t < q.length; t += 1) q[t].m(E, null);
        c(S, M), c(S, I);
        for (let t = 0; t < U.length; t += 1) U[t].m(I, null);
        c(S, O), c(S, A);
        for (let t = 0; t < F.length; t += 1) F[t].m(A, null);
        H || ((K = p(k, "click", t[11])), (H = !0));
      },
      p(t, e) {
        if (
          (64 & e && w(s, t[6]),
          1024 & e &&
            N !== (N = t[10].name ? ", " + t[10].name : "") &&
            w(a, N),
          128 & e && w(b, t[7]),
          t[3]
            ? j
              ? j.p(t, e)
              : ((j = P(t)), j.c(), j.m(k, null))
            : j && (j.d(1), (j = null)),
          1024 & e)
        ) {
          let n;
          for (T = t[10].links[0], n = 0; n < T.length; n += 1) {
            const o = L(t, T, n);
            q[n] ? q[n].p(o, e) : ((q[n] = J(o)), q[n].c(), q[n].m(E, null));
          }
          for (; n < q.length; n += 1) q[n].d(1);
          q.length = T.length;
        }
        if (1024 & e) {
          let n;
          for (R = t[10].links[1], n = 0; n < R.length; n += 1) {
            const o = D(t, R, n);
            U[n] ? U[n].p(o, e) : ((U[n] = B(o)), U[n].c(), U[n].m(I, null));
          }
          for (; n < U.length; n += 1) U[n].d(1);
          U.length = R.length;
        }
        if (1024 & e) {
          let n;
          for (Y = t[10].links[2], n = 0; n < Y.length; n += 1) {
            const o = z(t, Y, n);
            F[n] ? F[n].p(o, e) : ((F[n] = G(o)), F[n].c(), F[n].m(A, null));
          }
          for (; n < F.length; n += 1) F[n].d(1);
          F.length = Y.length;
        }
      },
      d(t) {
        t && d(e),
          j && j.d(),
          t && d(C),
          t && d(S),
          f(q, t),
          f(U, t),
          f(F, t),
          (H = !1),
          K();
      },
    };
  }
  function P(t) {
    let e, n, o, l, s, a;
    return {
      c() {
        (e = m("div")),
          (n = h(t[5])),
          (o = h("°")),
          (l = g()),
          (s = m("div")),
          v(e, "id", "temperature"),
          v(e, "class", "svelte-wdado1"),
          v(s, "class", (a = "weather-icon " + t[4] + " svelte-wdado1"));
      },
      m(t, a) {
        u(t, e, a), c(e, n), c(e, o), u(t, l, a), u(t, s, a);
      },
      p(t, e) {
        32 & e && w(n, t[5]),
          16 & e &&
            a !== (a = "weather-icon " + t[4] + " svelte-wdado1") &&
            v(s, "class", a);
      },
      d(t) {
        t && d(e), t && d(l), t && d(s);
      },
    };
  }
  function J(t) {
    let e,
      n,
      o,
      l,
      s,
      a,
      i,
      r,
      f = t[21].name + "";
    return {
      c() {
        (e = m("a")),
          (n = m("span")),
          (n.textContent = ">"),
          (o = g()),
          (l = m("span")),
          (s = h(f)),
          (i = g()),
          (r = m("br")),
          v(n, "class", "arrow svelte-wdado1"),
          v(l, "class", "text svelte-wdado1"),
          v(e, "href", (a = t[21].url)),
          v(e, "class", "svelte-wdado1");
      },
      m(t, a) {
        u(t, e, a), c(e, n), c(e, o), c(e, l), c(l, s), u(t, i, a), u(t, r, a);
      },
      p(t, n) {
        1024 & n && f !== (f = t[21].name + "") && w(s, f),
          1024 & n && a !== (a = t[21].url) && v(e, "href", a);
      },
      d(t) {
        t && d(e), t && d(i), t && d(r);
      },
    };
  }
  function B(t) {
    let e,
      n,
      o,
      l,
      s,
      a,
      i,
      r,
      f = t[21].name + "";
    return {
      c() {
        (e = m("a")),
          (n = m("span")),
          (n.textContent = ">"),
          (o = g()),
          (l = m("span")),
          (s = h(f)),
          (i = g()),
          (r = m("br")),
          v(n, "class", "arrow svelte-wdado1"),
          v(l, "class", "text svelte-wdado1"),
          v(e, "href", (a = t[21].url)),
          v(e, "class", "svelte-wdado1");
      },
      m(t, a) {
        u(t, e, a), c(e, n), c(e, o), c(e, l), c(l, s), u(t, i, a), u(t, r, a);
      },
      p(t, n) {
        1024 & n && f !== (f = t[21].name + "") && w(s, f),
          1024 & n && a !== (a = t[21].url) && v(e, "href", a);
      },
      d(t) {
        t && d(e), t && d(i), t && d(r);
      },
    };
  }
  function G(t) {
    let e,
      n,
      o,
      l,
      s,
      a,
      i,
      r,
      f = t[21].name + "";
    return {
      c() {
        (e = m("a")),
          (n = m("span")),
          (n.textContent = ">"),
          (o = g()),
          (l = m("span")),
          (s = h(f)),
          (i = g()),
          (r = m("br")),
          v(n, "class", "arrow svelte-wdado1"),
          v(l, "class", "text svelte-wdado1"),
          v(e, "href", (a = t[21].url)),
          v(e, "class", "svelte-wdado1");
      },
      m(t, a) {
        u(t, e, a), c(e, n), c(e, o), c(e, l), c(l, s), u(t, i, a), u(t, r, a);
      },
      p(t, n) {
        1024 & n && f !== (f = t[21].name + "") && w(s, f),
          1024 & n && a !== (a = t[21].url) && v(e, "href", a);
      },
      d(t) {
        t && d(e), t && d(i), t && d(r);
      },
    };
  }
  function R(e) {
    let n, l, s, a, i, f, $, y, b, x, _, k, C, S, E, M, I, O, A;
    function H(t, e) {
      return t[1] ? T : q;
    }
    let K = H(e),
      N = K(e);
    return {
      c() {
        (n = m("main")),
          (l = m("div")),
          (s = m("div")),
          (a = m("img")),
          (f = g()),
          ($ = m("div")),
          (y = h(e[9])),
          (b = h("-")),
          (x = h(e[8])),
          (_ = g()),
          (k = m("div")),
          N.c(),
          (C = g()),
          (S = m("div")),
          (E = m("button")),
          (E.textContent = "settings"),
          (M = g()),
          (I = m("a")),
          (I.textContent = "v1.2.5"),
          v(a, "id", "image"),
          r(a.src, (i = "gifs/" + e[2] + ".gif")) || v(a, "src", i),
          v(a, "alt", ""),
          v(a, "class", "svelte-wdado1"),
          v($, "id", "time"),
          v($, "class", "svelte-wdado1"),
          v(s, "id", "image-container"),
          v(s, "class", "svelte-wdado1"),
          v(k, "id", "box"),
          v(k, "class", "svelte-wdado1"),
          v(l, "id", "content"),
          v(l, "class", "svelte-wdado1"),
          v(E, "id", "settings-button"),
          v(E, "class", "svelte-wdado1"),
          v(I, "href", "https://github.com/refact0r/startpage"),
          v(I, "id", "version"),
          v(I, "class", "svelte-wdado1"),
          v(S, "id", "corner"),
          v(S, "class", "svelte-wdado1"),
          v(n, "class", "svelte-wdado1");
      },
      m(t, o) {
        u(t, n, o),
          c(n, l),
          c(l, s),
          c(s, a),
          c(s, f),
          c(s, $),
          c($, y),
          c($, b),
          c($, x),
          c(l, _),
          c(l, k),
          N.m(k, null),
          c(n, C),
          c(n, S),
          c(S, E),
          c(S, M),
          c(S, I),
          O || ((A = [p(a, "click", e[13]), p(E, "click", e[18])]), (O = !0));
      },
      p(t, [e]) {
        4 & e && !r(a.src, (i = "gifs/" + t[2] + ".gif")) && v(a, "src", i),
          512 & e && w(y, t[9]),
          256 & e && w(x, t[8]),
          K === (K = H(t)) && N
            ? N.p(t, e)
            : (N.d(1), (N = K(t)), N && (N.c(), N.m(k, null)));
      },
      i: t,
      o: t,
      d(t) {
        t && d(n), N.d(), (O = !1), o(A);
      },
    };
  }
  function U(t) {
    return t < 10 ? "0" + t : t;
  }
  function Y(e, n, o) {
    let l,
      s,
      a,
      i,
      r,
      c = t,
      u = () => (
        c(),
        (c = (function (e, ...n) {
          if (null == e) return t;
          const o = e.subscribe(...n);
          return o.unsubscribe ? () => o.unsubscribe() : o;
        })(d, (t) => o(10, (r = t)))),
        d
      );
    e.$$.on_destroy.push(() => c());
    let { config: d } = n;
    u();
    let f,
      m = !1,
      h = Math.floor(5 * Math.random()) + 1,
      g = new Date(),
      p = "none",
      v = 0;
    async function w() {
      const t = await fetch(
        `http://api.openweathermap.org/data/2.5/weather?q=${r.location}&units=${r.units}&appid=${r.apiKey}`
      );
      if (!t.ok)
        return (
          console.log(t),
          void console.warn(
            "Your Openweathermap API key is probably missing or invalid."
          )
        );
      if (
        (o(3, (f = await t.json())),
        console.log(f),
        o(5, (v = Math.round(f.main.temp))),
        "Clear" === f.weather[0].main)
      ) {
        let t = Math.floor(g / 1e3);
        t < f.sys.sunrise || t > f.sys.sunset
          ? o(4, (p = "moon"))
          : o(4, (p = "sun"));
      } else
        "Rain" === f.weather[0].main ||
        "Drizzle" === f.weather[0].main ||
        "Thunderstorm" === f.weather[0].main
          ? o(4, (p = "rain"))
          : "Snow" === f.weather[0].main
          ? o(4, (p = "snow"))
          : o(4, (p = "cloud"));
    }
    setInterval(() => {
      o(12, (g = new Date()));
    }, 1e3),
      setInterval(() => {
        w();
      }, 3e5),
      d.subscribe((t) => {
        w();
      });
    return (
      (e.$$set = (t) => {
        "config" in t && u(o(0, (d = t.config)));
      }),
      (e.$$.update = () => {
        4096 & e.$$.dirty &&
          o(9, (l = U(g.getHours() % 12 == 0 ? 12 : g.getHours() % 12))),
          4096 & e.$$.dirty && o(8, (s = U(g.getMinutes()))),
          4096 & e.$$.dirty &&
            o(
              7,
              (a = g.toLocaleDateString("en", {
                weekday: "long",
                year: "numeric",
                month: "long",
                day: "numeric",
              }))
            ),
          4096 & e.$$.dirty &&
            o(
              6,
              (i =
                g.getHours() < 2
                  ? "night"
                  : g.getHours() < 12
                  ? "morning"
                  : g.getHours() < 18
                  ? "afternoon"
                  : g.getHours() < 22
                  ? "evening"
                  : "night")
            );
      }),
      [
        d,
        m,
        h,
        f,
        p,
        v,
        i,
        a,
        s,
        l,
        r,
        w,
        g,
        () => o(2, (h = Math.floor(5 * Math.random()) + 1)),
        function () {
          (r.name = this.value), d.set(r);
        },
        function () {
          (r.location = this.value), d.set(r);
        },
        function () {
          (r.apiKey = this.value), d.set(r);
        },
        function () {
          (r.units = (function (t) {
            const e = t.querySelector(":checked") || t.options[0];
            return e && e.__value;
          })(this)),
            d.set(r);
        },
        () => o(1, (m = !m)),
      ]
    );
  }
  const F = [];
  const Q = (function (e, n = t) {
    let o;
    const l = new Set();
    function a(t) {
      if (s(e, t) && ((e = t), o)) {
        const t = !F.length;
        for (const t of l) t[1](), F.push(t, e);
        if (t) {
          for (let t = 0; t < F.length; t += 2) F[t][0](F[t + 1]);
          F.length = 0;
        }
      }
    }
    return {
      set: a,
      update: function (t) {
        a(t(e));
      },
      subscribe: function (s, i = t) {
        const r = [s, i];
        return (
          l.add(r),
          1 === l.size && (o = n(a) || t),
          s(e),
          () => {
            l.delete(r), 0 === l.size && (o(), (o = null));
          }
        );
      },
    };
  })(
    JSON.parse(localStorage.getItem("config")) ?? {
      name: "RAY",
      location: "Seattle",
      units: "imperial",
      apiKey: "",
      links: [
        [
          { name: "gmail", url: "https://mail.google.com" },
          { name: "office", url: "https://personal.onlyoffice.com/" },
          { name: "drive", url: "https://drive.google.com" },
          { name: "docs", url: "https://docs.google.com" },
        ],
        [
          { name: "github", url: "https://github.com" },
          { name: "translate", url: "https://translate.google.com" },
          { name: "netlify", url: "https://app.netlify.com/" },
          { name: "type", url: "https://monkeytype.com" },
        ],
        [
          { name: "youtube", url: "https://youtube.com" },
          { name: "ytmusic", url: "https://music.youtube.com/" },
          { name: "reddit", url: "https://reddit.com" },
          { name: "anilist", url: "https://anilist.co/" },
        ],
      ],
    }
  );
  Q.subscribe((t) => {
    localStorage.setItem("config", JSON.stringify(t));
  });
  return new (class extends class {
    $destroy() {
      !(function (t, e) {
        const n = t.$$;
        null !== n.fragment &&
          (o(n.on_destroy),
          n.fragment && n.fragment.d(e),
          (n.on_destroy = n.fragment = null),
          (n.ctx = []));
      })(this, 1),
        (this.$destroy = t);
    }
    $on(t, e) {
      const n = this.$$.callbacks[t] || (this.$$.callbacks[t] = []);
      return (
        n.push(e),
        () => {
          const t = n.indexOf(e);
          -1 !== t && n.splice(t, 1);
        }
      );
    }
    $set(t) {
      var e;
      this.$$set &&
        ((e = t), 0 !== Object.keys(e).length) &&
        ((this.$$.skip_bound = !0), this.$$set(t), (this.$$.skip_bound = !1));
    }
  } {
    constructor(t) {
      super(), j(this, t, Y, R, s, { config: 0 });
    }
  })({ target: document.body, props: { config: Q } });
})();
//# sourceMappingURL=bundle.js.map
