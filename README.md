# Dotfiles

Personal Arch Linux and Hyprland configuration, package manifests, and setup
utilities.

This repository is tailored to my machines and services. It is useful as a
reference, but it is not intended to be a general-purpose dotfiles installer.
Review dry-run output before applying it to another system.

## What is managed

The repository contains configuration for Zsh, Neovim, Hyprland, Waybar,
Ghostty, Git, tmux, systemd user services, and other command-line and desktop
tools. It also contains:

- scripts installed under `~/.local/scripts`;
- portable Pi guidance, skills, and themes under `env/.pi/agent`;
- package manifests and optional lifecycle hooks under `runs/`;
- webapp specifications under `env/webapps`;
- encrypted machine-specific configuration; and
- a Git submodule for Neovim configuration.

## Repository layout

- `env/` — files installed into the home and XDG directories.
- `runs/` — package manifests, with optional `before/` and `after/` hooks.
- `dev-env` — full and development-container configuration installer.
- `devcontainer-env` — compatibility wrapper for the container profile.
- `run` — installs or uninstalls package manifests with `yay`.
- `webapp` — installs or uninstalls repository webapp specifications.
- `gen` — generates run manifests, webapp specs, and general scripts.
- `tests/` — isolated Bash integration tests.

## Initial setup

The expected repository location is the value assigned to `DEV_ENV`. The
installed Zsh environment defaults it to:

```text
~/.config/personal/dotfiles
```

Clone the repository and initialize the available submodules:

```bash
git clone git@github.com:m-housh/dotfiles.git \
  "$HOME/.config/personal/dotfiles"
cd "$HOME/.config/personal/dotfiles"
git submodule update --init --recursive
export DEV_ENV=$PWD
```

### Full environment

First inspect the complete installation plan:

```bash
./dev-env full --dry-run --no-reload
```

Apply it without immediately replacing the current process with a login Zsh:

```bash
./dev-env full --no-reload
```

Start a new login shell after the command completes:

```bash
exec zsh -l
```

The `full` profile installs configuration and scripts, generates completions,
and reloads user services. It intentionally has a mix of replacement and merge
policies. Run `./dev-env --help` for the current policy summary.

This setup expects an Arch/Hyprland workstation and invokes host tools such as
Podman, systemd, Hyprland, and Espanso. A dry-run does not change the filesystem
or invoke those host actions.

### Development container

For the smaller container profile, run:

```bash
./devcontainer-env --dry-run
./devcontainer-env
```

The wrapper uses its own repository directory as `DEV_ENV` and forwards options
to `dev-env container`. The container profile installs a small set of shell and
development configuration without workstation service actions.

## Pi resources

Both the full and container profiles install the portable Pi resources from
`env/.pi/agent` into `~/.pi/agent`. Managed global guidance, the managed
`herdr-flow.ts` extension, same-named skills, and same-named themes are updated
on each installation. Other extensions and runtime entries are left in place.

Managed Pi sources must be portable filesystem entries rather than symlinks.
Each top-level skill is a real directory with a regular `SKILL.md` and may
contain only real directories and regular files. Guidance, settings, the managed
extension, and themes are regular files. All managed Pi sources are validated
before runtime entries are changed.

The managed `settings.json` is only an initial default: it is copied when no
runtime settings file exists and selects the `catppuccin-mocha` theme. An
existing `~/.pi/agent/settings.json` is preserved byte-for-byte. To use the
managed Catppuccin theme with an existing runtime, select it once through
Pi's `/settings` interface.

Credentials, models, sessions, trust decisions, package directories, Herdr
state, unrelated extensions, and other machine-local runtime files are
deliberately excluded from dotfile management. Keep those only in the live
`~/.pi/agent` directory.

## Herdr task workflow

`wt` is the low-level Git worktree helper. It creates, removes, lists, and
prunes worktrees and local branches; it does not manage Herdr or Pi. For a
worktree-only operation, use:

```bash
wt add feat/example [base]
wt remove -D --force feat/example
```

`herdr-flow` owns the planned-task lifecycle. Run implementation handoff from
inside Herdr and from the repository's main worktree, with an explicit readable
plan file:

```bash
herdr-flow implement --plan /path/to/approved-plan.md feat/example [base]
```

It validates all inputs before mutation, delegates worktree creation to `wt`,
creates a Herdr workspace, starts a named Pi agent, sends the complete plan, and
focuses the workspace only after setup succeeds. It does not move, copy, or
delete the plan file. In Pi, `/implement feat/example [base]` asks for that path
and shows the resolved inputs before it delegates to the same command.

After the task is merged, return to the main worktree. Preview the exact actions,
then provide the required merge acknowledgement:

```bash
herdr-flow cleanup --preview feat/example
herdr-flow cleanup --merged feat/example
```

Cleanup requires both main and the target worktree to be clean, and refuses
missing, ambiguous, current, and main targets. It first fast-forwards local
`main` from its configured upstream, then closes the matching
Herdr workspace, delegates worktree and branch removal to `wt`, prunes stale
metadata, and verifies removal. `/cleanup feat/example` provides the same preview
and confirmation. From a linked worktree, `/cleanup` only prints the commands to
run later from main.

## Package runs

Files immediately under `runs/` are package lists consumed by `yay`. Matching
executable files under `runs/before/` and `runs/after/` perform optional setup
or teardown.

Install every package run:

```bash
./run install
```

Install only runs whose path matches a filter:

```bash
./run hyprland
```

Remove the matching packages and run uninstall hooks:

```bash
./run uninstall hyprland
```

The command syntax is `run [--dry-run] [install|uninstall] [FILTER]`; mode and
filter may each be supplied at most once. Preview either operation with
`--dry-run`. The filter is a Bash regular expression matched against each full
manifest path, so one filter may select multiple manifests. Malformed regular
expressions and unknown options are rejected. Run `./run --help` for the command
summary.

`run` expects `DEV_ENV` and `SCRIPTS` to be set. The installed Zsh environment
sets both; when running directly from a fresh clone, point `SCRIPTS` at the
repository copy:

```bash
DEV_ENV=$PWD SCRIPTS=$PWD/env/.local/scripts ./run --dry-run hyprland
```

## Webapps

Install every spec under `env/webapps`:

```bash
./webapp
```

Filter specs by name, preview changes, or uninstall matching specs:

```bash
./webapp github
./webapp --dry-run github
./webapp --uninstall github
```

As with package runs, the optional filter is a regular expression. Local icons
come from `env/.local/share/applications/icons`; remote icons are downloaded by
the webapp installer.

## Generating files

`gen` requires `DEV_ENV` and accepts exactly one type and destination name:

```bash
./gen run example
./gen webapp example
./gen script example
```

Run manifests are non-executable package lists. Webapp names receive a `.json`
extension when omitted. Script names may contain relative subdirectories and
are generated as executable Bash scripts. Existing destinations and paths that
escape their managed directory are rejected.

See `./gen --help` for the command summary.

## Tests

Run every integration test locally with:

```bash
tests/run-all
```

The tests use temporary fixtures and command stubs rather than modifying the
host. CI also runs Bash syntax checks and ShellCheck for the supported entry
points, package lifecycle and webapp helpers, test runner, and all
`tests/*-test` scripts. The deferred `bootstrap` and `repos` helpers are not part
of this enforcement.

## Deferred setup scripts

`bootstrap` and `repos` are older, infrequently exercised machine-setup helpers.
They are not the recommended entry points at present. Full machine setup is
normally performed in supervised stages using `dev-env`, `run`, and `webapp`.
The older helpers should be reviewed before use.

## License

See [LICENSE](LICENSE). Contributions are additionally covered by the
[Developer Certificate of Origin](DOC).
