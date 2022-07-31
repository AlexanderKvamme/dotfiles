# install apps via cask
# CASK APPS
apps=(
  dozer
  slack
  spotify
  vlc
  numi
  1password
  paletro
  cleanshot
  aware
  #Anki
  #google-backup-and-sync
  #textesxpander
  fliqlo
  rocket
  sensibleSideButtons
  google-chrome
  dropbox
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}
brew cask alfred link
brew cask cleanup
brew cleanup
echo "Remember to set your screensaver to fliqlo"

