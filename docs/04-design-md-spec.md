# 04 · The `design.md` spec

`design.md` lives at the project root and is the **single source of truth** for design decisions. Humans read it to understand *why*; agents read it before touching UI.

## Required sections

| # | Section | Contains |
|---|---|---|
| 1 | Overview | Product, audience, tone in 3 lines |
| 2 | Principles | 3–7 project-specific principles |
| 3 | Brand | Palette roles, typefaces, logo usage, imagery direction |
| 4 | Tokens | Where tokens live, tier rules, link to `tokens.css` |
| 5 | Accessibility | Contrast pairs table (incl. `-text` tokens), focus style, motion policy |
| 6 | Layout | Grid, breakpoints, container widths, spacing rhythm |
| 7 | Components | Link to `docs/components-index.md` + reuse ladder |
| 8 | Patterns | Approved sections and when to use each |
| 9 | Figma | File link, variable collections, sync rules |
| 10 | Quality gates | Commands that must pass |
| 11 | Changelog | Dated, one line per significant change |

## Rules

- **Decisions, not essays.** Tables and bullet rules beat paragraphs; agents follow tables.
- **Verifiable.** "Use generous spacing" is useless; "sections are separated by `--space-20` desktop / `--space-12` mobile" is a rule.
- **Linked, not duplicated.** Values live in `tokens.css`; `design.md` names them.
- **Changelog every significant change**, including deferred work ("Figma mirror deferred — see index").

Full template: [`templates/design.md`](../templates/design.md).
