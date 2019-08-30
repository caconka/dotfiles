# Caconka

if [ -f ~/.bash_profile ]; then
	source ~/.bash_profile;
fi

# Config colors and git λ
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\n\[\e[1;31m\]> \[\e[39m\]\W$(__git_ps1 " \[\e[39m\]git:\[\e[1;32m\]%s")\[\e[39m\] '

# Bash completion
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

[[ $- != *i* ]] && return

# kubectl
source <(kubectl completion bash)

# History
HISTSIZE=10000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

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

# TMUX
if [[ -z "$TMUX" ]] ;then
	ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
	if [[ -z "$ID" ]] ;then
		tmux new-session
	else
		tmux attach-session -t "$ID"
	fi
fi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

###-tns-completion-start-###
if [ -f /home/carlos/.tnsrc ]; then
	source /home/carlos/.tnsrc
fi
###-tns-completion-end-###

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google-cloud-sdk/path.bash.inc' ]; then source '/opt/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google-cloud-sdk/completion.bash.inc' ]; then source '/opt/google-cloud-sdk/completion.bash.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
