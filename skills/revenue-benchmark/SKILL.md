---
name: revenue-benchmark
description: Benchmark revenue and monetization across a niche — what apps earn, which pricing models win, and what a realistic revenue target looks like. Use for "how much do apps like this make", pricing-model questions, and revenue potential sizing.
---

# Revenue Benchmark

Give the user a defensible revenue picture: the distribution, not just the outlier.

## Requirements

GetAppNiche MCP connected: `search_apps`, `get_app_detail`, `get_app_historicals`.

## Workflow

1. **Define the comparison set.** 10–20 apps that genuinely compete for the same
   user, via `search_apps` — a mix of leaders and mid-pack, not just the top 3.
2. **Collect revenue estimates** from search results, deepening the interesting ones
   with `get_app_detail` (price model, rating, review base).
3. **Report the distribution, not the average.** App revenue is power-law shaped: a
   mean is misleading. Show top / upper-middle / typical / floor tiers with example
   apps in each.
4. **Connect model to outcome.** Group the set by monetization approach (subscription,
   one-time paid, freemium/IAP, ad-supported if visible from price + revenue pattern)
   and note which tier each model concentrates in within *this* niche — priors from
   other niches don't transfer.
5. **Check stability** for the 2–3 benchmark apps that matter most:
   `get_app_historicals` (90–365d) to confirm the revenue estimate isn't a spike.
6. **Answer the actual question.** If the user is sizing their own opportunity:
   a realistic 12-month target sits near the *typical* tier, not the top — say that,
   with the assumptions (market, pricing, differentiation) that could move it.

## Output

A tiered table — Tier · Est. revenue/mo range · Example apps · Dominant model —
followed by 3–4 sentences of interpretation and, when relevant, the realistic-target
paragraph.

## Guardrails

- Every figure is a modelled estimate — frame ranges ("roughly $10–50K/mo"), never
  exact claims.
- Never project the niche's #1 as the user's expected outcome.
- If the niche's revenue is concentrated in 1–2 apps, that concentration IS the
  finding — flag winner-take-most dynamics explicitly.
