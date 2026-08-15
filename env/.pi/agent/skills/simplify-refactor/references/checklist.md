# Simplify Refactor Checklist

Use this checklist when a refactor is supposed to reduce complexity rather than add features.

## 1. Boundary check

- What are the layers involved?
- Which layer should own context or policy?
- Which layer should own mechanics or validation?
- Is any concern implemented in more than one place?

## 2. Duplication check

Look for repeated:

- argument parsing
- validation
- branching logic
- state tracking
- error handling
- help text or interface docs

## 3. Delegation check

- Can a higher-level layer pass arguments through instead of re-parsing them?
- Can a wrapper call the lower-level primitive directly?
- Are we rebuilding behavior that the primitive already supports?
- Are we keeping extra glue only because it already exists?

## 4. Complexity check

- Did the number of branches or code paths go down?
- Did the wrapper or adapter get smaller?
- Did the number of owners for a concern go from many to one?
- If line count went up, did conceptual complexity still go down?

## 5. Documentation check

- Is there one canonical help surface?
- Can higher-level docs point to the source of truth instead of repeating the full interface?
- Do examples reflect the intended ownership boundary?

## 6. Safe exceptions

Duplication may still be justified when there is a clear reason, such as:

- intentionally different user-facing UX
- compatibility behavior
- policy enforcement at a higher layer
- security guardrails
- better diagnostics that do not belong in the primitive

## 7. Final summary

Capture the simplification result in a compact form:

- Boundary enforced:
- Duplication removed:
- Now owned by:
- Net simplification:
- Remaining tradeoffs:
