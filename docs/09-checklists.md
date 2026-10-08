# 09 · Checklists

Copy these into PRs, issues, or agent instructions.

## Starting a system
- [ ] `design.md` created from template, principles written
- [ ] Primitive palettes and scales defined (color, space, radius, shadow, type, motion)
- [ ] Semantic tokens defined for light and dark
- [ ] Contrast pairs table filled; `-text` tokens added for failing accents
- [ ] Figma variable collections mirror tokens with identical names
- [ ] Quality gates in CI (tsc, lint, build, zero-hex)
- [ ] `docs/components-index.md` created

## New token
- [ ] Belongs to a tier; semantic tokens alias primitives
- [ ] Name describes intent, not appearance
- [ ] Added in code **and** Figma
- [ ] Contrast verified in both themes (color tokens)
- [ ] Changelog line

## New / changed component
- [ ] Compose-first ladder checked and reported
- [ ] Spec written (states, tokens, responsive, a11y, acceptance)
- [ ] Spacing and shadows are tokens only
- [ ] default · hover · focus-visible · active · disabled (+ loading/empty/error)
- [ ] 375 / 768 / 1280 checked
- [ ] Docs header current
- [ ] Figma mirrored, or `figma: PENDING` logged
- [ ] Components index row added/updated

## Before merge
- [ ] `tsc --noEmit` clean
- [ ] Lint clean
- [ ] Build clean
- [ ] Zero-hex grep clean
- [ ] No off-scale `px` values or one-off shadows
- [ ] AA contrast verified, including text over images
- [ ] Keyboard pass: tab order, focus visible, escape closes overlays
- [ ] Only the requested area changed

## Release
- [ ] Version bumped per semver rules
- [ ] Deprecations marked with replacements
- [ ] Changelog updated
- [ ] Figma library published
