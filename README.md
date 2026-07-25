# GetAppNiche ASO Skills — App Store & Google Play Research for AI Agents (MCP)

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

**Manus** — Skills → Create / Import → Import from public GitHub repository → `https://github.com/getappniche/aso-skills`.

**Cursor / anything else** (copy the skill files):

```bash
git clone https://github.com/getappniche/aso-skills.git
cp -r aso-skills/skills/* .cursor/skills/
```

Skills work standalone. They get dramatically better with the GetAppNiche MCP server
connected — that's what lets your agent pull real revenue & download data,
keyword scores, and reviews instead of guessing.

## Connect the MCP server (recommended)

The GetAppNiche MCP server is a hosted Streamable HTTP endpoint at
`https://api.getappniche.com/mcp` with Bearer-token auth — nothing to run locally.
Grab an API key at [app.getappniche.com](https://app.getappniche.com) →
Settings → API Keys, then:

```bash
claude mcp add --transport http getappniche https://api.getappniche.com/mcp \
  --header "Authorization: Bearer YOUR_API_KEY"
```

Seven tools ship today: `search_apps`, `get_app_detail`, and `get_app_historicals`
(1 credit each), `get_keyword_difficulty` and `batch_keyword_difficulty`
(10 credits per keyword), `get_app_reviews` (1 credit, for apps monitored in your
workspace), and `get_supported_countries` (free).

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

## Updating

Skills installed via the official installer update with one command:

```bash
npx skills update
```

The hosted MCP server updates itself — nothing to reinstall.

## Data notes

Revenue and download figures come straight from the GetAppNiche data pipeline —
refreshed daily across 4M+ indexed App Store and Google Play apps, and built for
comparing apps and sizing niches. Most tool calls cost 1 API credit; keyword
scoring costs 10 per keyword. A Pro plan includes 5,000 credits per month,
refreshed monthly.

## License

[MIT](LICENSE) — use them, fork them, adapt them to your own stack.
