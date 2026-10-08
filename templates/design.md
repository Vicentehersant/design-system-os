# design.md — <Project name>

> Single source of truth for design decisions. Values live in `tokens.css`; this file names them and explains why.
> Agents: read this and `docs/components-index.md` before building UI.

## 1. Overview
- **Product:** <one line>
- **Audience:** <who, context of use>
- **Tone:** <three adjectives>

## 2. Principles
1. <Principle — one verifiable sentence>
2. <…>

## 3. Brand
| Role | Token | Notes |
|---|---|---|
| Accent (fills) | `--color-accent` | Decorative / filled surfaces only |
| Accent (text) | `--color-accent-text` | Accent-colored text on light surfaces |
| Surface | `--color-bg-surface` | Cards, panels |

- **Typefaces:** Display `<font>` · Body `<font>` · Mono `<font>`
- **Imagery:** <direction>
- **Iconography:** <set, stroke weight, sizes>

## 4. Tokens
- Source: `src/styles/tokens.css` (Tailwind v4 `@theme`)
- Tiers: primitive → semantic → component. Components never reference primitives.
- Missing token? Add it here + Figma, never inline.

## 5. Accessibility
| Text token | Surface | Light | Dark | Pass |
|---|---|---|---|---|
| `--color-text-primary` | `--color-bg-canvas` | <ratio> | <ratio> | ✓ |
| `--color-accent-text` | `--color-bg-canvas` | <ratio> | <ratio> | ✓ |

- Focus: 2 px ring `--color-border-focus`, offset 2 px
- Motion: respects `prefers-reduced-motion`

## 6. Layout
- Breakpoints: 375 / 768 / 1280 (+1536)
- Grid: 4 cols mobile, 8 tablet, 12 desktop · gutters `--space-4/6/8`
- Container: `--container-max`
- Section rhythm: `--space-12` mobile / `--space-20` desktop

## 7. Components
See `docs/components-index.md`. Reuse ladder: reuse → variant → compose → new (justified).

## 8. Patterns
| Pattern | Use when | Composes |
|---|---|---|
| <Hero> | <…> | <…> |

## 9. Figma
- File: <link>
- Collections: Primitives · Semantic (Light/Dark) · Component
- Names identical to code (`/` ↔ `-`)

## 10. Quality gates
```bash
npx tsc --noEmit && npm run lint && npm run build && ./scripts/zero-hex-grep.sh src
```

## 11. Changelog
- YYYY-MM-DD — <change> (<who>)
