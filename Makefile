install-brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install-brew-recipes:
	@brew install stow \
		httpie \
		zsh

install-brew-casks:
	@brew install --cask docker \
		google-chrome

stow:
	@stow --stow --verbose --target ~ */

fresh-install: install-brew install-brew-recipes install-brew-casks stow
