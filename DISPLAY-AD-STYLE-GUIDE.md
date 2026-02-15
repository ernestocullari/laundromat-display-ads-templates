# Display Ad Style Guide

Complete design specifications for HTML5 display ads across all 12 IAB sizes. These guidelines eliminate guesswork — every value is specified per ad size.

---

## 1. Core Principle

Every ad shows only three things in its main content phase: **Logo**, **2-line headline**, and **CTA button**. Everything else is hidden. Simplicity is the standard.

---

## 2. Ad Size Categories

The 12 sizes fall into 4 layout categories, each with different HTML structure, animation timing, and spacing rules.

| Category | Sizes | Layout | Phases |
|----------|-------|--------|--------|
| **Billboard** | 970x250 | 3-zone horizontal (logo+rating / headline / CTA) | 2 phases |
| **Banners** | 970x90, 728x90, 468x60, 320x50 | 2-zone horizontal (logo+headline / CTA) | 3 phases (has Phase 1.5) |
| **Boxes** | 336x280, 300x250, 250x250 | Vertical stack (logo top, headline center, CTA bottom) | 2 phases |
| **Tall** | 300x600, 320x480, 160x600, 120x600 | Vertical stack (logo top, headline split around logo, address+CTA bottom) | 2 phases |

---

## 3. Color System

| Role | Value | Where Used |
|------|-------|-----------|
| Phase 1 background | Brand primary (e.g. `#42B6ED`) | Phase 1 full background |
| Phase 2 background | `#FFFFFF` | Phase 2 full background — required for logos with white/transparent backgrounds |
| Phase 1 brand name | `#FFFFFF` | Brand name text in Phase 1 |
| Phase 1 accent word | Accent color (e.g. `#FFAB23`) | Category word ("LAUNDROMATS") in Phase 1 |
| Phase 1 address | `#192226` (charcoal) | Location text in Phase 1 |
| Headline line 1 | Dark brand color (e.g. `#2C5A9E`) | First headline in Phase 2 |
| Headline line 2 | Accent color (e.g. `#FFAB23`) | Second headline in Phase 2 |
| CTA button fill | Accent color (e.g. `#FFAB23`) | Button background |
| CTA button text | `#FFFFFF` | Button text |
| Bottom accent bar | `linear-gradient(90deg, accent, brand-primary)` | 2–3px bar at bottom edge |

---

## 4. Typography

**Font**: Roboto (or brand font), loaded via Google Fonts with weights 600, 700, 800, 900.

All headlines and CTA text are `uppercase` with `font-weight: 800`.
Address and body text use `font-weight: 600`.

---

## 5. Animation System

### Two-Phase Ads (Billboard, Boxes, Tall)

| Event | Timing |
|-------|--------|
| Phase 1 fade in | 0s → 0.3s |
| Phase 1 visible | 0.3s → 3.4s |
| Phase 1 fade out | 3.4s → 4s |
| Phase 2 fade in | 4s → 5.1s |
| Phase 2 element cascade | 4.2s → 5.2s (staggered 0.1–0.2s per element) |
| CTA pulse begins | 6–6.5s |
| Bottom accent bar grows | 5–5.4s |

### Three-Phase Ads (Banners: 970x90, 728x90, 468x60, 320x50)

| Event | Timing |
|-------|--------|
| Phase 1 fade in/out | 0s → 4s |
| **Phase 1.5 fade in** | **4s** |
| **Phase 1.5 visible** | **4s → 6.4s** (single bold tagline, e.g. "SEE THE DIFFERENCE") |
| **Phase 1.5 fade out** | **6.4s → 7s** |
| Phase 2 fade in | **7s** → 7.8s |
| Phase 2 element cascade | **7.2s → 7.5s** |
| CTA pulse begins | **8s** |
| Bottom accent bar grows | **7.6s** |

**Why banners have Phase 1.5**: Their constrained height (50–90px) means Phase 2 content appears all at once rather than cascading vertically. The extra transition creates a narrative beat so the viewer isn't jarred by the instant switch.

### Phase 2 Element Cascade Order
1. Logo (or left-group on wide ads)
2. Badge (if visible)
3. Headline line 1
4. Headline line 2
5. Offer text (if visible)
6. CTA button
7. Address (if visible)
8. Bottom accent bar (final flourish)

Each element: `opacity: 0` → `animation: fadeIn 0.4–0.5s ease-out [delay] forwards`

### CTA Pulse Animation
```css
@keyframes pulse {
    0%   { box-shadow: 0 0 0 0 rgba(accent, 0.6); }
    50%  { box-shadow: 0 0 0 8px rgba(accent, 0); }
    100% { box-shadow: 0 0 0 0 rgba(accent, 0.6); }
}
```
Runs infinitely after initial appearance, 2s cycle.

---

## 6. Phase 1 — Brand Intro

Phase 1 displays the brand name, category word, and location on a solid brand-color background. The HTML structure differs by ad shape.

### Phase 1 Text Layout Per Shape

**Wide ads (Billboard + Banners)** — Single horizontal line:
```html
<div class="phase1-name">WASH WORKS <span class="phase1-accent">LAUNDROMATS</span></div>
<div class="phase1-address">Springfield & Westfield, MA</div>
```
- Brand name and accent word on one line, `white-space: nowrap`
- If brand name is too long for 320x50, abbreviate

**Box ads** — Two stacked lines:
```html
<div class="phase1-name">
    <span class="phase1-line1">WASH WORKS</span>
    <span class="phase1-line2">LAUNDROMATS</span>
</div>
<div class="phase1-address">Springfield & Westfield, MA</div>
```
- Line 1: brand name (white), Line 2: category (accent)
- `line-height: 0.9`, vertically centered

**Tall ads** — Each word stacked vertically:
```html
<div class="phase1-name">
    <span class="phase1-word">WASH</span>
    <span class="phase1-word">WORKS</span>
    <span class="phase1-word-accent">LAUNDROMATS</span>
</div>
<div class="phase1-address">Springfield & Westfield, MA</div>
```
- Each word on its own line, `line-height: 0.85`
- Required because at 120px wide, even "WASH WORKS" won't fit on one line
- Add `gap` to Phase 1 container so name block and address aren't jammed together

### Phase 1 Font Sizes

| Size | Brand Name | Accent Word | Address |
|------|-----------|-------------|---------|
| **970x250** | 72px / 46px (line1/line2) | (included in line2) | 16px |
| **970x90** | 36px | (inline) | 12px |
| **728x90** | 30px | (inline) | 11px |
| **468x60** | 20px | (inline) | 9px |
| **320x50** | 14px | (inline) | 8px |
| **336x280** | 42px / 28px (line1/line2) | (included in line2) | 12px |
| **300x250** | 38px / 26px | | 12px |
| **250x250** | 30px / 20px | | 11px |
| **300x600** | 80px per word | 34px | 14px |
| **320x480** | 62px per word | 30px | 12px |
| **160x600** | 44px per word | 18px | 10px |
| **120x600** | 32px per word | 14px | 9px |

### Phase 1 Tall Ad Gap

| Size | Phase 1 `gap` |
|------|--------------|
| 300x600 | 40px |
| 320x480 | 30px |
| 160x600 | 30px |
| 120x600 | 30px |

---

## 7. Phase 1.5 — Tagline Transition (Banners Only)

Only the 4 banner sizes (970x90, 728x90, 468x60, 320x50) use this. A single bold tagline fills the screen between Phase 1 and Phase 2.

```html
<div class="phase1-5">
    <span class="headline-text" data-i18n="phase1-5.text">SEE THE DIFFERENCE</span>
</div>
```

| Size | Font Size |
|------|----------|
| 970x90 | 36px |
| 728x90 | 36px |
| 468x60 | 20px |
| 320x50 | 14px |

---

## 8. Phase 2 — Content Layouts

### 8A. Billboard (970x250)

Unique 3-zone horizontal layout. This is the only ad that shows a star/rating row.

```
┌────────────────────────────────────────────────────────────────┐
│   [LOGO]          │  HEADLINE LINE 1    │   [CTA BUTTON]      │
│   ★★★★★ Attended  │  HEADLINE LINE 2    │                     │
└────────────────────────────────────────────────────────────────┘
```

- `display: flex; align-items: center; gap: 28px; padding: 24px 32px`
- Left group: logo (180px) + stars row
- Center: headline group
- Right group: CTA button
- Headline: 30px
- CTA: 14px font, 14px 28px padding

**Visible elements**: logo, stars-row, headline (2 lines), CTA
**Hidden**: offer-text, brand-name, persistent-brand, sub-headline, props-row, tagline, address, divider

---

### 8B. Banners (970x90, 728x90, 468x60, 320x50)

2-zone horizontal layout. Everything on one row, vertically centered.

```
┌──────────────────────────────────────────────────┐
│   [LOGO]  HEADLINE 1   │           [CTA BUTTON]  │
│           HEADLINE 2   │                          │
└──────────────────────────────────────────────────┘
```

- `display: flex; align-items: center; justify-content: center; gap: [varies]; padding: 0 [varies]`
- Left group: logo + headline stack (side by side)
- CTA: `flex-shrink: 0`, inline (not full-width)
- No vertical padding (content vertically centered in the thin strip)

| Size | Phase 2 Padding | Gap | Logo | Headline | CTA Font | CTA Padding | CTA Text (EN) | CTA Text (ES) |
|------|----------------|-----|------|----------|----------|-------------|---------------|---------------|
| 970x90 | 0 20px | 40px | 110px | 24px | 16px | 14px 26px | FIND A LOCATION → | ENCONTRAR UBICACION → |
| 728x90 | 0 20px | 24px | 100px | 22px | 15px | 13px 22px | FIND A LOCATION → | ENCONTRAR UBICACION → |
| 468x60 | 0 14px | 24px | 80px | 16px | 12px | 10px 14px | FIND US → | ENCONTRAR → |
| 320x50 | 0 10px | 24px | 70px | 13px | 11px | 8px 12px | FIND → | IR → |

**Visible elements**: left-group (logo + headline stack), CTA
**Hidden**: badge, offer-text, brand-name, persistent-brand, stars-row, stars-text, sub-headline, props-row, tagline, address, divider, center-group

**CTA text length rule**: Spanish runs 20–30% longer. Shorten aggressively on small sizes:
- ≥728px: full CTA (up to ~20 chars)
- 468px: medium CTA (up to ~10 chars)
- 320px: minimal CTA (up to ~6 chars)

---

### 8C. Box Ads (336x280, 300x250, 250x250)

Vertical stack with three zones: logo at top, headline centered, CTA at bottom.

```
┌──────────────────────┐
│  25px                │
│       [LOGO]         │
│                      │
│    HEADLINE LINE 1   │  ← vertically centered
│    HEADLINE LINE 2   │     (margin: auto 0)
│                      │
│     [CTA BUTTON]     │
│  25px                │
└──────────────────────┘
```

- `.phase2`: `display: flex; flex-direction: column; align-items: center; justify-content: flex-start`
- Logo pinned to top (natural flow)
- Headline centered in remaining space: `margin: auto 0`
- CTA pinned to bottom: `margin-top: auto`
- CTA is auto-width (not full-width)

| Size | Phase 2 Padding | Gap | Logo | Headline | CTA Font | CTA Padding |
|------|----------------|-----|------|----------|----------|-------------|
| 336x280 | 25px 22px 25px | 7px | 150px | 28px | 12px | 9px 20px |
| 300x250 | 25px 20px 25px | 6px | 140px | 26px | 12px | 9px 20px |
| 250x250 | 25px 18px 25px | 5px | 130px | 22px | 11px | 8px 18px |

**Visible elements**: logo, headline-group (2 lines), CTA
**Hidden**: badge, offer-text, brand-name, persistent-brand, stars-row, stars-text, sub-headline, props-row, tagline, address, divider

---

### 8D. Tall Ads (300x600, 320x480, 160x600, 120x600)

Vertical stack with headline split above and below the logo. Address visible at bottom, CTA below address.

```
┌──────────────┐
│  25px        │
│  [LOGO]      │  ← order: -1 (renders first visually)
│   50px gap   │
│ HEADLINE 1   │
│              │
│ HEADLINE 2   │
│              │
│              │
│ Springfield  │  ← margin-top: auto (pushed to bottom)
│ Westfield    │
│ [CTA BUTTON] │  ← order: 2 (renders last visually)
│  50px        │
└──────────────┘
```

- `.phase2`: `display: flex; flex-direction: column; align-items: center; justify-content: flex-start`
- Logo at top via CSS `order: -1` with `margin-bottom: 50px`
- Address pushed to bottom via `margin-top: auto`
- CTA rendered last via CSS `order: 2`, full-width
- Note: HTML order doesn't match visual order — `order` properties rearrange without changing markup

**Headline split sizing**: On narrow tall ads (120x600, 160x600), the top headline is larger than the bottom. On wider tall ads (300x600, 320x480), both lines are the same size.

| Size | Phase 2 Padding | Gap | Logo | Headline Top | Headline Bottom | CTA Font | CTA Padding | Address Font |
|------|----------------|-----|------|-------------|-----------------|----------|-------------|-------------|
| 300x600 | 25px 12px 50px | 24px | 160px | 48px | 48px | 16px | 16px 24px | 18px |
| 320x480 | 25px 12px 50px | 24px | 160px | 42px | 42px | 15px | 14px 20px | 18px |
| 160x600 | 25px 12px 50px | 24px | 120px | 30px | 22px | 12px | 10px 8px | 14px |
| 120x600 | 25px 12px 50px | 24px | 90px | 20px | 16px | 11px | 9px 6px | 12px |

**Visible elements**: headline-top, logo-section, headline-bottom, address, CTA
**Hidden**: badge, offer-text, brand-name, persistent-brand, stars-row, stars-text, sub-headline, props-row, tagline, divider, offer-column, offer-row

**Sparkle decoration**: Only on wider tall ads (300x600, 320x480). A rotating ✦ character positioned at top-right of logo section. Omit on 120x600 and 160x600 — no room.

---

## 9. Bottom Accent Bar

Every ad has a gradient bar at the absolute bottom edge.

| Ad Width | Bar Height |
|----------|-----------|
| ≥250px | 3px |
| <250px (320x50, 468x60) | 2px |

```css
.bottom-accent {
    position: absolute; bottom: 0; left: 0; width: 100%;
    height: 3px;
    background: linear-gradient(90deg, accent-color, brand-primary);
    transform: scaleX(0);
    animation: growLine 0.5s ease-out [delay] forwards;
}
```

---

## 10. CTA Button Styling

```css
.cta-button {
    background: accent-color;
    color: #FFFFFF;
    font-weight: 800;
    text-transform: uppercase;
    letter-spacing: 0.06em;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
```

| Ad Category | Width | Behavior |
|------------|-------|----------|
| Tall ads | `width: 100%` | Full-width block button |
| Box ads | auto | Auto-width, centered by flex |
| Banner ads | auto | Auto-width, `flex-shrink: 0`, inline with other content |
| Billboard | auto | Auto-width, inside right-group |

---

## 11. Creative Variants

### A Variant — Brand Awareness
- Floating bubble animation (transparent circles rising from bottom)
- Messaging: brand/renovation focused (e.g. "NEWLY RENOVATED")
- Phase 1.5 tagline: "SEE THE DIFFERENCE" (banners only)

### B Variant — Service-Focused
- Suds/foam animation at bottom edge (layered foam waves + popping bubbles)
- Messaging: action-oriented (e.g. "DROP OFF / PICK UP FRESH")
- Phase 1.5 tagline: varies per campaign

Both variants share:
- Identical Phase 1 brand intro
- Same layout structure, spacing, and timing per size
- Same color system and typography

---

## 12. Language Support (EN/ES)

### Implementation
- All translatable text uses `data-i18n="key"` attributes in HTML
- `translations` JS object per file with `en` and `es` keys
- `detectLanguage()` checks localStorage → browser language → defaults to `en`
- `setLanguage(lang)` updates all `[data-i18n]` elements

### Preview Language Toggle
- Preview pages use `postMessage` API to communicate with iframed ads (required for `file://` protocol)
- Each ad listens: `window.addEventListener('message', function(e) { ... })`
- Preview sends: `iframe.contentWindow.postMessage({ type: 'setLang', lang: lang }, '*')`

### Spanish Text Length Warning
Spanish translations are 20–30% longer than English. Always verify:
- CTA text fits button at every size (especially 320x50 and 468x60)
- Phase 1 brand category word fits ad width on narrow tall ads
- Phase 1.5 tagline fits banner height

---

## 13. Complete Logo Width Reference

| Size | Logo Width | Category |
|------|-----------|----------|
| 970x250 | 180px | Billboard |
| 970x90 | 110px | Banner |
| 728x90 | 100px | Banner |
| 468x60 | 80px | Banner |
| 320x50 | 70px | Banner |
| 336x280 | 150px | Box |
| 300x250 | 140px | Box |
| 250x250 | 130px | Box |
| 300x600 | 160px | Tall |
| 320x480 | 160px | Tall |
| 160x600 | 120px | Tall |
| 120x600 | 90px | Tall |

---

## 14. Hidden Elements Per Category

Elements built into the HTML but hidden with `display: none !important` to maintain structural flexibility while keeping the visual clean.

| Element | Billboard | Banners | Boxes | Tall |
|---------|-----------|---------|-------|------|
| .badge | visible | hidden | hidden | hidden |
| .offer-text | hidden | hidden | hidden | hidden |
| .brand-name | hidden | hidden | hidden | hidden |
| .persistent-brand | hidden | hidden | hidden | hidden |
| .stars-row | visible | hidden | hidden | hidden |
| .sub-headline | hidden | hidden | hidden | hidden |
| .props-row | hidden | hidden | hidden | hidden |
| .tagline | hidden | hidden | hidden | hidden |
| .address | hidden | hidden | hidden | **visible** |
| .divider | hidden | hidden | hidden | hidden |
| .center-group | n/a | hidden | n/a | n/a |
| .offer-column/.offer-row | n/a | n/a | n/a | hidden |

---

## 15. Pre-Flight Checklist

Before finalizing any ad set:

- [ ] Phase 1 brand name fits without overflow at every size (especially 320x50 and 120x600)
- [ ] Phase 1 tall ads have gap between name block and address
- [ ] Phase 2 logo is clearly visible at smallest size (90px on 120x600)
- [ ] Headline text doesn't overflow at narrowest width (120px)
- [ ] CTA text fits button at every size — check Spanish version too
- [ ] Spanish toggle works in preview (test both preview-a and preview-b)
- [ ] Animations restart cleanly (test Restart Animations button)
- [ ] Bottom accent bar appears as final element
- [ ] CTA pulse animation triggers ~2s after button appears
- [ ] White Phase 2 background doesn't clash with logo edges
- [ ] Banner ads (970x90, 728x90, 468x60, 320x50) show Phase 1.5 transition
- [ ] 970x250 billboard shows star/rating row that other sizes don't
- [ ] Tall ads show address at bottom, other sizes don't
- [ ] Sparkle decoration only on 300x600 and 320x480, not on narrow tall ads
