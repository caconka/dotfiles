#!/usr/bin/env bash
set -euo pipefail

dir="${1:?usage: navigate.sh <left|down|up|right>}"
herdr="${HERDR_BIN_PATH:-herdr}"
pane="${HERDR_ACTIVE_PANE_ID:-}"

case "$dir" in
	left)  key="alt+h" ;;
	down)  key="alt+j" ;;
	up)    key="alt+k" ;;
	right) key="alt+l" ;;
	*) echo "navigate.sh: unknown direction: $dir" >&2; exit 2 ;;
esac

vim_re='^g?(view|l?n?vim?x?)(diff)?$'
passthrough_re="${HERDR_NAV_PASSTHROUGH_RE:-}"

forward=0
if [ -n "$pane" ] && command -v jq >/dev/null 2>&1; then
	if "$herdr" pane process-info --pane "$pane" 2>/dev/null \
		| jq -e --arg vim "$vim_re" --arg pass "$passthrough_re" \
			'.result.process_info.foreground_processes[]?.name | ascii_downcase | select(test($vim) or ($pass != "" and (try test($pass) catch false)))' \
			>/dev/null 2>&1; then
	forward=1
	fi
fi

if [ "$forward" -eq 1 ]; then
	exec "$herdr" pane send-keys "$pane" "$key"
else
	exec "$herdr" pane focus --direction "$dir" --pane "$pane"
fi
