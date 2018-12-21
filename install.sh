cd ~
if [ ! -d ".dotfiles" ]
then
	echo "Creating an SSH key for you..."
	ssh-keygen -t rsa -C "alexanderkvamme@gmail.com"

	echo "Please add this public key to Github"
	echo "https://github.com/account/ssh"
	read -p "Press [Enter] key after this..."

	mv id_rsa.pub ~/.ssh/
	mv id_rsa ~/.ssh/
fi

# install Xcode command-line tools
echo "Installing xcode-stuff"
xcode-select --install

# set up directories
mkdir -p ~/Documents/workspaces/code/swift
mkdir -p ~/Documents/workspaces/music
mkdir -p ~/Documents/workspaces/design


# Install Home-brew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

# install mas - https://github.com/mas-cli/mas
brew install mas

# setup git
echo "Installing Git..."
brew install git

echo "Git config"
git config --global user.name "Alexander Kvamme"
git config --global user.email alexanderkvamme@gmail.com

echo "Installing other brew stuff..."
brew install trash
brew install tree
brew install tig
brew install ack
brew install jq
#brew install sqlite??
brew install wget

echo "Cleaning up brew"
brew cleanup






# download my .dotfiles if they dont exist
if [ ! -d ".dotfiles" ] 
then
    echo "Copying dotfiles from Github"
    cd ~
    git clone git@github.com:AlexanderKvamme/dotfiles.git .dotfiles
    #cd .dotfiles
    #sh symdotfiles
    ln -s ".dotfiles/runcom/.bash_profile"
else
    echo "Directory .dotfiles already exists."
fi



#echo "Setting up Oh My Zsh theme..."
#cd  /Users/bradparbs/.oh-my-zsh/themes
#curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/#cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > #brad-muse.zsh-theme


# install apps via mas
mas install 866773894 #quiver
mas install 1176895641 #spark
mas install 441258766 #Magnet
mas install 577085396 #Unclutter
mas install 568494494 #Pocket

# install apps via cask
# Apps
apps=(
  Anki
  atom
  alfred
  bartender
  bettertouchtool
  slack
  #cleanmymac
  dropbox
  google-chrome
  spotify
  #textexpander
  skype
  transmission
  #onepassword
  #qlstephen
  #suspicious-package
  vlc
  rocket
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

#brew cask cleanup
brew cleanup


#install from github
#https://github.com/josh/Aware/


#setup osx things

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Setting screenshots location to ~/Desktop"
defaults write com.apple.screencapture location -string "$HOME/Desktop"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#"Use `~/Downloads/Incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

#"Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

#"Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

#"Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

#"Disable 'natural' (Lion-style) scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

killall Finder

echo "Done!"
