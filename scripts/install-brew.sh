#/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
chmod -R go-w "$(/opt/homebrew/bin/brew --prefix)"
