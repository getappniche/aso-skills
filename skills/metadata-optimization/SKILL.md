---
name: metadata-optimization
description: Draft optimized App Store title, subtitle, keyword field, and description variants with exact character counts. Use when the user wants to rewrite store metadata, improve ASO, or prepare a metadata A/B test.
---

# Metadata Optimization

Write store metadata that a reviewer would approve and a search algorithm would reward.

## Requirements

Works standalone. With the GetAppNiche MCP connected, ground the draft in data first:
`get_app_detail` for the app's current metadata and `get_keyword_difficulty` /
`batch_keyword_difficulty` (10 credits per keyword) for the terms you're about to
spend title characters on. If a `keyword-research` skill run already produced a
"target now" list in this conversation, reuse it — don't re-score.

## Hard limits (Apple App Store)

- Title: **30 chars** · Subtitle: **30 chars** · Keyword field: **100 chars**
- Keyword field: comma-separated, no spaces after commas, no duplicates of words
  already in title/subtitle (they're already indexed), no plurals of included
  singulars, no competitor brand names.

Google Play: title **30**, short description **80**, long description **4000** —
keywords are extracted from natural description text instead of a keyword field.

## Workflow

1. **Inventory.** Current title/subtitle/keywords (from `get_app_detail` or the user),
   the target keyword list, and the one differentiator the app owns.
2. **Allocate characters by value.** Highest-traffic viable keyword goes in the title;
   next tier in the subtitle; the rest into the keyword field. Brand name earns its
   spot only if people actually search for it.
3. **Draft 3 variants** with different bets: (A) keyword-max, (B) benefit-led,
   (C) balanced. Show `(N/30)` style character counts on every line — count before
   you claim; overlong metadata is an automatic fail.
4. **Description** (on request): first 2–3 lines carry the hook (that's what shows
   before "more"), then feature bullets, social proof, closing CTA. For Google Play,
   weave target phrases into natural sentences at roughly 2–3 mentions each — never
   keyword-stuff.
5. **Explain the trade-offs** between variants in 2–3 sentences and pick a default.

## Output

Three labeled variants with per-line character counts, a filled keyword field, the
recommendation, and a short "what we deliberately left out" note.

## Guardrails

- Never exceed a character limit, even by one.
- Metadata changes ship with app releases on Apple — bundle recommendations
  accordingly; don't promise instant ranking effects.
