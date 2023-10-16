# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


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
brew install microsoft-teams
brew install microsoft-outlook
brew install slack

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
brew install microsoft-outlook
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
    echo "Directory .dotfiles already exists."
fi

# install apps via mas (Mac App Store CLI)
mas install 1176895641 # Spark
mas install 1191449274 # ToothFairy
mas install 1287239339 # ColorSlurp

# Install casks
cd ~/.dotfiles

# Setup
echo 'Consider manually installing TextSniper, Codespace'
echo "Done!"

# Install vim plugins
echo "Installing vim plugins..."
vim +PluginInstall +qall

# Subinstallers
sh subinstallers/setOSXSettings.sh
sh subinstallers/installfonts.sh
sh subinstallers/installCasks.sh
sh subinstallers/installTerminalTheme.sh
sh subinstallers/installShortcuts.sh
sh subinstallers/vimPlugins.sh
sh subinstallers/vimTheme.sh
sh subinstallers/terminaltheme.sh
sh subinstallers/installHyperButton.sh
echo "Done!"
