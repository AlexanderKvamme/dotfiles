# Source .dotfiles
source ~/.dotfiles/system/alias
source ~/.dotfiles/system/functions

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b' # Format the vcs_info_msg_0_ variable
setopt PROMPT_SUBST
PROMPT='in $fg[yellow]${PWD##*/}$reset_color on $fg[blue]${vcs_info_msg_0_} $reset_color $ '

# Source other stuff
source $ZSH/oh-my-zsh.sh
