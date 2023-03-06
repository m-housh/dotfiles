# My Dotfiles

This is a repository for my dotfiles. Be warned that these may often change and
that the installation documentation may not always be correct as things
progress.  In general the setup process is something that is only done when
a new machine is purchased or I feel like testing in a virtual machine (which
does not happen often).  It is helpful to have an understanding of what these
commands do on your own.

In general no pull-requests or changes will be accepted, however you can
generate an issue if you find a problem.

It currently will install homebrew and the following homebrew formula.

Most of the functionality is contained in the
[dots](https://github.com/m-housh/dots) project, that is a companion to manage
the dotfiles, which expects the dotfiles directory to be at `~/.dotfiles`.

```
fd
figlet
gh
git
httpie
jq
mas
pure
node
ripgrep
swift-format
swift-zet
tmux
vim
zsh
zsh-completions
```

It will also install the following homebrew casks in the `~/Applications` directory.

```
docker
espanso
google-chrome
iterm2
onyx
rapid-api
rectangle
```

And the following fonts.

```
font-inconsolata-nerd-font

```

The following applications will be installed from the macOS app store.

```
Developer
Home Assistant
pwSafe
Xcode
```

## Installation

Clone the repository.

```bash
git clone https://m-housh/dotfiles.git ~/.dotfiles && \
  cd ~/.dotfiles
```

On a fresh system run the following command from the dotfiles root.

```
make bootstrap
```

This start by installing homebrew, then install the required homebrew formulas and casks.  Next it will use
`gnu-stow` to symlink configuration files to the appropriate locations.  And finally, it will download
applications from the `App Store`.  When the bootstrap command is done it will open up the `~/Downloads` folder
for the few applications that get downloaded from the internet, so that you can finish the installation of those applications.

### Minimal Setup

If you would like to just setup minimal stuff, link dotfiles, and install brews.
Then you can run the following command.

```bash
make bootstrap-minimal
```

## To set macOS settings

```bash
source scripts/setup_defaults
```

## Post Installation

After everything has finished up, you will be able to open `iTerm2` and load
the profile which should now be symlinked to `~/.config/macOS/iterm/profile.json`

## Make commands

It is also possible to not do the full bootstrapping.  If you would only like
to install homebrew (without any formula or casks) then you can run the following
command.

```
make bootstrap-homebrew
```

## Other Make Commands

If you would like to setup any specific `zsh` configuration that is only for
the local machine then you can run the following command.

```bash
make zshrc-local
```

This will generate and symlink a file that you can use to extend the default
`zshrc` configuration.  In general, I use this to set custom location for
homebrew casks to be installed on certain machines.
