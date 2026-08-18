# Fix Herdr flow pane readiness

## Problem

`herdr workspace create` can return the root pane ID before that pane's terminal runtime is available to later Herdr commands. `herdr-flow implement` currently calls `herdr agent start` immediately, so a normal workspace-startup race can leave a durable worktree and workspace while reporting agent startup failure.

## Scope and ownership

- Keep `herdr-flow` responsible for sequencing the worktree, workspace, and agent handoff.
- Wait only until Herdr can inspect the newly created root pane's process state before starting the agent.
- Keep Herdr responsible for creating the pane and for verifying that the started agent becomes interactively ready; do not duplicate Herdr's shell or agent detection in the wrapper.
- Preserve the existing durable-state recovery policy and keep pushes, merges, and worktree cleanup manual.
- Following user steering, make successful planned-task handoffs require an initial conventional commit after validation.

## Implementation

1. Add a bounded root-pane readiness check after parsing the workspace creation response and before `herdr agent start`.
2. Poll `herdr pane process-info` briefly so transient terminal-runtime delays succeed without changing the agent startup command.
3. Report a clear setup failure with the worktree and workspace recovery details if the pane never becomes available.
4. Extend the isolated `herdr-flow` integration stub to simulate delayed and permanently unavailable panes.
5. Assert that agent startup waits for pane readiness and that readiness failure never attempts agent startup or hidden cleanup.
6. Update both implementation prompts to require a conventional commit after successful validation while still prohibiting automatic push, merge, and cleanup.

## Validation

- Run `bash -n` on changed Bash files.
- Run ShellCheck on changed supported Bash files.
- Run `tests/herdr-flow-test`.
- Run the complete `tests/run-all` integration suite.
- Run `git diff --check` and inspect the final diff/status.
