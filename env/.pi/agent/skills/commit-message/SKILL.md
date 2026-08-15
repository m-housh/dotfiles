---
name: commit-message
description: Proposes concise conventional commit messages from the current changes. Use when the user wants help writing, refining, or choosing a Git commit message.
---

# Commit Message

Use this skill when the user asks for a commit message or wants help summarizing a change for Git history.

## Goal

Produce concise, accurate conventional commit message options.

## Type Guidance

Choose the type that best fits the work:

- `feat` — new behavior or capability
- `fix` — a bug fix
- `docs` — documentation-only changes
- `refactor` — structural improvement without intended behavior change
- `test` — adding or updating tests
- `chore` — maintenance, cleanup, configuration, or housekeeping

Use a scope only when it adds useful context, for example `fix(parser): handle empty input`.

## Workflow

1. Inspect the current changes before proposing a message.
2. Summarize what changed in one to three short bullets.
3. Pick the most fitting conventional commit type.
4. Propose three commit message options.
5. Recommend the strongest option and briefly explain why.
6. For mixed changes, suggest either the best single message or a sensible commit split.

## Style Rules

- Use the form `<type>[(scope)]: <description>`.
- Write the description in the imperative mood, lowercase after the colon, with no trailing period.
- Keep the subject short and specific.
- Prefer concrete nouns and verbs over vague wording.
- Do not invent changes that are not present.
- Follow an explicitly requested type, scope, or format.

## Output Format

### Change Summary
- ...

### Recommended Type
- `...`

### Commit Message Options
1. `feat: ...`
2. `fix: ...`
3. `chore: ...`

### Recommendation
- ...
