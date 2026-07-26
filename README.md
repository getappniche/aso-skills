# GetAppNiche ASO Skills — App Store & Google Play Research for AI Agents (MCP)

Turn **Claude Code**, **Claude Desktop**, **Cursor**, **Codex**, **Manus**,
**Windsurf**, **VS Code**, **Gemini CLI**, **Zed** — or any Agent-Skills /
MCP-compatible assistant — into an app-market research analyst: niche discovery,
keyword strategy, metadata drafting, competitor teardowns, growth scans and review
mining, grounded in live [GetAppNiche](https://getappniche.com) data across
**3.6M+ indexed App Store and Google Play apps** (1.1M+ iOS, 2.5M+ Google Play).

Each skill is a battle-plan, not a prompt: when to trigger, which data calls to
make, how to reason about the numbers, and the exact output format to deliver.

## Install the skills

**Claude Code** (official installer — downloads this repo and registers the skills):

```bash
npx skills add getappniche/aso-skills
# or only some of them:
npx skills add getappniche/aso-skills --skill keyword-research competitor-teardown
```

**Claude Code plugin** — the repo ships a [`.claude-plugin`](.claude-plugin/)
manifest, so it can also be installed through the plugin system; the `skills/`
directory is picked up automatically.

**Cursor** — Settings → Rules → Add Rule → **Remote Rule (GitHub)** →
`https://github.com/getappniche/aso-skills`, or copy the files locally:

```bash
git clone https://github.com/getappniche/aso-skills.git
cp -r aso-skills/skills/* .cursor/skills/
```

**Manus** — Skills → Create / Import → **Import from public GitHub repository** →
`https://github.com/getappniche/aso-skills`.

**Any other agent** — clone and point your client's skills directory at
`skills/`. Known-compatible locations: `.claude/skills/`, `.cursor/skills/`,
`.agents/skills/`, `.codex/skills/`.

Skills work standalone. They get dramatically better with the GetAppNiche MCP
server connected — that's what lets your agent pull real revenue & download data,
keyword scores, and reviews instead of guessing.

## Connect the MCP server (recommended)

The GetAppNiche MCP server is a hosted Streamable HTTP endpoint at
`https://api.getappniche.com/mcp` with Bearer-token auth — nothing to run
locally. Grab an API key at [app.getappniche.com](https://app.getappniche.com) →
Settings → API Keys (the secret is shown once), then:

**Claude Code**

```bash
claude mcp add --transport http getappniche https://api.getappniche.com/mcp \
  --header "Authorization: Bearer YOUR_API_KEY"
```

**Cursor** (`~/.cursor/mcp.json`)

```json
{
  "mcpServers": {
    "getappniche": {
      "url": "https://api.getappniche.com/mcp",
      "headers": { "Authorization": "Bearer YOUR_API_KEY" }
    }
  }
}
```

**Claude Desktop and other stdio-only clients** — use the official
[`@getappniche/mcp`](https://www.npmjs.com/package/@getappniche/mcp) bridge
(zero dependencies, needs Node 18+):

```json
{
  "mcpServers": {
    "getappniche": {
      "command": "npx",
      "args": ["-y", "@getappniche/mcp"],
      "env": { "GETAPPNICHE_API_KEY": "YOUR_API_KEY" }
    }
  }
}
```

**Windsurf · VS Code (Copilot agent mode) · Codex CLI · Gemini CLI · Zed ·
Cline · Continue · JetBrains AI** — same URL, same header; copy-paste snippets
for all twelve clients: **[getappniche.com/mcp](https://getappniche.com/mcp)**.

**ChatGPT** (Settings → Connectors, Developer mode) connects with the same API
key — choose API-key auth when adding the custom connector. The open-source
protocol layer lives at [getappniche/mcp](https://github.com/getappniche/mcp).

### Seven tools, priced in credits

| Tool | What the agent gets | Cost |
|---|---|---|
| `search_apps` | Search & filter apps by store, category, text, ratings, growth | 1 credit |
| `get_app_detail` | Full record for one app — `apple:284882215` / `google:com.duolingo` | 1 credit |
| `get_app_historicals` | Metric time-series: reviews, ratings, downloads, revenue | 1 credit |
| `get_keyword_difficulty` | Popularity, difficulty, traffic & opportunity for one keyword | 10 credits |
| `batch_keyword_difficulty` | Up to 10 keywords in one call, auto-sorted by opportunity | 10 credits / kw |
| `get_app_reviews` | Live App Store reviews for **any** app (`app_id` + `country`) — or enriched rows for apps monitored in your workspace | 1 credit |
| `get_supported_countries` | Valid store country codes | Free |

A Pro plan includes **5,000 credits per month**; every tool result reports
`credits_charged`. Which skill calls which tool: [tools/REGISTRY.md](tools/REGISTRY.md).

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
- "Which Health & Fitness apps grew more than 20% in the last 30 days?"
- "Build a keyword strategy for my habit tracker in the US."
- "Find App Store or Google Play apps making $10K–50K/mo with under 1,000 reviews."
- "Tear down these two competitors and tell me where they're vulnerable."
- "Is this app's growth real or a marketing spike? apple:284882215"
- "Compare 'daily planner', 'focus timer' and 'habit tracker' for ASO."
- "What are people complaining about in this app's reviews?
  https://apps.apple.com/us/app/x/id284882215"
- "What do negative reviews of my app complain about most — and what should I fix first?"
- "Draft three title/subtitle variants for my meditation app."

## How an agent typically runs

1. `search_apps` turns the question into a candidate list — one focused call
   beats ten scattershot ones.
2. `get_app_detail` on the 5–8 apps that matter, before claiming any numbers.
3. `get_app_historicals` whenever the question is about time — growth, decline,
   spike vs. trend.
4. Keyword tools for anything ASO; `get_app_reviews` for anything users say.
5. Deliver the skill's output format: a table plus a recommendation — never a raw
   data dump.

## REST API quick reference

Prefer plain HTTP? The same data is served at `https://api.getappniche.com` with
the same API key and the same credit meter.

| Route | Purpose | Cost |
|---|---|---|
| `GET /api/v1/apps` | Search & filter apps | 1 credit |
| `GET /api/v1/apps/{app_id}` | One app by `apple:<id>` / `google:<package>` | 1 credit |
| `GET /api/v1/keywords/difficulty` | Keyword analysis (`keyword`, `store`, `country`, `language`) | 10 credits |
| `GET /api/v1/reviews` | Enriched reviews for monitored apps | 1 credit |
| `GET /api/v1/reviews/live` | Live App Store reviews for any app (`app_id`, `country`) | 1 credit |

`GET /api/v1/apps` filters (AND-combined): `store` (`apple` / `google`),
`category` / `categories`, `language` / `languages`, `search` + `search_in`
(`all` / `title` / `developer`), `price_model`, rating / review / download /
revenue bounds (`min_*` **and** `max_*`), recency (`max_days_since_release`,
`max_days_since_update`, `released_after/before`, `updated_after/before`),
growth (`growth_metric` + `growth_period` + `growth_direction` +
`min_growth_pct`), `limit` (≤100), `offset` (≤10,000), `sort_by`, `sort_dir`.

```bash
# Top-grossing meditation apps
curl -s "https://api.getappniche.com/api/v1/apps?search=meditation&sort_by=revenue&limit=10" \
  -H "Authorization: Bearer YOUR_API_KEY"

# One app by canonical id
curl -s "https://api.getappniche.com/api/v1/apps/apple:284882215" \
  -H "Authorization: Bearer YOUR_API_KEY"

# Score a keyword
curl -s "https://api.getappniche.com/api/v1/keywords/difficulty?keyword=habit%20tracker&country=US" \
  -H "Authorization: Bearer YOUR_API_KEY"
```

**Limits & errors:** 60 requests/minute per key. Out-of-credits returns a
structured error naming the top-up path (Settings at app.getappniche.com);
malformed requests return standard HTTP 4xx with a JSON `detail`; MCP tool errors
arrive as JSON-RPC tool results, so agents can relay them verbatim.

## Updating

Skills installed via the official installer update with one command:

```bash
npx skills update
```

The hosted MCP server updates itself — nothing to reinstall.

## Data notes

Revenue and download figures are **estimates** from the GetAppNiche data pipeline —
refreshed daily across 3.6M+ indexed App Store and Google Play apps, and built for
comparing apps and sizing niches.

`search_apps` filters on the full Explore set — store, categories, languages, price
model, rating, review count, download and revenue thresholds (min *and* max), release
and update recency, and review-growth direction — so the skills express a research
thesis as a query rather than fetching broadly and filtering by eye.

`get_app_reviews` reads live store reviews for **any** app when given an
`app_id` — App Store or Google Play — which is what lets the competitor and review
skills work without adding a monitor first. Those rows carry no sentiment/topic
labels (the agent clusters them); apps monitored in the workspace return the
enriched rows instead. Play rows carry no review title (Play reviews have none).

## License

[MIT](LICENSE) — use them, fork them, adapt them to your own stack.
Built by [GetAppNiche](https://getappniche.com) ·
X [@getappniche](https://x.com/getappniche) ·
[LinkedIn](https://www.linkedin.com/company/getappniche)
