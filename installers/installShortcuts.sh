
#### NY - KAN MULIGENS SLETTE HELE OG HELLER LAGE SHORTCUTS SLIK:

defaults write -app com.apple.finder NSUserKeyEquivalents '{
  "Tags..."="^~@J"
}'

defaults write -app Quiver NSUserKeyEquivalents '{
"Notebook"="@~N";
}'

# Hide sidebar
defaults write com.apple.Finder NSUserKeyEquivalents -dict-add 'Hide Sidebar' -string '^~@H'
defaults write com.apple.Finder NSUserKeyEquivalents -dict-add 'Show Sidebar' -string '^~J'


### GAMMEL - kan brukes om ikke dictionary settingen funker ###
# må kopieres til ~/Library/KeyBindings/DefaultKeyBinding.Dict
# Symlink funker ikke: https://apple.stackexchange.com/questions/53066/textedit-key-bindings-modified-in-defaultkeybinding-dict-stopped-working

#mkdir ~/Library/KeyBindings/
#cp DefaultKeyBinding.Dict ~/Library/KeyBindings/DefaultKeyBinding.Dict

:'

### Key Modifiers ###

^ : Ctrl
$ : Shift
~ : Option (Alt)
@ : Command (Apple)
# : Numeric Keypad

### Non-Printable Key Codes ###

Standard
Up Arrow:     \UF700        Backspace:    \U0008        F1:           \UF704
Down Arrow:   \UF701        Tab:          \U0009        F2:           \UF705
Left Arrow:   \UF702        Escape:       \U001B        F3:           \UF706
Right Arrow:  \UF703        Enter:        \U000A        ...
Insert:       \UF727        Page Up:      \UF72C
Delete:       \UF728        Page Down:    \UF72D
Home:         \UF729        Print Screen: \UF72E
End:          \UF72B        Scroll Lock:  \UF72F
Break:        \UF732        Pause:        \UF730
SysReq:       \UF731        Menu:         \UF735
Help:         \UF746

OS X
delete:       \U007F
'
