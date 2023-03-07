BREWPATH ?= /opt/homebrew/bin
BREW = $(BREWPATH)/brew
DOTS = $(BREWPATH)/dots

# This does not work inside of a make command.
bootstrap-homebrew:
	xcode-select --install || true
	source "$(PWD)/scripts/install-brew.sh"

# Install the dots application manager.
install-dots:
	"$(BREW)" tap m-housh/formula
	"$(BREW)" install dots

bootstrap-minimal: bootstrap-homebrew install-dots
	"$(DOTS)" install --minimal

bootstrap: bootstrap-homebrew install-dots
	"$(DOTS)" install --full

# make a local zsh configuration file, to extend
# the normal .zshrc for configuration that is only
# relevant on the local machine.
zshrc-local:
	# check if a file already exists or not and create it if not.
	test  -f "$(PWD)/zsh/config/.zshrc-local" \
		|| echo "#!/usr/bin/env zsh" > "$(PWD)/zsh/config/.zshrc-local"
	# add symlink to appropriate location if doesn't exist.
	test -L "$(HOME)/.config/zsh/.zshrc-local" \
		|| ln -sfv "$(PWD)/zsh/config/.zshrc-local" "$(HOME)/.config/zsh/"
	# open the file to edit.
	vim "$(PWD)/zsh/config/.zshrc-local"

default: bootstrap
