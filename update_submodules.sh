!#/bin/sh

printf "\033[0;32mUpdating submodules\033[0m\n"

printf "\033[0;32mCheckout to master\033[0m\n"
git submodule foreach git switch master

printf "\033[0;32mUpdating master branches\033[0m\n"
git submodule foreach git pull origin master

printf "\033[0;32mUpdating release branch coc's module\033[0m\n"
cd vim/pack/caconka/start/coc
git switch release
git pull origin release

printf "\033[0;32mCommit && push\033[0m\n"
cd ~/.dotfiles
git add -A
git commit -m "update submodules"
git push origin HEAD
