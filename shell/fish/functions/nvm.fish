set -gx NVM_DIR "$HOME/.nvm"

function nvm
	bass source "$NVM_DIR/nvm.sh" --no-use ';' nvm $argv
end
