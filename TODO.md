# TODO

## Arch Todos

- [ ] Update README, it's way out of date.
- [x] Separate scripts that are used for configurations / store them somewhere aside
  from `~/.local/bin`
- [x] Add neomutt configuration files into the repo (or probably a private repo)
- [x] Clipse didn't work when installed on a new machine when I try to use the
  config in the dotfiles, but works if I use the default config. Need to explore
  why (current thoughts are it has to do with creating the
  clipboard_history.json file and not letting clipse do it automatically).
- [ ] Need to confirm bootstrap does things properly with git submodules.
    - [ ] Need to ensure ssh keys are setup before private submodules are loaded / installed,
    so I need to make sure that Yubikey setup runs early and works for ssh authentication.
- [ ] Need to add the following system packages for neovim/render-markdown.nvim
    - [ ] `libtexprintf`

### Keyboard / kanata

- [ ] Move keyboard (kanata) systemd service to be started as a '--user' service, as
  it seems to not work when used on a desktop (mac mini) vs. laptop.
  - [ ] Need to update kanatactl to generate udev rules, etc. (see
        here)[https://github.com/jtroo/kanata/blob/main/docs/setup-linux.md]
- [ ] Need to rethink symbol / number keyboard layers.
    - [ ] Move symbols to their own layer.
    - [ ] I would like to have a symbols layer that I can hold modifier keys with a symbol
          and would also like to possibly pass through underlying key / experiment so that
          I can use default keybinds in certain applications (i.e. neovim `[b`, etc.).  
### Runs (package installs)

- [ ] Should runs just export / echo a list of packages, then the `run` script can handle the package
      manager options / command.
- [ ] Think about adding an `after` directory for runs, so that they can perform setup tasks after
      the packages are installed.
    - [ ] The `after` file should have the same name as the `run` file.
    - [ ] This could allow to remove / move the `system` script into the `after` directory.
