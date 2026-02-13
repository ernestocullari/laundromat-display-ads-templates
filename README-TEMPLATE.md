# Laundromat Display Ads Templates

DSP-ready HTML5 display ad templates for laundromat businesses. 16 ads across 8 IAB sizes, with A (Brand Awareness) and B (Service-Focused) variants. Built-in EN/ES language detection.

## Quick Start

1. Copy this entire folder for your new client
2. Find and replace the placeholders below
3. Drop the client's logo into each `media/` folder as `logo.png`
4. Preview with `preview-a.html` and `preview-b.html`
5. Zip each size folder individually for DSP upload

---

## What to Replace

### Colors

Search for the `/* {{...}} */` comments in CSS to find every occurrence.

| Placeholder | Default | What It Controls |
|-------------|---------|------------------|
| `{{PRIMARY_DARK}}` | `#1A5B8A` | Background gradient dark end |
| `{{PRIMARY_LIGHT}}` | `#2980B9` | Background gradient light end |
| `{{ACCENT}}` | `#F39C12` | CTA button, accent text, badges, bottom bar |
| `{{ACCENT_HIGHLIGHT}}` | `#B5DFF5` | Bottom accent bar gradient end |
| `{{CTA_TEXT_COLOR}}` | `#1A1A2E` | Text color on CTA button and badges |
| `{{ACCENT_RGBA}}` | `rgba(243,156,18,` | Pulse glow animation (update RGB values to match ACCENT) |

### Font

Look for `<!-- {{FONT_FAMILY}} -->` comment. Change:
1. The Google Fonts `<link href="...">` URL
2. All `font-family: 'Inter', sans-serif` in CSS

### Business Info

| Field | Where to Change |
|-------|----------------|
| Brand name | `persistent-brand` div text + `brand.name` in translations |
| Phase 1 name | `.phase1-word` spans (tall) or `.phase1-name` text (wide/rect) |
| Address | HTML default text + `phase1.address` and `address` in translations |
| Logo | Replace `media/logo.png` in each size folder |
| Reviews count | `offer.reviews` in translations ("XX Reviews" → "77 Reviews") |
| Hours | `offer.hours` in translations |
| Star rating | `offer.stars` in translations |
| localStorage key | `'laundromat-lang'` → `'yourbrand-lang'` |

### Text Content (translations object)

Each `index.html` has a `translations` object with `en` and `es` keys. Update all values for the new brand. Key categories:

**A-Variant (Brand Awareness):**
- `phase1.laundry` — Brand suffix shown in phase 1
- `headline.see` / `headline.difference` — Main headline
- `badge.attended` — Feature badge text
- `subhead` — Supporting description
- `prop.attended` / `prop.renovated` / `prop.spanish` — Feature props (970x250)
- `cta.directions` — CTA button text

**B-Variant (Service-Focused):**
- `badge.attended` — Service badge ("Wash-Dry-Fold")
- `headline.see` / `headline.difference` — Service headline
- `subhead` — Service description
- `phase1-5.text` — Transition phase text (728x90, 320x50)
- `cta.action` — CTA button text

---

## Structure

```
laundromat-display-ads-templates/
├── a/                      ← A: Brand Awareness (floating bubbles)
│   ├── 970x250/            ← Billboard
│   ├── 728x90/             ← Leaderboard
│   ├── 320x50/             ← Mobile Leaderboard
│   ├── 300x250/            ← Medium Rectangle
│   ├── 336x280/            ← Large Rectangle
│   ├── 250x250/            ← Square
│   ├── 160x600/            ← Wide Skyscraper
│   └── 300x600/            ← Half Page
├── b/                      ← B: Service-Focused (suds + bubbles)
│   ├── [same 8 sizes]
├── preview-a.html          ← Preview all A variants
├── preview-b.html          ← Preview all B variants
└── README-TEMPLATE.md      ← This file
```

Each size folder contains:
- `index.html` — The ad creative (self-contained, DSP-ready)
- `media/logo.png` — Logo placeholder (replace with client logo)

---

## Built-In Features

- **Language Detection**: Auto-detects EN/ES from browser, persists in localStorage
- **Click Tag**: Uses `{{clickMacro}}` — standard DSP macro
- **15s Animation Loop**: Phase 1 (3s brand intro) → Phase 2 (content + CTA) → restart
- **Cascading Reveals**: Elements fade in sequentially for visual polish
- **CTA Pulse**: Button glows after appearing to draw attention
- **A: Floating Bubbles**: Soap bubble animation throughout the ad
- **B: Suds Effect**: Foam waves + popping bubbles at bottom (large sizes), floating bubbles (728x90, 320x50)
- **Bottom Accent Bar**: Gradient line grows left-to-right as final flourish

---

## Zipping for Upload

Each size folder is self-contained. To create upload-ready zips:

```bash
for size in 970x250 728x90 320x50 300x250 336x280 250x250 160x600 300x600; do
  cd "a/$size" && zip -r "../../a-${size}.zip" . -x ".*" && cd ../..
  cd "b/$size" && zip -r "../../b-${size}.zip" . -x ".*" && cd ../..
done
```
