---
name: keyword-research
description: Build a prioritized App Store keyword strategy — generate candidate keywords, score their difficulty and opportunity, and recommend where to compete. Use for ASO keyword planning, keyword gap questions, or "what should my app rank for".
---

# Keyword Research

Produce a keyword plan a developer can act on this week, not a raw dump of scores.

## Requirements

GetAppNiche MCP connected: `get_keyword_difficulty`, `batch_keyword_difficulty`,
`get_supported_countries` (free). Keyword scoring is the expensive call — 10 credits
per keyword — so generate first, score second, and score only the shortlist.

## Workflow

1. **Collect context.** App's core job, target market (default `US` / `en` unless told
   otherwise — verify uncommon markets against `get_supported_countries`), and any
   keywords already targeted.
2. **Generate candidates by intent bucket, before any scoring:**
   - *Core*: what the app literally is ("habit tracker")
   - *Problem*: what the user is trying to fix ("stop procrastinating")
   - *Feature*: specific capabilities ("streak counter", "widget")
   - *Adjacent*: neighboring queries the audience also types
   Aim for 15–25 candidates across buckets.
3. **Shortlist ~10** by judgment (relevance × plausible traffic) and score them in one
   `batch_keyword_difficulty` call. Batch is capped at 10 keywords — prioritize before
   scoring rather than paging through everything.
4. **Read the scores like a strategist.** The sweet spot is meaningful popularity with
   difficulty your app can survive: a new app should mostly avoid head terms and win
   mid-tail; an established app can contest harder terms. Note which top-ranking apps
   hold each keyword — outranking a giant is a different project than outranking
   abandonware.
5. **Recommend.** Split the final list into: *target now*, *build toward*, *skip (and
   why)*.

## Output

A ranked table — Keyword · Popularity · Difficulty · Verdict — then the three-tier
recommendation with one sentence of reasoning per tier, and suggested placement
(title vs. subtitle vs. keyword field) for the "target now" set.

## Guardrails

- Scores are point-in-time snapshots; treat small differences (±5) as noise.
- Never present a keyword list without a recommendation — prioritization is the value.
- State the assumed country/language; rankings differ per storefront.
