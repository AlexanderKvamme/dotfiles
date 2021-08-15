bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Convenience paths
alias stretch='cd /Users/alexanderkvamme/Documents/workspaces/code/swift/Stretchapp'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/Documents/workspaces/code/react/helseapp-devops/frontend
export GOPRIVATE=github.com/solarstein
export blifrisk=~/Documents/workspaces/code/react/helseapp-blifrisk-rn
export happy=/Users/alexanderkvamme/Documents/workspaces/code/swift/Stretchapp
export ANDROID_HOME=/Users/alexanderkvamme/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
# Fastlane variables
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export REACT_EDITOR=atom

# function to add git info to the input line

prompt_git() {
	local s='';
	local branchName='';

	# Check if the current directory is in a Git repository.
	if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

		# check if the current directory is in .git before running git checks
		if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

			# Ensure the index is up to date.
			git update-index --really-refresh -q &>/dev/null;

			# Check for uncommitted changes in the index.
			if ! $(git diff --quiet --ignore-submodules --cached); then
				s+='+';
			fi;

			# Check for unstaged changes.
			if ! $(git diff-files --quiet --ignore-submodules --); then
				s+='!';
			fi;

			# Check for untracked files.
			if [ -n "$(git ls-files --others --exclude-standard)" ]; then
				s+='?';
			fi;

			# Check for stashed files.
			if $(git rev-parse --verify refs/stash &>/dev/null); then
				s+='$';
			fi;

		fi;

		# Get the short symbolic ref.
		# If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
		# Otherwise, just give up.
		branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
			git rev-parse --short HEAD 2> /dev/null || \
			echo '(unknown)')";

		[ -n "${s}" ] && s=" [${s}]";

		echo -e "${1}${branchName}${2}${s}";
	else
		return;
	fi;
}

# Alexander's FAC - Find And Copy
function fac() {
	find . -name "*${1}*" | tr -d '\n' | pbcopy
	OUTPUT=$(find . -name "*${1}*" | tr -d '\n')
	echo "${OUTPUT}"
}

# Color variables
orange=$(tput setaf 223);
yellow=$(tput setaf 174);
white=$(tput setaf 15);
bold=$(tput bold);
violet=$(tput setaf 153);
blue=$(tput setaf 33);
reset=$(tput sgr0);

# Set the terminal title and prompt.
PS1="\[\033]0;\W\007\]"; # working directory base name
PS1+="\[${bold}\]\n"; # newline
PS1+="\[${orange}\]\u"; # username
PS1+="\[${white}\] in ";
PS1+="\[${yellow}\]\W"; # working directory full path
PS1+="\$(prompt_git \"\[${white}\] on \[${violet}\]\" \"\[${blue}\]\") "; # Git repository details
#PS1+="\n";
PS1+="\[${white}\]\$ "; # `$`

export PS1;

trap '[[ -t 1 ]] && tput sgr0' DEBUG # reset to terminal theme color after input
source $HOME/.solarstein/dot-root

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export DISPLAY=localhost:0.0

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alexanderkvamme/google-cloud-sdk/path.bash.inc' ]; then . '/Users/alexanderkvamme/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alexanderkvamme/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/alexanderkvamme/google-cloud-sdk/completion.bash.inc'; fi
