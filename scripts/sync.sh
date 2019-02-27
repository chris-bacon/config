export DISPLAY=:0

CONFIG=~/.config
POLYBAR=$CONFIG/polybar
SCRIPT=~/scripts
NVIM=$CONFIG/nvim
GITIGNORE=~/.gitignore
ALIASES=~/_functions.sh
FUNCTIONS=~/_functions.sh

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information

git add $GITIGNORE
git commit -m "Automated sync of $GITIGNORE"

cd $POLYBAR
git add config
git commit -m "Automated sync of $POLYBAR"

cd $SCRIPT
git add sync.sh
git commit -m "Automated sync of $SCRIPT"

cd $NVIM
git add .
git commit -m "Automated sync of $NVIM"

git add $ALIASES
git commit -m "Automated sync of $ALIASES"

git add $FUNCTIONS
git commit -m "Automated sync of $FUNCTIONS"

ssh-add ~/.ssh/github
cd ~
git push origin master

