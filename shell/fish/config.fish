# Disable greeting message
set fish_greeting

## ALIASES ##
test -f "$HOME/.config/fish/aliases" && source "$HOME/.config/fish/aliases"

# LINUX
if test "$OSTYPE" = "linux-gnu"
	alias open='xdg-open'
	alias myip="ip addr show | grep 'inet 192' | awk '{ print \$2}'"
end

# TMUX
if test -z "$TMUX" -a -z "$DISABLE_TMUX"
	set ID (tmux ls | grep -vm1 attached | cut -d: -f1)
	if test -z "$ID"
		tmux new-session -s main
	else
		tmux attach-session -t "$ID"
	end
end

## FZF ##
# Set up fzf key bindings
fzf --fish | source
# fg:#080808 bg:#ffffff
set -gx FZF_DEFAULT_OPTS '--height 40% --layout=reverse
	--color=fg:#080808,bg:#ffffff,hl:#080808
	--color=fg+:#080808,bg+:#ffffff,hl+:#080808
	--color=info:#080808,prompt:#080808,pointer:#080808
	--color=marker:#080808,spinner:#080808,header:#080808'

## ENV VARS ##
# Basics
set -gx LANG en_US.UTF-8
set -gx EDITOR nvim
set -gx VISUAL $EDITOR

# scripts
set -gx PATH $HOME/.local/bin $PATH

# NPM without sudo
set -gx PATH $HOME/.npm-global/bin $PATH

# JetBrains
set -gx PATH $HOME/.local/share/JetBrains/Toolbox/scripts $PATH

# golang
set -gx GOPATH $HOME/code/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $GOBIN $PATH

# colors
set -gx LS_COLORS "ln=0;36:ex=0;31:di=0;34:fi=0"
# kubectx colors
set -gx KUBECTX_CURRENT_FGCOLOR (tput setaf 3) # yellow text
set -gx KUBECTX_CURRENT_BGCOLOR (tput sgr0) # white background

# bat
set -gx BAT_THEME OneHalfLight

# java
set -gx SDKMAN_DIR "$HOME/.sdkman"
set -gx JAVA_HOME "$HOME/.sdkman/candidates/java/current"
set -gx __sdkman_custom_dir "$SDKMAN_DIR"

## Masmovil ##
test -f "$HOME/.config/fish/work/mm-shell" && source "$HOME/.config/fish/work/mm-shell"

## Gcloud and kubectl ##
if test -f "$HOME/.google-cloud-sdk/path.fish.inc"
	source "$HOME/.google-cloud-sdk/path.fish.inc"
end
