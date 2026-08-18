# Global agent guidance

- Keep responses concise unless additional detail is useful.
- Keep managed guidance non-sensitive and avoid adding credentials, private values, or
  machine-specific state.

## Planned tasks and worktrees

For a full handoff of an agreed plan from the repository's main worktree, use:

```text
herdr-flow implement --plan <path> <branch> [base]
```

The plan path must be explicit. Do not infer an approved plan from conversation history or require a
copied `PLAN.md` in the task worktree. The `/implement <branch> [base]` command is the interactive
adapter: it asks for the plan path and confirmation before delegating to `herdr-flow`.

Use plain `wt add <branch> [base]` only when the request is for Git worktree mechanics without
Herdr/Pi orchestration. `wt` owns Git worktree and local-branch mechanics. `herdr-flow` owns Herdr,
Pi, and task lifecycle orchestration. Do not call `git worktree add` directly. If the branch, base,
or plan is ambiguous, ask before proceeding.

After the user confirms a task was merged, initiate cleanup from the main worktree with
`herdr-flow cleanup --merged <branch>` or `/cleanup <branch>`. Never run task cleanup from a linked
feature worktree, and never infer merge acknowledgement.

## Responses

Always respond to the user in simplified plain English in accordance with the ISO 24495-1:2023
standard.
