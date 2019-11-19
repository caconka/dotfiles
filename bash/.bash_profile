# ~/.bash_profile

# Basics
export LANG=en_US.UTF-8
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim

# golang
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

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

# git-completion
source /usr/share/git/completion/git-completion.bash

# Caps-lock -> ESC
setxkbmap -option caps:escape

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
		export $(cat .env | xargs -L 1)
	fi
}

export -f dotenv

# maven
alias mvn-dev="dotenv && mvn clean package && java -jar ./target/*-dependencies.jar"
alias mvn-dev-skip="dotenv && mvn clean package -DskipTests && java -jar ./target/*-dependencies.jar"
alias mvn-debug="dotenv && mvn clean package -DskipTests && java -agentlib:jdwp=transport=dt_socket,address=8080,server=y,suspend=n -jar ./target/*-dependencies.jar"

# kubernetes
alias itt-dev="kubectl --context gke_transformacion-it-dev_europe-west1-b_dev"
alias hitt-dev="helm --kube-context gke_transformacion-it-dev_europe-west1-b_dev"

# Google Cloud SDK.
if [ -f "$HOME/.google-cloud-sdk/path.bash.inc" ]; then source "$HOME/.google-cloud-sdk/path.bash.inc"; fi
# The next line enables shell command completion for gcloud.
if [ -f "$HOME/.google-cloud-sdk/completion.bash.inc" ]; then source "$HOME/.google-cloud-sdk/completion.bash.inc"; fi

export JAVA_HOME="$HOME/.sdkman/candidates/java/current"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
