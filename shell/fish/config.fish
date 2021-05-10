set -U fish_greeting ""

# TMUX
if status is-interactive
	and not set -q TMUX
	exec tmux
end

[ -f "$HOME/.common_profile" ] && bass source "$HOME/.common_profile"

# prompt
starship init fish | source

switch (uname)
	case Linux
		set -g -x PATH=$PATH:/usr/local/appimage
		alias open="xdg-open"
		alias myip="ip addr show | grep 'inet 192' | awk '{ print \$2}'"
end
