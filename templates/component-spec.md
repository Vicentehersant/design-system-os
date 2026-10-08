# Component spec — <ComponentName>

## Purpose
<One sentence. What job does it do?>

**Use when:** <…>
**Don't use when:** <…> → use <Alternative> instead.

## Compose-first check
- Existing component considered: <…> — why not sufficient: <…>
- Composes: <Primitive/Component list>

## API
| Prop | Type | Default | Allowed values | Notes |
|---|---|---|---|---|
| variant | string | `"primary"` | primary · secondary · ghost | Mirrors Figma property |
| size | string | `"md"` | sm · md · lg | |

## Tokens
| Part | Property | Token |
|---|---|---|
| Container | padding | `--space-?` |
| Container | radius | `--radius-?` |
| Container | shadow | `--shadow-?` |
| Label | color | `--color-text-?` |

## States
| State | Change | Token |
|---|---|---|
| default | — | — |
| hover | <…> | <…> |
| focus-visible | 2 px ring, offset 2 px | `--color-border-focus` |
| active | <…> | <…> |
| disabled | <…> | <…> |
| loading / empty / error | <…> | <…> |

## Responsive
| Width | Behavior |
|---|---|
| 375 | <…> |
| 768 | <…> |
| 1280 | <…> |

## Accessibility
- Role / element: <…>
- Required aria: <…>
- Keyboard: <…>
- Contrast pairs: <token × surface = ratio>

## Acceptance criteria
- [ ] `tsc --noEmit` clean
- [ ] Build clean
- [ ] Zero-hex grep clean
- [ ] All states implemented incl. focus-visible
- [ ] Checked at 375 / 768 / 1280
- [ ] Figma component mirrors props (or `figma: PENDING` logged)
- [ ] Components index row added

## Out of scope
<What the implementer must not touch.>
