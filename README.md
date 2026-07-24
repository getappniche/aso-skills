# GetAppNiche ASO Skills

Agent skills that turn any MCP-capable AI assistant (Claude Code, Cursor, Windsurf,
VS Code, Codex, Gemini CLI, Zed, …) into an App Store research analyst — niche
discovery, keyword strategy, metadata drafting, competitor teardowns, and review
mining, grounded in live [GetAppNiche](https://getappniche.com) data.

Each skill is a battle-plan, not a prompt: when to trigger, which data calls to make,
how to reason about the numbers, and the exact output format to deliver.

## Install

**Claude Code** (one command):

```bash
npx skills add getappniche/aso-skills
```

**Cursor / anything else** (copy the skill files):

```bash
git clone https://github.com/getappniche/aso-skills.git
cp -r aso-skills/skills/* .cursor/skills/
```

Skills work standalone. They get dramatically better with the GetAppNiche MCP server
connected — that's what lets your agent pull real revenue/download estimates,
keyword scores, and reviews instead of guessing.

## Connect the MCP server (recommended)

Grab an API key at [app.getappniche.com](https://app.getappniche.com) →
Settings → API Keys, then:

```bash
claude mcp add --transport http getappniche https://api.getappniche.com/mcp \
  --header "Authorization: Bearer YOUR_API_KEY"
```

Setup guides for every other client: [getappniche.com/mcp](https://getappniche.com/mcp).

## The skills

| Skill | What your agent learns to do |
|---|---|
| [`app-discovery`](skills/app-discovery/SKILL.md) | Scan a niche and shortlist the apps worth studying |
| [`keyword-research`](skills/keyword-research/SKILL.md) | Generate, score, and prioritize an ASO keyword strategy |
| [`metadata-optimization`](skills/metadata-optimization/SKILL.md) | Draft title/subtitle/keyword-field variants with exact char counts |
| [`competitor-teardown`](skills/competitor-teardown/SKILL.md) | Deep-dive named competitors: trajectory, monetization, weaknesses |
| [`growth-scan`](skills/growth-scan/SKILL.md) | Find risers and verify momentum with time-series, not snapshots |
| [`revenue-benchmark`](skills/revenue-benchmark/SKILL.md) | Map a niche's revenue distribution and realistic targets |
| [`review-mining`](skills/review-mining/SKILL.md) | Turn reviews into a prioritized product to-do list |
| [`research-brief`](skills/research-brief/SKILL.md) | Maintain a shared context brief the other skills build on |

## Try asking your agent

- "Scan the sleep-tracking niche on iOS — who's actually making money?"
- "Build a keyword strategy for my habit tracker in the US."
- "Tear down these two competitors and tell me where they're vulnerable."
- "Is this app's growth real or a marketing spike? apple:284882215"
- "What do negative reviews of my app complain about most — and what should I fix first?"
- "Draft three title/subtitle variants for my meditation app."

## Data notes

Revenue and download figures returned by the MCP tools are modelled estimates built
for comparing apps and sizing niches — directional by design, and the skills are
written to present them that way. Most tool calls cost 1 API credit; keyword scoring
costs 10 per keyword; credits are included with a GetAppNiche plan and refresh
monthly.

## License

[MIT](LICENSE) — use them, fork them, adapt them to your own stack.
