---
name: test-plan
description: Creates a practical test and verification plan for a code or config change, including happy path, edge cases, regressions, and manual checks. Use when the user wants to know how to validate work.
---

# Test Plan

Use this skill when the user wants a validation plan for a code change, config change, bug fix, refactor, or workflow update.

## Goal

Produce a focused plan that helps prove the change works without wasting effort.

## Planning Focus

Cover:
- primary happy path behavior
- likely edge cases
- regression risks
- existing automated tests to run
- new tests worth adding, if any
- manual verification steps when automation is missing

## Workflow

1. Inspect the relevant files, diff, or described change.
2. Identify what behavior changed and what could regress nearby.
3. Prioritize the smallest useful validation steps first.
4. Separate automated checks from manual checks.
5. Call out assumptions, blockers, or untestable parts.

## Output Format

Use this structure:

### Validation Goal
- what must be proven

### Automated Checks
- commands to run
- existing tests that matter
- new tests worth adding

### Manual Checks
- step-by-step checks for runtime or UX behavior

### Edge Cases / Regressions
- cases that should not break

### Confidence Notes
- assumptions, gaps, blockers

## Guidance

- Prefer concrete commands when possible.
- Keep the plan proportional to the size of the change.
- For small changes, a short checklist is enough.
- For risky changes, include rollback or failure-observation steps.
- If no automated tests exist, say that plainly and give the best manual checks.
