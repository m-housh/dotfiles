bootstrap-homebrew:
	xcode-select --install | true
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	chmod -R go-w $(brew --prefix)

bootstrap-brews:
	@brew bundle \
		--no-lock \
		--cleanup \
		--debug \
		--file "$(PWD)/macOS/.config/macOS/Brewfile"

bootstrap-casks:
	@brew bundle \
		--no-lock \
		--cleanup \
		--debug \
		--file "$(PWD)/macOS/.config/macOS/Casks.Brewfile"

bootstrap-logitech:
	@curl \
		--output ~/Downloads/logi-options.zip \
		https://download01.logi.com/web/ftp/pub/techsupport/options/options_installer.zip

bootstrap-amazon-workdocs:
	@curl \
		--output ~/Downloads/AmazonWorkDocsDrive.pkg \
	  https://d3f2hupz96ggz3.cloudfront.net/mac/AmazonWorkDocsDrive.pkg

bootstrap-app-store:
	@brew bundle \
		--no-lock \
		--cleanup \
		--debug \
		--file "$(PWD)/macOS/.config/macOS/AppStore.Brewfile"

bootstrap-non-brews: bootstrap-logitech bootstrap-amazon-workdocs

stow:
	@stow --stow --verbose --target ~ */

# Order matters, need to install home-brew first then formula
bootstrap: bootstrap-homebrew bootstrap-brews bootstrap-casks stow bootstrap-non-brews bootstrap-app-store
	open ~/Downloads
