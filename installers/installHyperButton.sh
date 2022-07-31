brew install --cask karabiner-elements
brew install --cask keyboard-maestro

# Make symlink so that .config/karabiner uses the karabiner.json from my dotfiles
rm ~/.config/karabiner/karabiner.json
ln -s ~/.dotfiles/installers/karabiner.json ~/.config/karabiner/karabiner.json
