---
name: simplify-refactor
description: Helps simplify code by identifying duplicated logic, clarifying ownership between layers, and reducing unnecessary complexity. Use when a refactor should make code smaller, clearer, and more maintainable.
---

# Simplify Refactor

Use this skill when code, scripts, helpers, or documentation feel more complicated than needed and the goal is to simplify without changing intended behavior.

## Goal

Find the smallest clear design that preserves behavior while enforcing clean ownership between layers.

## Core Principle

Each concern should have one obvious owner.

- Higher-level layers should provide context, policy, or light argument translation.
- Lower-level layers should own mechanics, validation, and implementation details.
- If a lower-level primitive already owns a concern, do not re-implement it in a wrapper unless the user explicitly wants a different interface or behavior.

## Workflow

1. Inspect the current implementation and identify the layers involved.
2. Name the abstraction boundary in plain language.
3. Identify duplicated logic, validation, parsing, or documentation across layers.
4. Push each concern down to the lowest appropriate layer.
5. Prefer delegation and pass-through over rebuilding an existing interface.
6. Make the smallest edits that produce a meaningfully simpler design.
7. Verify behavior after the change.
8. Summarize what duplication was removed and whether the result became smaller or simpler.

## Required Behavior

- Before editing, decide which layer owns each important concern.
- Remove duplicated parsing, validation, or flag handling when one layer can own it cleanly.
- Prefer one canonical help surface when a primitive already documents its supported flags or behavior.
- Avoid preserving accidental complexity just because it already exists.
- If a wrapper exists, it should usually add context and delegate rather than re-implement lower-level mechanics.
- If the refactor increases line count, explain why complexity still decreased.

## Common Simplification Heuristics

- Move mechanics and validation to the lowest reusable layer.
- Keep wrappers, adapters, and helpers focused on context or translation.
- Pass arguments through instead of re-parsing them in every layer.
- Remove checks that are already guaranteed by a lower-level primitive.
- Do not duplicate documentation for flags or behavior that already live in the canonical primitive help text.
- Prefer a clear failure mode over extra orchestration glue.
- When possible, reduce branching, duplicated state, and parallel code paths.

## Good Fits

Use this skill for things like:

- wrapper scripts that started re-implementing the primitive they call
- helper functions that duplicate validation from a lower-level utility
- adapters with too many special cases
- documentation that repeats interfaces instead of pointing to the source of truth
- refactors where the user explicitly wants smaller, clearer code

## Reference

For a compact review aid during simplification work, see `references/checklist.md`.

## Response Guidance

When the simplification path is not obvious, structure the reasoning like this:

### Boundary
- Which layer should own what

### Duplication to remove
- Parsing
- Validation
- Flag handling
- Docs

### Simplification plan
- What to move, delete, or delegate

### Result check
- What became smaller, clearer, or more maintainable
- Any tradeoffs that remain
