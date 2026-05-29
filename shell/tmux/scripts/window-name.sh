#!/usr/bin/env bash

window_name="$1"
pane_path="$2"

shells=("fish" "bash" "zsh" "sh")

# Patrones de directorios "raíz" que quieres destacar
# Añade aquí los que necesites
anchor_patterns=("mm-monorepo*")

for shell in "${shells[@]}"; do
	if [[ "$window_name" == "$shell" ]]; then
		short_path="${pane_path/#$HOME/\~}"
		IFS='/' read -ra parts <<< "$short_path"
		count=${#parts[@]}

		  # Buscar si algún segmento coincide con un patrón ancla
		  anchor_idx=-1
		  anchor_part=""
		  for (( i=0; i<count; i++ )); do
			  for pattern in "${anchor_patterns[@]}"; do
				  if [[ "${parts[i]}" == $pattern ]]; then
					  anchor_idx=$i
					  anchor_part="${parts[i]}"
					  break 2
				  fi
			  done
		  done

		  if (( anchor_idx >= 0 )); then
			  echo "${anchor_part}"
		  elif (( count > 2 )); then
			  echo "…/${parts[count-2]}/${parts[count-1]}"
		  else
			  echo "$short_path"
		  fi
		  exit 0
	fi
done

echo "$window_name"
