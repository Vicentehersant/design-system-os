# 05 · Agent-ready specs

AI coding agents are fast, literal and context-limited. They build exactly what the spec says and fill every gap with a guess — usually a hex value, an eyeballed `px`, or a duplicate component. An agent-ready spec removes the gaps.

## What makes a spec agent-ready

1. **Names, not values.** Reference `--color-text-muted`, `--space-4`, `<Button variant="ghost">` — never `#6B7280` or `16px`.
2. **Every state enumerated.** Default, hover, focus-visible, active, disabled, loading, empty, error — with the token for each.
3. **Responsive table.** What changes at 375 / 768 / 1280.
4. **Composition declared.** "Built from `Card` + `Stack` + `Badge`" — so the agent doesn't rebuild them.
5. **Acceptance criteria that a command can check.** If it can't be verified, it isn't a criterion.
6. **Out of scope.** What *not* to touch. Agents love redesigning neighbors.
7. **Context pointers.** Which files to read (design.md section, index row, token file). Pointers, not pasted content — context is scarce.

## Spec skeleton

```md
## Component: PriceCard
Purpose: show one plan's price and CTA on pricing pages.
Composes: Card, Stack, Heading, Text, Badge, Button.
Props: plan (object), featured (boolean, default false).
Tokens: padding --space-6 · gap --space-4 · radius --radius-3 · shadow --shadow-md (featured: --shadow-lg)
States: hover → --shadow-lg · focus-visible on CTA → ring --color-border-focus
Responsive: 375 full width · 768 two columns · 1280 three columns
A11y: price uses <p> not heading; featured badge has text, not color only.
Acceptance: tsc clean · build clean · zero-hex grep clean · axe 0 violations
Out of scope: pricing page layout, checkout.
```

Full template: [`templates/component-spec.md`](../templates/component-spec.md).

## Quality gates

Every change passes all gates before it's "done". Put them in CI and in the agent's instructions.

| Gate | Command (example) | Catches |
|---|---|---|
| Type check | `npx tsc --noEmit` | Broken props, missing variants |
| Lint | `npm run lint` | Unused code, hooks misuse |
| Clean build | `npm run build` | Server/client boundary errors, dead imports |
| **Zero-hex grep** | `./templates/zero-hex-grep.sh src` | Hardcoded colors outside token files |
| Off-scale values | grep for `px` in class names / `shadow-[` | Eyeballed spacing and one-off shadows |
| Contrast | axe / Lighthouse / manual pair table | AA failures |
| Visual check | Screenshot at 375 / 768 / 1280 | Layout regressions |

### Zero-hex grep

Hex colors are allowed **only** in token files. Everywhere else they are drift.

```bash
#!/usr/bin/env bash
# Usage: zero-hex-grep.sh [dir]  — exits 1 if hex colors appear outside token files
DIR="${1:-src}"
MATCHES=$(grep -rnE '#[0-9a-fA-F]{3,8}\b' "$DIR" \
  --include='*.ts' --include='*.tsx' --include='*.js' --include='*.jsx' \
  --include='*.css' --include='*.scss' --include='*.html' --include='*.vue' --include='*.svelte' \
  | grep -vE '(tokens|globals|theme)\.css' \
  | grep -vE '^\S+:[0-9]+:\s*(//|/\*|\*)')
if [ -n "$MATCHES" ]; then echo "Hardcoded hex colors found:"; echo "$MATCHES"; exit 1; fi
echo "Zero-hex: clean"
```

Full script: [`templates/zero-hex-grep.sh`](../templates/zero-hex-grep.sh).

## Instructions block for your agent

Put this in your project's agent instructions file (e.g. `CLAUDE.md`, `AGENTS.md`, `.cursorrules`):

```md
## Design system rules
- Read design.md and docs/components-index.md before building UI.
- Never hardcode colors, spacing, radius, shadows or type. Use tokens; if one is missing, add it to tokens.css and say so.
- Compose-first: reuse → variant → compose → new (justify).
- Every interactive element has focus-visible.
- Done = tsc clean, build clean, zero-hex grep clean, index row updated.
- Fix surgically: do not redesign areas you weren't asked to touch.
```
