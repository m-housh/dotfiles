---
name: code-review
description: Reviews code changes for correctness, readability, maintainability, duplication, and edge cases. Use when the user wants a thoughtful review of code, config, scripts, or a diff.
---

# Code Review

Use this skill when the user wants a review of code, scripts, config, or a set of changes.

## Goal

Produce a concise, useful review that prioritizes real issues over stylistic noise.

## Review Focus

Check for:
- correctness problems
- broken assumptions or edge cases
- maintainability issues
- confusing naming or ownership boundaries
- duplicated logic
- unnecessary complexity
- missing updates to nearby docs/config/tests when relevant

## Workflow

1. Inspect the relevant files or diff before making claims.
2. Identify concrete issues first, not hypothetical style preferences.
3. Separate true problems from optional improvements.
4. Prefer the smallest set of high-value findings.
5. If no meaningful issues are found, say so clearly.

## Severity Guidance

Use these buckets when helpful:
- `high` — likely bug, breakage, or serious design issue
- `medium` — maintainability or correctness risk worth fixing soon
- `low` — polish, clarity, or minor improvement

Do not inflate severity.

## Output Format

Use this structure:

### Summary
- brief overall assessment

### Findings
- `[high]` ...
- `[medium]` ...
- `[low]` ...

### Suggested Improvements
- optional non-blocking ideas

### Review Verdict
- `no major issues found`, or
- `changes recommended before merge`

## Guidance

- Quote specific files, functions, or snippets when possible.
- Be explicit about why something is a problem.
- Prefer actionable suggestions over vague criticism.
- Avoid turning personal style preferences into findings.
- If review scope is unclear, ask whether to review a file, diff, or whole repo area.
