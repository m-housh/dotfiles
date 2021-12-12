install-brews:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@brew bundle --file "$(PWD)/macOS/Brewfile"

stow:
	@stow --stow --verbose --target ~ */

fresh-install: install-brews stow
