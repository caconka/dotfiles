set -l all_commands list download load build deploy clean help
set -l action_commands list download load build deploy

complete -c neo -f

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a list \
	-d 'List dump files contained in the storage'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a download \
	-d 'Download a dump file from storage'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a load \
	-d 'Load a dump file from storage into local neo4j database'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a build \
	-d 'Create a docker image with a specific dump version'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a deploy \
	-d 'Start a docker container with a specific dump version'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a clean \
	-d 'Remove docker resources and downloaded files'

complete -c neo -n "not __fish_seen_subcommand_from $all_commands" \
	-a help \
	-d 'Display help message'

complete -c neo -n "__fish_seen_subcommand_from $action_commands" \
	-a '-e --env' \
	-d 'Specify the environment to use: dev|sta|prod (default: dev)'

complete -c neo -n "__fish_seen_subcommand_from $action_commands" \
	-a '-f --filter' \
	-d 'Filter dump files by a specific string. E.g. "2006-01-02T15:04:05Z'

complete -c neo -n "__fish_seen_subcommand_from $action_commands" \
	-a '--failed' \
	-d 'Filter dump files to get only those containing errors'

complete -c neo -n "__fish_seen_subcommand_from $action_commands" \
	-a '--latest' \
	-d 'Get the latest dump that matches the other filters (if any)'
