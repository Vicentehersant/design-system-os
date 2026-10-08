# 06 · Figma ↔ code sync

Figma and code are two views of the same system. Neither is "the original"; **the token chain is**.

## Variable collections mirror the token tiers

| Figma collection | Modes | Mirrors |
|---|---|---|
| `Primitives` | — | `--orange-600`, `--space-4`, `--radius-2` |
| `Semantic` | Light / Dark | `--color-text-primary`, `--color-bg-surface` (aliases into Primitives) |
| `Component` (optional) | — | `--button-primary-bg` (aliases into Semantic) |

Semantic variables must **alias** primitives — never hold raw values. Same rule as code.

## Naming parity

| Code (CSS) | Figma variable | Tailwind utility |
|---|---|---|
| `--color-text-primary` | `color/text/primary` | `text-primary` |
| `--color-accent-text` | `color/accent/text` | `text-accent-text` |
| `--space-4` | `space/4` | `p-4`, `gap-4` |

Slashes in Figma become hyphens in CSS. Nothing else changes.

## Direction of sync

- **Token values:** export from one place (a `tokens.json` or Figma variables via an exporter / the Figma API) and generate the other. Never hand-edit both.
- **Components:** Figma component properties mirror code props (`variant`, `size`, `state`). Use Code Connect so devs and agents see the real component import from a Figma node.
- **Styles:** text styles and effect styles (shadows) bind to variables — no detached values.

## Every component change, same session

1. Update code.
2. Update the Figma component (desktop + tablet + phone frames when layouts differ; otherwise note "responsive: single frame").
3. Update the components index row (Figma node id).
4. Can't do Figma now? Mark `figma: PENDING` in the index. Visible debt beats silent drift.

## Documentation pages in Figma

- One cover page per section (Foundations, Components, Patterns).
- Per component: variants grid, do/don't, spacing specs annotated with token names, token references.
- Same names as code, always.
