---
name: app-discovery
description: Scan an App Store or Google Play category or niche and produce a shortlist of apps worth studying, with revenue and download data. Use when the user wants to find apps in a space, size a niche, find underserved segments, or build a research candidate list.
---

# App Discovery

Turn a vague market question ("what's out there in sleep tracking?") into a concrete,
data-backed shortlist.

## Requirements

Works best with the GetAppNiche MCP server connected (`search_apps`, `get_app_detail`).
Without it, fall back to reasoning from public store pages and say so explicitly.

## Workflow

1. **Frame the niche as filters, not just words.** Restate the request as (a) a store —
   `apple`, `google`, or both; (b) `categories` to include; (c) a search phrase if the
   niche is narrower than a category; and (d) **the thesis expressed numerically**.
   `search_apps` takes the whole Explore filter set, so state the thesis directly
   instead of fetching broadly and filtering by eye:

   - "who makes real money here" → `min_revenue: 10000`, `sort_by: "revenue"`
   - "beatable incumbents" → `min_revenue: 10000`, `max_reviews: 1000`
   - "is this niche still being entered" → `max_days_since_release: 365`
   - "what's heating up" → `growth_period: "30d"`, `growth_direction: "up"`,
     `min_growth_pct: 20`, `sort_by: "growth"`
   - "abandoned apps to displace" → `min_reviews: 1000`, plus
     `updated_before` a year ago
   - "non-US opportunity" → `languages: ["de", "ja"]`

   Confirm only if genuinely ambiguous.
2. **Run two or three sharp queries, not ten scattershot ones.** One query per thesis
   (`limit: 25` is a good default). Because the filters do the narrowing, a second
   query should test a *different hypothesis* — not a synonym of the first.
3. **Deduplicate and rank.** Merge results, then rank by whatever signal matches the
   user's goal. `sort_by` accepts `downloads`, `revenue`, `growth`, `reviews`,
   `rating`, `title`, `released` and `updated`, so let the query do the sorting.
4. **Deepen the top candidates.** For the top 5–8 apps, call `get_app_detail` to pull
   ratings, review counts, and metadata before making claims about any single app.
   It accepts the canonical id (`apple:284882215`, `google:com.example.app`), a bare
   Apple track id, an Android package name, or a store URL pasted straight from a
   browser.
5. **Summarize the niche.** Close with 2–3 sentences on the shape of the market:
   concentration (one winner vs. long tail), price patterns, and obvious gaps.

## Output

A table — App · Store · Downloads/mo · Revenue/mo · Rating (count) · One-line
angle — followed by the niche summary and a "worth a deeper look" pick with reasoning.
State the filters you used, so the user can see what the shortlist is and isn't.

## Guardrails

- Use revenue and download figures to rank and compare; round them in output
  rather than quoting to the dollar.
- Each call costs 1 credit. If a call reports an out-of-credits error, relay it:
  credits refresh monthly and can be topped up in Settings at app.getappniche.com.
- A filter combination that returns nothing is a finding ("nobody is making $50K/mo
  here"), not a failure — report it before loosening the filters, and say which
  constraint you relaxed.
- Don't invent apps to pad a thin niche — a short honest list is the finding.
