#!/usr/bin/env bash

window_name="$1"
pane_path="$2"

shells=("fish" "bash" "zsh" "sh")

for shell in "${shells[@]}"; do
	if [[ "$window_name" == "$shell" ]]; then
		# Es un shell → mostrar path acortado
		short_path="${pane_path/#$HOME/\~}"
		IFS='/' read -ra parts <<< "$short_path"
		count=${#parts[@]}

			if (( count > 2 )); then
				echo "…/${parts[count-2]}/${parts[count-1]}"
			else
				echo "$short_path"
			fi
			exit 0
	fi
done

echo "$window_name"
