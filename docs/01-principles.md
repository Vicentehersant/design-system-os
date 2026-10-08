# 01 · Principles

These are the rules every other document derives from. When two docs disagree, these win.

## 1. One source of truth
`design.md` holds the decisions (what and why). Tokens hold the values. Code and Figma *consume* both — they never redefine them. If a value lives in two places, one of them is already wrong.

## 2. Tokens first, always
Never hardcode a color, spacing, radius, shadow, font size or duration if a token exists. If the token doesn't exist and you need it, **add it to the system** (code + Figma variable) — never inline the value "just this once".

## 3. Compose before you create
Reuse as-is → add a variant/state → compose existing parts → only then propose a new component. Creating from zero is the last resort and must state why nothing composable existed.

## 4. Accessibility is a property of the system, not a pass at the end
WCAG AA is baked into tokens (accessible `-text` variants), components (`focus-visible` at creation) and gates (contrast checks). A component without a focus state is unfinished.

## 5. Consistency over novelty
A slightly less clever solution that reuses the system beats a beautiful one-off. One-offs are how systems die.

## 6. Mobile is not an afterthought
Every component and section defines its behavior at 375 / 768 / 1280 px minimum.

## 7. Specs are executable
A spec is good when an AI coding agent (or a new teammate) can build the component from it without asking questions — and a gate can verify the result.

## 8. Verify, don't trust
Type check, clean build, zero-hex grep, contrast check. "Looks fine" is not a gate.

## 9. Docs that lie are worse than none
Every edit updates its docs in the same session. Stale docs mislead agents faster than they mislead people.

## 10. Same names everywhere
`color-text-primary` in CSS is `color/text/primary` in Figma and `text-primary` in Tailwind. Renaming in one place means renaming in all.
