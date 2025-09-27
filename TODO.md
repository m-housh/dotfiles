# TODO

- Add zsh functions to dots cli manager.
- Add tmux plugins to dots cli manager.
- Add tmux-powerline linking to `dots` cli manager.
- Clean up zet commands, maybe make a gum / fzf filter script.
- Update README to reflect ansible installation
- Update ansible to do gpg installation.
- Update ansible to include sketchybar.

# Arch Todos

- Separate scripts that are used for configurations / store them somewhere aside
  from `~/.local/bin`
- Clipse didn't work when installed on a new machine when I try to use the
  config in the dotfiles, but works if I use the default config. Need to explore
  why (current thoughts are it has to do with creating the
  clipboard_history.json file and not letting clipse do it automatically).
- Set sddm login theme, currently it doesn't allow me to echo values into the
  /etc/sddm.conf file, also need to edit the theme in
  `/usr/share/sddm/themes/catppuccin-mocha/theme.conf` to use the wallpaper as a
  background image.
  - Note: The background needs to be copied into the theme's background
    directory. It didn't seem to work when I just set the path to somewhere in
    my home directory.
- Add script to generate yubikey authentication using the pam-u2f module
  [documentation](https://wiki.archlinux.org/title/Universal_2nd_Factor).
  - Note: that the directory this is stored in MUST be ~/.config/Yubico (I tried
    using ~/.config/yubico and it didn't work)
