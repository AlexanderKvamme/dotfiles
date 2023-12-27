brew install --cask karabiner-elements
brew install --cask keyboard-maestro

# Make symlink so that .config/karabiner uses the karabiner.json from my dotfiles
rm ~/.config/karabiner/karabiner.json
ln -s ~/.dotfiles/installers/karabiner.json ~/.config/karabiner/karabiner.json

echo "TODO: 1. Manually add Keyboard Maestro sync file located in Dropbox"
echo "TODO: 2. get the complex modification from notion doc 'Karabiner' and paste it into karabiner elements"
