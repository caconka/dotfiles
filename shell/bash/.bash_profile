# ~/.bash_profile

# profile
[ -f "$HOME/.common_profile" ] && source $HOME/.common_profile

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

# fzf
[ -f "$HOME/.fzf.bash" ] && source $HOME/.fzf.bash

# Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.bash.inc" ]; then source "$HOME/.google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/.google-cloud-sdk/completion.bash.inc"; fi

# nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
