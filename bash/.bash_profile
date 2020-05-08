# ~/.bash_profile

## ENV VARS ##
# Basics
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# AppImages
export PATH=$PATH:/usr/local/appimage

# golang
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# NPM without sudo
export PATH=~/.npm-global/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# colors
LS_COLORS="ln=1;32:ex=1;31:di=1;34:fi=0"
export LS_COLORS

# Caps-lock -> ESC
if [ command -v xetxkbmap &> /dev/null ]; then
	setxkbmap -option caps:escape
fi

## ALIASES ##
if [ -f "$HOME/.aliases" ]; then source "$HOME/.aliases"; fi

## FUNCTIONS ##
# export env vars
function dotenv() {
	if [ -e .env ]; then
		while read -r line; do
			export $line
		done < .env
		#export $(cat .env | xargs -L 1)
	fi
}
export -f dotenv

function cd_up() {
	cd $(printf "%0.0s../" $(seq 1 $1))
}
alias cd..=cd_up

# git-completion
# linux
if [ -f /usr/share/git/completion/git-completion.bash ]; then
	source /usr/share/git/completion/git-completion.bash
else
	# darwin
	[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
		# if not found in /usr/local/etc, try the brew --prefix location
		[ -f "/usr/local/etc/bash_completion.d/git-completion.bash" ] && \
			. /usr/local/etc/bash_completion.d/git-completion.bash
	}
fi

# Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.bash.inc" ]; then source "$HOME/.google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/.google-cloud-sdk/completion.bash.inc"; fi

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
