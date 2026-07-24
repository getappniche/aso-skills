---
name: review-mining
description: Mine app reviews for complaints, feature requests, and sentiment patterns, and turn them into a prioritized product to-do list. Use for "what do users hate/want", churn-reason hunting, and pre-build validation of a feature idea.
---

# Review Mining

Reviews are the cheapest user research that exists. Extract decisions from them,
not word clouds.

## Requirements

The GetAppNiche `get_app_reviews` tool serves **apps monitored in the user's
workspace** (added under Review Analytics in the dashboard). If the app in question
isn't monitored yet, say so and point the user to app.getappniche.com → Review
Analytics → add the app — then continue with whatever review text the user pastes,
or with the app's public store page content, clearly labeling the smaller sample.

## Workflow

1. **Pull a real sample.** `get_app_reviews` with pagination (`limit: 50`, then
   further `offset` pages) — 100+ reviews before claiming patterns. Use the
   `sentiment` / `topic` arguments to slice when the user's question is specific
   ("what do negative reviews say about pricing?").
2. **Cluster by theme, count honestly.** Bugs/reliability · missing features ·
   pricing/paywall friction · UX confusion · praise (what to protect). Report
   theme frequency as a share of the sample, with 1–2 verbatim quotes each —
   quotes carry more decision weight than percentages.
3. **Weight by recency.** A complaint cluster that appears only in recent reviews is
   a regression; one that spans a year is a chronic gap. Say which is which.
4. **Convert to actions.** For each major cluster: the fix/feature implied, expected
   effect (rating defense vs. conversion vs. retention), and a rough
   frequency × severity priority.
5. **Comparative mode** (two monitored apps): mine both, then contrast — complaints
   competitor users have that yours don't are your marketing angles; the inverse is
   your roadmap.

## Output

Theme table — Theme · Share of sample · Trend (rising/chronic) · Representative
quote — followed by a prioritized action list (top 3–5) and one "protect this"
strength.

## Guardrails

- Reviewers over-represent the angry and the delighted; frame findings as "among
  reviewers", not "among users".
- Minimum ~30 reviews before percentages; below that, present themes qualitatively.
- Quote verbatim, short, and anonymous — no reviewer names.
