---
name: app-discovery
description: Scan an App Store or Google Play category or niche and produce a shortlist of apps worth studying, with revenue and download data. Use when the user wants to find apps in a space, size a niche, or build a research candidate list.
---

# App Discovery

Turn a vague market question ("what's out there in sleep tracking?") into a concrete,
data-backed shortlist.

## Requirements

Works best with the GetAppNiche MCP server connected (`search_apps`, `get_app_detail`).
Without it, fall back to reasoning from public store pages and say so explicitly.

## Workflow

1. **Frame the niche.** Restate what the user is looking for as (a) a store —
   `apple`, `google`, or both; (b) one or two category guesses; (c) 2–4 search phrases
   a real user would type. Confirm only if genuinely ambiguous.
2. **Cast a wide net.** Call `search_apps` once per store/phrase combination
   (`limit: 25` is a good default). Vary the phrasing between calls — synonyms surface
   different clusters of apps.
3. **Deduplicate and rank.** Merge results, then rank by whatever signal matches the
   user's goal: revenue for "who makes money here", downloads for
   reach, recency of release for "is this niche still being entered".
4. **Deepen the top candidates.** For the top 5–8 apps, call `get_app_detail`
   (id format `apple:284882215` / `google:com.example.app`) to pull ratings, review
   counts, and metadata before making claims about any single app.
5. **Summarize the niche.** Close with 2–3 sentences on shape of the market:
   concentration (one winner vs. long tail), price patterns, and obvious gaps.

## Output

A table — App · Store · Est. downloads/mo · Est. revenue/mo · Rating (count) · One-line
angle — followed by the niche summary and a "worth a deeper look" pick with reasoning.

## Guardrails

- Use revenue and download figures to rank and compare; round them in output
  rather than quoting to the dollar.
- Prefer two focused `search_apps` calls over ten scattershot ones; each call costs
  1 credit. If a call reports an out-of-credits error, relay it: credits refresh
  monthly and can be topped up in Settings at app.getappniche.com.
- Don't invent apps to pad a thin niche — a short honest list is the finding.
