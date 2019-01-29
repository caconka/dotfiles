# Caconka

# Config colors and git λ
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\n\[\e[1;31m\]> \[\e[39m\]\W$(__git_ps1 " \[\e[39m\]git:\[\e[1;32m\]%s")\[\e[39m\] '
source /usr/share/git/completion/git-completion.bash
source /usr/share/nvm/init-nvm.sh
source <(kubectl completion bash)

# Default text-editor
export Editor="vim"
export VISUAL="vim"

[[ $- != *i* ]] && return

# History
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignoredups:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -a; history -r; \
	$PROMPT_COMMAND"

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

# ls colors
alias ls='ls --color'
LS_COLORS='ln=1;32:ex=1;31:di=1;34:fi=0'
export LS_COLORS

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# TMUX
if [[ -z "$TMUX" ]] ;then
	ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
	if [[ -z "$ID" ]] ;then
		tmux new-session 'HISTFILE=$HOME/.bash_history bash'
	else
		tmux attach-session -t "$ID"
	fi
fi

# Golang exec
export PATH=$PATH:$HOME/code/go/bin

# NPM without sudo
export PATH=~/.npm-global/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

###-tns-completion-start-###
if [ -f /home/carlos/.tnsrc ]; then
	source /home/carlos/.tnsrc
fi
###-tns-completion-end-###

# Aliases
alias open="xdg-open"
alias grep="grep --color"
alias calc="libreoffice --calc"
alias writer="libreoffice --writer"
alias myip="ip addr show | grep 'inet 192' | awk '{ print \$2}'"

# needed by PhoneGap
ANDROID_HOME=/opt/android-sdk
PATH="$PATH:$ANDROID_HOME/tools"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then source '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then source '/opt/google-cloud-sdk/completion.bash.inc'; fi
