
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

# Install junegunn/vim-plug
# - for installing vim plugins via a Plug command
echo 'Trying to run vimPlugins.sh. Double check this is working'
sh vimPlugins.sh
sh installfonts.sh

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
brew install git bash-completion

echo "Git config"
git config --global user.name "Alexander Kvamme"
git config --global user.email alexanderkvamme@gmail.com

echo "Installing other brew stuff..."
brew install trash
brew install tree
brew install tig
brew install ack
brew install fzf
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


# install apps via mas (Mac App Store CLI)
mas install 866773894  # Quiver
mas install 1176895641 # Spark
mas install 441258766  # Magnet
mas install 577085396  # Unclutter
mas install 1191449274 # ToothFairy
mas install 1287239339 # ColorSlurp

# install apps via cask
# CASK APPS
apps=(
  dozer
  sensibleSideButtons
  alfred
  slack
  dropbox
  google-chrome
  spotify
  vlc
  rocket
  #quick lock extensions - https://github.com/sindresorhus/quick-look-plugins
  numi
  onepassword
  paletro
  cleanshot
  aware
  # atom
  #Anki
  #google-backup-and-sync
  #textesxpander
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install --cask --appdir="/Applications" ${apps[@]}

echo "Remember to set your screensaver to fliqlo"
brew install --cask fliqlo

brew cask alfred link
brew cask cleanup
brew cleanup

# Setup
sh setupKarabiner.sh

sh setOSXSettings
echo 'Consider manually installing TextSniper, Codespace'
echo "Done!"
