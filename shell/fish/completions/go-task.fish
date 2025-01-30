complete -fc go-task -a '(go-task -l | tail -n +2 | awk \'{print $2}\' | sed \'s/:$//\')'
