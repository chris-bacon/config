export DISPLAY=:0

# DIRS
CONFIG=~/.config
POLYBAR=$CONFIG/polybar
NVIM=$CONFIG/nvim

# FIlES
SCRIPT=~/scripts/sync.sh
GITIGNORE=~/.gitignore
ALIASES=~/_functions.sh
FUNCTIONS=~/_functions.sh

/usr/bin/notify-send 'Syncing...!' 'Automated sync in progress' --icon=dialog-information

git add $GITIGNORE
git commit -m "Automated sync of $GITIGNORE"

git add $SCRIPT
git commit -m "Automated sync of $SCRIPT"

git add $ALIASES
git commit -m "Automated sync of $ALIASES"

git add $FUNCTIONS
git commit -m "Automated sync of $FUNCTIONS"

cd $POLYBAR
git add config
git commit -m "Automated sync of $POLYBAR"

cd $NVIM
git add .
git commit -m "Automated sync of $NVIM"

ssh-add ~/.ssh/github
ssh -vvv git@github.com verify
HOME=/home/chrisbacon git push origin master

