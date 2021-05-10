## FUNCTIONS ##
# export env vars
function dotenv() {
	envFile="$1"
	if [ -z "$1" ]; then
		envFile=.env
	fi
	if [ -e "$envFile" ]; then
		while read -r line; do
			l=${line/\$HOME/$HOME}
			export "$l"
		done < "$envFile"
		#export $(cat .env | xargs -L 1)
	fi
}

# navigate
function cd..() {
	cd $(printf "%0.0s../" $(seq 1 $1))
}

# docker
function docker-list() {
	docker ps -aq | while read line; do
		docker $1 $line
	done
}

### MASMOVIL ###
function mm() {
	cd "$HOME/code/masmovil/mm-monorepo/$1"
}

function mm-scripts() {
	SCRIPTS_PATH="$(pwd)/src/main/scripts"
	dotenv
	if [ -z "$1" ]; then
		ls "$SCRIPTS_PATH"
	else
		mm
		source "$SCRIPTS_PATH/$1"
	fi
}

function tunnel-qvantel() {
	if [ ! -z "$1" ]; then
		if [ "$1" = "on" ]; then
			if [ ! -e "/etc/hosts_default" ]; then
				sudo cp /etc/hosts /etc/hosts_default
			fi
			sudo cp -f $HOME/Dropbox/code/hosts/mm_qvantel /etc/hosts
			sudo kubectl -n external-services port-forward service/qvproxy 443:8443
		elif [ "$1" = "off" ]; then
			sudo cp -f /etc/hosts_default /etc/hosts
		fi
	fi
}
