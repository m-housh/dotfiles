# Repository guidance

This repository contains Michael's personal dotfiles and configuration used
across his machines, primarily Arch Linux workstations running Hyprland.
It also includes scripts and package manifests for setting up and maintaining
those environments.

The configuration reflects personal preferences and machine requirements.
See README.md for installation details and command usage.

## Structure

- `env/` contains configuration and assets installed onto each machine.
  - `.config/` holds application configuration. Neovim is a Git submodule.
  - `.local/scripts/` holds shell utilities.
  - `.pi/agent/` holds shared Pi guidance, skills, extensions, and themes.
  - `webapps/` holds webapp specifications.
- `runs/` contains package manifests and optional `before/` and `after/` hooks.
- `dev-env` installs configuration for workstation and container profiles.
- `devcontainer-env` wraps the container profile.
- `run` installs or removes packages from the manifests.
- `webapp` installs or removes webapps.
- `gen` generates package manifests, webapp specifications, and scripts.
- `tests/` contains isolated Bash integration tests.
- `bootstrap` and `repos` are older machine-setup helpers. Review them before use.

## Making changes

Keep changes focused on the requested configuration or behavior. Consider
whether a change should apply across machines or belong in machine-specific
configuration.

Edit the repository sources rather than installed copies in the home directory.
Update README.md when installation behavior or command usage changes.

For script or installer changes, run `tests/run-all` and appropriate checks:
Bash syntax checks, ShellCheck for supported Bash scripts, and JSON parsing
for changed JSON files. Run `git diff --check` for all changes.

Keep automated tests isolated using temporary fixtures and command stubs.
Tests must not alter host packages, services, mounts, or credentials.

Use conventional commit subjects. Do not push or merge unless asked.
