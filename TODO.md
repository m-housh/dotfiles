# TODO

## Arch Todos

- [ ] Update README, it's way out of date.
- [x] Separate scripts that are used for configurations / store them somewhere aside
  from `~/.local/bin`
- [x] Clipse didn't work when installed on a new machine when I try to use the
  config in the dotfiles, but works if I use the default config. Need to explore
  why (current thoughts are it has to do with creating the
  clipboard_history.json file and not letting clipse do it automatically).
- [ ] Move keyboard (kanata) systemd service to be started as a '--user' service, as
  it seems to not work when used on a desktop (mac mini) vs. laptop.
  - [ ] Need to update kanatactl to generate udev rules, etc. (see
        here)[https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md]
- [x] Add neomutt configuration files into the repo (or probably a private repo)
- [ ] Need to confirm bootstrap does things properly with git submodules.
    - [ ] Need to ensure ssh keys are setup before private submodules are loaded / installed,
    so I need to make sure that Yubikey setup runs early and works for ssh authentication.
