---
name: security-review
description: Reviews code, scripts, config, and automation for security risks such as secret exposure, unsafe shell usage, trust-boundary mistakes, and insecure defaults. Use when the user wants a security-focused review.
---

# Security Review

Use this skill when the user wants a security-focused review of code, scripts, config, automation, or infrastructure-related changes.

## Goal

Identify concrete security risks and explain them clearly, without exaggeration.

## Review Focus

Check for:
- secrets committed, echoed, logged, or copied into unsafe locations
- unsafe shell command construction or injection risks
- path traversal or over-broad file operations
- auth/authz mistakes or incorrect trust assumptions
- insecure defaults or missing validation
- unsafe handling of user-controlled input
- accidental credential reuse across contexts
- permissions that are too broad

## Workflow

1. Inspect the actual files or diff before making claims.
2. Focus on realistic attack surfaces and trust boundaries.
3. Distinguish exploitable risks from general hardening ideas.
4. Prefer concrete examples of how a bug could happen.
5. If nothing significant is found, say so clearly.

## Severity Guidance

Use these buckets when helpful:
- `high` — likely credential leak, command injection, privilege issue, or major trust-boundary failure
- `medium` — realistic security weakness or unsafe pattern
- `low` — defense-in-depth or hardening opportunity

## Output Format

Use this structure:

### Summary
- brief security assessment

### Findings
- `[high]` ...
- `[medium]` ...
- `[low]` ...

### Hardening Suggestions
- optional non-blocking improvements

### Security Verdict
- `no significant security issues found`, or
- `security changes recommended before merge`

## Guidance

- Be concrete about the threat or failure mode.
- Name the boundary involved: user input, environment, filesystem, network, credentials, session, repo, etc.
- Avoid vague statements like "this may be insecure" without explanation.
- Do not invent external attackers or deployment assumptions unless the code implies them.
- Treat secrets, auth files, runtime state, and machine-local credentials as sensitive by default.
