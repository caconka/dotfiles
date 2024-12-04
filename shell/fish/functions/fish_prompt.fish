function fish_prompt
	set -g fish_prompt_pwd_full_dirs 20

	set -g __fish_git_prompt_color grey
	set -g ___fish_git_prompt_char_stateseparator ''

	set -g __fish_git_prompt_showdirtystate true
	set -g __fish_git_prompt_color_dirtystate magenta
	set -g __fish_git_prompt_char_dirtystate '*'
	set -g __fish_git_prompt_color_stagedstate green
	set -g __fish_git_prompt_char_stagedstate '*'

	set -g __fish_git_prompt_showstashstate true
	set -g __fish_git_prompt_color_stashstate yellow
	set -g __fish_git_prompt_char_stashstate '⏎'

	set -g __fish_git_prompt_showupstream auto
	set -g __fish_git_prompt_color_upstream cyan
	set -g __fish_git_prompt_char_upstream_prefix ' '
	set -g __fish_git_prompt_char_upstream_equal '='
	set -g __fish_git_prompt_char_upstream_ahead '↑'
	set -g __fish_git_prompt_char_upstream_behind '↓'
	set -g __fish_git_prompt_char_upstream_diverged '↓↑'

	set -l last_status $status
	set -l stat
	if test $last_status -ne 0
		set stat (set_color red)'✘'(set_color normal)
	end

	set -l duration
	if test $CMD_DURATION -gt 5000
		set -l seconds (math round $CMD_DURATION / 1000)
		set duration (set_color grey)'took '(set_color yellow)$seconds's'(set_color normal)
	end

	printf '\n%s %s%s\n' (set_color blue)(prompt_pwd) (fish_git_prompt '%s ') $duration
	echo -n -s (set_color red)(__kube_prompt) $stat (set_color magenta)'❯ '(set_color normal)
end
