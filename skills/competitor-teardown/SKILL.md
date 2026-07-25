---
name: competitor-teardown
description: Deep-dive one or more named competitor apps — trajectory, monetization, positioning, and exploitable weaknesses. Use when the user names specific apps to analyze or asks "how is X doing" / "how do I beat X".
---

# Competitor Teardown

Answer the question behind the question: not "what are X's numbers" but "where is X
vulnerable and what should we copy vs. counter".

## Requirements

GetAppNiche MCP connected: `search_apps` (to resolve names to ids), `get_app_detail`,
`get_app_historicals`, `get_app_reviews`. Canonical ids look like `apple:284882215` /
`google:com.example.app`, but `get_app_detail` and `get_app_reviews` also accept a
bare Apple track id, an Android package name, or a store URL pasted from a browser —
so when the user hands you a link, use it directly instead of searching for the app.

## Workflow

1. **Resolve and confirm.** If the user gave a link or an id, skip straight to step 2.
   Otherwise find each competitor with `search_apps` (`search_in: "title"` narrows a
   name lookup); if multiple plausible matches, confirm with the user before spending
   credits on the wrong app.
2. **Snapshot each app** with `get_app_detail`: downloads and revenue,
   rating and review count, price model, category, last update.
3. **Pull trajectory** with `get_app_historicals` (90 days is a good default;
   up to 730 available). Look for: growth vs. plateau vs. decline, revenue moving
   independently of downloads (monetization change), rating drift (quality trend).
4. **Read positioning from metadata.** From each app's title/subtitle/description:
   who they target, the promise they lead with, keywords they visibly chase.
5. **Hear their users.** Call `get_app_reviews` with the competitor's `app_id` — the
   live App Store feed works on any app, no monitoring needed. One page of recent
   reviews turns "weaknesses worth exploiting" from inference into evidence: what
   their users actually complain about, and which complaints track the latest
   version. (App Store only; Google Play publishes no public review feed.)
6. **Synthesize per competitor:** two or three *strengths worth copying* and two or
   three *weaknesses worth exploiting* — each tied to a number, a quote, or an
   observed fact, not vibes.
7. **If the user has their own app,** finish with a positioning gap: the audience or
   promise none of the competitors own, and the shortest credible path to owning it.

## Output

Per competitor: a compact stat block (downloads · revenue · rating · trajectory arrow)
plus the strengths/weaknesses lists. Then a comparison table if 2+ competitors, and
the gap recommendation.

## Guardrails

- Round figures for readability — say "~$40K/mo", never a false-precision figure.
- Historicals cost 1 credit per app; for a 5+ app comparison, snapshot all first and
  pull history only for the 2–3 that matter.
- A teardown without a recommendation is a report — always end with "so what".
