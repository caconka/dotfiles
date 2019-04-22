# ~/.bash_profile

# Basics
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
# golang
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
# java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
# NPM without sudo
export PATH=~/.npm-global/bin:$PATH
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# needed by PhoneGap
export PATH=$PATH:/opt/android-sdk/tools
# colors
LS_COLORS="ln=1;32:ex=1;31:di=1;34:fi=0"
export LS_COLORS

##### Alias #####
alias ls="ls --color"
alias open="xdg-open"
alias grep="grep --color"
alias calc="libreoffice --calc"
alias writer="libreoffice --writer"
alias myip="ip addr show | grep 'inet 192' | awk '{ print \$2}'"

# Ctags
alias ctagsjava="ctags -R --tag-relative=yes --exclude=.git"

# export env vars
function dotenv() {
	if [ -e .env ]; then
		while read LINE
		do
			export ${LINE%'='*}=${LINE#*'='}
		done < .env
	fi
}

export -f dotenv

# maven
alias mvn-dev="dotenv && mvn clean package && java -jar ./target/*-dependencies.jar"
alias mvn-debug="dotenv && mvn clean package && java -agentlib:jdwp=transport=dt_socket,address=8080,server=y,suspend=n -jar ./target/*-dependencies.jar"

# kubernetes
alias itt-dev="kubectl --context gke_transformacion-it-dev_europe-west1-b_dev"
alias hitt-dev="helm --kube-context gke_transformacion-it-dev_europe-west1-b_dev"

# git-completion
source /usr/share/git/completion/git-completion.bash

# Caps-lock -> ESC
setxkbmap -option caps:escape
