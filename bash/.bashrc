#
# ~/.bashrc

# Config colors and git
#source ~/.git-completion.bash
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
PS1='\n\[\e[1;31m\]λ \[\e[39m\]\w$(__git_ps1 " \[\e[39m\]git:\[\e[1;32m\]%s")\[\e[39m\] '
#PS1='\[\e[1;36m\]# \[\e[1;34m\]\u \[\e[0m\]at \[\e[1;32m\]\h \[\e[0m\]in  \[\e[1;33m\]\w$(__git_ps1 " \[\e[0m\]on \[\e[1;36m\]git:\[\e[1;34m\]%s") \[\e[0m\][\t]\n\[\e[1;35m\]\$\[\e[0m\] '

# Default text-editor
export Editor="vim"
export VISUAL="vim"

[[ $- != *i* ]] && return

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

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# TMUX
if [[ -z "$TMUX" ]] ;then
    ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )"
    if [[ -z "$ID" ]] ;then
        tmux new-session
    else
        tmux attach-session -t "$ID"
    fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
