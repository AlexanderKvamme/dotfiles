brew cask install hammerspoon

# må kanskje legge til accesibility

git clone https://github.com/jasonrudolph/keyboard.git ~/.keyboard

cd ~/.keyboard

script/setup

cd ~/.dotfiles/
rm /Users/alexander/.hammerspoon/keyboard/hyper-apps-defaults.lua
cp hyper-apps-defaults.lua /Users/alexander/.hammerspoon/keyboard/hyper-apps-defaults.lua 

echo "you must restart your machine for hammerspoon to work"
