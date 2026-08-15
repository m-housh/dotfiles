# Global agent guidance

- Keep responses concise unless additional detail is useful.
- Keep managed guidance non-sensitive and avoid adding credentials, private values, or machine-specific state.

## Worktrees

When asked to create a new Git worktree, use:

```text
wt add --space <branch> [base]
```

Do not call `git worktree add` directly. The `--space` option creates and opens the corresponding Herdr workspace. If the branch or base is ambiguous, ask before proceeding.
