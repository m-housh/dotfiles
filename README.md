# My Dotfiles

This is my repository for learning dotfiles.

It currently will install homebrew and the following homebrew formula.

```
fd
git
mas
neovim
node
ripgrep
stow
swift-format
zsh
zsh-completions
```

It will also install the following homebrew casks in the `~/Applications` directory.

```
docker
google-chrome
iterm2
microsoft-teams
obs
paw
sketchup-pro
```

And the following fonts.

```
font-inconsolata-nerd-font

```

The following applications will be installed from the macOS app store.

```
pwSafe
Xcode
```

The following non-app-store applications will be downloaded for later installation / setup.  These will be placed in `~/Downloads`

```
Logi Options      # logitech mouse / keyboard settings
AmazonWorkDocsDrive
```

## Installation

Clone the repository.

```bash
git clone https://m-housh/dotfiles.git ~/.dotfiles && \
  cd ~/.dotfiles
```

The Makefile includes commands to install dependencies andlink the configuration using `gnu-stow`.

On a fresh system run the following command from the dotfiles root.

```
make bootstrap
```

This start by installing homebrew, then install the required homebrew formulas and casks.  Next it will use
`gnu-stow` to symlink configuration files to the appropriate locations.  And finally, it will download
applications from the `App Store`.  When the bootstrap command is done it will open up the `~/Downloads` folder
for the few applications that get downloaded from the internet, so that you can finish the installation of those applications.

## Post Installation

After everything has finished up, you will be able to open `iTerm2` and load the profile which should now be symlinked
to `~/.config/macOS/iterm/profile.json`

You will also want to open `neovim` and run `:PackerSync` or `:PackerInstall` to download all the `neovim` plugins.

## Make commands

It is also possible to not do the full bootstrapping.  If you would only like to install homebrew (without any formula or casks) then you can run the following command.

```
make bootstrap-homebrew
```

Once homebrew is installed, if you'd like to install the homebrew formula (located in `macOS/.config/macOS/Brewfile`) then you can run the following command.

```
make bootstrap-brews
```

To install homebrew casks (located in `macOS/.config/macOS/Casks.Brewfile`) then you can run the following command.

```
make bootstrap-casks
```

To symlink the configuration files only then you can run.

```
make stow
```

To download the logitech options application and place in your `~/Downloads` folder, you can run.

```
make bootstrap-logitech
```

To download the amazon workdocs drive installer and place in your `~/Downloads` folder, you can run.

```
make bootstrap-amazon-workdocs
```

And finally to download the app store applications run.

```
make bootstrap-app-store
```
