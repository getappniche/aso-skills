# Tool Registry

Which skill calls which GetAppNiche MCP tool, and what each costs.

Hosted server: `https://api.getappniche.com/mcp` (Streamable HTTP,
`Authorization: Bearer <key>`). REST mirror for scripts:
`https://api.getappniche.com/api/v1/*` — same key, same credit meter.

## Capability matrix

| Skill | search_apps | get_app_detail | get_app_historicals | keyword tools | get_app_reviews |
|---|:-:|:-:|:-:|:-:|:-:|
| app-discovery | ● | ● | | | |
| keyword-research | ○ | | | ● | |
| metadata-optimization | ○ | ○ | | ● | |
| competitor-teardown | ● | ● | ● | ○ | ○ |
| growth-scan | ● | ○ | ● | | |
| revenue-benchmark | ● | ● | ● | | |
| review-mining | | ○ | | | ● |
| research-brief | | ● | | | |

● primary · ○ optional deepening. `get_supported_countries` (free) backs any
country-parameterized call.

## Costs

| Tool | Cost |
|---|---|
| search_apps · get_app_detail · get_app_historicals · get_app_reviews | 1 credit / call |
| get_keyword_difficulty · batch_keyword_difficulty | 10 credits / keyword |
| get_supported_countries | free |

Pro plan: 5,000 credits/month; every result reports `credits_charged`.

## REST endpoints

| Route | Purpose | Cost |
|---|---|---|
| `GET /api/v1/apps` | Search & filter apps | 1 credit |
| `GET /api/v1/apps/{app_id}` | App detail (`apple:<id>` / `google:<package>`) | 1 credit |
| `GET /api/v1/keywords/difficulty` | Keyword analysis | 10 credits |
| `GET /api/v1/reviews` | Reviews for monitored apps | 1 credit |
