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
4. Create the worktree and Herdr space with:

   ```bash
   wt add --space <type>/<description> [base]
   ```

5. Add `PLAN.md` in the worktree. Keep it focused on the agreed goal, changes,
   tests, validation, and explicit non-goals.
6. Implement the approved plan in the same worktree.
7. Treat `PLAN.md` as temporary implementation scaffolding. Remove it after the
   implementation is complete and before preparing the final commit or pull
   request. It should not appear in the final diff against `main`.
8. Run targeted validation and the repository test suite before considering the
   work complete.

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
2. Pull the merged changes into the main worktree with a fast-forward update.
3. Remove the worktree, close its Herdr space, and delete its local branch using
   `wt`, for example:

   ```bash
   wt remove --space -D --force <type>/<description>
   ```

   `-D` is appropriate after a confirmed squash merge because the implementation
   commit is not an ancestor of `main`.
4. Confirm `main` matches `origin/main`, the worktree is gone, the Herdr space is
   closed, and the local branch was deleted.

Never remove an unmerged or dirty worktree without explicit user direction.
Do not use `git worktree add` or `git worktree remove` directly when `wt` can
perform the operation.
