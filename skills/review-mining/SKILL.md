---
name: review-mining
description: Mine app reviews for complaints, feature requests, and sentiment patterns, and turn them into a prioritized product to-do list. Use for "what do users hate/want", churn-reason hunting, competitor review teardowns, and pre-build validation of a feature idea.
---

# Review Mining

Reviews are the cheapest user research that exists. Extract decisions from them,
not word clouds.

## Requirements

`get_app_reviews` reads in two modes, and which one you get changes what you can say:

- **Live store feed** — pass `app_id` (`apple:284882215`, a bare track id, or a
  pasted store URL) and optionally `country`. Works for **any App Store or Google
  Play app**, monitored or not, which is what makes competitor teardowns possible.
  Rows carry review text, rating, version, author and date — but **no sentiment or
  topic labels**, so you cluster them yourself. The result reports
  `source: "store_feed"` and `enriched: false`.
- **Workspace feed** — omit `app_id` to read apps monitored under Review Analytics.
  These rows add the enrichment layer (`sentiment`, `topics`, `improvement_areas`),
  so the `sentiment` / `topic` arguments only filter here. The result reports
  `source: "workspace"` and `enriched: true`.

Live lookup covers both stores: pass an Apple id or an Android package name
(`google:com.duolingo` and a bare `com.duolingo` both work). Google Play rows
carry no review title — cluster them on the body text alone.

## Workflow

1. **Pull a real sample.** For a competitor or any untracked app, call
   `get_app_reviews` with `app_id` and page through with `offset` (`limit: 50`);
   `has_more` tells you whether the feed had rows behind the page. For the user's
   own monitored app, omit `app_id` and slice with `sentiment` / `topic` when the
   question is specific ("what do negative reviews say about pricing?"). Aim for
   100+ reviews before claiming patterns.
2. **Cluster by theme, count honestly.** Bugs/reliability · missing features ·
   pricing/paywall friction · UX confusion · praise (what to protect). Report
   theme frequency as a share of the sample, with 1–2 verbatim quotes each —
   quotes carry more decision weight than percentages. On live rows you are doing
   this clustering yourself; say so rather than implying a model scored it.
3. **Weight by recency.** Rows come newest-first with a `version` attached. A
   complaint cluster confined to the latest version is a regression; one that spans
   many versions is a chronic gap. Say which is which.
4. **Convert to actions.** For each major cluster: the fix/feature implied, expected
   effect (rating defense vs. conversion vs. retention), and a rough
   frequency × severity priority.
5. **Comparative mode.** Mine any two apps — the user's and a competitor's, no
   monitoring required — then contrast. Complaints competitor users have that yours
   don't are your marketing angles; the inverse is your roadmap.
6. **Check other storefronts.** A theme that shows up in `US` but not `DE`/`JP` is
   often a localization or pricing problem rather than a product one. Re-run step 1
   with a different `country` when the app has meaningful non-US traction.

## Output

Theme table — Theme · Share of sample · Trend (rising/chronic) · Representative
quote — followed by a prioritized action list (top 3–5) and one "protect this"
strength.

## Guardrails

- Reviewers over-represent the angry and the delighted; frame findings as "among
  reviewers", not "among users".
- Minimum ~30 reviews before percentages; below that, present themes qualitatively.
- Quote verbatim, short, and anonymous — no reviewer names.
- Each page costs 1 credit. If a call reports an out-of-credits error, relay it:
  credits refresh monthly and can be topped up in Settings at app.getappniche.com.
