bootstrap-homebrew:
	xcode-select --install | true
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

bootsrap-brews:
	@brew bundle \
		--no-lock \
		--cleanup \
		--debug \
		--file "$(PWD)/macOS/.config/macOS/Brewfile"

bootstrap-app-store:
	@brew bundle \
		--no-lock \
		--cleanup \
		--debug \
		--file "$(PWD)/macOS/.config/macOS/AppStore.Brewfile"

stow:
	@stow --stow --verbose --target ~ */

# Order matters, need to install home-brew first then formula
bootstrap: bootstrap-homebrew bootstrap-brews stow bootstrap-app-store
