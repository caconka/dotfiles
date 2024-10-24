function cd..
	set -l levels $argv[1]

	if test -z "$levels"
		set levels 1
	else if test "$levels" -lt 1
		echo -s (set_color red)"ERROR: " (set_color normal)"The number of levels must be greater than 0."
		return 1
	end

	cd (string repeat -n $levels "../")
end
