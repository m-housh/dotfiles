---
name: explain-before-edit
description: Forces a cautious planning step before making code or file changes. Use when the user wants an explanation, plan, touched files, and assumptions before any edits happen.
---

# Explain Before Edit

Use this skill when the user wants tighter control before the agent edits files.

## Goal

Before making any edits, explain what you intend to change and wait for confirmation.

## Required Behavior

1. Do not edit files immediately.
2. First inspect the relevant files and gather enough context.
3. Then provide a short pre-edit plan with these sections:
   - `Intent`
   - `Files to change`
   - `Planned edits`
   - `Assumptions / risks`
4. End by asking for confirmation.
5. Wait for the user's approval before using `write`, `edit`, or any destructive `bash` command.

## Guidance

- Keep the plan concise but concrete.
- Name the exact files you expect to modify when possible.
- Call out uncertainty clearly.
- If there are multiple implementation choices, present the best options with tradeoffs.
- If the user narrows scope or approves a subset, follow that updated instruction.
- After approval, execute the plan efficiently and summarize what changed.

## Example Response Shape

### Intent
- ...

### Files to change
- `path/to/file`

### Planned edits
- ...

### Assumptions / risks
- ...

If this plan looks good, reply with `approved` and I will make the changes.
