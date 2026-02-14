# Laundromat Display Ads Templates

This repo contains 16 DSP-ready HTML5 display ad templates for laundromat businesses. 8 A-variant (Brand Awareness, floating bubbles) in `a/` and 8 B-variant (Service-Focused, suds/bubbles) in `b/`. Each ad is a self-contained `index.html` + `media/logo.png` inside a size folder.

## Template Structure

```
a/ and b/ each contain:
├── 970x250/   (Billboard)
├── 728x90/    (Leaderboard)
├── 320x50/    (Mobile Leaderboard)
├── 300x250/   (Medium Rectangle)
├── 336x280/   (Large Rectangle)
├── 250x250/   (Square)
├── 160x600/   (Wide Skyscraper)
└── 300x600/   (Half Page)
```

## How to Customize for a New Brand

When the user asks to customize these templates for a new laundromat client, follow these steps exactly:

### 1. Gather Brand Info

Ask the user to provide (or extract from materials they share):

- **Business Name**
- **Address**
- **Hours** and **Days Open**
- **Star Rating** and **Review Count**
- **Logo File** (path on disk)
- **Brand Colors**:
  - Primary Dark (background gradient dark end)
  - Primary Light (background gradient light end)
  - Accent (CTA buttons, badges, accent text, bottom bar)
  - Accent Highlight (bottom bar gradient end)
  - CTA Text Color (text on buttons/badges)
- **Font** (Google Fonts name)
- **A-Variant Messaging**: Phase 1 brand display, accent word, badge, headline, subheadline, feature props, CTA text
- **B-Variant Messaging**: Badge, headline, subheadline, feature props, CTA text, phase 1.5 transition text
- **Spanish Translations** for all text above

### 2. Copy Templates

Copy this entire directory to a new folder named for the client before making changes. Never modify the templates in place.

### 3. Apply Changes (all 16 ad files + 2 preview files)

**Colors**: Search for `/* {{PRIMARY_DARK}} */`, `/* {{PRIMARY_LIGHT}} */`, `/* {{ACCENT}} */`, `/* {{ACCENT_HIGHLIGHT}} */`, `/* {{CTA_TEXT_COLOR}} */`, and `/* {{ACCENT_RGBA}} */` comments in CSS. Replace the hex value before each comment with the new brand color. For `{{ACCENT_RGBA}}`, convert the accent hex to `rgba(R,G,B,`. Remove the placeholder comments after replacing.

**Font**: Update the Google Fonts `<link href="...">` URL. Replace all `font-family: 'Inter', sans-serif` with the new font. Remove the `<!-- {{FONT_FAMILY}} -->` comment.

**Logo**: Copy the client's logo into every `media/` folder (all 16) as `logo.png`.

**Business info**: Update persistent brand text, phase 1 display text, address, hours, rating, review count in both HTML and the `translations` JS object (`en` and `es` keys).

**Messaging**: Update headline, badge, subheadline, props, and CTA text in both HTML and translations.

**localStorage key**: Change `'laundromat-lang'` to `'clientname-lang'`.

**Title tags**: Update `<title>` from "Laundromat Display Ad" to the brand name.

**Preview pages**: Update `preview-a.html` and `preview-b.html` titles, subtitles, and localStorage key in `setLang()`.

### 4. Check Phase 1 Sizing

After injecting the brand name, verify the phase 1 text fits each ad size:
- **Tall ads** (160x600, 300x600) stack words vertically with `.phase1-word` — keep each word short
- **Wide ads** (970x250, 728x90, 320x50) display on one line with `.phase1-name` — brand name must fit
- **Rect ads** (300x250, 336x280, 250x250) use `.phase1-line1` and `.phase1-line2` — two short lines

If text overflows, reduce font sizes in the relevant CSS classes for affected sizes.

### 5. Verify

Open `preview-a.html` and `preview-b.html` in a browser. Confirm:
- All 16 ads render with correct colors, font, and logo
- Phase 1 text doesn't overflow any ad size
- Language toggle switches EN/ES correctly
- Animations play (bubbles on A, suds on B)
- CTA button pulses after appearing

### 6. Package

Zip each size folder individually for DSP upload:
```bash
for size in 970x250 728x90 320x50 300x250 336x280 250x250 160x600 300x600; do
  cd "a/$size" && zip -r "../../a-${size}.zip" . -x ".*" && cd ../..
  cd "b/$size" && zip -r "../../b-${size}.zip" . -x ".*" && cd ../..
done
```

## Efficiency Tips

- Use parallel Task agents grouped by shape: wide (970x250, 728x90, 320x50), rectangle (300x250, 336x280, 250x250), tall (160x600, 300x600)
- A and B variants share the same phase 1 brand display — edit both in the same pass
- The `translations` JS object in each file contains all translatable text — this is the single source of truth for content

## Ad Architecture (Do Not Modify)

- **Phase system**: 3s brand intro → content reveal → 15s loop via `restartAnimations()`
- **Click tag**: `var clickTag = "{{clickMacro}}"` — standard DSP macro
- **i18n**: `data-i18n` attributes + `detectLanguage()` / `setLanguage()` with localStorage persistence
- **Animations**: CSS keyframes only — bubbles (`@keyframes floatUp`), suds (`@keyframes foamWave`, `@keyframes sudsPop`), cascading fadeIn, CTA pulse
- **Bottom accent bar**: Gradient line grows left-to-right as final flourish
