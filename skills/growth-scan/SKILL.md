---
name: growth-scan
description: Find what's growing right now — fast-rising apps in a category, momentum behind a trend, or whether a specific app's growth is accelerating or stalling. Use for "what's taking off", trend-spotting, and momentum checks.
---

# Growth Scan

Separate real momentum from noise. Growth questions are time-series questions —
never answer them from a single snapshot.

## Requirements

GetAppNiche MCP connected: `search_apps`, `get_app_detail`, `get_app_historicals`.

## Workflow

**Mode A — "what's growing in this space?"**

1. Let the query find the risers: `search_apps` with `growth_direction: "up"`,
   a `growth_period` matched to the question (`7d`/`14d` for "right now",
   `30d`/`90d` for a trend), `min_growth_pct` to set the bar (20 is a sensible
   floor), and `sort_by: "growth"`. Add `categories` and any size floor
   (`min_downloads`, `min_revenue`) so momentum on a 50-download app doesn't top
   the list. Ask for 25–50 results. Google Play growth is tracked over 7 days
   only — `store: "google"` with a longer window is refused, so for Play
   questions stay on `7d`.
2. Sanity-check the pool. A high growth percentage on a tiny base is noise — read
   the growth figure next to the download/revenue figures before ranking. Use
   `growth_direction: "down"` for the mirror question ("who is losing ground?").
3. Verify the top 3–5 candidates with `get_app_historicals` (30–90 days) — confirm
   the curve actually rises before calling anything a riser.

**Mode B — "is this app's growth real / stalling?"**

1. `get_app_detail` for the baseline, then `get_app_historicals` at two windows:
   short (30d) and long (180–365d).
2. Classify the shape: steady compounder · step-change (feature or marketing event) ·
   spike-and-decay (paid burst or press) · plateau · decline.
3. Cross-read downloads against revenue and rating: downloads up + revenue flat =
   monetization lag; downloads up + rating down = growth outrunning quality.

## Output

Mode A: ranked riser list — App · Downloads trend · Age · Why it's moving
(one line each) — plus one sentence on what the risers share (the actual trend).
Mode B: the shape classification, the evidence, and what to watch next month.

## Guardrails

- Momentum claims need at least two time points; "high downloads" alone is not
  growth.
- Spike-and-decay is the most common false positive — check whether the curve held
  after the peak before declaring a winner.
- Small week-to-week wiggles are noise, not signal — judge momentum on
  multi-week curves.
