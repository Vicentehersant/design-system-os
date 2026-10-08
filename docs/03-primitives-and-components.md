# 03 · Primitives & Components

## Layers

| Layer | Examples | May use |
|---|---|---|
| Primitives | `Box`, `Stack`, `Inline`, `Grid`, `Container`, `Text`, `Heading`, `Icon` | Tokens only |
| Components | `Button`, `Input`, `Select`, `Checkbox`, `Badge`, `Card`, `Dialog`, `Tabs`, `Toast`, `Table` | Primitives + tokens |
| Sections / patterns | Hero, feature grid, pricing table, filterable data table, sign-in form | Components + primitives |
| Pages / layouts | Marketing page, app shell, dashboard, settings | Sections |

## The compose-first ladder

Before building anything, check — and write down what you found:

1. **Reuse as-is** — does an existing component already cover this?
2. **Variant / state** — can a new `variant` or `size` on an existing component cover it?
3. **Compose** — can it be built from existing components and primitives?
4. **Tokens** — do the needed tokens exist? If not, add them to the system first.
5. **New component** — last resort, governance-gated ([08](08-governance.md)).

## Build spec — every component ships with all of this

- **Spacing:** spacing-scale tokens only. Peer elements get equal gaps; separation between groups is larger than gaps within a group (Gestalt proximity). Name the tokens used.
- **Elevation:** shadow-scale tokens only. Need a new elevation? Add it to the scale.
- **States, at creation:** default · hover · **focus-visible** (visible ring, ≥ 3:1 against adjacent colors, never removed) · active · disabled · and loading / empty / error where applicable.
- **Responsive:** behavior defined at 375 / 768 / 1280 px.
- **API:** props mirror Figma variant properties (`variant`, `size`, `state`).
- **Docs header:** purpose, when to use / when not, props with allowed values, minimal example, a11y notes.

```tsx
/**
 * Button — triggers an action.
 * Use for actions; use <Link> for navigation.
 * @param variant "primary" | "secondary" | "ghost" | "danger"
 * @param size "sm" | "md" | "lg"
 * @example <Button variant="primary">Save</Button>
 * a11y: icon-only buttons require aria-label; focus ring uses --color-border-focus.
 */
```

## Grids & layout

- Use a 4- or 12-column grid with token gutters (`--space-4` mobile, `--space-6` tablet, `--space-8` desktop).
- Max content width as a token (`--container-max`), not a magic number.
- Prefer intrinsic layouts (`grid-template-columns: repeat(auto-fit, minmax(…))`) over breakpoint-specific hacks.

## Lists & tables

- Tables: sticky header, right-aligned numbers with tabular figures, zebra or dividers (pick one system-wide), row hover, clear empty and loading states.
- Under 768 px, tables become stacked cards or get horizontal scroll with a visible affordance — decide per table and write it in the spec.
- Lists: consistent row height per density (`compact` / `comfortable`), never mixed in one view.

## The components index

Every project keeps `docs/components-index.md`. **A component without a row does not exist for the system** — agents consult the index before building.

| Component | Use (when / when not) | Code | Figma | Variants / states | Last edit |
|---|---|---|---|---|---|
| PriceCard | Plan summary on pricing pages; not for cart totals | `src/components/pricing/PriceCard.tsx` | node `12:340` | default/featured · all states ✓ | 2026-01-12 · +featured variant |

Figma not updated yet? Log `figma: PENDING` in the row — visible debt, never silent omission.

## Definition of "component done"

1. Compose-first check reported
2. Tokens-only spacing and shadows (named)
3. All states including focus-visible
4. Responsive behavior defined
5. Figma mirrored (or debt logged)
6. Index row added/updated and docs current
