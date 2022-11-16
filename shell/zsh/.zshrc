export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	golang
	docker
	kubectl
	helm
	gcloud
	mvn
	gradle
	npm
	yarn
	bazel
	fzf
)

source $ZSH/oh-my-zsh.sh

# prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

## Profile configs ##
[ -f "$HOME/.common_profile" ] && source $HOME/.common_profile
[ -f "$HOME/.common_bash_zsh" ] && source $HOME/.common_bash_zsh

# Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/path.zsh.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/.google-cloud-sdk/completion.zsh.inc"; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
