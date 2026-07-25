---
name: getappniche-aso
description: App Store & Google Play research meta-skill — routes app-market questions to the right specialized skill (discovery, keywords, metadata, competitors, growth, revenue, reviews). Use when the user asks any app-market research question and no more specific skill has triggered.
---

# GetAppNiche ASO — router

Pick the specialized skill that matches the question and follow it:

| Question sounds like | Use |
|---|---|
| "what's out there / who makes money in X" | `skills/app-discovery` |
| "what keywords should I target" | `skills/keyword-research` |
| "rewrite my title/subtitle/keywords" | `skills/metadata-optimization` |
| "how is competitor X doing / how do I beat them" | `skills/competitor-teardown` |
| "what's growing / is this growth real" | `skills/growth-scan` |
| "how much do apps like this make" | `skills/revenue-benchmark` |
| "what do users complain about / want" | `skills/review-mining` |
| start of an engagement, scattered context | `skills/research-brief` |

Data: hosted GetAppNiche MCP server (`https://api.getappniche.com/mcp`, Bearer
key) — `search_apps`, `get_app_detail`, `get_app_historicals`,
`get_keyword_difficulty`, `batch_keyword_difficulty`, `get_app_reviews`,
`get_supported_countries`. Most calls cost 1 credit; keyword scoring 10/keyword.
If the server is not connected, say so and reason from public store pages.
