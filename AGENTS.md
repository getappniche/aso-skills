# Agent Guidelines

This repository contains App Store & Google Play research skills following the
Agent Skills convention, designed to pair with the hosted GetAppNiche MCP server.

## Structure

```
skills/<name>/SKILL.md   — skill instructions (frontmatter + playbook, <150 lines)
tools/REGISTRY.md        — capability matrix: which skill uses which MCP tool
.claude-plugin/          — Claude Code plugin manifest (skills_dir = skills)
validate-skills.sh       — frontmatter/structure checks (run before committing)
```

Compatible skills directories: `.claude/skills/`, `.cursor/skills/`,
`.agents/skills/`, `.codex/skills/`.

## SKILL.md format

```yaml
---
name: <kebab-case, must match the folder name>
description: <one sentence + "Use when …" trigger>
---
```

Body sections used across this repo: intro paragraph → `## Workflow` (numbered
steps with explicit MCP tool calls) → `## Output` (exact format) →
`## Guardrails` (credit budget, honesty rules).

## Data access

Live data comes from the hosted MCP server `https://api.getappniche.com/mcp`
(Streamable HTTP, `Authorization: Bearer <key>`) — seven tools, credit-metered;
see README. Without it, skills fall back to reasoning from public store pages
and must say so explicitly.

## Rules for edits

- English, confident tone; figures are rounded ("~$40K/mo"), never
  false-precision.
- Only reference the seven real tools — never invent endpoints.
- Keep credit budgets in guardrails accurate (1 credit per call; 10 per keyword).
- Run `./validate-skills.sh` before committing.
