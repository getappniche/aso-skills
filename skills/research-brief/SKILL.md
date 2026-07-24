---
name: research-brief
description: Create a compact shared research brief — the app, its market, competitors, goals, and constraints — that other ASO and market-research skills reference instead of re-asking. Use at the start of a research engagement or when context is scattered across a long conversation.
---

# Research Brief

One page that makes every subsequent analysis sharper and cheaper. Build it once,
reference it everywhere, update it when facts change.

## When to trigger

- The user starts a multi-step research effort (discovery → keywords → metadata).
- Another skill would otherwise re-ask for basics already mentioned.
- The user says some form of "let me give you context about my app".

## Workflow

1. **Gather what exists.** From conversation history first; then, if the GetAppNiche
   MCP is connected and the user's app is live, one `get_app_detail` call fills the
   factual half (category, price model, rating, estimated scale) — cheaper and more
   reliable than asking the user to type it.
2. **Ask only for what's missing and material** — batch the questions in one message.
   Typical gaps: target user, business goal (revenue vs. installs vs. validation),
   markets/languages, budget realities (solo dev vs. funded team), hard constraints.
3. **Write the brief** in the fixed format below, marking every unverified statement
   with *(assumption)*.
4. **Keep it alive.** When later research contradicts the brief (a competitor turns
   out bigger, a keyword unviable), update the brief and say what changed.

## Brief format

```
## Research Brief: <app / working title>
- Product: what it does, for whom, in one sentence
- Stage: idea / pre-launch / live (scale if live)
- Store(s) & markets: apple/google · countries · languages
- Business goal: the one metric that matters this quarter
- Monetization: model + price points
- Competitors: 3–5 named, one clause each on why they're in the set
- Edge: the differentiator we believe in (assumption until validated)
- Constraints: team, budget, timeline, platform limits
- Open questions: what research still needs to answer
```

## Guardrails

- One page maximum — a brief nobody rereads is worthless.
- Never silently invent facts to fill a field; *(assumption)* labels are the
  integrity mechanism other skills rely on.
- End by suggesting the natural next skill (discovery for idea-stage, review-mining
  for live apps with rating trouble, keyword-research before a metadata rewrite).
