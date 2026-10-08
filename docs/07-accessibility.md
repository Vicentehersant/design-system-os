# 07 · Accessibility

Target: **WCAG 2.2 AA**, enforced at the token and component level so pages inherit it.

## Contrast

| Content | Minimum |
|---|---|
| Body text | 4.5:1 |
| Large text (≥ 24 px, or ≥ 18.66 px bold) | 3:1 |
| UI components & focus indicators | 3:1 against adjacent colors |

- Keep a **contrast pairs table** in `design.md`: every text token × every surface it can appear on, in both themes.
- Brand accents used as text get a dedicated `-text` token ([02](02-tokens.md#the--text-pattern)).
- Text over images, gradients or video: measure against the **worst** region and the worst frame. Add a scrim token if needed.
- Disabled states are exempt from contrast rules but must still be identifiable (not color alone).

## Focus

- Every interactive element has a `:focus-visible` style using `--color-border-focus`, ≥ 3:1, at least 2 px.
- Never `outline: none` without a replacement.
- Focus order follows visual order; dialogs trap focus and return it on close.

## Semantics

- One `h1` per page; heading levels don't skip.
- Buttons for actions, links for navigation.
- Icon-only controls have `aria-label`.
- Form fields have visible labels; errors are announced (`aria-describedby`, `aria-invalid`).
- Status is never conveyed by color alone — pair with text or icon.

## Motion

- Respect `prefers-reduced-motion`: disable parallax, auto-play and large transforms; keep opacity fades.
- No content flashes more than 3 times per second.

## Targets & responsive

- Touch targets ≥ 44 × 44 px (24 × 24 px absolute minimum per WCAG 2.2).
- Content reflows at 320 px width without horizontal scroll (data tables excepted).
- Text resizes to 200 % without loss of content.
