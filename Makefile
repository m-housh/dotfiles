install-brews:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@brew bundle --no-lock --file "$(PWD)/macOS/.config/macOS/Brewfile"

stow:
	@stow --stow --verbose --target ~ */

fresh-install: install-brews stow
