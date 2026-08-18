# Repository agent guidance

## Change workflow

Use the planning workflow for non-trivial change sets:

1. Inspect the relevant files and clarify scope, behavior, and open decisions.
2. Choose a branch name that reflects the intended final change using a
   conventional commit type, such as:
   - `feat/pi-config`
   - `fix/run-hooks`
   - `docs/readme`
   - `refactor/dev-env`
   - `test/webapp-installer`
   - `chore/ci`
3. Do not use `plan/` as the branch prefix. Planning and implementation happen
   on the eventual implementation branch.
4. Agree on an explicit plan file in the planning session, then hand it to the
   task workspace and Pi agent from the main worktree with:

   ```bash
   herdr-flow implement --plan <path> <type>/<description> [base]
   ```

   The `/implement <type>/<description> [base]` command is the interactive
   equivalent. It asks for the plan path and confirmation. Do not infer a plan
   from conversation history or require a copied `PLAN.md` in the new worktree.
5. Implement the approved plan in the created worktree.
6. Run targeted validation and the repository test suite before considering the
   work complete.

Use plain `wt add <branch> [base]` only when the request is for Git worktree
mechanics without Herdr or Pi orchestration. `wt` owns worktree and local-branch
mechanics; `herdr-flow` owns task orchestration and lifecycle policy. Do not call
`git worktree add` directly.

Small, explicitly requested maintenance edits may be made directly on `main`
when a separate plan and worktree would add no value.

## Validation

Run the complete integration suite with:

```bash
tests/run-all
```

Also run checks appropriate to the touched files, including:

- `bash -n` for changed Bash scripts;
- ShellCheck for changed supported Bash scripts;
- JSON parsing for changed JSON files; and
- `git diff --check` before committing.

Keep tests isolated from the host by using temporary fixtures and command stubs.
Do not invoke package managers, services, mounts, credentials, or other host
state from automated tests.

## Commits and branches

Use conventional commit subjects:

```text
<type>[(scope)]: <imperative description>
```

Common types are `feat`, `fix`, `docs`, `refactor`, `test`, and `chore`. The
branch prefix and final commit type should generally agree, unless the actual
implementation changes scope.

Do not include unrelated changes in a commit. Do not push or merge unless the
user asks.

## Post-merge cleanup

Only clean up a worktree after the user confirms its changes are merged.

1. Confirm the implementation worktree is clean.
2. Return to the repository's main worktree. Let `herdr-flow` perform the
   required fast-forward update.
3. From the main worktree, preview and then explicitly acknowledge merged-task
   cleanup:

   ```bash
   herdr-flow cleanup --preview <type>/<description>
   herdr-flow cleanup --merged <type>/<description>
   ```

   `/cleanup <type>/<description>` is the interactive equivalent. It confirms
   the merge acknowledgement before delegating to `herdr-flow`.
4. Confirm `main` matches its upstream and the worktree, Herdr workspace, and
   local branch are gone.

Never remove an unmerged or dirty worktree without explicit user direction.
Run task cleanup only from the main worktree. Use plain `wt remove` only for a
worktree-only request; do not call `git worktree remove` directly when `wt` can
perform the operation.
