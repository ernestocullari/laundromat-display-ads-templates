# Laundromat Display Ads — Brand Customization Prompt

Use the following prompt when working with Claude Code to customize these templates for a new laundromat client.

---

## Prompt

```
I need you to customize the Laundromat Display Ads Templates for a new client. The templates are located at:

/Users/cullari/Desktop/laundromat-display-ads-templates/

There are 16 ad files total — 8 A-variant (Brand Awareness, with floating bubbles) in the `a/` folder and 8 B-variant (Service-Focused, with suds/bubbles) in the `b/` folder. Each ad is a self-contained `index.html` inside a size folder with a `media/` subfolder for the logo.

Here is the new client's brand information:

**Business Name**: [e.g. "The Bubble Room"]
**Address**: [e.g. "123 Main St, Brooklyn, NY"]
**Hours**: [e.g. "6 AM – 11 PM"]
**Days Open**: [e.g. "OPEN 7 DAYS"]
**Star Rating**: [e.g. "4.9 ★"]
**Review Count**: [e.g. "132 Reviews"]
**Logo File**: [e.g. "/Users/cullari/Desktop/logo.png"]

**Brand Colors**:
- Primary Dark (background gradient dark end): [e.g. #0A0A0A]
- Primary Light (background gradient light end): [e.g. #1A1A2E]
- Accent (CTA buttons, badges, accent text, bottom bar): [e.g. #c44569]
- Accent Highlight (bottom bar gradient end): [e.g. #ffd4e0]
- CTA Text Color (text on buttons/badges): [e.g. #0A0A0A]

**Font** (Google Fonts name): [e.g. "Anton"]

**A-Variant Messaging (Brand Awareness)**:
- Phase 1 brand display (large text, first 3 seconds): [e.g. "THE BUBBLE ROOM"]
- Phase 1 accent word (colored word below brand): [e.g. "NYC"]
- Badge text: [e.g. "Fully Attended"]
- Headline: [e.g. "SEE THE" / "DIFFERENCE"]
- Subheadline (970x250 only): [e.g. "Brooklyn's premier attended laundromat"]
- Feature props (970x250 only): [e.g. "Friendly Staff", "Modern Equipment", "Hablamos Español"]
- CTA button text: [e.g. "GET DIRECTIONS →"]

**B-Variant Messaging (Service-Focused)**:
- Phase 1 brand display: [same as A]
- Phase 1 accent word: [same as A]
- Badge text: [e.g. "Wash-Dry-Fold"]
- Headline: [e.g. "DROP OFF" / "PICK UP FRESH"]
- Subheadline (970x250 only): [e.g. "Drop off your clothes, pick them up fresh and folded"]
- Feature props (970x250 only): [e.g. "Wash-Dry-Fold Service", "Same-Day Available", "Hablamos Español"]
- CTA button text: [e.g. "TRY IT TODAY →"]
- Phase 1.5 transition text (728x90, 320x50 only): [e.g. "TRY WASH-DRY-FOLD SERVICE"]

**Spanish Translations** (provide for all text above):
- [e.g. Phase 1 accent: "NYC", Badge: "Totalmente Atendida", Headline: "VEA LA" / "DIFERENCIA", CTA: "CÓMO LLEGAR →"]

## Instructions

1. **Read** the README-TEMPLATE.md first to understand the placeholder system.

2. **Colors**: Search for `/* {{PRIMARY_DARK}} */`, `/* {{PRIMARY_LIGHT}} */`, `/* {{ACCENT}} */`, `/* {{ACCENT_HIGHLIGHT}} */`, `/* {{CTA_TEXT_COLOR}} */`, and `/* {{ACCENT_RGBA}} */` comments in CSS. Replace the hex value before each comment with the new brand color. For `{{ACCENT_RGBA}}`, convert the accent hex to its `rgba(R,G,B,` equivalent. Remove the placeholder comments after replacing.

3. **Font**: Update the Google Fonts `<link href="...">` URL to load the new font. Replace all `font-family: 'Inter', sans-serif` with the new font family. Remove the `<!-- {{FONT_FAMILY}} -->` comment.

4. **Logo**: Copy the client's logo file into every `media/` folder (all 16 of them) as `logo.png`.

5. **Business info**: Update the persistent brand text, phase 1 display text, address, hours, rating, and review count in both the HTML default text and the `translations` JavaScript object (both `en` and `es` keys).

6. **Messaging**: Update all headline, badge, subheadline, props, and CTA text in both HTML and the translations object.

7. **localStorage key**: Change `'laundromat-lang'` to `'yourbrand-lang'` (e.g. `'bubble-room-lang'`).

8. **Title tags**: Update each `<title>` from "Laundromat Display Ad" to the brand name.

9. **Preview pages**: Update `preview-a.html` and `preview-b.html` titles, subtitles, and the localStorage key in the `setLang()` function.

10. **Phase 1 sizing**: After injecting the brand name, check that the phase 1 text fits within each ad size. The tall ads (160x600, 300x600) stack words vertically — keep each word short. The wide ads (970x250, 728x90, 320x50) display on one line — the brand name must fit. If text overflows, reduce font sizes in the `.phase1-word`, `.phase1-name`, or `.phase1-line1` CSS classes for the affected sizes.

11. **Verify**: Open `preview-a.html` and `preview-b.html` in a browser. Confirm:
    - All 16 ads render with correct colors, font, and logo
    - Phase 1 text doesn't overflow any ad size
    - Language toggle switches EN/ES correctly
    - Animations play (bubbles on A, suds on B)
    - CTA button pulses after appearing

12. **Package**: Zip each size folder individually for DSP upload. Each zip should contain only `index.html` and `media/logo.png`.

Use parallel Task agents to edit multiple files simultaneously — group by shape (wide, rectangle, tall) for efficiency.
```
